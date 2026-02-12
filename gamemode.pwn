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
#define HORAS_POR_NIVEL_PJ   2

#define PAGO_MAX_PIZZERO     2600
#define PAGO_MAX_CAMIONERO   6800
#define PAGO_MAX_BASURERO    4500

#define PAGO_BASE_CAMIONERO   1700
#define PAGO_BASE_PIZZERO      750
#define PAGO_BASE_BASURERO     650

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
#define DIALOG_ADMIN_ARMAS_REMOVE 22
#define DIALOG_ARMERIA_MENU   23
#define DIALOG_ARMERIA_COMPRA 24
#define DIALOG_MOVER_MENU     25
#define DIALOG_ARMERIA_CATEGORIA 26
#define DIALOG_ARMERIA_ARMAS     27
#define DIALOG_ARMERIA_MUNICION  28
#define DIALOG_ARMERIA_MUNI_CANT 29
#define DIALOG_ADMIN_ARMAS_ADD_ID 30
#define DIALOG_ADMIN_ARMAS_ADD_PRECIO 31
#define DIALOG_ADMIN_ARMAS_ADD_STOCK 32
#define DIALOG_VENTA_AUTOS 33
#define DIALOG_VENTA_AUTOS_BUY 34
#define DIALOG_AYUDA_CATEGORIA 35

#define MAX_PLANTAS_POR_JUGADOR 5
#define BOLSA_OBJ_MODEL 1264
#define BASURERO_NPC_SKIN 16
#define BASURERO_FLORES_CHANCE 30

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
new PlayerTiempoJugadoMin[MAX_PLAYERS];

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
new bool:BasureroTieneBolsa[MAX_PLAYERS];
new bool:BasureroDepositandoBolsa[MAX_PLAYERS];
new bool:BasureroBolsaVisible[MAX_PLAYERS];

// Variables Inventario/Cultivo
new InvSemillaHierba[MAX_PLAYERS];
new InvSemillaFlor[MAX_PLAYERS];
new InvHierba[MAX_PLAYERS];
new InvFlor[MAX_PLAYERS];
new CultivoActivo[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new CultivoTipo[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new CultivoCantidadBase[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new CultivoReadyTick[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new CultivoObj[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new Text3D:CultivoLabel[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR];
new Float:CultivoPos[MAX_PLAYERS][MAX_PLANTAS_POR_JUGADOR][3];
new CultivoTimer[MAX_PLAYERS] = {-1, ...};
new PlantasColocadas[MAX_PLAYERS];

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
new ArmeriaAdminArmaPendiente[MAX_PLAYERS];
new bool:PlayerArmaComprada[MAX_PLAYERS][MAX_WEAPON_ID_GM];
new PlayerAmmoInventario[MAX_PLAYERS][MAX_WEAPON_ID_GM];

#define MAX_RUTAS_BASURA 128
new Float:BasuraRuta[MAX_RUTAS_BASURA][3];
new TotalRutasBasura;
new BasuraPickup[MAX_RUTAS_BASURA];
new Text3D:BasuraLabel[MAX_RUTAS_BASURA] = {Text3D:-1, ...};
new bool:BasuraRecolectadaPunto[MAX_PLAYERS][MAX_RUTAS_BASURA];
new BasureroEntregando[MAX_PLAYERS];
new BasureroFloresEncontradas[MAX_PLAYERS];

enum ePuntoMovible {
    puntoCamionero,
    puntoPizzeria,
    puntoBasurero,
    puntoCarga,
    puntoBanco,
    puntoSemilleria,
    puntoArmeria,
    puntoVentaAutos,
    totalPuntosMovibles
}
new Float:PuntoPos[totalPuntosMovibles][3];
new PuntoPickup[totalPuntosMovibles] = {0, ...};
new Text3D:PuntoLabel[totalPuntosMovibles] = {Text3D:-1, ...};
new BasureroNPC = INVALID_ACTOR_ID;

#define MAX_AUTOS_VENTA 20
enum eVentaAuto {
    bool:vaActiva,
    vaModelo,
    vaPrecio,
    vaStock
}
new bool:VentaAutosActiva;
new Float:VentaAutosPos[3];
new VentaAutosPickup;
new Text3D:VentaAutosLabel = Text3D:-1;
new VentaAutosData[MAX_AUTOS_VENTA][eVentaAuto];

// Adelantos de funciones usadas antes de su implementacion
forward strtok(const string[], &index);
forward sscanf_manual(const string[], &Float:x, &Float:y, &Float:z);
forward GuardarCasas();
forward GuardarCuenta(playerid);
forward BajarHambre();
forward ChequearLimitesMapa();
forward AutoGuardadoGlobal();
forward FinalizarRecolectaBasura(playerid);
forward SubirTiempoJugado();
forward ClearPlayerAnimLock(playerid);
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

    new punto = GetBasuraPointNearPlayer(playerid);
    if(punto == -1) {
        SendClientMessage(playerid, 0xFF0000FF, "No estas en un punto valido de basura.");
        IniciarRutaBasurero(playerid);
        return 1;
    }

    if(!BasuraRecolectadaPunto[playerid][punto]) {
        BasuraRecolectadaPunto[playerid][punto] = true;
        BasureroRecolectado[playerid]++;
        ActualizarHUDRecolectaBasurero(playerid);
    }

    BasureroTieneBolsa[playerid] = true;
    BasureroDepositandoBolsa[playerid] = true;
    if(!BasureroBolsaVisible[playerid]) {
        SetPlayerAttachedObject(playerid, 9, BOLSA_OBJ_MODEL, 6, 0.10, 0.05, -0.05, 0.0, 90.0, 0.0, 0.70, 0.75, 0.70);
        BasureroBolsaVisible[playerid] = true;
    }
    SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 4.5);
    SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Tienes una bolsa. Acercate a la Rumpo y presiona H para cargarla.");

    if(BasureroRecolectado[playerid] >= TotalRutasBasura) {
        SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Ultima bolsa recolectada. Cargala en la Rumpo para ir automaticamente al vertedero.");
    }

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
stock GetBasuraPointNearPlayer(playerid);
stock ActualizarHUDRecolectaBasurero(playerid);
stock ActualizarLabelCultivo(playerid, slot);
stock FinalizarCultivoVisual(playerid, slot);
stock FinalizarTodosLosCultivos(playerid);
stock GetPrimerSlotCultivoLibre(playerid);
stock GetCultivoCosechableCercano(playerid);
stock CrearPuntosFijos();
stock CrearPuntosFijos();
stock RecrearPuntoFijo(ePuntoMovible:punto);
stock GetPuntoMovibleNombre(ePuntoMovible:punto, dest[], len);
stock IsNearVentaAutos(playerid);
stock ActualizarLabelVentaAutos();
stock ShowVentaAutosBuyMenu(playerid);
stock GetVentaAutoByListIndex(listindex);
stock GetNivelPJ(playerid);
stock ActualizarNivelPJ(playerid);

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

    PuntoPos[puntoVentaAutos][0] = POS_BANCO_X + 12.0;
    PuntoPos[puntoVentaAutos][1] = POS_BANCO_Y + 4.0;
    PuntoPos[puntoVentaAutos][2] = POS_BANCO_Z;

    CrearPuntosFijos();
    if(BasureroNPC != INVALID_ACTOR_ID) DestroyActor(BasureroNPC);
    BasureroNPC = CreateActor(BASURERO_NPC_SKIN, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 180.0);
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

            CasaPickup[TotalCasas] = CreatePickup(strcmp(CasaData[TotalCasas][cOwner], "None") == 0 ? 1273 : 1559, 2, CasaData[TotalCasas][cX], CasaData[TotalCasas][cY], CasaData[TotalCasas][cZ], 0);

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
    SetTimer("SubirTiempoJugado", 60000, true);
    return 1;
}

// ================= [ SISTEMA DE TRABAJO ] =================

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if(!(newkeys & KEY_CTRL_BACK)) return 1; // Tecla H

    if(TrabajandoBasurero[playerid] > 0 && !IsPlayerInAnyVehicle(playerid) && BasureroRecolectando[playerid]) {
        BasureroRecolectando[playerid] = false;
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("FinalizarRecolectaBasura", 3000, false, "d", playerid);
        GameTextForPlayer(playerid, "~w~RECOLECTANDO BASURA", 2000, 3);
        return 1;
    }

    if(TrabajandoBasurero[playerid] > 0 && !IsPlayerInAnyVehicle(playerid) && BasureroTieneBolsa[playerid]) {
        new Float:vx, Float:vy, Float:vz;
        GetVehiclePos(BasureroVehiculo[playerid], vx, vy, vz);
        if(!IsPlayerInRangeOfPoint(playerid, 3.0, vx, vy, vz)) {
            SendClientMessage(playerid, 0xFF0000FF, "[Basurero] Debes estar al lado de la Rumpo para cargar la bolsa.");
            return 1;
        }
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("ClearPlayerAnimLock", 1200, false, "d", playerid);
        BasureroTieneBolsa[playerid] = false;
        BasureroDepositandoBolsa[playerid] = false;
        if(BasureroBolsaVisible[playerid]) { RemovePlayerAttachedObject(playerid, 9); BasureroBolsaVisible[playerid] = false; }
        if(BasureroRecolectado[playerid] >= TotalRutasBasura) {
            BasureroEntregando[playerid] = 1;
            SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 6.0);
            SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Ruta completa. Sube a la Rumpo y regresa al vertedero para cobrar.");
        } else {
            SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Bolsa subida a la Rumpo. Ve al siguiente punto.");
            IniciarRutaBasurero(playerid);
        }
        return 1;
    }

    if(IsNearVentaAutos(playerid)) {
        if(PlayerAdmin[playerid] >= 1) {
            ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS, DIALOG_STYLE_INPUT, "Admin Venta Autos", "1 [modelo] [precio] [stock] = agregar auto\n2 [modelo] = eliminar auto\n3 = eliminar venta\n\nEjemplo: 1 411 50000 3", "Aceptar", "Cerrar");
            return 1;
        }
        return ShowVentaAutosBuyMenu(playerid);
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
        SendClientMessage(playerid, -1, "{FFD700}[Camionero]{FFFFFF} Sube al camion y ve al punto de carga.");
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
        SendClientMessage(playerid, -1, "{FF4500}[Pizzero]{FFFFFF} Entrega pizzas y sigue el checkpoint para cobrar.");
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
        BasureroEntregando[playerid] = 0;
        BasureroFloresEncontradas[playerid] = 0;
        for(new b = 0; b < TotalRutasBasura; b++) BasuraRecolectadaPunto[playerid][b] = false;
        TrabajandoBasurero[playerid] = 1;
        IniciarRutaBasurero(playerid);
        SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Recolecta basura y cargala en la Rumpo estando a su lado con H.");
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
        if(BasureroDepositandoBolsa[playerid]) {
            if(GetPlayerVehicleID(playerid) != BasureroVehiculo[playerid]) {
                SendClientMessage(playerid, 0xFF0000FF, "[Basurero] Sube a la Rumpo para cargar la bolsa.");
                return 1;
            }
            SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Acercate a la Rumpo y presiona H para subir la bolsa.");
            return 1;
        }

        if(BasureroEntregando[playerid] == 1) {
            if(GetPlayerVehicleID(playerid) != BasureroVehiculo[playerid]) {
                SendClientMessage(playerid, 0xFF0000FF, "Debes entregar la basura usando la Rumpo del trabajo.");
                return 1;
            }
            DisablePlayerCheckpoint(playerid);
            FinalizarTrabajoBasurero(playerid);
            return 1;
        }

        if(GetPlayerVehicleID(playerid) != BasureroVehiculo[playerid]) {
            SendClientMessage(playerid, 0xFFFF00FF, "[Basurero] Baja de la Rumpo y presiona H para recolectar la basura.");
            BasureroRecolectando[playerid] = true;
            return 1;
        }
        DisablePlayerCheckpoint(playerid);
        TrabajandoBasurero[playerid] = 2;
        BasureroRecolectando[playerid] = true;
        SendClientMessage(playerid, 0x66FF66FF, "[Basurero] Baja de la Rumpo y presiona H para recolectar (3s).");
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
            SendClientMessage(playerid, -1, "{FFD700}[Camionero]{FFFFFF} Carga completa. Entrega la mercancia en el checkpoint.");
        }
        fclose(h);
    } else SendClientMessage(playerid, -1, "{FF0000}ERROR: No hay rutas guardadas.");
    return 1;
}

forward FinalizarDescarga(playerid);
forward AsignarRutaPizzero(playerid);

public ClearPlayerAnimLock(playerid) {
    if(!IsPlayerConnected(playerid)) return 1;
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    return 1;
}

forward FinalizarEntregaPizza(playerid);
forward ActualizarCultivo(playerid);
public FinalizarDescarga(playerid) {
    TogglePlayerControllable(playerid, true);
    TrabajandoCamionero[playerid] = 5;
    SetPlayerCheckpoint(playerid, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], 5.0);
    SendClientMessage(playerid, -1, "{FFD700}[Camionero]{FFFFFF} Descarga lista. Regresa al deposito para cobrar.");
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

    new pagoBase = PAGO_BASE_CAMIONERO;
    new pagoDistancia = floatround(distancia * 0.18);
    if(pagoDistancia < 80) pagoDistancia = 80;
    if(pagoDistancia > 420) pagoDistancia = 420;
    new pagoNivel = nivelCamionero * 65;
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

    if(random(100) < 6) {
        InvFlor[playerid]++;
        SendClientMessage(playerid, 0xFF66CCFF, "Encontraste flores durante el recorrido de camionero.");
    }

    new str[160];
    format(str, sizeof(str), "{FFD700}[Camionero]{FFFFFF} Pago base:$%d | Nivel:$%d | Distancia:$%d | Total:$%d", pagoBase, pagoNivel, pagoDistancia, pago);
    SendClientMessage(playerid, 0x00FF00FF, str);
    format(str, sizeof(str), "{FFD700}[Camionero]{FFFFFF} Progreso: %d/%d | Nivel: %d/%d", CamioneroViajes[playerid], PROGRESO_CAMIONERO_POR_NIVEL, CamioneroNivel[playerid], NIVEL_MAX_TRABAJO);
    SendClientMessage(playerid, 0x00FF00FF, str);
    format(str, sizeof(str), "{FFD700}[Camionero]{FFFFFF} Pago recibido: {00FF00}$%d", pago);
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
    SendClientMessage(playerid, 0xFF8C00FF, "[Pizzero] Nueva entrega asignada. Ve al checkpoint y entrega la pizza.");
    return 1;
}

public FinalizarEntregaPizza(playerid) {
    if(!IsPlayerConnected(playerid) || TrabajandoPizzero[playerid] == 0) return 1;
    TogglePlayerControllable(playerid, true);
    new Float:distancia = GetDistanceBetweenPoints(PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], PizzeroDestino[playerid][0], PizzeroDestino[playerid][1], PizzeroDestino[playerid][2]);
    new nivelPizzero = PizzeroNivel[playerid];
    if(nivelPizzero > NIVEL_MAX_TRABAJO) nivelPizzero = NIVEL_MAX_TRABAJO;

    new pagoBase = PAGO_BASE_PIZZERO;
    new pagoDistancia = floatround(distancia * 1.35);
    if(pagoDistancia < 120) pagoDistancia = 120;
    if(pagoDistancia > 340) pagoDistancia = 340;
    new pagoNivel = nivelPizzero * 65;
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
    format(info, sizeof(info), "{FF4500}[Pizzero]{FFFFFF} Pago base:$%d | Nivel:$%d | Distancia:$%d | Total:$%d", pagoBase, pagoNivel, pagoDistancia, pago);
    SendClientMessage(playerid, 0x00FF00FF, info);
    format(info, sizeof(info), "{FF4500}[Pizzero]{FFFFFF} Progreso: %d/%d | Nivel: %d/%d", PizzeroEntregas[playerid], PROGRESO_PIZZERO_POR_NIVEL, PizzeroNivel[playerid], NIVEL_MAX_TRABAJO);
    SendClientMessage(playerid, 0x00FF00FF, info);
    format(info, sizeof(info), "{FF4500}[Pizzero]{FFFFFF} Pago recibido: {00FF00}$%d", pago);
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

    if(!strcmp(cmd, "/lvl", true) || !strcmp(cmd, "/nivel", true)) {
        new nivel = GetNivelPJ(playerid);
        new progreso = PlayerTiempoJugadoMin[playerid] % (HORAS_POR_NIVEL_PJ * 60);
        new faltanMin = (HORAS_POR_NIVEL_PJ * 60) - progreso;
        if(progreso == 0 && PlayerTiempoJugadoMin[playerid] > 0) faltanMin = HORAS_POR_NIVEL_PJ * 60;
        new horas = faltanMin / 60;
        new mins = faltanMin % 60;

        new body[384], pagoHora = nivel * 500;
        format(body, sizeof(body), "{33CCFF}Nivel PJ: {FFFFFF}%d
{33CCFF}Tiempo jugado: {FFFFFF}%d horas
{33CCFF}Prox nivel en: {FFFFFF}%dh %dm
{33CCFF}Pago por hora: {00FF00}$%d
{33CCFF}Capacidad de vehiculos: {FFFFFF}1/3 Vehiculos", nivel, PlayerTiempoJugadoMin[playerid] / 60, horas, mins, pagoHora);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "{FFD700}Progreso del personaje", body, "Cerrar", "");
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
        if(PlantasColocadas[playerid] >= MAX_PLANTAS_POR_JUGADOR) return SendClientMessage(playerid, -1, "Limite alcanzado: maximo 5 plantas por jugador en casa.");
        ShowPlayerDialog(playerid, DIALOG_PLANTAR, DIALOG_STYLE_LIST, "Plantar", "Hierba verde\nFlores", "Plantar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/cosehar", true) || !strcmp(cmd, "/cosechar", true)) {
        new slot = GetCultivoCosechableCercano(playerid);
        if(slot == -1) return SendClientMessage(playerid, -1, "No tienes cultivos listos cerca. Acercate a una planta madura para cosecharla.");
        new restante = CultivoReadyTick[playerid][slot] - GetTickCount();
        if(restante > 0) {
            new ms[96];
            format(ms, sizeof(ms), "Ese cultivo aun no esta listo. Falta: %d segundos.", restante / 1000);
            return SendClientMessage(playerid, -1, ms);
        }

        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        new extra = random(3);
        new total = CultivoCantidadBase[playerid][slot] + extra;
        if(CultivoTipo[playerid][slot] == 1) {
            InvHierba[playerid] += total;
        } else {
            InvFlor[playerid] += total;
        }

        FinalizarCultivoVisual(playerid, slot);
        CultivoActivo[playerid][slot] = 0;
        if(PlantasColocadas[playerid] > 0) PlantasColocadas[playerid]--;
        CultivoTipo[playerid][slot] = 0;
        CultivoCantidadBase[playerid][slot] = 0;
        CultivoReadyTick[playerid][slot] = 0;

        new ok[96];
        format(ok, sizeof(ok), "Cosecha completada. Obtuviste %d unidades. Plantas activas: %d/%d.", total, PlantasColocadas[playerid], MAX_PLANTAS_POR_JUGADOR);
        SendClientMessage(playerid, 0x00FF00FF, ok);
        return 1;
    }

    if(!strcmp(cmd, "/consumir", true)) {
        ShowPlayerDialog(playerid, DIALOG_CONSUMIR, DIALOG_STYLE_LIST, "Consumir", "Hierba verde (chaleco)\nFlores (vida)", "Usar", "Cerrar");
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

    if(!strcmp(cmd, "/tirarbasura", true)) {
        return SendClientMessage(playerid, -1, "Ahora la entrega es automatica: al cargar la ultima bolsa se marcara el vertedero automaticamente.");
    }

    if(!strcmp(cmd, "/gps", true)) {
        ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS de la ciudad", "Trabajo Camionero\nPizzeria Los Santos\nTrabajo Basurero\nDeposito de Carga\nBanco KameHouse\nSemilleria\nArmeria\nVenta de autos", "Ir", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/ayuda", true)) {
        ShowPlayerDialog(playerid, DIALOG_AYUDA_CATEGORIA, DIALOG_STYLE_LIST, "Ayuda por categorias", "General\nTrabajos\nCasas y plantado\nEconomia\nAdmin", "Ver", "Cerrar");
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

    if(!strcmp(cmd, "/comprarauto", true)) {
        return SendClientMessage(playerid, -1, "Ahora se usa la tecla H en el concesionario para ver los autos disponibles.");
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
        if(CasaPickup[casa] != 0) DestroyPickup(CasaPickup[casa]);
        CasaPickup[casa] = CreatePickup(1559, 2, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ], 0);
        SendClientMessage(playerid, 0x00FF00FF, "Casa comprada exitosamente.");
        GuardarCasas();
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


    if(!strcmp(cmd, "/crearventadeautos", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        new Float:p[3];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        VentaAutosPos[0] = p[0];
        VentaAutosPos[1] = p[1];
        VentaAutosPos[2] = p[2];
        PuntoPos[puntoVentaAutos][0] = p[0];
        PuntoPos[puntoVentaAutos][1] = p[1];
        PuntoPos[puntoVentaAutos][2] = p[2];
        RecrearPuntoFijo(puntoVentaAutos);
        VentaAutosActiva = true;
        if(VentaAutosPickup != 0) DestroyPickup(VentaAutosPickup);
        if(VentaAutosLabel != Text3D:-1) Delete3DTextLabel(VentaAutosLabel);
        VentaAutosPickup = CreatePickup(1274, 1, p[0], p[1], p[2], 0);
        ActualizarLabelVentaAutos();
        SendClientMessage(playerid, 0x00FF00FF, "Punto de venta de autos creado. Usa /agregarauto en el punto.");
        return 1;
    }

    if(!strcmp(cmd, "/agregarauto", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(!VentaAutosActiva || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el checkpoint de venta de autos.");
        ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS, DIALOG_STYLE_INPUT, "Admin Venta Autos", "1 [modelo] [precio] [stock] = agregar auto\n2 [modelo] = eliminar auto\n3 = eliminar venta\n\nEjemplo: 1 411 50000 3", "Aceptar", "Cerrar");
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

    if(!strcmp(cmd, "/adminarmas", true) || !strcmp(cmd, "/adminarma", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowAdminArmasMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/mover", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowPlayerDialog(playerid, DIALOG_MOVER_MENU, DIALOG_STYLE_LIST, "Mover iconos y puntos", "Trabajo Camionero\nPizzeria\nTrabajo Basurero\nDeposito de Carga\nBanco\nSemilleria\nArmeria\nVenta de autos", "Mover aqui", "Cerrar");
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
            CasaPickup[i] = CreatePickup(strcmp(CasaData[i][cOwner], "None") == 0 ? 1273 : 1559, 2, CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ], 0);

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
    BasureroTieneBolsa[playerid] = false;
    BasureroDepositandoBolsa[playerid] = false;
    if(BasureroBolsaVisible[playerid]) { RemovePlayerAttachedObject(playerid, 9); BasureroBolsaVisible[playerid] = false; }
    BasureroEntregando[playerid] = 0;
    BasureroFloresEncontradas[playerid] = 0;
    ArmeriaAdminArmaPendiente[playerid] = 0;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    PlayerTiempoJugadoMin[playerid] = 0;
    InvSemillaHierba[playerid] = 0;
    InvSemillaFlor[playerid] = 0;
    InvHierba[playerid] = 0;
    InvFlor[playerid] = 0;
    PlantasColocadas[playerid] = 0;
    if(CultivoTimer[playerid] != -1) { KillTimer(CultivoTimer[playerid]); CultivoTimer[playerid] = -1; }
    for(new c = 0; c < MAX_PLANTAS_POR_JUGADOR; c++) {
        CultivoActivo[playerid][c] = 0;
        CultivoTipo[playerid][c] = 0;
        CultivoCantidadBase[playerid][c] = 0;
        CultivoReadyTick[playerid][c] = 0;
        CultivoObj[playerid][c] = -1;
        CultivoLabel[playerid][c] = Text3D:-1;
        CultivoPos[playerid][c][0] = 0.0;
        CultivoPos[playerid][c][1] = 0.0;
        CultivoPos[playerid][c][2] = 0.0;
    }
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) { PlayerArmaComprada[playerid][w] = false; PlayerAmmoInventario[playerid][w] = 0; }

    new name[MAX_PLAYER_NAME], path[64];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), PATH_USUARIOS, name);
    if(fexist(path)) ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Clave:", "Entrar", "Salir");
    else ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "Registro", "Crea clave:", "Registrar", "Salir");
    ActualizarNivelPJ(playerid);
    return 1;
}

public OnPlayerSpawn(playerid) {
    if(!IsPlayerLoggedIn[playerid]) return Kick(playerid);
    SetPlayerSkin(playerid, SKIN_POR_DEFECTO);
    SetPlayerHealth(playerid, VIDA_AL_LOGUEAR);
    SetPlayerArmour(playerid, 0.0);
    if(GetPVarFloat(playerid, "SpawnX") != 0.0) {
        SetPlayerPos(playerid, GetPVarFloat(playerid, "SpawnX"), GetPVarFloat(playerid, "SpawnY"), GetPVarFloat(playerid, "SpawnZ"));
        DeletePVar(playerid, "SpawnX");
    } else SetPlayerPos(playerid, 2494.24, -1671.19, 13.33);
    SetCameraBehindPlayer(playerid);
    PlayerTextDrawShow(playerid, BarraHambre[playerid]);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

    if(dialogid == DIALOG_AYUDA_CATEGORIA) {
        if(!response) return 1;
        if(listitem == 0) return ShowAyudaDialog(playerid);
        if(listitem == 1) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Trabajos", "/dejartrabajo /cancelartrabajo\nCamionero: ir a checkpoint\nPizzero: entregar con moto\nBasurero: bajar, H para recoger, cargar bolsa al lado de la Rumpo con H", "Cerrar", "");
        if(listitem == 2) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Casas", "/comprar /abrircasa /salir\n/plantar /cosehar /inventario\nMaximo 5 plantas por jugador en su casa", "Cerrar", "");
        if(listitem == 3) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Economia", "/saldo /pagar /comprar\nCada hora recibes pago segun nivel PJ", "Cerrar", "");
        if(listitem == 4) {
            if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
            return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Admin", "/crearparada /crearparadapizza /crearparadabasura\n/kick /dardinero /adminarmas /mover /tp /gotomap\n/crearcasa /eliminarcasa /crearventadeautos /agregarauto", "Cerrar", "");
        }
        return 1;
    }
    if(dialogid == DIALOG_GPS) {
        if(!response) return 1;
        if(listitem == 0) SetPlayerCheckpoint(playerid, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], 6.0);
        else if(listitem == 1) SetPlayerCheckpoint(playerid, PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], 6.0);
        else if(listitem == 2) SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 6.0);
        else if(listitem == 3) SetPlayerCheckpoint(playerid, PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2], 6.0);
        else if(listitem == 4) SetPlayerCheckpoint(playerid, PuntoPos[puntoBanco][0], PuntoPos[puntoBanco][1], PuntoPos[puntoBanco][2], 6.0);
        else if(listitem == 5) SetPlayerCheckpoint(playerid, PuntoPos[puntoSemilleria][0], PuntoPos[puntoSemilleria][1], PuntoPos[puntoSemilleria][2], 6.0);
        else if(listitem == 6) SetPlayerCheckpoint(playerid, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2], 6.0);
        else if(listitem == 7) SetPlayerCheckpoint(playerid, PuntoPos[puntoVentaAutos][0], PuntoPos[puntoVentaAutos][1], PuntoPos[puntoVentaAutos][2], 6.0);
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
        if(ePuntoMovible:listitem == puntoVentaAutos && VentaAutosActiva) {
            VentaAutosPos[0] = px;
            VentaAutosPos[1] = py;
            VentaAutosPos[2] = pz;
            if(VentaAutosPickup != 0) DestroyPickup(VentaAutosPickup);
            VentaAutosPickup = CreatePickup(1274, 1, px, py, pz, 0);
            ActualizarLabelVentaAutos();
        }
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
            SendClientMessage(playerid, 0x00FF00FF, "Compraste 1 semilla de hierba verde.");
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
        if(PlantasColocadas[playerid] >= MAX_PLANTAS_POR_JUGADOR) return SendClientMessage(playerid, -1, "Limite alcanzado: maximo 5 plantas por jugador en casa.");

        new slot = GetPrimerSlotCultivoLibre(playerid);
        if(slot == -1) return SendClientMessage(playerid, -1, "No tienes espacios libres para plantar.");

        if(listitem == 0) {
            if(InvSemillaHierba[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes semillas de hierba verde.");
            InvSemillaHierba[playerid]--;
            CultivoTipo[playerid][slot] = 1;
        } else if(listitem == 1) {
            if(InvSemillaFlor[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes semillas de flores.");
            InvSemillaFlor[playerid]--;
            CultivoTipo[playerid][slot] = 2;
        }

        new Float:px, Float:py, Float:pz;
        GetPlayerPos(playerid, px, py, pz);
        CultivoPos[playerid][slot][0] = px + (0.7 * (slot + 1));
        CultivoPos[playerid][slot][1] = py + (0.45 * ((slot % 2) + 1));
        CultivoPos[playerid][slot][2] = pz - 1.0;

        CultivoActivo[playerid][slot] = 1;
        PlantasColocadas[playerid]++;
        new duracion = TIEMPO_CULTIVO_MIN + random(TIEMPO_CULTIVO_MAX - TIEMPO_CULTIVO_MIN + 1);
        CultivoReadyTick[playerid][slot] = GetTickCount() + (duracion * 1000);
        CultivoCantidadBase[playerid][slot] = 2;

        new modeloCultivo = (CultivoTipo[playerid][slot] == 2) ? 325 : 757;
        CultivoObj[playerid][slot] = CreateObject(modeloCultivo, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2], 0.0, 0.0, 0.0, 200.0);
        CultivoLabel[playerid][slot] = Create3DTextLabel("Cultivo en progreso", 0x00FF00FF, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2] + 1.0, 15.0, 0);
        ActualizarLabelCultivo(playerid, slot);

        if(CultivoTimer[playerid] == -1) CultivoTimer[playerid] = SetTimerEx("ActualizarCultivo", 1000, true, "d", playerid);

        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        new plantmsg[120];
        format(plantmsg, sizeof(plantmsg), "Semilla plantada (%d/%d). Revisa el tiempo en el texto de la planta.", PlantasColocadas[playerid], MAX_PLANTAS_POR_JUGADOR);
        SendClientMessage(playerid, 0x00FF00FF, plantmsg);
        return 1;
    }

    if(dialogid == DIALOG_CONSUMIR) {
        if(!response) return 1;
        if(listitem == 0) {
            if(InvHierba[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes hierba verde para consumir.");
            InvHierba[playerid]--;
            ApplyAnimation(playerid, "SMOKING", "M_smk_in", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
            new Float:armour;
            GetPlayerArmour(playerid, armour);
            armour += 3.0;
            if(armour > 100.0) armour = 100.0;
            SetPlayerArmour(playerid, armour);
            SendClientMessage(playerid, 0x00FF00FF, "Consumiste hierba verde y recuperaste 3% de chaleco.");
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
        ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD_ID, DIALOG_STYLE_INPUT, "Admin Armas - Paso 1", "Ingresa el ID del arma a agregar:", "Siguiente", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_ADD_ID) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new armaId = strval(inputtext);
        if(armaId <= 0 || armaId >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "ID de arma invalida.");
        ArmeriaAdminArmaPendiente[playerid] = armaId;
        ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Admin Armas - Paso 2", "Ingresa el precio del arma:", "Siguiente", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_ADD_PRECIO) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new precioArma = strval(inputtext);
        if(precioArma <= 0) return SendClientMessage(playerid, -1, "Precio invalido.");
        SetPVarInt(playerid, "AdminArmaPrecio", precioArma);
        ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD_STOCK, DIALOG_STYLE_INPUT, "Admin Armas - Paso 3", "Ingresa el stock inicial del arma:", "Guardar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_ADD_STOCK) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new stockArma = strval(inputtext);
        if(stockArma <= 0) return SendClientMessage(playerid, -1, "Stock invalido.");

        new precioArma = GetPVarInt(playerid, "AdminArmaPrecio");
        if(precioArma <= 0) return SendClientMessage(playerid, -1, "Precio pendiente invalido.");
        new armaId = ArmeriaAdminArmaPendiente[playerid];
        if(armaId <= 0 || armaId >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "No hay arma pendiente valida.");

        for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
            if(!ArmeriaItems[i][aiActiva]) {
                ArmeriaItems[i][aiActiva] = true;
                ArmeriaItems[i][aiArma] = armaId;
                ArmeriaItems[i][aiSlot] = i;
                ArmeriaItems[i][aiPrecioArma] = precioArma;
                ArmeriaItems[i][aiPrecioMunicion] = 6;
                ArmeriaItems[i][aiMunicionPack] = 1;
                ArmeriaItems[i][aiStockArma] = stockArma;
                ArmeriaItems[i][aiStockMunicion] = stockArma * 120;
                DeletePVar(playerid, "AdminArmaPrecio");
                SendClientMessage(playerid, 0x00FF00FF, "Arma agregada a la tienda correctamente.");
                return ShowAdminArmasMenu(playerid);
            }
        }
        DeletePVar(playerid, "AdminArmaPrecio");
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
        return 1;
    }

    if(dialogid == DIALOG_ARMERIA_ARMAS) {
        if(!response) return ShowArmeriaMenu(playerid);
        new item = GetArmeriaItemByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(ArmeriaItems[item][aiStockArma] <= 0) return SendClientMessage(playerid, -1, "No hay stock de arma.");
        if(GetPlayerMoney(playerid) < ArmeriaItems[item][aiPrecioArma]) return SendClientMessage(playerid, -1, "No tienes dinero para comprar esta arma.");
        GivePlayerMoney(playerid, -ArmeriaItems[item][aiPrecioArma]);
        PlayerAmmoInventario[playerid][ArmeriaItems[item][aiArma]] = 9999;
        GivePlayerWeapon(playerid, WEAPON:ArmeriaItems[item][aiArma], 9999);
        PlayerArmaComprada[playerid][ArmeriaItems[item][aiArma]] = true;
        ArmeriaItems[item][aiStockArma]--;
        return ShowArmeriaArmasDisponibles(playerid);
    }

    if(dialogid == DIALOG_ARMERIA_MUNICION) {
        if(!response) return ShowArmeriaMenu(playerid);
        new item = GetArmeriaItemByStockMuniIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        ArmeriaMuniItemJugador[playerid] = item;
        ShowPlayerDialog(playerid, DIALOG_ARMERIA_MUNI_CANT, DIALOG_STYLE_INPUT, "Comprar municion", "Cantidad de balas a comprar:", "Comprar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ARMERIA_MUNI_CANT) {
        if(!response) return ShowArmeriaMunicionDisponible(playerid);
        new item = ArmeriaMuniItemJugador[playerid];
        new balas = strval(inputtext);
        if(item < 0 || item >= MAX_ARMAS_TIENDA || !ArmeriaItems[item][aiActiva]) return SendClientMessage(playerid, -1, "Item invalido.");
        if(balas <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(balas > ArmeriaItems[item][aiStockMunicion]) return SendClientMessage(playerid, -1, "No hay tanta municion disponible.");
        new costo = balas * ArmeriaItems[item][aiPrecioMunicion];
        if(GetPlayerMoney(playerid) < costo) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        GivePlayerMoney(playerid, -costo);
        PlayerAmmoInventario[playerid][ArmeriaItems[item][aiArma]] += balas;
        ArmeriaItems[item][aiStockMunicion] -= balas;
        new WEAPON:armaActual = GetPlayerWeapon(playerid);
        if(_:armaActual == ArmeriaItems[item][aiArma]) GivePlayerWeapon(playerid, WEAPON:ArmeriaItems[item][aiArma], PlayerAmmoInventario[playerid][ArmeriaItems[item][aiArma]]);
        return ShowArmeriaMunicionDisponible(playerid);
    }

    if(dialogid == DIALOG_VENTA_AUTOS) {
        if(!response) return 1;
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(!VentaAutosActiva || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de venta de autos.");

        new accion[8], tmp1[16], tmp2[16], tmp3[16], ix;
        format(accion, sizeof(accion), "%s", strtok(inputtext, ix));
        if(!accion[0]) return SendClientMessage(playerid, -1, "Formato invalido.");

        new tipo = strval(accion);
        if(tipo == 1) {
            format(tmp1, sizeof(tmp1), "%s", strtok(inputtext, ix));
            format(tmp2, sizeof(tmp2), "%s", strtok(inputtext, ix));
            format(tmp3, sizeof(tmp3), "%s", strtok(inputtext, ix));
            new modelo = strval(tmp1), precio = strval(tmp2), stockVehiculos = strval(tmp3);
            if(modelo < 400 || modelo > 611) return SendClientMessage(playerid, -1, "Modelo invalido.");
            if(precio <= 0 || stockVehiculos <= 0) return SendClientMessage(playerid, -1, "Precio/stock invalidos.");
            for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
                if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaModelo] == modelo) {
                    VentaAutosData[i][vaPrecio] = precio;
                    VentaAutosData[i][vaStock] += stockVehiculos;
                    SendClientMessage(playerid, 0x00FF00FF, "Stock de auto actualizado.");
                    ActualizarLabelVentaAutos();
                    return 1;
                }
            }
            for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
                if(!VentaAutosData[i][vaActiva]) {
                    VentaAutosData[i][vaActiva] = true;
                    VentaAutosData[i][vaModelo] = modelo;
                    VentaAutosData[i][vaPrecio] = precio;
                    VentaAutosData[i][vaStock] = stockVehiculos;
                    SendClientMessage(playerid, 0x00FF00FF, "Auto agregado a la venta.");
                    ActualizarLabelVentaAutos();
                    return 1;
                }
            }
            return SendClientMessage(playerid, -1, "No hay espacio para mas modelos.");
        }
        if(tipo == 2) {
            format(tmp1, sizeof(tmp1), "%s", strtok(inputtext, ix));
            new modelo = strval(tmp1);
            for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
                if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaModelo] == modelo) {
                    VentaAutosData[i][vaActiva] = false;
                    SendClientMessage(playerid, 0x00FF00FF, "Modelo eliminado de la venta.");
                    ActualizarLabelVentaAutos();
                    return 1;
                }
            }
            return SendClientMessage(playerid, -1, "Modelo no encontrado en la venta.");
        }
        if(tipo == 3) {
            VentaAutosActiva = false;
            if(VentaAutosPickup != 0) { DestroyPickup(VentaAutosPickup); VentaAutosPickup = 0; }
            if(VentaAutosLabel != Text3D:-1) { Delete3DTextLabel(VentaAutosLabel); VentaAutosLabel = Text3D:-1; }
            for(new i = 0; i < MAX_AUTOS_VENTA; i++) VentaAutosData[i][vaActiva] = false;
            SendClientMessage(playerid, 0xFF0000FF, "Venta de autos eliminada.");
            return 1;
        }
        return SendClientMessage(playerid, -1, "Accion invalida. Usa 1, 2 o 3.");
    }

    if(dialogid == DIALOG_VENTA_AUTOS_BUY) {
        if(!response) return 1;
        new item = GetVentaAutoByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(GetPlayerMoney(playerid) < VentaAutosData[item][vaPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");

        new Float:px, Float:py, Float:pz, Float:pa;
        GetPlayerPos(playerid, px, py, pz);
        GetPlayerFacingAngle(playerid, pa);
        new veh = CreateVehicle(VentaAutosData[item][vaModelo], px + 3.0, py, pz, pa, -1, -1, 120);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No se pudo crear el vehiculo.");
        GivePlayerMoney(playerid, -VentaAutosData[item][vaPrecio]);
        PutPlayerInVehicle(playerid, veh, 0);
        VentaAutosData[item][vaStock]--;
        ActualizarLabelVentaAutos();
        SendClientMessage(playerid, 0x00FF00FF, "Compra realizada. Disfruta tu auto.");
        return 1;
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
            format(line, 128, "%s\n%d\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n2494.24\n-1671.19\n13.33", inputtext, DINERO_INICIAL);
            fwrite(h, line); fclose(h);
            IsPlayerLoggedIn[playerid] = true;
            GivePlayerMoney(playerid, DINERO_INICIAL);
            ActualizarNivelPJ(playerid);
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
                    PlayerTiempoJugadoMin[playerid] = 0;
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
                        PlayerTiempoJugadoMin[playerid] = 0;
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
                            PlayerTiempoJugadoMin[playerid] = 0;
                            v[0] = floatstr(line);
                            fread(h, line); v[1] = floatstr(line);
                            fread(h, line); v[2] = floatstr(line);
                        } else {
                            InvSemillaHierba[playerid] = strval(line);
                            fread(h, line); InvSemillaFlor[playerid] = strval(line);
                            fread(h, line); InvHierba[playerid] = strval(line);
                            fread(h, line); InvFlor[playerid] = strval(line);
                            fread(h, line);
                            if(strfind(line, ".") != -1) {
                                PlayerTiempoJugadoMin[playerid] = 0;
                                v[0] = floatstr(line);
                                fread(h, line); v[1] = floatstr(line);
                                fread(h, line); v[2] = floatstr(line);
                            } else {
                                PlayerTiempoJugadoMin[playerid] = strval(line);
                                fread(h, line); v[0] = floatstr(line);
                                fread(h, line); v[1] = floatstr(line);
                                fread(h, line); v[2] = floatstr(line);
                            }
                        }
                    }
                }
                SetPVarFloat(playerid, "SpawnX", v[0]); SetPVarFloat(playerid, "SpawnY", v[1]); SetPVarFloat(playerid, "SpawnZ", v[2]);
                ActualizarNivelPJ(playerid);
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
            format(line, 256, "%s\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%f\n%f\n%f",
                PlayerPassword[playerid], GetPlayerMoney(playerid), PlayerAdmin[playerid],
                CamioneroNivel[playerid], CamioneroViajes[playerid], PizzeroNivel[playerid], PizzeroEntregas[playerid], PlayerBankMoney[playerid], InvSemillaHierba[playerid], InvSemillaFlor[playerid], InvHierba[playerid], InvFlor[playerid], PlayerTiempoJugadoMin[playerid], p[0], p[1], p[2]);
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

public SubirTiempoJugado() {
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i) && IsPlayerLoggedIn[i]) {
            PlayerTiempoJugadoMin[i]++;
            if(PlayerTiempoJugadoMin[i] % 60 == 0) {
                new pago = GetNivelPJ(i) * 500;
                GivePlayerMoney(i, pago);
                new paymsg[96];
                format(paymsg, sizeof(paymsg), "Pago horario recibido por nivel PJ: $%d", pago);
                SendClientMessage(i, 0x00FF00FF, paymsg);
            }
            ActualizarNivelPJ(i);
        }
    }
    return 1;
}

stock GetNivelPJ(playerid) {
    return (PlayerTiempoJugadoMin[playerid] / (HORAS_POR_NIVEL_PJ * 60)) + 1;
}

stock ActualizarNivelPJ(playerid) {
    SetPlayerScore(playerid, GetNivelPJ(playerid));
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
    #pragma unused playerid
    #pragma unused weaponid
    #pragma unused hittype
    #pragma unused hitid
    #pragma unused fX
    #pragma unused fY
    #pragma unused fZ
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
    BasureroTieneBolsa[playerid] = false;
    BasureroDepositandoBolsa[playerid] = false;
    if(BasureroBolsaVisible[playerid]) { RemovePlayerAttachedObject(playerid, 9); BasureroBolsaVisible[playerid] = false; }
    BasureroEntregando[playerid] = 0;
    BasureroFloresEncontradas[playerid] = 0;
    ArmeriaAdminArmaPendiente[playerid] = 0;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    FinalizarTodosLosCultivos(playerid);
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


public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate) {
    #pragma unused oldstate
    if(newstate == PLAYER_STATE_DRIVER && TrabajandoBasurero[playerid] > 0 && BasureroTieneBolsa[playerid]) {
        new veh = GetPlayerVehicleID(playerid);
        if(veh == BasureroVehiculo[playerid]) {
            RemovePlayerFromVehicle(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "Debes presionar H para subir la bolsa antes de conducir la Rumpo.");
        }
    }
    return 1;
}

public OnPlayerRequestClass(playerid, classid) {
    #pragma unused classid
    SetPlayerPos(playerid, 2494.24, -1680.0, 15.0);
    return 1;
}


public ActualizarCultivo(playerid) {
    if(!IsPlayerConnected(playerid)) return 0;
    new activos;
    for(new c = 0; c < MAX_PLANTAS_POR_JUGADOR; c++) {
        if(!CultivoActivo[playerid][c]) continue;
        ActualizarLabelCultivo(playerid, c);
        activos++;
    }
    if(activos == 0 && CultivoTimer[playerid] != -1) {
        KillTimer(CultivoTimer[playerid]);
        CultivoTimer[playerid] = -1;
    }
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

stock IsNearVentaAutos(playerid) {
    if(VentaAutosActiva && IsPlayerInRangeOfPoint(playerid, 3.0, VentaAutosPos[0], VentaAutosPos[1], VentaAutosPos[2])) return 1;
    if(!VentaAutosActiva) return 0;
    return 0;
}

stock ActualizarLabelVentaAutos() {
    if(VentaAutosLabel != Text3D:-1) { Delete3DTextLabel(VentaAutosLabel); VentaAutosLabel = Text3D:-1; }
    if(!VentaAutosActiva) return 1;
    new texto[256], disponibles;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaStock] > 0) disponibles++;
    format(texto, sizeof(texto), "Venta de autos\nModelos disponibles: %d\nPresiona H para ver el catalogo", disponibles);
    VentaAutosLabel = Create3DTextLabel(texto, 0x33CCFFFF, VentaAutosPos[0], VentaAutosPos[1], VentaAutosPos[2] + 0.6, 15.0, 0);
    return 1;
}

stock GetVentaAutoByListIndex(listindex) {
    new current;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(!VentaAutosData[i][vaActiva] || VentaAutosData[i][vaStock] <= 0) continue;
        if(current == listindex) return i;
        current++;
    }
    return -1;
}

stock ShowVentaAutosBuyMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(!VentaAutosData[i][vaActiva] || VentaAutosData[i][vaStock] <= 0) continue;
        format(line, sizeof(line), "Modelo %d | Precio:$%d | Stock:%d\n", VentaAutosData[i][vaModelo], VentaAutosData[i][vaPrecio], VentaAutosData[i][vaStock]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay autos disponibles en venta.");
    ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_BUY, DIALOG_STYLE_LIST, "Concesionario", body, "Comprar", "Cerrar");
    return 1;
}

stock ShowArmeriaMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_CATEGORIA, DIALOG_STYLE_LIST, "Armeria KameHouse", "Armas disponibles (municion infinita)", "Abrir", "Cerrar");
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
        format(line, sizeof(line), "%s | Precio bala $%d | Disp:%d\n", nombreArma, ArmeriaItems[i][aiPrecioMunicion], ArmeriaItems[i][aiStockMunicion]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay municion disponible por ahora.");
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_MUNICION, DIALOG_STYLE_LIST, "Municion disponible", body, "Comprar", "Atras");
    return 1;
}

stock ShowAdminArmasMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_MENU, DIALOG_STYLE_LIST, "Admin Armas", "Agregar arma (ID + stock)", "Seleccionar", "Cerrar");
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
    for(new i = 0; i < MAX_RUTAS_BASURA; i++) {
        if(BasuraPickup[i] != 0) DestroyPickup(BasuraPickup[i]);
        BasuraPickup[i] = 0;
        if(_:BasuraLabel[i] != -1) Delete3DTextLabel(BasuraLabel[i]);
        BasuraLabel[i] = Text3D:-1;
    }

    TotalRutasBasura = 0;
    new File:h = fopen(PATH_RUTAS_BASURA, io_read);
    if(!h) return 1;
    new line[64];
    while(fread(h, line) && TotalRutasBasura < MAX_RUTAS_BASURA) {
        sscanf_manual(line, BasuraRuta[TotalRutasBasura][0], BasuraRuta[TotalRutasBasura][1], BasuraRuta[TotalRutasBasura][2]);
        BasuraPickup[TotalRutasBasura] = CreatePickup(1328, 1, BasuraRuta[TotalRutasBasura][0], BasuraRuta[TotalRutasBasura][1], BasuraRuta[TotalRutasBasura][2], 0);
        BasuraLabel[TotalRutasBasura] = Create3DTextLabel("Punto de basura\nPresiona H para recolectar", 0x66FF66FF, BasuraRuta[TotalRutasBasura][0], BasuraRuta[TotalRutasBasura][1], BasuraRuta[TotalRutasBasura][2] + 0.6, 12.0, 0);
        TotalRutasBasura++;
    }
    fclose(h);
    return 1;
}

stock IniciarRutaBasurero(playerid) {
    if(TotalRutasBasura <= 0) return 0;
    new pendientes[MAX_RUTAS_BASURA], totalPendientes = 0;
    for(new i = 0; i < TotalRutasBasura; i++) {
        if(!BasuraRecolectadaPunto[playerid][i]) {
            pendientes[totalPendientes] = i;
            totalPendientes++;
        }
    }
    if(totalPendientes <= 0) {
        DisablePlayerCheckpoint(playerid);
        return 0;
    }

    new punto = pendientes[random(totalPendientes)];
    BasureroDestino[playerid][0] = BasuraRuta[punto][0];
    BasureroDestino[playerid][1] = BasuraRuta[punto][1];
    BasureroDestino[playerid][2] = BasuraRuta[punto][2];
    SetPlayerCheckpoint(playerid, BasureroDestino[playerid][0], BasureroDestino[playerid][1], BasureroDestino[playerid][2], 4.0);
    TrabajandoBasurero[playerid] = 1;
    ActualizarHUDRecolectaBasurero(playerid);
    return 1;
}

stock FinalizarTrabajoBasurero(playerid) {
    DisablePlayerCheckpoint(playerid);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);

    if(BasureroRecolectado[playerid] > 0) {
        new nivel = BasureroNivel[playerid];
        if(nivel > NIVEL_MAX_TRABAJO) nivel = NIVEL_MAX_TRABAJO;
        new pagoBase = PAGO_BASE_BASURERO;
        new pagoRecolecta = BasureroRecolectado[playerid] * 120;
        new pagoNivel = nivel * 95;
        new pago = pagoBase + pagoRecolecta + pagoNivel;
        if(pago > PAGO_MAX_BASURERO) pago = PAGO_MAX_BASURERO;
        GivePlayerMoney(playerid, pago);

        BasureroRecorridos[playerid]++;
        if(BasureroRecorridos[playerid] >= PROGRESO_BASURERO_POR_NIVEL) {
            BasureroRecorridos[playerid] = 0;
            if(BasureroNivel[playerid] < NIVEL_MAX_TRABAJO) BasureroNivel[playerid]++;
        }

        if(random(100) < BASURERO_FLORES_CHANCE) {
            InvFlor[playerid]++;
            BasureroFloresEncontradas[playerid]++;
        }

        new msg[200];
        format(msg, sizeof(msg), "{66FF66}[Basurero]{FFFFFF} Pago base:$%d | Recoleccion:$%d | Nivel:$%d | Total:$%d", pagoBase, pagoRecolecta, pagoNivel, pago);
        SendClientMessage(playerid, 0x66FF66FF, msg);
        format(msg, sizeof(msg), "{66FF66}[Basurero]{FFFFFF} Progreso: %d/%d | Nivel: %d/%d", BasureroRecorridos[playerid], PROGRESO_BASURERO_POR_NIVEL, BasureroNivel[playerid], NIVEL_MAX_TRABAJO);
        SendClientMessage(playerid, 0x66FF66FF, msg);
        if(BasureroFloresEncontradas[playerid] > 0) {
            format(msg, sizeof(msg), "{FF66CC}[Basurero]{FFFFFF} Encontraste {FF66CC}%d flor(es){FFFFFF} en este recorrido.", BasureroFloresEncontradas[playerid]);
            SendClientMessage(playerid, 0xFF66CCFF, msg);
        }
    }

    if(BasureroVehiculo[playerid] != INVALID_VEHICLE_ID) DestroyVehicle(BasureroVehiculo[playerid]);
    BasureroVehiculo[playerid] = INVALID_VEHICLE_ID;
    TrabajandoBasurero[playerid] = 0;
    BasureroEntregando[playerid] = 0;
    BasureroFloresEncontradas[playerid] = 0;
    BasureroRecolectado[playerid] = 0;
    BasureroRecolectando[playerid] = false;
    BasureroTieneBolsa[playerid] = false;
    BasureroDepositandoBolsa[playerid] = false;
    if(BasureroBolsaVisible[playerid]) { RemovePlayerAttachedObject(playerid, 9); BasureroBolsaVisible[playerid] = false; }
    for(new b = 0; b < TotalRutasBasura; b++) BasuraRecolectadaPunto[playerid][b] = false;
    return 1;
}

stock GetBasuraPointNearPlayer(playerid) {
    for(new i = 0; i < TotalRutasBasura; i++) {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, BasuraRuta[i][0], BasuraRuta[i][1], BasuraRuta[i][2])) return i;
    }
    return -1;
}

stock ActualizarHUDRecolectaBasurero(playerid) {
    new texto[72];
    format(texto, sizeof(texto), "~g~Basura: ~w~%d/%d", BasureroRecolectado[playerid], TotalRutasBasura);
    GameTextForPlayer(playerid, texto, 3500, 3);
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
    format(body, sizeof(body), "Semilla hierba verde - $%d\nSemilla de flores - $%d", SEMILLA_HIERBA_PRECIO, SEMILLA_FLOR_PRECIO);
    ShowPlayerDialog(playerid, DIALOG_SEMILLERIA, DIALOG_STYLE_LIST, "Semilleria", body, "Comprar", "Cerrar");
    return 1;
}

stock ActualizarLabelCultivo(playerid, slot) {
    if(!CultivoActivo[playerid][slot]) return 0;
    new restante = CultivoReadyTick[playerid][slot] - GetTickCount();
    if(restante < 0) restante = 0;
    new totalMin = restante / 60000;
    if((restante % 60000) > 0) totalMin++;
    new label[128], tipo[20];
    if(CultivoTipo[playerid][slot] == 2) format(tipo, sizeof(tipo), "Flor");
    else format(tipo, sizeof(tipo), "Hierba");
    if(restante == 0) format(label, sizeof(label), "%s lista para cosechar\nUsa /cosehar cerca", tipo);
    else format(label, sizeof(label), "%s en cultivo\nTiempo restante: %d minuto(s)", tipo, totalMin);
    if(CultivoLabel[playerid][slot] != Text3D:-1) Update3DTextLabelText(CultivoLabel[playerid][slot], 0x00FF00FF, label);
    return 1;
}

stock FinalizarCultivoVisual(playerid, slot) {
    if(CultivoObj[playerid][slot] != -1) {
        DestroyObject(CultivoObj[playerid][slot]);
        CultivoObj[playerid][slot] = -1;
    }
    if(CultivoLabel[playerid][slot] != Text3D:-1) {
        Delete3DTextLabel(CultivoLabel[playerid][slot]);
        CultivoLabel[playerid][slot] = Text3D:-1;
    }
    CultivoPos[playerid][slot][0] = 0.0;
    CultivoPos[playerid][slot][1] = 0.0;
    CultivoPos[playerid][slot][2] = 0.0;
    return 1;
}

stock FinalizarTodosLosCultivos(playerid) {
    for(new c = 0; c < MAX_PLANTAS_POR_JUGADOR; c++) {
        if(CultivoActivo[playerid][c]) {
            FinalizarCultivoVisual(playerid, c);
            CultivoActivo[playerid][c] = 0;
            CultivoTipo[playerid][c] = 0;
            CultivoCantidadBase[playerid][c] = 0;
            CultivoReadyTick[playerid][c] = 0;
        }
    }
    PlantasColocadas[playerid] = 0;
    if(CultivoTimer[playerid] != -1) {
        KillTimer(CultivoTimer[playerid]);
        CultivoTimer[playerid] = -1;
    }
    return 1;
}

stock GetPrimerSlotCultivoLibre(playerid) {
    for(new c = 0; c < MAX_PLANTAS_POR_JUGADOR; c++) if(!CultivoActivo[playerid][c]) return c;
    return -1;
}

stock GetCultivoCosechableCercano(playerid) {
    for(new c = 0; c < MAX_PLANTAS_POR_JUGADOR; c++) {
        if(!CultivoActivo[playerid][c]) continue;
        if(CultivoReadyTick[playerid][c] > GetTickCount()) continue;
        if(IsPlayerInRangeOfPoint(playerid, 2.5, CultivoPos[playerid][c][0], CultivoPos[playerid][c][1], CultivoPos[playerid][c][2])) return c;
    }
    return -1;
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
        case puntoVentaAutos: format(dest, len, "Venta de autos");
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
            PuntoLabel[punto] = Create3DTextLabel("Trabajo: {00C853}Basurero\n{FFFFFF}NPC encargado + tecla {FFFF00}H", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
            if(BasureroNPC != INVALID_ACTOR_ID) DestroyActor(BasureroNPC);
            BasureroNPC = CreateActor(BASURERO_NPC_SKIN, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 180.0);
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
        case puntoVentaAutos: {
            PuntoPickup[punto] = CreatePickup(1274, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{33CCFF}Venta de autos\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para ver autos", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
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
        format(texto, sizeof(texto), "{00FF00}Comandos usuario:\n{FFFFFF}/g /skills /lvl /comer /inventario /plantar /cosehar /consumir /dejartrabajo /cancelartrabajo /gps /pagar /saldo /salir /comprar /abrircasa /ayuda\n\n{FFAA00}Comandos admin:\n{FFFFFF}/crearparada /crearparadapizza /crearparadabasura /kick /dardinero /dararma /adminarmas /mover /tp /gotomap /crearcasa /eliminarcasa /crearventadeautos /agregarauto");
    } else {
        format(texto, sizeof(texto), "{00FF00}Comandos basicos:\n{FFFFFF}/g /skills /lvl /comer /inventario /plantar /cosehar /consumir /dejartrabajo /cancelartrabajo /gps /pagar /saldo /salir /comprar /abrircasa /ayuda\n\n{AAAAAA}Tip: ve al icono del banco y presiona H para guardar, retirar o transferir dinero.");
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
