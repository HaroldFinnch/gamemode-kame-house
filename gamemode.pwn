#include <open.mp>
#include <string>
#include <file>

// ================= [ CONFIGURACION EDITABLE ] =================
#define SKIN_POR_DEFECTO    229
#define VIDA_AL_LOGUEAR     100.0
#define CHALECO_AL_LOGUEAR  100.0
#define DINERO_INICIAL      500
#define COLOR_HAMBRE        0xFFA500FF 
#define RADIO_CHAT_LOCAL    20.0
#define PRECIO_COMIDA       25
#define HAMBRE_POR_COMIDA   20

#define POS_TRABAJO_X       2494.24 // Posicion del maletin de camionero
#define POS_TRABAJO_Y       -1671.19
#define POS_TRABAJO_Z       13.33

// Posicion nueva para el Checkpoint de carga 
#define POS_CARGA_X         2480.00 
#define POS_CARGA_Y         -1685.00
#define POS_CARGA_Z         13.33

#define LIMITE_X_MAX        3000.0
#define LIMITE_X_MIN        -500.0
#define LIMITE_Y_MAX        -500.0
#define LIMITE_Y_MIN        -3000.0

#define DIALOG_REGISTRO     1
#define DIALOG_LOGIN        2
#define PATH_USUARIOS       "usuarios/%s.ini"
#define PATH_RUTAS          "rutas_camionero.txt"
#define PATH_CASAS          "casas.txt"
#define MAX_CASAS           50

#if !defined WEAPON_NONE
    #define WEAPON_NONE (WEAPON:-1)
#endif

// ================= [ VARIABLES ] =================
new bool:IsPlayerLoggedIn[MAX_PLAYERS];
new PlayerPassword[MAX_PLAYERS][16];
new PlayerAdmin[MAX_PLAYERS]; 
new PlayerHambre[MAX_PLAYERS];
new PlayerText:BarraHambre[MAX_PLAYERS];
new Float:AdminMapPos[MAX_PLAYERS][3];
new PlayerInCasa[MAX_PLAYERS] = {-1, ...};

// Variables Camionero
new TrabajandoCamionero[MAX_PLAYERS]; 
new CamioneroVehiculo[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new CamioneroNivel[MAX_PLAYERS];
new CamioneroViajes[MAX_PLAYERS];

// Variables Casas
enum eCasa {
    Float:cX,
    Float:cY,
    Float:cZ,
    cPrecio,
    cOwner[MAX_PLAYER_NAME],
    cFriends[128]
}
new CasaData[MAX_CASAS][eCasa];
new TotalCasas = 0;
new CasaPickup[MAX_CASAS];
new Text3D:CasaLabel[MAX_CASAS];

// Adelantos de funciones usadas antes de su implementacion
forward strtok(const string[], &index);
forward sscanf_manual(const string[], &Float:x, &Float:y, &Float:z);
forward GuardarCasas();
forward GuardarCuenta(playerid);
forward BajarHambre();
forward ChequearLimitesMapa();
forward AutoGuardadoGlobal();
stock GetClosestCasa(playerid);
stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);

// ================= [ MAIN & INIT ] =================
main() {
    printf("Server KameHouse");
}

public OnGameModeInit() {
    SetGameModeText("KH 1.0");
    AddPlayerClass(SKIN_POR_DEFECTO, 2494.24, -1671.19, 13.33, 180.0, WEAPON_NONE, 0, WEAPON_NONE, 0, WEAPON_NONE, 0);
    
    CreatePickup(1210, 1, POS_TRABAJO_X, POS_TRABAJO_Y, POS_TRABAJO_Z, 0); 
    Create3DTextLabel("Trabajo: {FFFF00}Camionero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para iniciar", -1, POS_TRABAJO_X, POS_TRABAJO_Y, POS_TRABAJO_Z + 0.5, 10.0, 0);

    // Cargar casas
    new File:h = fopen(PATH_CASAS, io_read);
    if(h) {
        new str[256];
        while(fread(h, str) && TotalCasas < MAX_CASAS) {
            new idx = 0;
            CasaData[TotalCasas][cX] = floatstr(strtok(str, idx));
            CasaData[TotalCasas][cY] = floatstr(strtok(str, idx));
            CasaData[TotalCasas][cZ] = floatstr(strtok(str, idx));
            CasaData[TotalCasas][cPrecio] = strval(strtok(str, idx));
            strmid(CasaData[TotalCasas][cOwner], strtok(str, idx), 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
            strmid(CasaData[TotalCasas][cFriends], strtok(str, idx), 0, 128, 128);
            
            CasaPickup[TotalCasas] = CreatePickup(1273, 2, CasaData[TotalCasas][cX], CasaData[TotalCasas][cY], CasaData[TotalCasas][cZ], 0);
            
            new labelstr[64];
            if(!strcmp(CasaData[TotalCasas][cOwner], "None")) {
                format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d", CasaData[TotalCasas][cPrecio]);
            } else {
                format(labelstr, sizeof(labelstr), "Casa de %s", CasaData[TotalCasas][cOwner]);
            }
            CasaLabel[TotalCasas] = Create3DTextLabel(labelstr, 0x00FF00FF, CasaData[TotalCasas][cX], CasaData[TotalCasas][cY], CasaData[TotalCasas][cZ] + 0.5, 10.0, 0);
            
            TotalCasas++;
        }
        fclose(h);
    }

    SetTimer("AutoGuardadoGlobal", 300000, true);
    SetTimer("BajarHambre", 60000, true); 
    SetTimer("ChequearLimitesMapa", 1000, true);
    return 1;
}

// ================= [ SISTEMA DE TRABAJO ] =================

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if(newkeys & KEY_CTRL_BACK) // Tecla H
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, POS_TRABAJO_X, POS_TRABAJO_Y, POS_TRABAJO_Z))
        {
            if(TrabajandoCamionero[playerid] > 0) return SendClientMessage(playerid, -1, "Ya estas trabajando.");
            
            CamioneroVehiculo[playerid] = CreateVehicle(498, POS_TRABAJO_X + 3.0, POS_TRABAJO_Y, POS_TRABAJO_Z + 1.0, 0.0, 1, 1, 0);
            PutPlayerInVehicle(playerid, CamioneroVehiculo[playerid], 0);
            
            TrabajandoCamionero[playerid] = 1;
            SetPlayerCheckpoint(playerid, POS_CARGA_X, POS_CARGA_Y, POS_CARGA_Z, 5.0);
            SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Sube al camion y ve al punto de CARGA (punto rojo).");
        }
    }
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    if(TrabajandoCamionero[playerid] >= 2 && GetPlayerVehicleID(playerid) != CamioneroVehiculo[playerid])
    {
        SendClientMessage(playerid, 0xFF0000FF, "TRABAJO CANCELADO: Debes estar en el vehiculo de la empresa.");
        CanceladoTrabajo(playerid);
        return 1;
    }

    if(TrabajandoCamionero[playerid] == 1) { // Llegando a cargar
        DisablePlayerCheckpoint(playerid);
        TogglePlayerControllable(playerid, false);
        GameTextForPlayer(playerid, "~w~CARGANDO...~n~~y~Espere", 3000, 3);
        SetTimerEx("FinalizarCarga", 20000, false, "d", playerid);
        TrabajandoCamionero[playerid] = 2; 
    }
    else if(TrabajandoCamionero[playerid] == 3) { // Llegando a entregar
        DisablePlayerCheckpoint(playerid);
        TogglePlayerControllable(playerid, false);
        GameTextForPlayer(playerid, "~w~DESCARGANDO...~n~~y~Espere", 3000, 3);
        SetTimerEx("FinalizarDescarga", 10000, false, "d", playerid);
        TrabajandoCamionero[playerid] = 4;
    }
    else if(TrabajandoCamionero[playerid] == 5) { // Volviendo a base
        DisablePlayerCheckpoint(playerid);
        FinalizarTrabajo(playerid);
    }
    return 1;
}

forward FinalizarCarga(playerid);
public FinalizarCarga(playerid) {
    if(!IsPlayerConnected(playerid)) return 1;
    TogglePlayerControllable(playerid, true);
    TrabajandoCamionero[playerid] = 3;
    
    new File:h = fopen(PATH_RUTAS, io_read);
    if(h) {
        new line[64], count = 0;
        while(fread(h, line)) count++;
        
        if(count > 0) {
            fseek(h, 0, seek_start);
            new ruta_azar = random(count);
            for(new i = 0; i <= ruta_azar; i++) fread(h, line);
            
            new Float:rx, Float:ry, Float:rz;
            sscanf_manual(line, rx, ry, rz);
            SetPlayerCheckpoint(playerid, rx, ry, rz, 5.0);
            SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Cargado. Entrega la mercancia en el nuevo punto.");
        }
        fclose(h);
    } else SendClientMessage(playerid, -1, "{FF0000}ERROR: No hay rutas guardadas.");
    return 1;
}

forward FinalizarDescarga(playerid);
public FinalizarDescarga(playerid) {
    TogglePlayerControllable(playerid, true);
    TrabajandoCamionero[playerid] = 5;
    SetPlayerCheckpoint(playerid, POS_TRABAJO_X, POS_TRABAJO_Y, POS_TRABAJO_Z, 5.0);
    SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Descarga completa. Regresa al deposito por tu pago.");
    return 1;
}

stock CanceladoTrabajo(playerid) {
    DisablePlayerCheckpoint(playerid);
    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoCamionero[playerid] = 0;
    return 1;
}

stock FinalizarTrabajo(playerid) {
    new pago = 500 + (CamioneroNivel[playerid] * 250);
    GivePlayerMoney(playerid, pago);
    
    CamioneroViajes[playerid]++;
    if(CamioneroViajes[playerid] >= 50) {
        CamioneroViajes[playerid] = 0;
        CamioneroNivel[playerid]++;
        new levelmsg[96];
        format(levelmsg, sizeof(levelmsg), "{FFFF00}NIVEL SUBIDO!{FFFFFF} Ahora eres nivel %d.", CamioneroNivel[playerid]);
        SendClientMessage(playerid, 0xFFFF00FF, levelmsg);
    }
    
    new str[128];
    format(str, 128, "Pago recibido: $%d. Progreso: %d/50", pago, CamioneroViajes[playerid]);
    SendClientMessage(playerid, 0x00FF00FF, str);
    
    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoCamionero[playerid] = 0;
    return 1;
}

// ================= [ SISTEMA DE CASAS - COMANDOS ] =================

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[32], idx;
    format(cmd, 32, "%s", strtok(cmdtext, idx));

    if(!strcmp(cmd, "/g", true)) {
        if(!cmdtext[idx]) return SendClientMessage(playerid, -1, "Uso: /g [mensaje]");
        new string[144], name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        format(string, sizeof(string), "[GLOBAL] %s: %s", name, cmdtext[idx]);
        SendClientMessageToAll(0x00FFFFFF, string);
        return 1;
    }

    if(!strcmp(cmd, "/skills", true)) {
        new str[128];
        format(str, 128, "{FFFFFF}Nivel de Camionero: {FFFF00}%d\n{FFFFFF}Viajes Realizados: {FFFF00}%d/50", CamioneroNivel[playerid], CamioneroViajes[playerid]);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Mis Habilidades", str, "Aceptar", "");
        return 1;
    }

    if(!strcmp(cmd, "/comer", true)) {
        if(PlayerHambre[playerid] >= 100) return SendClientMessage(playerid, -1, "Ya tienes el hambre al maximo.");
        if(GetPlayerMoney(playerid) < PRECIO_COMIDA) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para comprar comida.");

        GivePlayerMoney(playerid, -PRECIO_COMIDA);
        PlayerHambre[playerid] += HAMBRE_POR_COMIDA;
        if(PlayerHambre[playerid] > 100) PlayerHambre[playerid] = 100;

        new msg[96], hud[16];
        format(msg, sizeof(msg), "Compraste comida por $%d. Hambre actual: %d/100", PRECIO_COMIDA, PlayerHambre[playerid]);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        format(hud, sizeof(hud), "H: %d", PlayerHambre[playerid]);
        PlayerTextDrawSetString(playerid, BarraHambre[playerid], hud);
        return 1;
    }

    if(!strcmp(cmd, "/cancelartrabajo", true)) {
        if(TrabajandoCamionero[playerid] == 0) return SendClientMessage(playerid, -1, "No tienes un trabajo activo.");
        CanceladoTrabajo(playerid);
        SendClientMessage(playerid, 0xFF0000FF, "Has cancelado tu trabajo de camionero.");
        return 1;
    }

    if(PlayerAdmin[playerid] < 1) return 0;

    if(!strcmp(cmd, "/crearparada", true)) {
        new Float:p[3], File:h = fopen(PATH_RUTAS, io_append), line[64];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        format(line, 64, "%f %f %f\n", p[0], p[1], p[2]);
        if(h) {
            fwrite(h, line); 
            fclose(h);
            SendClientMessage(playerid, 0x00FF00FF, "Punto de entrega guardado exitosamente.");
        }
        return 1;
    }

    if(!strcmp(cmd, "/kick", true)) {
        new tmp[32], id, razon[64];
        format(tmp, 32, "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /kick [id] [razon]");
        id = strval(tmp);
        format(razon, 64, "%s", cmdtext[idx]);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        new str[128], n1[24], n2[24];
        GetPlayerName(playerid, n1, 24); GetPlayerName(id, n2, 24);
        format(str, 128, "AdmCmd: %s expulso a %s. Razon: %s", n1, n2, razon);
        SendClientMessageToAll(0xFF0000FF, str);
        Kick(id);
        return 1;
    }

    if(!strcmp(cmd, "/dararma", true)) {
        new tmp[32], id, arma, muni;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /dararma [id] [arma] [muni]");
        id = strval(tmp);

        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /dararma [id] [arma] [muni]");
        arma = strval(tmp);

        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /dararma [id] [arma] [muni]");
        muni = strval(tmp);

        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        GivePlayerWeapon(id, WEAPON:arma, muni);
        return 1;
    }

    if(!strcmp(cmd, "/tp", true)) {
        new tmp[32], id; 
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /tp [id]");
        id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        new Float:p[3]; GetPlayerPos(id, p[0], p[1], p[2]);
        SetPlayerPos(playerid, p[0], p[1], p[2]+1.5);
        return 1;
    }

    if(!strcmp(cmd, "/gotomap", true)) {
        if(AdminMapPos[playerid][0] == 0.0) return SendClientMessage(playerid, -1, "Marca el mapa.");
        SetPlayerPos(playerid, AdminMapPos[playerid][0], AdminMapPos[playerid][1], AdminMapPos[playerid][2]);
        return 1;
    }
    
    // Comandos de casas (solo admin para crear)
    if(!strcmp(cmd, "/crearcasa", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new tmp[32];
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Uso: /crearcasa [precio]");
        new precio = strval(tmp);
        if(precio <= 0) return SendClientMessage(playerid, -1, "Precio invalido.");
        if(TotalCasas >= MAX_CASAS) return SendClientMessage(playerid, -1, "Maximo de casas alcanzado.");
        new Float:p[3];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        CasaData[TotalCasas][cX] = p[0];
        CasaData[TotalCasas][cY] = p[1];
        CasaData[TotalCasas][cZ] = p[2];
        CasaData[TotalCasas][cPrecio] = precio;
        strmid(CasaData[TotalCasas][cOwner], "None", 0, strlen("None")+1, MAX_PLAYER_NAME);
        CasaData[TotalCasas][cFriends][0] = EOS;
        CasaPickup[TotalCasas] = CreatePickup(1273, 2, p[0], p[1], p[2], 0);
        new labelstr[64];
        format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d", precio);
        CasaLabel[TotalCasas] = Create3DTextLabel(labelstr, 0x00FF00FF, p[0], p[1], p[2] + 0.5, 10.0, 0);
        // Guardar en archivo
        new File:fh = fopen(PATH_CASAS, io_append);
        if(fh) {
            new line[128];
            format(line, sizeof(line), "%f %f %f %d None\n", p[0], p[1], p[2], precio);
            fwrite(fh, line);
            fclose(fh);
        }
        SendClientMessage(playerid, 0x00FF00FF, "Casa creada y guardada.");
        TotalCasas++;
        return 1;
    }

    if(!strcmp(cmd, "/comprar", true)) {
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");
        if(strcmp(CasaData[casa][cOwner], "None") != 0) return SendClientMessage(playerid, -1, "Esta casa no esta en venta.");
        if(GetPlayerMoney(playerid) < CasaData[casa][cPrecio]) return SendClientMessage(playerid, -1, "No tienes suficiente dinero.");
        GivePlayerMoney(playerid, -CasaData[casa][cPrecio]);
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        strmid(CasaData[casa][cOwner], name, 0, strlen(name)+1, MAX_PLAYER_NAME);
        CasaData[casa][cFriends][0] = EOS;
        new labelstr[64];
        format(labelstr, sizeof(labelstr), "Casa de %s", name);
        Update3DTextLabelText(CasaLabel[casa], 0x00FF00FF, labelstr);
        SendClientMessage(playerid, 0x00FF00FF, "?Casa comprada exitosamente!");
        GuardarCasas();
        return 1;
    }

    if(!strcmp(cmd, "/entrar", true)) {
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        new bool:hasaccess = false;
        if(strcmp(CasaData[casa][cOwner], name) == 0) hasaccess = true;
        else if(strlen(CasaData[casa][cFriends]) > 0) {
            new temp[MAX_PLAYER_NAME + 3];
            format(temp, sizeof(temp), "%s,", name);
            if(strfind(CasaData[casa][cFriends], temp) != -1) hasaccess = true;
        }
        if(!hasaccess) return SendClientMessage(playerid, -1, "No tienes acceso a esta casa.");
        PlayerInCasa[playerid] = casa;
        SetPlayerPos(playerid, 2496.0499, -1707.84, 1014.74); 
        SetPlayerInterior(playerid, 3);
        SetPlayerVirtualWorld(playerid, casa + 1);
        SetCameraBehindPlayer(playerid);
        SendClientMessage(playerid, -1, "Has entrado a la casa.");
        return 1;
    }

    if(!strcmp(cmd, "/salir", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "No estas en una casa.");
        new casa = PlayerInCasa[playerid];
        SetPlayerPos(playerid, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ] + 1.0);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        SetCameraBehindPlayer(playerid);
        PlayerInCasa[playerid] = -1;
        SendClientMessage(playerid, -1, "Has salido de la casa.");
        return 1;
    }

    if(!strcmp(cmd, "/abrircasa", true)) {
        new tmp[32];
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!strlen(tmp)) return SendClientMessage(playerid, -1, "Uso: /abrircasa [id]");
        new target = strval(tmp);
        if(!IsPlayerConnected(target) || target == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Jugador no conectado.");
        if(target == playerid) return SendClientMessage(playerid, -1, "No puedes invitarte a ti mismo.");
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        if(strcmp(CasaData[casa][cOwner], name) != 0) return SendClientMessage(playerid, -1, "No eres el dueno de esta casa.");
        new tname[MAX_PLAYER_NAME];
        GetPlayerName(target, tname, sizeof(tname));
        new temp[MAX_PLAYER_NAME + 3];
        format(temp, sizeof(temp), "%s,", tname);
        if(strfind(CasaData[casa][cFriends], temp) != -1) return SendClientMessage(playerid, -1, "Ese jugador ya tiene acceso.");
        if(strlen(CasaData[casa][cFriends]) > 0) strcat(CasaData[casa][cFriends], ",");
        strcat(CasaData[casa][cFriends], tname);
        SendClientMessage(playerid, 0x00FF00FF, "Has dado acceso al jugador.");
        new str[128];
        format(str, sizeof(str), "%s te ha dado acceso a su casa.", name);
        SendClientMessage(target, 0x00FF00FF, str);
        GuardarCasas();
        return 1;
    }

    return 0;
}

strtok(const string[], &index) {
    new length = strlen(string), offset = index, result[32];
    while ((offset < length) && (string[offset] <= ' ')) offset++;
    new free = 0;
    while ((offset < length) && (string[offset] > ' ') && (free < 31)) {
        result[free] = string[offset];
        free++; offset++;
    }
    result[free] = EOS; index = offset;
    return result;
}

stock sscanf_manual(const string[], &Float:x, &Float:y, &Float:z) {
    new idx;
    x = floatstr(strtok(string, idx));
    y = floatstr(strtok(string, idx));
    z = floatstr(strtok(string, idx));
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
    AdminMapPos[playerid][0] = fX; AdminMapPos[playerid][1] = fY; AdminMapPos[playerid][2] = fZ;
    if(PlayerAdmin[playerid] >= 1) SendClientMessage(playerid, -1, "{FFFF00}Punto marcado. /gotomap");
    return 1;
}

public OnPlayerText(playerid, text[]) {
    if(!IsPlayerLoggedIn[playerid]) return 0;
    new string[144], name[MAX_PLAYER_NAME], Float:p[3];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerPos(playerid, p[0], p[1], p[2]);
    format(string, sizeof(string), "%s dice: %s", name, text);
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL, p[0], p[1], p[2])) SendClientMessage(i, -1, string);
    }
    return 0;
}

public OnPlayerConnect(playerid) {
    IsPlayerLoggedIn[playerid] = false;
    PlayerHambre[playerid] = 100;
    BarraHambre[playerid] = CreatePlayerTextDraw(playerid, 545.0, 150.0, "H: 100");
    PlayerTextDrawLetterSize(playerid, BarraHambre[playerid], 0.3, 1.2);
    PlayerTextDrawAlignment(playerid, BarraHambre[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraHambre[playerid], COLOR_HAMBRE);
    PlayerTextDrawSetShadow(playerid, BarraHambre[playerid], 1);
    PlayerTextDrawFont(playerid, BarraHambre[playerid], TEXT_DRAW_FONT_1);
    PlayerInCasa[playerid] = -1;
    
    new name[MAX_PLAYER_NAME], path[64];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), PATH_USUARIOS, name);
    if(fexist(path)) ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Clave:", "Entrar", "Salir");
    else ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "Registro", "Crea clave:", "Registrar", "Salir");
    return 1;
}

public OnPlayerSpawn(playerid) {
    if(!IsPlayerLoggedIn[playerid]) return Kick(playerid);
    SetPlayerSkin(playerid, SKIN_POR_DEFECTO);
    SetPlayerHealth(playerid, VIDA_AL_LOGUEAR);
    SetPlayerArmour(playerid, CHALECO_AL_LOGUEAR);
    if(GetPVarFloat(playerid, "SpawnX") != 0.0) {
        SetPlayerPos(playerid, GetPVarFloat(playerid, "SpawnX"), GetPVarFloat(playerid, "SpawnY"), GetPVarFloat(playerid, "SpawnZ"));
        DeletePVar(playerid, "SpawnX");
    } else SetPlayerPos(playerid, 2494.24, -1671.19, 13.33);
    SetCameraBehindPlayer(playerid);
    PlayerTextDrawShow(playerid, BarraHambre[playerid]);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    new name[MAX_PLAYER_NAME], path[64], line[128];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), PATH_USUARIOS, name);
    if(dialogid == DIALOG_REGISTRO) {
        if(!response) return Kick(playerid);
        new File:h = fopen(path, io_write);
        if(h) {
            format(line, 128, "%s\n%d\n0\n0\n0\n2494.24\n-1671.19\n13.33", inputtext, DINERO_INICIAL);
            fwrite(h, line); fclose(h);
            IsPlayerLoggedIn[playerid] = true;
            GivePlayerMoney(playerid, DINERO_INICIAL);
            SpawnPlayer(playerid);
        }
    }
    if(dialogid == DIALOG_LOGIN) {
        if(!response) return Kick(playerid);
        new File:h = fopen(path, io_read);
        if(h) {
            fread(h, PlayerPassword[playerid]);
            for(new i=0; i<strlen(PlayerPassword[playerid]); i++) if(PlayerPassword[playerid][i] < 32) PlayerPassword[playerid][i] = '\0';
            if(!strcmp(inputtext, PlayerPassword[playerid])) {
                IsPlayerLoggedIn[playerid] = true;
                fread(h, line); GivePlayerMoney(playerid, strval(line));
                fread(h, line); PlayerAdmin[playerid] = strval(line);
                fread(h, line); CamioneroNivel[playerid] = strval(line);
                fread(h, line); CamioneroViajes[playerid] = strval(line);
                new Float:v[3]; fread(h, line); v[0] = floatstr(line);
                fread(h, line); v[1] = floatstr(line);
                fread(h, line); v[2] = floatstr(line);
                SetPVarFloat(playerid, "SpawnX", v[0]); SetPVarFloat(playerid, "SpawnY", v[1]); SetPVarFloat(playerid, "SpawnZ", v[2]);
                fclose(h); SpawnPlayer(playerid);
            } else { fclose(h); ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Error", "Clave mal:", "Entrar", "Salir"); }
        }
    }
    return 1;
}

public GuardarCuenta(playerid) {
    if(IsPlayerLoggedIn[playerid]) {
        new name[MAX_PLAYER_NAME], path[64], line[256], Float:p[3];
        GetPlayerName(playerid, name, sizeof(name));
        format(path, 64, PATH_USUARIOS, name); GetPlayerPos(playerid, p[0], p[1], p[2]);
        new File:h = fopen(path, io_write);
        if(h) {
            format(line, 256, "%s\n%d\n%d\n%d\n%d\n%f\n%f\n%f", 
                PlayerPassword[playerid], GetPlayerMoney(playerid), PlayerAdmin[playerid], 
                CamioneroNivel[playerid], CamioneroViajes[playerid], p[0], p[1], p[2]);
            fwrite(h, line); fclose(h);
        }
    }
    return 1;
}

public GuardarCasas() {
    new File:h = fopen(PATH_CASAS, io_write);
    if(h) {
        new line[256];
        for(new i = 0; i < TotalCasas; i++) {
            format(line, sizeof(line), "%f %f %f %d %s %s\n", 
                CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ], 
                CasaData[i][cPrecio], CasaData[i][cOwner], CasaData[i][cFriends]);
            fwrite(h, line);
        }
        fclose(h);
    }
    return 1;
}

public BajarHambre() {
    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && IsPlayerLoggedIn[i]) {
        if(PlayerHambre[i] > 0) {
            PlayerHambre[i]--; new s[16]; format(s, 16, "H: %d", PlayerHambre[i]);
            PlayerTextDrawSetString(i, BarraHambre[i], s);
        } else { new Float:h; GetPlayerHealth(i, h); SetPlayerHealth(i, h-2.0); }
    }
    return 1;
}

public ChequearLimitesMapa() {
    new Float:p[3], Float:h;
    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && IsPlayerLoggedIn[i]) {
        GetPlayerPos(i, p[0], p[1], p[2]);
        if(p[0] > LIMITE_X_MAX || p[0] < LIMITE_X_MIN || p[1] > LIMITE_Y_MAX || p[1] < LIMITE_Y_MIN) {
            GameTextForPlayer(i, "~r~REGRESA!", 1000, 3);
            GetPlayerHealth(i, h); SetPlayerHealth(i, h-5.0);
        }
    }
    return 1;
}

public AutoGuardadoGlobal() { 
    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i)) GuardarCuenta(i); 
    GuardarCasas();
    return 1; 
}

public OnPlayerDisconnect(playerid, reason) { 
    if(PlayerInCasa[playerid] != -1) {
        new casa = PlayerInCasa[playerid];
        SetPlayerPos(playerid, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ]);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        PlayerInCasa[playerid] = -1;
    }
    GuardarCuenta(playerid); 
    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    return 1; 
}

public OnPlayerRequestClass(playerid, classid) { SetPlayerPos(playerid, 2494.24, -1680.0, 15.0); return 1; }

stock GetClosestCasa(playerid) {
    new Float:minDist = 5.0;
    new closest = -1;
    new Float:dist;
    new Float:pos[3];
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    for(new i = 0; i < TotalCasas; i++) {
        dist = GetDistanceBetweenPoints(pos[0], pos[1], pos[2], CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ]);
        if(dist < minDist) {
            minDist = dist;
            closest = i;
        }
    }
    return closest;
}

stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2) {
    return floatsqroot( floatpower(x2 - x1, 2) + floatpower(y2 - y1, 2) + floatpower(z2 - z1, 2) );
}
