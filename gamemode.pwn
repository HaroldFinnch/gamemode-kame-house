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
#define DISTANCIA_PAGO_MULT  3.0
#define DISTANCIA_PAGO_PIZZA 2.2

#define PAGO_MAX_PIZZERO     2600
#define PAGO_MAX_CAMIONERO   6800
#define PAGO_MAX_BASURERO    4500

#define NIVEL_MAX_TRABAJO    10
#define PROGRESO_CAMIONERO_POR_NIVEL 30
#define PROGRESO_PIZZERO_POR_NIVEL   25
#define PROGRESO_BASURERO_POR_NIVEL  28

#define TIEMPO_CULTIVO_MIN   240
#define TIEMPO_CULTIVO_MAX   300

#define SEMILLA_HIERBA_PRECIO 45
#define SEMILLA_FLOR_PRECIO   65

#define MAX_WEAPON_ID_GM     47

#define CASA_INT_X           2496.0499
#define CASA_INT_Y           -1707.84
#define CASA_INT_Z           1014.74
#define ARMARIO_X            2493.20
#define ARMARIO_Y            -1702.10
#define ARMARIO_Z            1014.74

#define POS_TRABAJO_X       2494.24 // Posicion del maletin de camionero
#define POS_TRABAJO_Y       -1671.19
#define POS_TRABAJO_Z       13.33

// Posicion nueva para el Checkpoint de carga
#define POS_CARGA_X         2480.00
#define POS_CARGA_Y         -1685.00
#define POS_CARGA_Z         13.33

#define POS_PIZZERIA_X      2105.17
#define POS_PIZZERIA_Y      -1806.51
#define POS_PIZZERIA_Z      13.55
#define POS_PIZZA_SPAWN_X   2099.40
#define POS_PIZZA_SPAWN_Y   -1788.30
#define POS_PIZZA_SPAWN_Z   13.25
#define POS_PIZZA_SPAWN_A   90.0

#define POS_BANCO_X         2488.50
#define POS_BANCO_Y         -1660.20
#define POS_BANCO_Z         13.35

#define POS_SEMILLERIA_X    2499.80
#define POS_SEMILLERIA_Y    -1660.50
#define POS_SEMILLERIA_Z    13.35

#define POS_ARMERIA_X       2483.60
#define POS_ARMERIA_Y       -1659.90
#define POS_ARMERIA_Z       13.35

#define LIMITE_X_MAX        3000.0
#define LIMITE_X_MIN        -500.0
#define LIMITE_Y_MAX        -500.0
#define LIMITE_Y_MIN        -3000.0

#define DIALOG_REGISTRO     1
#define DIALOG_LOGIN        2
#define PATH_USUARIOS       "usuarios/%s.ini"
#define PATH_RUTAS          "rutas_camionero.txt"
#define PATH_RUTAS_PIZZA    "rutas_pizzero.txt"
#define PATH_RUTAS_BASURA   "rutas_basurero.txt"
#define PATH_CASAS          "casas.txt"
#define MAX_CASAS           50

#define DIALOG_GPS          10
#define DIALOG_AYUDA        11
#define DIALOG_BANK_MENU    12
#define DIALOG_BANK_DEPOSIT 13
#define DIALOG_BANK_WITHDRAW 14
#define DIALOG_BANK_TR_ID   15
#define DIALOG_BANK_TR_AMT  16
#define DIALOG_PLANTAR      17
#define DIALOG_CONSUMIR     18
#define DIALOG_SEMILLERIA   19
#define DIALOG_ADMIN_ARMAS_MENU 20
#define DIALOG_ADMIN_ARMAS_ADD  21
#define DIALOG_ADMIN_ARMAS_REMOVE 22
#define DIALOG_ARMERIA_MENU   23
#define DIALOG_ARMERIA_COMPRA 24
#define DIALOG_MOVER_MENU     25
#define DIALOG_ARMERIA_CATEGORIA 26
#define DIALOG_ARMERIA_ARMAS     27
#define DIALOG_ARMERIA_MUNICION  28
#define DIALOG_ARMERIA_MUNI_CANT 29

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
new PlayerBankMoney[MAX_PLAYERS];
new BankTransferTarget[MAX_PLAYERS] = {-1, ...};

// Variables Camionero
new TrabajandoCamionero[MAX_PLAYERS];
new CamioneroVehiculo[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new CamioneroNivel[MAX_PLAYERS];
new CamioneroViajes[MAX_PLAYERS];

// Variables Pizzero
new TrabajandoPizzero[MAX_PLAYERS];
new PizzeroVehiculo[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new PizzeroNivel[MAX_PLAYERS];
new PizzeroEntregas[MAX_PLAYERS];
new Float:PizzeroDestino[MAX_PLAYERS][3];

// Variables Basurero
new TrabajandoBasurero[MAX_PLAYERS];
new BasureroVehiculo[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new BasureroNivel[MAX_PLAYERS];
new BasureroRecorridos[MAX_PLAYERS];
new Float:BasureroDestino[MAX_PLAYERS][3];
new bool:BasureroRecolectando[MAX_PLAYERS];
new BasureroRecolectado[MAX_PLAYERS];

// Variables Inventario/Cultivo
new InvSemillaHierba[MAX_PLAYERS];
new InvSemillaFlor[MAX_PLAYERS];
new InvHierba[MAX_PLAYERS];
new InvFlor[MAX_PLAYERS];
new CultivoActivo[MAX_PLAYERS];
new CultivoTipo[MAX_PLAYERS];
new CultivoCantidadBase[MAX_PLAYERS];
new CultivoReadyTick[MAX_PLAYERS];
new CultivoObj[MAX_PLAYERS] = {-1, ...};
new Text3D:CultivoLabel[MAX_PLAYERS] = {Text3D:-1, ...};
new CultivoTimer[MAX_PLAYERS] = {-1, ...};
new Float:CultivoPos[MAX_PLAYERS][3];

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

new Float:CamioneroDestino[MAX_PLAYERS][3];

// Sistema de armeria
#define MAX_ARMAS_TIENDA 20
enum eArmeriaItem {
    bool:aiActiva,
    aiArma,
    aiSlot,
    aiPrecioArma,
    aiPrecioMunicion,
    aiMunicionPack,
    aiStockArma,
    aiStockMunicion
}
new ArmeriaItems[MAX_ARMAS_TIENDA][eArmeriaItem];
new ArmeriaMuniItemJugador[MAX_PLAYERS] = {-1, ...};
new bool:PlayerArmaComprada[MAX_PLAYERS][MAX_WEAPON_ID_GM];
new PlayerAmmoInventario[MAX_PLAYERS][MAX_WEAPON_ID_GM];

#define MAX_RUTAS_BASURA 128
new Float:BasuraRuta[MAX_RUTAS_BASURA][3];
new TotalRutasBasura;

enum ePuntoMovible {
    puntoCamionero,
    puntoPizzeria,
    puntoBasurero,
    puntoCarga,
    puntoBanco,
    puntoSemilleria,
    puntoArmeria,
    totalPuntosMovibles
}
new Float:PuntoPos[totalPuntosMovibles][3];
new PuntoPickup[totalPuntosMovibles] = {0, ...};
new Text3D:PuntoLabel[totalPuntosMovibles] = {Text3D:-1, ...};

// Adelantos de funciones usadas antes de su implementacion
forward strtok(const string[], &index);
forward sscanf_manual(const string[], &Float:x, &Float:y, &Float:z);
forward GuardarCasas();
forward GuardarCuenta(playerid);
forward BajarHambre();
forward ChequearLimitesMapa();
forward AutoGuardadoGlobal();
forward FinalizarRecolectaBasura(playerid);
stock GetClosestCasa(playerid);
stock GetClosestCasaOwnedBy(playerid);
stock bool:PlayerTieneAccesoCasa(playerid, casa);
stock EntrarCasa(playerid, casa);
stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
stock CanceladoTrabajo(playerid);
public FinalizarRecolectaBasura(playerid) {
    if(!IsPlayerConnected(playerid) || TrabajandoBasurero[playerid] == 0) return 1;
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    BasureroRecolectado[playerid]++;

    if(BasureroRecolectado[playerid] >= TotalRutasBasura) {
        FinalizarTrabajoBasurero(playerid);
        return 1;
    }

    IniciarRutaBasurero(playerid);
    return 1;
}

stock CanceladoTrabajoPizzero(playerid);
stock ShowAyudaDialog(playerid);
stock IsNearBank(playerid);
stock ShowBankMenu(playerid);
stock IsNearBusinessInterior(playerid);
stock IsNearSemilleria(playerid);
stock ShowSemilleriaMenu(playerid);
stock IsNearArmeria(playerid);
stock ShowArmeriaMenu(playerid);
stock ShowArmeriaArmasDisponibles(playerid);
stock ShowArmeriaMunicionDisponible(playerid);
stock ShowAdminArmasMenu(playerid);
stock GetWeaponNameGM(weaponid, dest[], len);
stock GetArmeriaItemByListIndex(listindex);
stock GetArmeriaItemByStockMuniIndex(listindex);
stock CrearVehiculoTrabajoUnico(playerid, modelid, Float:x, Float:y, Float:z, Float:a, c1, c2, &vehvar);
stock CargarRutasBasura();
stock IniciarRutaBasurero(playerid);
stock FinalizarTrabajoBasurero(playerid);
stock ActualizarLabelCultivo(playerid);
stock FinalizarCultivoVisual(playerid);
stock CrearPuntosFijos();
stock CrearPuntosFijos();
stock RecrearPuntoFijo(ePuntoMovible:punto);
stock GetPuntoMovibleNombre(ePuntoMovible:punto, dest[], len);

// ================= [ MAIN & INIT ] =================
main() {
    printf("Server KameHouse");
}

public OnGameModeInit() {
    SetGameModeText("KH 1.0");
    DisableInteriorEnterExits();
    AddPlayerClass(SKIN_POR_DEFECTO, 2494.24, -1671.19, 13.33, 180.0, WEAPON_NONE, 0, WEAPON_NONE, 0, WEAPON_NONE, 0);

    PuntoPos[puntoCamionero][0] = POS_TRABAJO_X;
    PuntoPos[puntoCamionero][1] = POS_TRABAJO_Y;
    PuntoPos[puntoCamionero][2] = POS_TRABAJO_Z;

    PuntoPos[puntoPizzeria][0] = POS_PIZZERIA_X;
    PuntoPos[puntoPizzeria][1] = POS_PIZZERIA_Y;
    PuntoPos[puntoPizzeria][2] = POS_PIZZERIA_Z;

    PuntoPos[puntoBasurero][0] = POS_PIZZERIA_X + 8.0;
    PuntoPos[puntoBasurero][1] = POS_PIZZERIA_Y + 6.0;
    PuntoPos[puntoBasurero][2] = POS_PIZZERIA_Z;

    PuntoPos[puntoCarga][0] = POS_CARGA_X;
    PuntoPos[puntoCarga][1] = POS_CARGA_Y;
    PuntoPos[puntoCarga][2] = POS_CARGA_Z;

    PuntoPos[puntoBanco][0] = POS_BANCO_X;
    PuntoPos[puntoBanco][1] = POS_BANCO_Y;
    PuntoPos[puntoBanco][2] = POS_BANCO_Z;

    PuntoPos[puntoSemilleria][0] = POS_SEMILLERIA_X;
    PuntoPos[puntoSemilleria][1] = POS_SEMILLERIA_Y;
    PuntoPos[puntoSemilleria][2] = POS_SEMILLERIA_Z;

    PuntoPos[puntoArmeria][0] = POS_ARMERIA_X;
    PuntoPos[puntoArmeria][1] = POS_ARMERIA_Y;
    PuntoPos[puntoArmeria][2] = POS_ARMERIA_Z;

    CrearPuntosFijos();
    CargarRutasBasura();

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
    if(!(newkeys & KEY_CTRL_BACK)) return 1; // Tecla H

    if(TrabajandoBasurero[playerid] == 2 && !IsPlayerInAnyVehicle(playerid) && BasureroRecolectando[playerid]) {
        BasureroRecolectando[playerid] = false;
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("FinalizarRecolectaBasura", 10000, false, "d", playerid);
        GameTextForPlayer(playerid, "~w~RECOLECTANDO BASURA", 2000, 3);
        return 1;
    }

    // Entrada a casas desde el icono con H
    new casa = GetClosestCasa(playerid);
    if(casa != -1 && PlayerInCasa[playerid] == -1) {
        if(PlayerTieneAccesoCasa(playerid, casa) == false) return SendClientMessage(playerid, -1, "No tienes acceso a esta casa.");
        EntrarCasa(playerid, casa);
        return 1;
    }

    // Sistema de banco
    if(IsNearBank(playerid)) {
        ShowBankMenu(playerid);
        return 1;
    }

    // Sistema de semilleria
    if(IsNearSemilleria(playerid)) {
        ShowSemilleriaMenu(playerid);
        return 1;
    }

    // Sistema de armeria
    if(IsNearArmeria(playerid)) {
        ShowArmeriaMenu(playerid);
        return 1;
    }

    // Inicio de trabajo camionero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2]))
    {
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");

        CrearVehiculoTrabajoUnico(playerid, 498, PuntoPos[puntoCamionero][0] + 3.0, PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2] + 1.0, 0.0, 0, 0, CamioneroVehiculo[playerid]);
        PutPlayerInVehicle(playerid, CamioneroVehiculo[playerid], 0);

        TrabajandoCamionero[playerid] = 1;
        SetPlayerCheckpoint(playerid, PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2], 5.0);
        SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Sube al camion y ve al punto de CARGA (punto rojo).");
        return 1;
    }

    // Inicio de trabajo pizzero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2]))
    {
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");

        CrearVehiculoTrabajoUnico(playerid, 448, POS_PIZZA_SPAWN_X, POS_PIZZA_SPAWN_Y, POS_PIZZA_SPAWN_Z, POS_PIZZA_SPAWN_A, 3, 3, PizzeroVehiculo[playerid]);
        PutPlayerInVehicle(playerid, PizzeroVehiculo[playerid], 0);
        TrabajandoPizzero[playerid] = 1;
        SetTimerEx("AsignarRutaPizzero", 200, false, "d", playerid);
        SendClientMessage(playerid, -1, "{FF4500}[PIZZERO]{FFFFFF} Entrega pizzas y gana dinero. Sigue el checkpoint.");
        return 1;
    }
    // Inicio de trabajo basurero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2]))
    {
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");
        if(TotalRutasBasura <= 0) return SendClientMessage(playerid, 0xFF0000FF, "No hay rutas de basura cargadas.");

        CrearVehiculoTrabajoUnico(playerid, 440, PuntoPos[puntoBasurero][0] + 4.0, PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2] + 1.0, 0.0, 0, 0, BasureroVehiculo[playerid]);
        PutPlayerInVehicle(playerid, BasureroVehiculo[playerid], 0);
        BasureroRecolectado[playerid] = 0;
        TrabajandoBasurero[playerid] = 1;
        IniciarRutaBasurero(playerid);
        SendClientMessage(playerid, 0x66FF66FF, "[BASURERO] Usa la Rumpo, baja en checkpoint y presiona H para recolectar.");
        return 1;
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
        return 1;
    }


    if(TrabajandoBasurero[playerid] >= 1) {
        if(GetPlayerVehicleID(playerid) != BasureroVehiculo[playerid]) {
            SendClientMessage(playerid, 0xFF0000FF, "BASURERO CANCELADO: Debes usar la Rumpo del trabajo.");
            FinalizarTrabajoBasurero(playerid);
            return 1;
        }
        DisablePlayerCheckpoint(playerid);
        TrabajandoBasurero[playerid] = 2;
        BasureroRecolectando[playerid] = true;
        SendClientMessage(playerid, 0x66FF66FF, "Baja del vehiculo y presiona H para recolectar (10s).");
        return 1;
    }
    if(TrabajandoPizzero[playerid] == 1) {
        if(GetPlayerVehicleID(playerid) != PizzeroVehiculo[playerid]) {
            SendClientMessage(playerid, 0xFF0000FF, "PIZZERO CANCELADO: Debes usar la moto de la pizzeria.");
            CanceladoTrabajoPizzero(playerid);
            return 1;
        }
        DisablePlayerCheckpoint(playerid);
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        GameTextForPlayer(playerid, "~r~ENTREGANDO PIZZA", 2500, 3);
        SetTimerEx("FinalizarEntregaPizza", 10000, false, "d", playerid);
        TrabajandoPizzero[playerid] = 2;
        return 1;
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
            CamioneroDestino[playerid][0] = rx;
            CamioneroDestino[playerid][1] = ry;
            CamioneroDestino[playerid][2] = rz;
            SetPlayerCheckpoint(playerid, rx, ry, rz, 5.0);
            SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Cargado. Entrega la mercancia en el nuevo punto.");
        }
        fclose(h);
    } else SendClientMessage(playerid, -1, "{FF0000}ERROR: No hay rutas guardadas.");
    return 1;
}

forward FinalizarDescarga(playerid);
forward AsignarRutaPizzero(playerid);
forward FinalizarEntregaPizza(playerid);
forward ActualizarCultivo(playerid);
public FinalizarDescarga(playerid) {
    TogglePlayerControllable(playerid, true);
    TrabajandoCamionero[playerid] = 5;
    SetPlayerCheckpoint(playerid, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], 5.0);
    SendClientMessage(playerid, -1, "{FFFF00}[TRABAJO]{FFFFFF} Descarga completa. Regresa al deposito por tu pago.");
    return 1;
}

stock CanceladoTrabajo(playerid) {
    DisablePlayerCheckpoint(playerid);
    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoCamionero[playerid] = 0;
    CamioneroDestino[playerid][0] = 0.0;
    CamioneroDestino[playerid][1] = 0.0;
    CamioneroDestino[playerid][2] = 0.0;
    return 1;
}

stock FinalizarTrabajo(playerid) {
    new Float:distancia = 0.0;
    distancia += GetDistanceBetweenPoints(PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2]);
    distancia += GetDistanceBetweenPoints(PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2], CamioneroDestino[playerid][0], CamioneroDestino[playerid][1], CamioneroDestino[playerid][2]);
    distancia += GetDistanceBetweenPoints(CamioneroDestino[playerid][0], CamioneroDestino[playerid][1], CamioneroDestino[playerid][2], PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2]);

    new nivelCamionero = CamioneroNivel[playerid];
    if(nivelCamionero > NIVEL_MAX_TRABAJO) nivelCamionero = NIVEL_MAX_TRABAJO;

    new pagoBase = 850;
    new pagoDistancia = floatround(distancia * DISTANCIA_PAGO_MULT);
    new pagoNivel = nivelCamionero * 165;
    new pago = pagoBase + pagoDistancia + pagoNivel;
    if(pago > PAGO_MAX_CAMIONERO) pago = PAGO_MAX_CAMIONERO;
    GivePlayerMoney(playerid, pago);

    CamioneroViajes[playerid]++;
    if(CamioneroViajes[playerid] >= PROGRESO_CAMIONERO_POR_NIVEL) {
        CamioneroViajes[playerid] = 0;
        if(CamioneroNivel[playerid] < NIVEL_MAX_TRABAJO) CamioneroNivel[playerid]++;
        new levelmsg[96];
        format(levelmsg, sizeof(levelmsg), "{FFFF00}NIVEL SUBIDO!{FFFFFF} Ahora eres nivel %d.", CamioneroNivel[playerid]);
        SendClientMessage(playerid, 0xFFFF00FF, levelmsg);
    }

    new str[160];
    format(str, sizeof(str), "{FFD700}[CAMIONERO]{FFFFFF} {66CCFF}Pago fijo:{FFFFFF} $%d {FF66CC}| Nivel:{FFFFFF} $%d {99FF66}| Distancia:{FFFFFF} $%d {00FF00}| Total:{FFFFFF} $%d", pagoBase, pagoNivel, pagoDistancia, pago);
    SendClientMessage(playerid, 0x00FF00FF, str);
    format(str, sizeof(str), "{FFD700}Progreso camionero:{FFFFFF} %d/%d | Nivel actual: %d/%d", CamioneroViajes[playerid], PROGRESO_CAMIONERO_POR_NIVEL, CamioneroNivel[playerid], NIVEL_MAX_TRABAJO);
    SendClientMessage(playerid, 0x00FF00FF, str);
    format(str, sizeof(str), "{FFD700}[CAMIONERO]{FFFFFF} Te pagaron: {00FF00}$%d", pago);
    SendClientMessage(playerid, 0x00FF00FF, str);
    GameTextForPlayer(playerid, "~g~Pago recibido", 2500, 3);

    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoCamionero[playerid] = 0;
    return 1;
}

public AsignarRutaPizzero(playerid) {
    if(!IsPlayerConnected(playerid) || TrabajandoPizzero[playerid] == 0) return 1;

    new File:h = fopen(PATH_RUTAS_PIZZA, io_read);
    if(!h) {
        SendClientMessage(playerid, 0xFF0000FF, "No hay rutas de pizzero guardadas. Contacta un admin.");
        CanceladoTrabajoPizzero(playerid);
        return 1;
    }

    new line[64], count = 0;
    while(fread(h, line)) count++;
    if(count <= 0) {
        fclose(h);
        SendClientMessage(playerid, 0xFF0000FF, "No hay rutas de pizzero guardadas.");
        CanceladoTrabajoPizzero(playerid);
        return 1;
    }

    fseek(h, 0, seek_start);
    new ruta_azar = random(count);
    for(new i = 0; i <= ruta_azar; i++) fread(h, line);
    fclose(h);

    new Float:rx, Float:ry, Float:rz;
    sscanf_manual(line, rx, ry, rz);
    PizzeroDestino[playerid][0] = rx;
    PizzeroDestino[playerid][1] = ry;
    PizzeroDestino[playerid][2] = rz;
    SetPlayerCheckpoint(playerid, rx, ry, rz, 4.0);
    TrabajandoPizzero[playerid] = 1;
    SendClientMessage(playerid, 0xFF8C00FF, "Nueva entrega asignada. Ve al checkpoint y entrega la pizza.");
    return 1;
}

public FinalizarEntregaPizza(playerid) {
    if(!IsPlayerConnected(playerid) || TrabajandoPizzero[playerid] == 0) return 1;
    TogglePlayerControllable(playerid, true);
    new Float:distancia = GetDistanceBetweenPoints(PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], PizzeroDestino[playerid][0], PizzeroDestino[playerid][1], PizzeroDestino[playerid][2]);
    new nivelPizzero = PizzeroNivel[playerid];
    if(nivelPizzero > NIVEL_MAX_TRABAJO) nivelPizzero = NIVEL_MAX_TRABAJO;

    new pagoBase = 230;
    new pagoDistancia = floatround(distancia * DISTANCIA_PAGO_PIZZA);
    new pagoNivel = nivelPizzero * 120;
    new pago = pagoBase + pagoDistancia + pagoNivel;
    if(pago > PAGO_MAX_PIZZERO) pago = PAGO_MAX_PIZZERO;
    GivePlayerMoney(playerid, pago);

    PizzeroEntregas[playerid]++;
    if(PizzeroEntregas[playerid] >= PROGRESO_PIZZERO_POR_NIVEL) {
        PizzeroEntregas[playerid] = 0;
        if(PizzeroNivel[playerid] < NIVEL_MAX_TRABAJO) PizzeroNivel[playerid]++;
        SendClientMessage(playerid, 0xFFFF00FF, "Subiste de nivel en el trabajo de pizzero.");
    }

    new info[160];
    format(info, sizeof(info), "{FF4500}[PIZZERO]{FFFFFF} {66CCFF}Pago fijo:{FFFFFF} $%d {FF66CC}| Nivel:{FFFFFF} $%d {99FF66}| Distancia:{FFFFFF} $%d {00FF00}| Total:{FFFFFF} $%d", pagoBase, pagoNivel, pagoDistancia, pago);
    SendClientMessage(playerid, 0x00FF00FF, info);
    format(info, sizeof(info), "{FF4500}Progreso pizzero:{FFFFFF} %d/%d | Nivel actual: %d/%d", PizzeroEntregas[playerid], PROGRESO_PIZZERO_POR_NIVEL, PizzeroNivel[playerid], NIVEL_MAX_TRABAJO);
    SendClientMessage(playerid, 0x00FF00FF, info);
    format(info, sizeof(info), "{FF4500}[PIZZERO]{FFFFFF} Te pagaron: {00FF00}$%d", pago);
    SendClientMessage(playerid, 0x00FF00FF, info);
    GameTextForPlayer(playerid, "~g~Pago recibido", 2000, 3);

    SetTimerEx("AsignarRutaPizzero", 300, false, "d", playerid);
    return 1;
}

stock CanceladoTrabajoPizzero(playerid) {
    DisablePlayerCheckpoint(playerid);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    if(PizzeroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(PizzeroVehiculo[playerid]);
    PizzeroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoPizzero[playerid] = 0;
    PizzeroDestino[playerid][0] = 0.0;
    PizzeroDestino[playerid][1] = 0.0;
    PizzeroDestino[playerid][2] = 0.0;
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
        new str[256];
        format(str, sizeof(str), "{FFFFFF}Camionero Nivel: {FFFF00}%d/%d\n{FFFFFF}Viajes: {FFFF00}%d/%d\n\n{FFFFFF}Pizzero Nivel: {FF8C00}%d/%d\n{FFFFFF}Entregas: {FF8C00}%d/%d\n\n{FFFFFF}Basurero Nivel: {66FF66}%d/%d\n{FFFFFF}Recorridos: {66FF66}%d/%d", CamioneroNivel[playerid], NIVEL_MAX_TRABAJO, CamioneroViajes[playerid], PROGRESO_CAMIONERO_POR_NIVEL, PizzeroNivel[playerid], NIVEL_MAX_TRABAJO, PizzeroEntregas[playerid], PROGRESO_PIZZERO_POR_NIVEL, BasureroNivel[playerid], NIVEL_MAX_TRABAJO, BasureroRecorridos[playerid], PROGRESO_BASURERO_POR_NIVEL);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Mis Habilidades", str, "Aceptar", "");
        return 1;
    }

    if(!strcmp(cmd, "/comer", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes usar /comer dentro de tu casa.");
        if(PlayerHambre[playerid] >= 100) return SendClientMessage(playerid, -1, "Ya tienes el hambre al maximo.");
        if(GetPlayerMoney(playerid) < PRECIO_COMIDA) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para comprar comida.");

        ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
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

    if(!strcmp(cmd, "/inventario", true)) {
        new inv[256];
        format(inv, sizeof(inv), "Semillas: Hierba %d | Flores %d\nConsumo: Hierba %d | Flores %d", InvSemillaHierba[playerid], InvSemillaFlor[playerid], InvHierba[playerid], InvFlor[playerid]);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Inventario", inv, "Cerrar", "");
        return 1;
    }

    if(!strcmp(cmd, "/plantar", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes plantar dentro de una casa.");
        if(CultivoActivo[playerid]) return SendClientMessage(playerid, -1, "Ya tienes un cultivo en progreso. Usa /cosehar cuando este listo.");
        ShowPlayerDialog(playerid, DIALOG_PLANTAR, DIALOG_STYLE_LIST, "Plantar", "Hierva verde\nFlores", "Plantar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/cosehar", true) || !strcmp(cmd, "/cosechar", true)) {
        if(!CultivoActivo[playerid]) return SendClientMessage(playerid, -1, "No tienes ningun cultivo activo.");
        new restante = CultivoReadyTick[playerid] - GetTickCount();
        if(restante > 0) {
            new ms[96];
            format(ms, sizeof(ms), "Tu cultivo aun no esta listo. Falta: %d segundos.", restante / 1000);
            return SendClientMessage(playerid, -1, ms);
        }

        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        new extra = random(3);
        new total = CultivoCantidadBase[playerid] + extra;
        if(CultivoTipo[playerid] == 1) {
            InvHierba[playerid] += total;
        } else {
            InvFlor[playerid] += total;
        }

        FinalizarCultivoVisual(playerid);
        CultivoActivo[playerid] = 0;
        CultivoTipo[playerid] = 0;
        CultivoCantidadBase[playerid] = 0;
        CultivoReadyTick[playerid] = 0;

        new ok[96];
        format(ok, sizeof(ok), "Cosecha completada. Obtuviste %d unidades.", total);
        SendClientMessage(playerid, 0x00FF00FF, ok);
        return 1;
    }

    if(!strcmp(cmd, "/consumir", true)) {
        ShowPlayerDialog(playerid, DIALOG_CONSUMIR, DIALOG_STYLE_LIST, "Consumir", "Hierva verde (chaleco)\nFlores (vida)", "Usar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/dejartrabajo", true) || !strcmp(cmd, "/cancelartrabajo", true)) {
        if(TrabajandoCamionero[playerid] == 0 && TrabajandoPizzero[playerid] == 0 && TrabajandoBasurero[playerid] == 0) return SendClientMessage(playerid, -1, "No tienes un trabajo activo.");
        if(TrabajandoCamionero[playerid] > 0) {
            CanceladoTrabajo(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "Dejaste el trabajo de camionero.");
        }
        if(TrabajandoPizzero[playerid] > 0) {
            CanceladoTrabajoPizzero(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "Dejaste el trabajo de pizzero.");
        }
        if(TrabajandoBasurero[playerid] > 0) {
            FinalizarTrabajoBasurero(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "Dejaste el trabajo de basurero.");
        }
        return 1;
    }

    if(!strcmp(cmd, "/gps", true)) {
        ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS de la ciudad", "Trabajo Camionero\nPizzeria Los Santos\nTrabajo Basurero\nDeposito de Carga\nBanco KameHouse\nSemilleria\nArmeria", "Ir", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/ayuda", true)) {
        ShowAyudaDialog(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/saldo", true)) {
        new str[96];
        format(str, sizeof(str), "Saldo banco: $%d", PlayerBankMoney[playerid]);
        SendClientMessage(playerid, 0x00FFFFFF, str);
        return 1;
    }

    if(!strcmp(cmd, "/pagar", true)) {
        new tmp[32], target, monto;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /pagar [id] [cantidad]");
        target = strval(tmp);

        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /pagar [id] [cantidad]");
        monto = strval(tmp);

        if(target == playerid) return SendClientMessage(playerid, -1, "No puedes pagarte a ti mismo.");
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "Jugador no conectado.");
        if(monto <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        new Float:p1[3], Float:p2[3];
        GetPlayerPos(playerid, p1[0], p1[1], p1[2]);
        GetPlayerPos(target, p2[0], p2[1], p2[2]);
        if(GetDistanceBetweenPoints(p1[0], p1[1], p1[2], p2[0], p2[1], p2[2]) > 5.0) return SendClientMessage(playerid, -1, "Debes estar cerca del jugador.");
        if(GetPlayerMoney(playerid) < monto) return SendClientMessage(playerid, -1, "No tienes ese dinero.");

        GivePlayerMoney(playerid, -monto);
        GivePlayerMoney(target, monto);

        new n1[MAX_PLAYER_NAME], n2[MAX_PLAYER_NAME], msg[144];
        GetPlayerName(playerid, n1, sizeof(n1));
        GetPlayerName(target, n2, sizeof(n2));
        format(msg, sizeof(msg), "Le pagaste $%d a %s.", monto, n2);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        format(msg, sizeof(msg), "%s te pago $%d.", n1, monto);
        SendClientMessage(target, 0x00FF00FF, msg);
        return 1;
    }

    if(PlayerAdmin[playerid] < 1) return 0;

    if(!strcmp(cmd, "/crearparada", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
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

    if(!strcmp(cmd, "/crearparadapizza", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new Float:p[3], File:h = fopen(PATH_RUTAS_PIZZA, io_append), line[64];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        format(line, sizeof(line), "%f %f %f\n", p[0], p[1], p[2]);
        if(h) {
            fwrite(h, line);
            fclose(h);
            SendClientMessage(playerid, 0x00FF00FF, "Punto de entrega de pizzero guardado.");
        }
        return 1;
    }

    if(!strcmp(cmd, "/crearparadabasura", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new Float:p[3], File:h = fopen(PATH_RUTAS_BASURA, io_append), line[64];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        format(line, sizeof(line), "%f %f %f\n", p[0], p[1], p[2]);
        if(h) {
            fwrite(h, line);
            fclose(h);
            CargarRutasBasura();
            SendClientMessage(playerid, 0x00FF00FF, "Punto de basura guardado.");
        }
        return 1;
    }

    if(!strcmp(cmd, "/kick", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
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

    if(!strcmp(cmd, "/dardinero", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new tmp[32], id, monto;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /dardinero [id] [monto]");
        id = strval(tmp);

        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /dardinero [id] [monto]");
        monto = strval(tmp);

        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        if(monto <= 0) return SendClientMessage(playerid, -1, "Monto invalido.");

        GivePlayerMoney(id, monto);
        new str[128], n1[MAX_PLAYER_NAME], n2[MAX_PLAYER_NAME];
        GetPlayerName(playerid, n1, sizeof(n1));
        GetPlayerName(id, n2, sizeof(n2));
        format(str, sizeof(str), "AdmCmd: %s dio $%d a %s.", n1, monto, n2);
        SendClientMessageToAll(0x00FF00FF, str);
        return 1;
    }

    if(!strcmp(cmd, "/dararma", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(arma <= 0 || arma >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "ID de arma invalida.");
        if(muni <= 0) return SendClientMessage(playerid, -1, "Municion invalida.");
        GivePlayerWeapon(id, WEAPON:arma, muni);
        return 1;
    }

    if(!strcmp(cmd, "/adminarmas", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowAdminArmasMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/mover", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowPlayerDialog(playerid, DIALOG_MOVER_MENU, DIALOG_STYLE_LIST, "Mover iconos y puntos", "Trabajo Camionero\nPizzeria\nTrabajo Basurero\nDeposito de Carga\nBanco\nSemilleria\nArmeria", "Mover aqui", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/tp", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
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

    if(!strcmp(cmd, "/salir", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "No estas en una casa.");
        new casa = PlayerInCasa[playerid];
        PlayerInCasa[playerid] = -1;
        SetPlayerPos(playerid, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ] + 1.0);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        SetCameraBehindPlayer(playerid);
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

    if(!strcmp(cmd, "/eliminarcasa", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");

        // Limpiar visuales actuales
        for(new i = 0; i < TotalCasas; i++) {
            if(CasaPickup[i]) DestroyPickup(CasaPickup[i]);
            Delete3DTextLabel(CasaLabel[i]);
        }

        // Compactar arrays
        for(new i = casa; i < TotalCasas - 1; i++) {
            CasaData[i][cX] = CasaData[i + 1][cX];
            CasaData[i][cY] = CasaData[i + 1][cY];
            CasaData[i][cZ] = CasaData[i + 1][cZ];
            CasaData[i][cPrecio] = CasaData[i + 1][cPrecio];
            strmid(CasaData[i][cOwner], CasaData[i + 1][cOwner], 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
            strmid(CasaData[i][cFriends], CasaData[i + 1][cFriends], 0, 128, 128);
        }

        TotalCasas--;

        // Ajustar jugadores dentro de casas
        for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i)) {
            if(PlayerInCasa[i] == casa) {
                PlayerInCasa[i] = -1;
                SetPlayerInterior(i, 0);
                SetPlayerVirtualWorld(i, 0);
                SetPlayerPos(i, 2494.24, -1671.19, 13.33);
                SendClientMessage(i, 0xFF0000FF, "Tu casa fue eliminada por un administrador.");
            } else if(PlayerInCasa[i] > casa) {
                PlayerInCasa[i]--;
                SetPlayerVirtualWorld(i, PlayerInCasa[i] + 1);
            }
        }

        // Recrear pickups/labels con indices y mundos correctos
        for(new i = 0; i < TotalCasas; i++) {
            CasaPickup[i] = CreatePickup(1273, 2, CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ], 0);

            new labelstr[64];
            if(!strcmp(CasaData[i][cOwner], "None")) format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d", CasaData[i][cPrecio]);
            else format(labelstr, sizeof(labelstr), "Casa de %s", CasaData[i][cOwner]);
            CasaLabel[i] = Create3DTextLabel(labelstr, 0x00FF00FF, CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ] + 0.5, 10.0, 0);

        }

        GuardarCasas();
        SendClientMessage(playerid, 0x00FF00FF, "Casa eliminada correctamente.");
        return 1;
    }

    return 0;
}

stock bool:PlayerTieneAccesoCasa(playerid, casa) {
    if(casa < 0 || casa >= TotalCasas) return false;

    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    if(strcmp(CasaData[casa][cOwner], name) == 0) return true;

    if(strlen(CasaData[casa][cFriends]) > 0) {
        new temp[MAX_PLAYER_NAME + 3];
        format(temp, sizeof(temp), "%s,", name);
        if(strfind(CasaData[casa][cFriends], temp) != -1) return true;
        if(!strcmp(CasaData[casa][cFriends], name)) return true;
    }
    return false;
}

stock EntrarCasa(playerid, casa) {
    PlayerInCasa[playerid] = casa;
    SetPlayerPos(playerid, CASA_INT_X, CASA_INT_Y, CASA_INT_Z);
    SetPlayerInterior(playerid, 3);
    SetPlayerVirtualWorld(playerid, casa + 1);
    SetCameraBehindPlayer(playerid);
    SendClientMessage(playerid, -1, "Has entrado a la casa. Aqui puedes usar /comer y descansar.");
    return 1;
}

stock GetClosestCasaOwnedBy(playerid) {
    new casa = GetClosestCasa(playerid);
    if(casa == -1) return -1;

    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    if(strcmp(CasaData[casa][cOwner], name) != 0) return -1;
    return casa;
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
    TrabajandoCamionero[playerid] = 0;
    TrabajandoPizzero[playerid] = 0;
    TrabajandoBasurero[playerid] = 0;
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    PizzeroVehiculo[playerid] = INVALID_VEHICLE_ID;
    BasureroVehiculo[playerid] = INVALID_VEHICLE_ID;
    BasureroRecolectado[playerid] = 0;
    BasureroRecolectando[playerid] = false;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    InvSemillaHierba[playerid] = 0;
    InvSemillaFlor[playerid] = 0;
    InvHierba[playerid] = 0;
    InvFlor[playerid] = 0;
    CultivoActivo[playerid] = 0;
    CultivoTipo[playerid] = 0;
    CultivoCantidadBase[playerid] = 0;
    CultivoReadyTick[playerid] = 0;
    CultivoObj[playerid] = -1;
    CultivoLabel[playerid] = Text3D:-1;
    CultivoTimer[playerid] = -1;
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) { PlayerArmaComprada[playerid][w] = false; PlayerAmmoInventario[playerid][w] = 0; }

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
    if(dialogid == DIALOG_GPS) {
        if(!response) return 1;
        if(listitem == 0) SetPlayerCheckpoint(playerid, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], 6.0);
        else if(listitem == 1) SetPlayerCheckpoint(playerid, PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], 6.0);
        else if(listitem == 2) SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 6.0);
        else if(listitem == 3) SetPlayerCheckpoint(playerid, PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2], 6.0);
        else if(listitem == 4) SetPlayerCheckpoint(playerid, PuntoPos[puntoBanco][0], PuntoPos[puntoBanco][1], PuntoPos[puntoBanco][2], 6.0);
        else if(listitem == 5) SetPlayerCheckpoint(playerid, PuntoPos[puntoSemilleria][0], PuntoPos[puntoSemilleria][1], PuntoPos[puntoSemilleria][2], 6.0);
        else if(listitem == 6) SetPlayerCheckpoint(playerid, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2], 6.0);
        SendClientMessage(playerid, 0x00FFFFFF, "GPS actualizado en tu mapa.");
        return 1;
    }

    if(dialogid == DIALOG_MOVER_MENU) {
        if(!response) return 1;
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(listitem < 0 || listitem >= _:totalPuntosMovibles) return SendClientMessage(playerid, -1, "Punto invalido.");

        new Float:px, Float:py, Float:pz, nombre[48], msg[144];
        GetPlayerPos(playerid, px, py, pz);
        PuntoPos[ePuntoMovible:listitem][0] = px;
        PuntoPos[ePuntoMovible:listitem][1] = py;
        PuntoPos[ePuntoMovible:listitem][2] = pz;
        RecrearPuntoFijo(ePuntoMovible:listitem);
        GetPuntoMovibleNombre(ePuntoMovible:listitem, nombre, sizeof(nombre));
        format(msg, sizeof(msg), "Moviste %s a tu posicion. El GPS ya usa la nueva ubicacion.", nombre);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        return 1;
    }

    if(dialogid == DIALOG_SEMILLERIA) {
        if(!response) return 1;
        if(listitem == 0) {
            if(GetPlayerMoney(playerid) < SEMILLA_HIERBA_PRECIO) return SendClientMessage(playerid, -1, "No tienes dinero para esa semilla.");
            GivePlayerMoney(playerid, -SEMILLA_HIERBA_PRECIO);
            InvSemillaHierba[playerid]++;
            SendClientMessage(playerid, 0x00FF00FF, "Compraste 1 semilla de hierva verde.");
        } else if(listitem == 1) {
            if(GetPlayerMoney(playerid) < SEMILLA_FLOR_PRECIO) return SendClientMessage(playerid, -1, "No tienes dinero para esa semilla.");
            GivePlayerMoney(playerid, -SEMILLA_FLOR_PRECIO);
            InvSemillaFlor[playerid]++;
            SendClientMessage(playerid, 0x00FF00FF, "Compraste 1 semilla de flores.");
        }
        return 1;
    }

    if(dialogid == DIALOG_PLANTAR) {
        if(!response) return 1;
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes plantar dentro de una casa.");
        if(CultivoActivo[playerid]) return SendClientMessage(playerid, -1, "Ya tienes un cultivo activo.");

        if(listitem == 0) {
            if(InvSemillaHierba[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes semillas de hierva verde.");
            InvSemillaHierba[playerid]--;
            CultivoTipo[playerid] = 1;
        } else if(listitem == 1) {
            if(InvSemillaFlor[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes semillas de flores.");
            InvSemillaFlor[playerid]--;
            CultivoTipo[playerid] = 2;
        }

        new Float:px, Float:py, Float:pz;
        GetPlayerPos(playerid, px, py, pz);
        CultivoPos[playerid][0] = px + 1.0;
        CultivoPos[playerid][1] = py + 1.0;
        CultivoPos[playerid][2] = pz - 1.0;

        CultivoActivo[playerid] = 1;
        new duracion = TIEMPO_CULTIVO_MIN + random(TIEMPO_CULTIVO_MAX - TIEMPO_CULTIVO_MIN + 1);
        CultivoReadyTick[playerid] = GetTickCount() + (duracion * 1000);
        CultivoCantidadBase[playerid] = 2;

        new modeloCultivo = (CultivoTipo[playerid] == 2) ? 3408 : 3409;
        CultivoObj[playerid] = CreateObject(modeloCultivo, CultivoPos[playerid][0], CultivoPos[playerid][1], CultivoPos[playerid][2], 0.0, 0.0, 0.0, 200.0);
        CultivoLabel[playerid] = Create3DTextLabel("Cultivo en progreso", 0x00FF00FF, CultivoPos[playerid][0], CultivoPos[playerid][1], CultivoPos[playerid][2] + 1.0, 15.0, 0);
        ActualizarLabelCultivo(playerid);

        if(CultivoTimer[playerid] != -1) KillTimer(CultivoTimer[playerid]);
        CultivoTimer[playerid] = SetTimerEx("ActualizarCultivo", 1000, true, "d", playerid);

        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        SendClientMessage(playerid, 0x00FF00FF, "Semilla plantada. Usa /cosehar cuando el contador llegue a 0.");
        return 1;
    }

    if(dialogid == DIALOG_CONSUMIR) {
        if(!response) return 1;
        if(listitem == 0) {
            if(InvHierba[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes hierva verde para consumir.");
            InvHierba[playerid]--;
            ApplyAnimation(playerid, "SMOKING", "M_smk_in", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
            new Float:armour;
            GetPlayerArmour(playerid, armour);
            armour += 3.0;
            if(armour > 100.0) armour = 100.0;
            SetPlayerArmour(playerid, armour);
            SendClientMessage(playerid, 0x00FF00FF, "Consumiste hierva verde y recuperaste 3% de chaleco.");
        } else if(listitem == 1) {
            if(InvFlor[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes flores para consumir.");
            InvFlor[playerid]--;
            ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
            new Float:vida;
            GetPlayerHealth(playerid, vida);
            vida += 6.0;
            if(vida > 100.0) vida = 100.0;
            SetPlayerHealth(playerid, vida);
            SendClientMessage(playerid, 0x00FF00FF, "Consumiste flores y recuperaste 6% de vida.");
        }
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD, DIALOG_STYLE_INPUT, "Admin Armas - Agregar", "Formato: arma_id slot precio_arma precio_municion pack stock_armas stock_municion\nEjemplo: 24 1 3500 40 12 5 500", "Guardar", "Atras");
        } else if(listitem == 1) {
            new lista[768], line[96], nombreArma[32], count;
            lista[0] = EOS;
            for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
                if(!ArmeriaItems[i][aiActiva]) continue;
                GetWeaponNameGM(ArmeriaItems[i][aiArma], nombreArma, sizeof(nombreArma));
                format(line, sizeof(line), "Slot venta %d | %s | Arma $%d | Muni x%d $%d\n", ArmeriaItems[i][aiSlot], nombreArma, ArmeriaItems[i][aiPrecioArma], ArmeriaItems[i][aiMunicionPack], ArmeriaItems[i][aiPrecioMunicion]);
                strcat(lista, line);
                count++;
            }
            if(count == 0) return SendClientMessage(playerid, -1, "No hay armas cargadas en la tienda.");
            ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_REMOVE, DIALOG_STYLE_LIST, "Admin Armas - Quitar", lista, "Quitar", "Atras");
        }
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_ADD) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new armaId, slotVenta, precioArma, precioMuni, packMuni, stockArma, stockMuni;
        new data[160], s0[16], s1[16], s2[16], s3[16], s4[16], s5[16], s6[16], pidx;
        format(data, sizeof(data), "%s", inputtext);
        format(s0, sizeof(s0), "%s", strtok(data, pidx));
        format(s1, sizeof(s1), "%s", strtok(data, pidx));
        format(s2, sizeof(s2), "%s", strtok(data, pidx));
        format(s3, sizeof(s3), "%s", strtok(data, pidx));
        format(s4, sizeof(s4), "%s", strtok(data, pidx));
        format(s5, sizeof(s5), "%s", strtok(data, pidx));
        format(s6, sizeof(s6), "%s", strtok(data, pidx));
        if(!s0[0] || !s1[0] || !s2[0] || !s3[0] || !s4[0] || !s5[0] || !s6[0]) {
            return SendClientMessage(playerid, -1, "Formato invalido. Usa: arma_id slot precio_arma precio_municion pack stock_armas stock_municion");
        }
        armaId = strval(s0);
        slotVenta = strval(s1);
        precioArma = strval(s2);
        precioMuni = strval(s3);
        packMuni = strval(s4);
        stockArma = strval(s5);
        stockMuni = strval(s6);
        if(armaId <= 0 || armaId >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "ID de arma invalida.");
        if(slotVenta < 0 || slotVenta > 12) return SendClientMessage(playerid, -1, "Slot de venta invalido (0-12).");
        if(precioArma <= 0 || precioMuni <= 0 || packMuni <= 0 || stockArma < 0 || stockMuni < 0) return SendClientMessage(playerid, -1, "Valores invalidos.");

        for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
            if(!ArmeriaItems[i][aiActiva]) {
                ArmeriaItems[i][aiActiva] = true;
                ArmeriaItems[i][aiArma] = armaId;
                ArmeriaItems[i][aiSlot] = slotVenta;
                ArmeriaItems[i][aiPrecioArma] = precioArma;
                ArmeriaItems[i][aiPrecioMunicion] = precioMuni;
                ArmeriaItems[i][aiMunicionPack] = packMuni;
                ArmeriaItems[i][aiStockArma] = stockArma;
                ArmeriaItems[i][aiStockMunicion] = stockMuni;
                SendClientMessage(playerid, 0x00FF00FF, "Arma agregada a la tienda correctamente.");
                return ShowAdminArmasMenu(playerid);
            }
        }
        SendClientMessage(playerid, -1, "No hay mas espacio en la tienda de armas.");
        return ShowAdminArmasMenu(playerid);
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_REMOVE) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new item = GetArmeriaItemByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Item invalido.");
        ArmeriaItems[item][aiActiva] = false;
        SendClientMessage(playerid, 0x00FF00FF, "Arma eliminada de la tienda.");
        return ShowAdminArmasMenu(playerid);
    }

    if(dialogid == DIALOG_ARMERIA_CATEGORIA) {
        if(!response) return 1;
        if(listitem == 0) return ShowArmeriaArmasDisponibles(playerid);
        if(listitem == 1) return ShowArmeriaMunicionDisponible(playerid);
        return 1;
    }

    if(dialogid == DIALOG_ARMERIA_ARMAS) {
        if(!response) return ShowArmeriaMenu(playerid);
        new item = GetArmeriaItemByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(ArmeriaItems[item][aiStockArma] <= 0) return SendClientMessage(playerid, -1, "No hay stock de arma.");
        if(GetPlayerMoney(playerid) < ArmeriaItems[item][aiPrecioArma]) return SendClientMessage(playerid, -1, "No tienes dinero para comprar esta arma.");
        GivePlayerMoney(playerid, -ArmeriaItems[item][aiPrecioArma]);
        GivePlayerWeapon(playerid, WEAPON:ArmeriaItems[item][aiArma], 0);
        PlayerArmaComprada[playerid][ArmeriaItems[item][aiArma]] = true;
        ArmeriaItems[item][aiStockArma]--;
        return ShowArmeriaArmasDisponibles(playerid);
    }

    if(dialogid == DIALOG_ARMERIA_MUNICION) {
        if(!response) return ShowArmeriaMenu(playerid);
        new item = GetArmeriaItemByStockMuniIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        ArmeriaMuniItemJugador[playerid] = item;
        ShowPlayerDialog(playerid, DIALOG_ARMERIA_MUNI_CANT, DIALOG_STYLE_INPUT, "Comprar municion", "Cantidad de packs a comprar:", "Comprar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ARMERIA_MUNI_CANT) {
        if(!response) return ShowArmeriaMunicionDisponible(playerid);
        new item = ArmeriaMuniItemJugador[playerid];
        new packs = strval(inputtext);
        if(item < 0 || item >= MAX_ARMAS_TIENDA || !ArmeriaItems[item][aiActiva]) return SendClientMessage(playerid, -1, "Item invalido.");
        if(packs <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(packs > ArmeriaItems[item][aiStockMunicion]) return SendClientMessage(playerid, -1, "No hay tanta municion disponible.");
        new costo = packs * ArmeriaItems[item][aiPrecioMunicion];
        new balas = packs * ArmeriaItems[item][aiMunicionPack];
        if(GetPlayerMoney(playerid) < costo) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        GivePlayerMoney(playerid, -costo);
        PlayerAmmoInventario[playerid][ArmeriaItems[item][aiArma]] += balas;
        ArmeriaItems[item][aiStockMunicion] -= packs;
        GivePlayerWeapon(playerid, WEAPON:ArmeriaItems[item][aiArma], balas);
        return ShowArmeriaMunicionDisponible(playerid);
    }

    if(dialogid == DIALOG_BANK_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            ShowPlayerDialog(playerid, DIALOG_BANK_DEPOSIT, DIALOG_STYLE_INPUT, "Banco - Depositar", "Ingresa la cantidad a depositar:", "Depositar", "Atras");
        } else if(listitem == 1) {
            ShowPlayerDialog(playerid, DIALOG_BANK_WITHDRAW, DIALOG_STYLE_INPUT, "Banco - Retirar", "Ingresa la cantidad a retirar:", "Retirar", "Atras");
        } else if(listitem == 2) {
            ShowPlayerDialog(playerid, DIALOG_BANK_TR_ID, DIALOG_STYLE_INPUT, "Banco - Transferir", "Ingresa el ID del jugador:", "Siguiente", "Atras");
        }
        return 1;
    }

    if(dialogid == DIALOG_BANK_DEPOSIT) {
        if(!response) return ShowBankMenu(playerid);
        new monto = strval(inputtext);
        if(monto <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(GetPlayerMoney(playerid) < monto) return SendClientMessage(playerid, -1, "No tienes ese dinero en mano.");
        GivePlayerMoney(playerid, -monto);
        PlayerBankMoney[playerid] += monto;
        SendClientMessage(playerid, 0x00FF00FF, "Deposito realizado correctamente.");
        return ShowBankMenu(playerid);
    }

    if(dialogid == DIALOG_BANK_WITHDRAW) {
        if(!response) return ShowBankMenu(playerid);
        new monto = strval(inputtext);
        if(monto <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(PlayerBankMoney[playerid] < monto) return SendClientMessage(playerid, -1, "No tienes saldo suficiente en el banco.");
        PlayerBankMoney[playerid] -= monto;
        GivePlayerMoney(playerid, monto);
        SendClientMessage(playerid, 0x00FF00FF, "Retiro realizado correctamente.");
        return ShowBankMenu(playerid);
    }

    if(dialogid == DIALOG_BANK_TR_ID) {
        if(!response) return ShowBankMenu(playerid);
        new id = strval(inputtext);
        if(id == playerid) return SendClientMessage(playerid, -1, "No puedes transferirte a ti mismo.");
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador no conectado.");
        BankTransferTarget[playerid] = id;
        ShowPlayerDialog(playerid, DIALOG_BANK_TR_AMT, DIALOG_STYLE_INPUT, "Banco - Transferir", "Ingresa el monto a transferir:", "Transferir", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_BANK_TR_AMT) {
        if(!response) return ShowBankMenu(playerid);
        if(BankTransferTarget[playerid] == -1 || !IsPlayerConnected(BankTransferTarget[playerid])) return SendClientMessage(playerid, -1, "Jugador destino invalido.");
        new monto = strval(inputtext);
        if(monto <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(PlayerBankMoney[playerid] < monto) return SendClientMessage(playerid, -1, "No tienes saldo suficiente en el banco.");
        PlayerBankMoney[playerid] -= monto;
        PlayerBankMoney[BankTransferTarget[playerid]] += monto;
        new n1[MAX_PLAYER_NAME], n2[MAX_PLAYER_NAME], msg[144];
        GetPlayerName(playerid, n1, sizeof(n1));
        GetPlayerName(BankTransferTarget[playerid], n2, sizeof(n2));
        format(msg, sizeof(msg), "Transferiste $%d a %s desde tu banco.", monto, n2);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        format(msg, sizeof(msg), "%s te transfirio $%d a tu banco.", n1, monto);
        SendClientMessage(BankTransferTarget[playerid], 0x00FF00FF, msg);
        BankTransferTarget[playerid] = -1;
        return ShowBankMenu(playerid);
    }

    new name[MAX_PLAYER_NAME], path[64], line[128];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), PATH_USUARIOS, name);
    if(dialogid == DIALOG_REGISTRO) {
        if(!response) return Kick(playerid);
        new File:h = fopen(path, io_write);
        if(h) {
            format(line, 128, "%s\n%d\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n2494.24\n-1671.19\n13.33", inputtext, DINERO_INICIAL);
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

                new Float:v[3];
                fread(h, line);
                if(strfind(line, ".") != -1) {
                    // Compatibilidad: cuenta vieja sin pizzero/banco/inventario
                    PizzeroNivel[playerid] = 0;
                    PizzeroEntregas[playerid] = 0;
                    PlayerBankMoney[playerid] = 0;
                    InvSemillaHierba[playerid] = 0;
                    InvSemillaFlor[playerid] = 0;
                    InvHierba[playerid] = 0;
                    InvFlor[playerid] = 0;
                    v[0] = floatstr(line);
                    fread(h, line); v[1] = floatstr(line);
                    fread(h, line); v[2] = floatstr(line);
                } else {
                    PizzeroNivel[playerid] = strval(line);
                    fread(h, line); PizzeroEntregas[playerid] = strval(line);
                    fread(h, line);
                    if(strfind(line, ".") != -1) {
                        PlayerBankMoney[playerid] = 0;
                        InvSemillaHierba[playerid] = 0;
                        InvSemillaFlor[playerid] = 0;
                        InvHierba[playerid] = 0;
                        InvFlor[playerid] = 0;
                        v[0] = floatstr(line);
                        fread(h, line); v[1] = floatstr(line);
                        fread(h, line); v[2] = floatstr(line);
                    } else {
                        PlayerBankMoney[playerid] = strval(line);
                        fread(h, line);
                        if(strfind(line, ".") != -1) {
                            InvSemillaHierba[playerid] = 0;
                            InvSemillaFlor[playerid] = 0;
                            InvHierba[playerid] = 0;
                            InvFlor[playerid] = 0;
                            v[0] = floatstr(line);
                            fread(h, line); v[1] = floatstr(line);
                            fread(h, line); v[2] = floatstr(line);
                        } else {
                            InvSemillaHierba[playerid] = strval(line);
                            fread(h, line); InvSemillaFlor[playerid] = strval(line);
                            fread(h, line); InvHierba[playerid] = strval(line);
                            fread(h, line); InvFlor[playerid] = strval(line);
                            fread(h, line); v[0] = floatstr(line);
                            fread(h, line); v[1] = floatstr(line);
                            fread(h, line); v[2] = floatstr(line);
                        }
                    }
                }
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
            format(line, 256, "%s\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%f\n%f\n%f",
                PlayerPassword[playerid], GetPlayerMoney(playerid), PlayerAdmin[playerid],
                CamioneroNivel[playerid], CamioneroViajes[playerid], PizzeroNivel[playerid], PizzeroEntregas[playerid], PlayerBankMoney[playerid], InvSemillaHierba[playerid], InvSemillaFlor[playerid], InvHierba[playerid], InvFlor[playerid], p[0], p[1], p[2]);
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

public OnPlayerWeaponShot(playerid, WEAPON:weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ) {
    #pragma unused hittype
    #pragma unused hitid
    #pragma unused fX
    #pragma unused fY
    #pragma unused fZ
    new wid = _:weaponid;
    if(wid <= 0 || wid >= MAX_WEAPON_ID_GM) return 1;
    if(PlayerAmmoInventario[playerid][wid] <= 0) {
        SendClientMessage(playerid, 0xFF0000FF, "Sin municion: compra en armeria.");
        GivePlayerWeapon(playerid, WEAPON:wid, 0);
        return 0;
    }
    PlayerAmmoInventario[playerid][wid]--;
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    #pragma unused reason
    if(PlayerInCasa[playerid] != -1) {
        new casa = PlayerInCasa[playerid];
        SetPlayerPos(playerid, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ]);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        PlayerInCasa[playerid] = -1;
    }
    GuardarCuenta(playerid);
    if(CamioneroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(CamioneroVehiculo[playerid]);
    if(PizzeroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(PizzeroVehiculo[playerid]);
    if(BasureroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(BasureroVehiculo[playerid]);
    TrabajandoCamionero[playerid] = 0;
    TrabajandoPizzero[playerid] = 0;
    TrabajandoBasurero[playerid] = 0;
    CamioneroVehiculo[playerid] = INVALID_VEHICLE_ID;
    PizzeroVehiculo[playerid] = INVALID_VEHICLE_ID;
    BasureroVehiculo[playerid] = INVALID_VEHICLE_ID;
    BasureroRecolectado[playerid] = 0;
    BasureroRecolectando[playerid] = false;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    FinalizarCultivoVisual(playerid);
    CultivoActivo[playerid] = 0;
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) { PlayerArmaComprada[playerid][w] = false; PlayerAmmoInventario[playerid][w] = 0; }
    return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid) {
    #pragma unused oldinteriorid
    if(!IsPlayerConnected(playerid) || !IsPlayerLoggedIn[playerid]) return 1;

    if(IsNearBusinessInterior(playerid) || (PlayerInCasa[playerid] == -1 && newinteriorid != 0)) {
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        SetPlayerPos(playerid, 2494.24, -1671.19, 13.33);
        SetCameraBehindPlayer(playerid);
        SendClientMessage(playerid, 0xFF0000FF, "Los interiores estan bloqueados. Entra a casas solo con H en el icono de casa.");
        return 1;
    }

    if(PlayerInCasa[playerid] != -1 && newinteriorid != 3) {
        SetPlayerInterior(playerid, 3);
        SetPlayerVirtualWorld(playerid, PlayerInCasa[playerid] + 1);
        SetPlayerPos(playerid, CASA_INT_X, CASA_INT_Y, CASA_INT_Z);
        SetCameraBehindPlayer(playerid);
        SendClientMessage(playerid, 0xFF0000FF, "No uses el marker amarillo. Usa /salir para salir de tu casa.");
        return 1;
    }
    return 1;
}

public OnPlayerRequestClass(playerid, classid) {
    #pragma unused classid
    SetPlayerPos(playerid, 2494.24, -1680.0, 15.0);
    return 1;
}


public ActualizarCultivo(playerid) {
    if(!IsPlayerConnected(playerid) || !CultivoActivo[playerid]) return 0;
    ActualizarLabelCultivo(playerid);
    return 1;
}

stock IsNearSemilleria(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoSemilleria][0], PuntoPos[puntoSemilleria][1], PuntoPos[puntoSemilleria][2])) return 1;
    return 0;
}

stock IsNearArmeria(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2])) return 1;
    return 0;
}

stock ShowArmeriaMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_CATEGORIA, DIALOG_STYLE_LIST, "Armeria KameHouse", "Armas disponibles\nComprar municion", "Abrir", "Cerrar");
    return 1;
}

stock ShowArmeriaArmasDisponibles(playerid) {
    new body[1024], line[128], nombreArma[32], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        if(!ArmeriaItems[i][aiActiva]) continue;
        GetWeaponNameGM(ArmeriaItems[i][aiArma], nombreArma, sizeof(nombreArma));
        format(line, sizeof(line), "%s | Arma $%d | Stock:%d\n", nombreArma, ArmeriaItems[i][aiPrecioArma], ArmeriaItems[i][aiStockArma]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay armas disponibles por ahora.");
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_ARMAS, DIALOG_STYLE_LIST, "Armas disponibles", body, "Comprar", "Atras");
    return 1;
}

stock ShowArmeriaMunicionDisponible(playerid) {
    new body[1024], line[128], nombreArma[32], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        if(!ArmeriaItems[i][aiActiva]) continue;
        if(ArmeriaItems[i][aiStockMunicion] <= 0) continue;
        GetWeaponNameGM(ArmeriaItems[i][aiArma], nombreArma, sizeof(nombreArma));
        format(line, sizeof(line), "%s | Pack %d | $%d | Disp:%d\n", nombreArma, ArmeriaItems[i][aiMunicionPack], ArmeriaItems[i][aiPrecioMunicion], ArmeriaItems[i][aiStockMunicion]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay municion disponible por ahora.");
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_MUNICION, DIALOG_STYLE_LIST, "Municion disponible", body, "Comprar", "Atras");
    return 1;
}

stock ShowAdminArmasMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_MENU, DIALOG_STYLE_LIST, "Admin Armas", "Agregar arma\nQuitar arma", "Seleccionar", "Cerrar");
    return 1;
}

stock GetArmeriaItemByListIndex(listindex) {
    new current;
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        if(!ArmeriaItems[i][aiActiva]) continue;
        if(current == listindex) return i;
        current++;
    }
    return -1;
}

stock GetArmeriaItemByStockMuniIndex(listindex) {
    new current;
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        if(!ArmeriaItems[i][aiActiva]) continue;
        if(ArmeriaItems[i][aiStockMunicion] <= 0) continue;
        if(current == listindex) return i;
        current++;
    }
    return -1;
}

stock CrearVehiculoTrabajoUnico(playerid, modelid, Float:x, Float:y, Float:z, Float:a, c1, c2, &vehvar) {
    #pragma unused playerid
    if(vehvar != INVALID_VEHICLE_ID) DestroyVehicle(vehvar);
    vehvar = CreateVehicle(modelid, x, y, z, a, c1, c2, 0);
    return 1;
}

stock CargarRutasBasura() {
    TotalRutasBasura = 0;
    new File:h = fopen(PATH_RUTAS_BASURA, io_read);
    if(!h) return 1;
    new line[64];
    while(fread(h, line) && TotalRutasBasura < MAX_RUTAS_BASURA) {
        sscanf_manual(line, BasuraRuta[TotalRutasBasura][0], BasuraRuta[TotalRutasBasura][1], BasuraRuta[TotalRutasBasura][2]);
        TotalRutasBasura++;
    }
    fclose(h);
    return 1;
}

stock IniciarRutaBasurero(playerid) {
    if(TotalRutasBasura <= 0) return 0;
    new punto = random(TotalRutasBasura);
    BasureroDestino[playerid][0] = BasuraRuta[punto][0];
    BasureroDestino[playerid][1] = BasuraRuta[punto][1];
    BasureroDestino[playerid][2] = BasuraRuta[punto][2];
    SetPlayerCheckpoint(playerid, BasureroDestino[playerid][0], BasureroDestino[playerid][1], BasureroDestino[playerid][2], 4.0);
    TrabajandoBasurero[playerid] = 1;
    return 1;
}

stock FinalizarTrabajoBasurero(playerid) {
    DisablePlayerCheckpoint(playerid);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);

    if(BasureroRecolectado[playerid] > 0) {
        new nivel = BasureroNivel[playerid];
        if(nivel > NIVEL_MAX_TRABAJO) nivel = NIVEL_MAX_TRABAJO;
        new pago = 400 + (BasureroRecolectado[playerid] * 220) + (nivel * 190);
        if(pago > PAGO_MAX_BASURERO) pago = PAGO_MAX_BASURERO;
        GivePlayerMoney(playerid, pago);

        BasureroRecorridos[playerid]++;
        if(BasureroRecorridos[playerid] >= PROGRESO_BASURERO_POR_NIVEL) {
            BasureroRecorridos[playerid] = 0;
            if(BasureroNivel[playerid] < NIVEL_MAX_TRABAJO) BasureroNivel[playerid]++;
        }

        new msg[160];
        format(msg, sizeof(msg), "{66FF66}Progreso basurero:{FFFFFF} %d/%d | Nivel actual: %d/%d", BasureroRecorridos[playerid], PROGRESO_BASURERO_POR_NIVEL, BasureroNivel[playerid], NIVEL_MAX_TRABAJO);
        SendClientMessage(playerid, 0x66FF66FF, msg);
        format(msg, sizeof(msg), "{66FF66}[BASURERO]{FFFFFF} Te pagaron: {00FF00}$%d", pago);
        SendClientMessage(playerid, 0x66FF66FF, msg);
    }

    if(BasureroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(BasureroVehiculo[playerid]);
    BasureroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoBasurero[playerid] = 0;
    BasureroRecolectado[playerid] = 0;
    BasureroRecolectando[playerid] = false;
    return 1;
}

stock GetWeaponNameGM(weaponid, dest[], len) {
    switch(weaponid) {
        case 22: format(dest, len, "Colt 45");
        case 23: format(dest, len, "Silenced 9mm");
        case 24: format(dest, len, "Desert Eagle");
        case 25: format(dest, len, "Shotgun");
        case 26: format(dest, len, "Sawn-off");
        case 27: format(dest, len, "Combat Shotgun");
        case 28: format(dest, len, "UZI");
        case 29: format(dest, len, "MP5");
        case 30: format(dest, len, "AK-47");
        case 31: format(dest, len, "M4");
        case 32: format(dest, len, "TEC-9");
        case 33: format(dest, len, "Rifle");
        case 34: format(dest, len, "Sniper");
        default: format(dest, len, "Arma %d", weaponid);
    }
    return 1;
}

stock ShowSemilleriaMenu(playerid) {
    new body[192];
    format(body, sizeof(body), "Semilla hierva verde - $%d\nSemilla flores - $%d", SEMILLA_HIERBA_PRECIO, SEMILLA_FLOR_PRECIO);
    ShowPlayerDialog(playerid, DIALOG_SEMILLERIA, DIALOG_STYLE_LIST, "Semilleria", body, "Comprar", "Cerrar");
    return 1;
}

stock ActualizarLabelCultivo(playerid) {
    if(!CultivoActivo[playerid]) return 0;
    new restante = CultivoReadyTick[playerid] - GetTickCount();
    new label[96];
    if(restante <= 0) {
        format(label, sizeof(label), "Cultivo listo\nUsa /cosehar");
    } else {
        format(label, sizeof(label), "Cultivo en progreso\nListo en: %d seg", restante / 1000);
    }
    if(CultivoLabel[playerid] != Text3D:-1) {
        Update3DTextLabelText(CultivoLabel[playerid], 0x00FF00FF, label);
    }
    return 1;
}

stock FinalizarCultivoVisual(playerid) {
    if(CultivoTimer[playerid] != -1) {
        KillTimer(CultivoTimer[playerid]);
        CultivoTimer[playerid] = -1;
    }
    if(CultivoObj[playerid] != -1) {
        DestroyObject(CultivoObj[playerid]);
        CultivoObj[playerid] = -1;
    }
    if(CultivoLabel[playerid] != Text3D:-1) {
        Delete3DTextLabel(CultivoLabel[playerid]);
        CultivoLabel[playerid] = Text3D:-1;
    }
    return 1;
}

stock GetPuntoMovibleNombre(ePuntoMovible:punto, dest[], len) {
    switch(punto) {
        case puntoCamionero: format(dest, len, "Trabajo camionero");
        case puntoPizzeria: format(dest, len, "Pizzeria");
        case puntoBasurero: format(dest, len, "Trabajo basurero");
        case puntoCarga: format(dest, len, "Deposito de carga");
        case puntoBanco: format(dest, len, "Banco");
        case puntoSemilleria: format(dest, len, "Semilleria");
        case puntoArmeria: format(dest, len, "Armeria");
        default: format(dest, len, "Punto");
    }
    return 1;
}

stock RecrearPuntoFijo(ePuntoMovible:punto) {
    if(PuntoPickup[punto] != 0) {
        DestroyPickup(PuntoPickup[punto]);
        PuntoPickup[punto] = 0;
    }
    if(PuntoLabel[punto] != Text3D:-1) {
        Delete3DTextLabel(PuntoLabel[punto]);
        PuntoLabel[punto] = Text3D:-1;
    }

    switch(punto) {
        case puntoCamionero: {
            PuntoPickup[punto] = CreatePickup(1210, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Trabajo: {FFFF00}Camionero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para iniciar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 10.0, 0);
        }
        case puntoPizzeria: {
            PuntoPickup[punto] = CreatePickup(1581, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Trabajo: {FF4500}Pizzero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}en la pizzeria", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoBasurero: {
            PuntoPickup[punto] = CreatePickup(1239, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Trabajo: {00C853}Basurero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para iniciar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoCarga: {
            PuntoPickup[punto] = CreatePickup(1271, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Deposito de carga\n{FFFFFF}Punto de trabajo camionero", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoBanco: {
            PuntoPickup[punto] = CreatePickup(1274, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Banco KameHouse\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para abrir", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoSemilleria: {
            PuntoPickup[punto] = CreatePickup(1275, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("Semilleria\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoArmeria: {
            PuntoPickup[punto] = CreatePickup(1242, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{AA0000}Mercado de armas\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case totalPuntosMovibles: {
            return 1;
        }
    }
    return 1;
}

stock CrearPuntosFijos() {
    for(new i = 0; i < _:totalPuntosMovibles; i++) {
        RecrearPuntoFijo(ePuntoMovible:i);
    }
    return 1;
}

stock ShowAyudaDialog(playerid) {
    new texto[1024];
    if(PlayerAdmin[playerid] >= 1) {
        format(texto, sizeof(texto), "{00FF00}Comandos usuario:\n{FFFFFF}/g /skills /comer /inventario /plantar /cosehar /consumir /dejartrabajo /cancelartrabajo /gps /pagar /saldo /salir /comprar /abrircasa /ayuda\n\n{FFAA00}Comandos admin:\n{FFFFFF}/crearparada /crearparadapizza /crearparadabasura /kick /dardinero /dararma /adminarmas /mover /tp /gotomap /crearcasa /eliminarcasa");
    } else {
        format(texto, sizeof(texto), "{00FF00}Comandos basicos:\n{FFFFFF}/g /skills /comer /inventario /plantar /cosehar /consumir /dejartrabajo /cancelartrabajo /gps /pagar /saldo /salir /comprar /abrircasa /ayuda\n\n{AAAAAA}Tip: ve al icono del banco y presiona H para guardar, retirar o transferir dinero.");
    }
    ShowPlayerDialog(playerid, DIALOG_AYUDA, DIALOG_STYLE_MSGBOX, "Ayuda del servidor", texto, "Cerrar", "");
    return 1;
}

stock IsNearBank(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoBanco][0], PuntoPos[puntoBanco][1], PuntoPos[puntoBanco][2])) return 1;
    return 0;
}

stock ShowBankMenu(playerid) {
    new msg[144];
    format(msg, sizeof(msg), "Dinero en mano: $%d\nSaldo banco: $%d", GetPlayerMoney(playerid), PlayerBankMoney[playerid]);
    ShowPlayerDialog(playerid, DIALOG_BANK_MENU, DIALOG_STYLE_LIST, "Banco KameHouse", "Depositar\nRetirar\nTransferir", "Seleccionar", "Cerrar");
    SendClientMessage(playerid, 0x00FFFFFF, msg);
    return 1;
}

stock IsNearBusinessInterior(playerid) {
    if(PlayerInCasa[playerid] != -1) return 0;
    new interior = GetPlayerInterior(playerid);
    if(interior == 0) return 0;
    if(interior == 3) return 0;
    return 1;
}

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
