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
#define PRECIO_COMIDA       1000
#define HAMBRE_POR_COMIDA   15
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
#define PATH_PUNTOS_MOVIBLES "puntos_movibles.txt"
#define PATH_MINAS "minas.txt"
#define PATH_HORNOS "hornos.txt"
#define PATH_CAJAS "cajas_busqueda.txt"
#define PATH_PREPIEZAS "prepiezas_puntos.txt"
#define PATH_PRENDAS "prendas_config.txt"
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
#define DIALOG_VENTA_AUTOS_ADMIN_MENU 33
#define DIALOG_VENTA_AUTOS_BUY 34
#define DIALOG_AYUDA_CATEGORIA 35
#define DIALOG_MALETERO_MENU 39
#define DIALOG_VENTA_AUTOS_ADD_ID 41
#define DIALOG_VENTA_AUTOS_ADD_PRECIO 42
#define DIALOG_VENTA_AUTOS_ADD_STOCK 43
#define DIALOG_VENTA_AUTOS_REMOVE_LIST 44
#define DIALOG_PINTURA_COLOR 45
#define DIALOG_GPS_VEHICULOS 46
#define DIALOG_KAMETIENDA_TIPO 47
#define DIALOG_KAMETIENDA_CANTIDAD 48
#define DIALOG_KAMETIENDA_CONFIRMAR 49
#define DIALOG_MINERO_MINAR 50
#define DIALOG_HORNO_MENU 51
#define DIALOG_ARMERO_MENU 52
#define DIALOG_ADMIN_MENU 53
#define DIALOG_ADMIN_DAR_DINERO_ID 54
#define DIALOG_ADMIN_DAR_DINERO_MONTO 55
#define DIALOG_ADMIN_CREAR_MENU 56
#define DIALOG_ADMIN_DAR_MINERAL_TIPO 57
#define DIALOG_ADMIN_DAR_MINERAL_MONTO 58
#define DIALOG_ADMIN_DAR_MINERAL_ID 59
#define DIALOG_PRENDAS_MENU 60
#define DIALOG_PRENDAS_EDITAR 61
#define DIALOG_PRENDAS_BONE 62
#define DIALOG_PRENDA_USUARIO_MENU 63
#define DIALOG_PRENDA_USUARIO_EDITAR 64
#define DIALOG_ADMIN_ARMAS_EDITAR 65
#define DIALOG_ADMIN_ARMAS_PRECIO 66
#define DIALOG_PRENDAS_ADMIN_MENU 67
#define DIALOG_PRENDAS_ADD_MODELO 68
#define DIALOG_PRENDAS_ADD_NOMBRE 69
#define DIALOG_PRENDAS_ADD_PRECIO 70
#define DIALOG_PRENDAS_ADD_STOCK 71
#define DIALOG_PRENDAS_REMOVE_LIST 72
#define DIALOG_TELEFONO_MENU 73
#define DIALOG_TELEFONO_MENSAJE_ID 74
#define DIALOG_TELEFONO_MENSAJE_TEXTO 75
#define DIALOG_TELEFONO_CALC_VALOR1 76
#define DIALOG_TELEFONO_CALC_OPERACION 77
#define DIALOG_TELEFONO_CALC_VALOR2 78
#define DIALOG_TELEFONO_LLAMAR_VEHICULO 79

#define MODELO_HIERBA_OBJ 15038
#define MODELO_FLOR_OBJ 2253
#define MAX_GAS_POINTS 64
#define MAX_MINAS 128
#define MAX_HORNOS 64
#define MAX_CAJAS 128
#define MAX_PREPIEZA_POINTS 64
#define MAX_PRENDAS 10
#define MAX_PRENDAS_USUARIO 5
#define PRECIO_MAZO 10000
#define PRECIO_TELEFONO 10000
#define COSTO_SMS 100
#define COSTO_LLAMAR_VEHICULO 5000

#define MAX_PLANTAS_POR_JUGADOR 5
#define BOLSA_OBJ_MODEL 1264
#define BASURERO_NPC_SKIN 16
#define BASURERO_FLORES_CHANCE 30
#define GAS_PRECIO_POR_PUNTO 500
#define GAS_CONSUMO_POR_MINUTO 5

#define MAX_AUTOS_NORMALES_JUGADOR 3
#define MAX_VEHICULOS_TOTALES_JUGADOR 4
#define CUENTA_DATA_VERSION 3
#define CUENTA_SECCION_PRENDAS "PRENDAS_BEGIN"
#define CUENTA_SECCION_VEHICULOS "VEHICULOS_BEGIN"

#if !defined WEAPON_NONE
    #define WEAPON_NONE (WEAPON:-1)
#endif

// ================= [ VARIABLES ] =================
new bool:IsPlayerLoggedIn[MAX_PLAYERS];
new PlayerPassword[MAX_PLAYERS][16];
new PlayerAdmin[MAX_PLAYERS];
new PlayerHambre[MAX_PLAYERS];
new PlayerText:BarraHambre[MAX_PLAYERS];
new PlayerText:BarraGas[MAX_PLAYERS];
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
new InvMadera[MAX_PLAYERS];
new InvPiedra[MAX_PLAYERS];
new InvCobre[MAX_PLAYERS];
new InvHierroMineral[MAX_PLAYERS];
new InvPolvora[MAX_PLAYERS];
new InvPrepieza[MAX_PLAYERS];
new InvCarbon[MAX_PLAYERS];
new bool:PlayerTieneMazo[MAX_PLAYERS];
new MazoDurabilidad[MAX_PLAYERS];
new ArmeroNivel[MAX_PLAYERS];
new ArmeroExp[MAX_PLAYERS];
new bool:MineroTrabajando[MAX_PLAYERS];
new MineroMinaIndex[MAX_PLAYERS] = {-1, ...};
new MineroTimer[MAX_PLAYERS] = {-1, ...};
new MineroDuracionActual[MAX_PLAYERS];
new HornoActivoJugador[MAX_PLAYERS] = {-1, ...};
new bool:GPSCheckpointActivo[MAX_PLAYERS];
new AdminTargetIdPendiente[MAX_PLAYERS] = {-1, ...};
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
    puntoMaletero,
    puntoPintura,
    puntoMinero,
    puntoPrendas,
    totalPuntosMovibles
}
new Float:PuntoPos[totalPuntosMovibles][3];
new PuntoPickup[totalPuntosMovibles] = {0, ...};
new Text3D:PuntoLabel[totalPuntosMovibles] = {Text3D:-1, ...};
new BasureroNPC = INVALID_ACTOR_ID;

enum ePrendaData {
    bool:prendaActiva,
    prendaModelo,
    prendaPrecio,
    prendaStock,
    prendaBone,
    Float:prendaOffX,
    Float:prendaOffY,
    Float:prendaOffZ,
    Float:prendaRotX,
    Float:prendaRotY,
    Float:prendaRotZ,
    Float:prendaScaleX,
    Float:prendaScaleY,
    Float:prendaScaleZ,
    prendaNombre[32]
}
new PrendasData[MAX_PRENDAS][ePrendaData];
new PrendaEditIndex[MAX_PLAYERS] = {-1, ...};
new PrendaMoveIndex[MAX_PLAYERS] = {-1, ...};
new PrendaBonePendiente[MAX_PLAYERS] = {-1, ...};
new PrendaPrecioPendiente[MAX_PLAYERS] = {-1, ...};
new PrendaStockPendiente[MAX_PLAYERS] = {-1, ...};
new PrendaAdminSlotPendiente[MAX_PLAYERS] = {-1, ...};
new PrendaAdminModeloPendiente[MAX_PLAYERS];
new PrendaAdminNombrePendiente[MAX_PLAYERS][32];
new PrendaAdminPrecioPendiente[MAX_PLAYERS];
new PrendaUsuarioEditando[MAX_PLAYERS] = {-1, ...};
new ArmeriaAdminItemEditando[MAX_PLAYERS] = {-1, ...};
new PlayerPrendaActiva[MAX_PLAYERS][MAX_PRENDAS];
new PlayerPrendaComprada[MAX_PLAYERS][MAX_PRENDAS];
new PlayerPrendaBone[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaOffX[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaOffY[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaOffZ[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaRotX[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaRotY[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaRotZ[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaScaleX[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaScaleY[MAX_PLAYERS][MAX_PRENDAS];
new Float:PlayerPrendaScaleZ[MAX_PLAYERS][MAX_PRENDAS];

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
new VentaAutosAdminModeloPendiente[MAX_PLAYERS];
new VentaAutosAdminPrecioPendiente[MAX_PLAYERS];

new MaleteroOwner[MAX_VEHICLES] = {-1, ...};
new MaleteroSlotsVeh[MAX_VEHICLES];
new MaleteroHierbaVeh[MAX_VEHICLES];
new MaleteroFloresVeh[MAX_VEHICLES];
new MaleteroSemillaHierbaVeh[MAX_VEHICLES];
new MaleteroSemillaFlorVeh[MAX_VEHICLES];
new MaleteroArmasVeh[MAX_VEHICLES][MAX_WEAPON_ID_GM];

new VehOwner[MAX_VEHICLES] = {-1, ...};
new bool:VehLocked[MAX_VEHICLES];
new VehSharedTo[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new VehSharedUntil[MAX_PLAYERS];

new GasVehiculo[MAX_VEHICLES];
new bool:GasInitVehiculo[MAX_VEHICLES];
new GasRefuelTimer[MAX_PLAYERS] = {-1, ...};
new GasRefuelVeh[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new GasRefuelCost[MAX_PLAYERS];
new BidonGasolina[MAX_PLAYERS];
new KameTiendaTipoPendiente[MAX_PLAYERS];
new KameTiendaCantidadPendiente[MAX_PLAYERS];
new bool:PlayerTieneTelefono[MAX_PLAYERS];
new TelefonoMensajeDestino[MAX_PLAYERS] = {-1, ...};
new Float:CalcValor1Pendiente[MAX_PLAYERS];
new CalcOperacionPendiente[MAX_PLAYERS];
new TelefonoVehiculoSeleccionado[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new bool:AdminFlyActivo[MAX_PLAYERS];
new GPSVehiculoSeleccionado[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};

new bool:VehOculto[MAX_VEHICLES];
new VehLastUseTick[MAX_VEHICLES];
new VehColor1Data[MAX_VEHICLES];
new VehColor2Data[MAX_VEHICLES];
new Float:VehPosData[MAX_VEHICLES][4];
new VehModelData[MAX_VEHICLES];
new VehTempRestoreTimer[MAX_VEHICLES] = {-1, ...};
new TempVehModel[MAX_VEHICLES];
new TempVehColor1[MAX_VEHICLES];
new TempVehColor2[MAX_VEHICLES];
new Float:TempVehPos[MAX_VEHICLES][4];
new TempVehVW[MAX_VEHICLES];
new TempVehInterior[MAX_VEHICLES];

new GasTotalPuntos;
new Float:GasPos[MAX_GAS_POINTS][3];
new GasPickup[MAX_GAS_POINTS];
new Text3D:GasLabel[MAX_GAS_POINTS] = {Text3D:-1, ...};

enum eMinaData {
    bool:minaActiva,
    Float:minaX,
    Float:minaY,
    Float:minaZ,
    minaObj,
    Text3D:minaLabel
}
new MinaData[MAX_MINAS][eMinaData];
new TotalMinas;

enum eHornoData {
    bool:hornoActivo,
    Float:hornoX,
    Float:hornoY,
    Float:hornoZ,
    hornoObj,
    Text3D:hornoLabel,
    bool:hornoEnUso,
    hornoOwner,
    hornoTipo,
    hornoCantidadEntrada,
    hornoCantidadSalida,
    hornoReadyTick,
    bool:hornoListoRetiro
}
new HornoData[MAX_HORNOS][eHornoData];
new TotalHornos;

enum eCajaData {
    bool:cajaActiva,
    Float:cajaX,
    Float:cajaY,
    Float:cajaZ,
    cajaObj,
    Text3D:cajaLabel
}
new CajaDataLoot[MAX_CAJAS][eCajaData];
new TotalCajas;
new CajaCooldownTick[MAX_PLAYERS][MAX_CAJAS];
new MineroCooldownTick[MAX_PLAYERS][MAX_MINAS];

enum ePrepiezaPoint {
    bool:ppActivo,
    Float:ppX,
    Float:ppY,
    Float:ppZ,
    ppObj,
    Text3D:ppLabel
}
new PrepiezaPoints[MAX_PREPIEZA_POINTS][ePrepiezaPoint];
new TotalPrepiezaPoints;
new PrepiezaCooldownTick[MAX_PLAYERS][MAX_PREPIEZA_POINTS];
new AdminMineralTipoPendiente[MAX_PLAYERS] = {-1, ...};
new AdminMineralCantidadPendiente[MAX_PLAYERS];

// Adelantos de funciones usadas antes de su implementacion
forward strtok(const string[], &index);
forward sscanf_manual(const string[], &Float:x, &Float:y, &Float:z);
forward GuardarCasas();
forward GuardarCuenta(playerid);
stock CargarVehiculosJugadorDesdeCuenta(playerid, File:h);
stock CargarVehiculosJugadorDesdeLinea(playerid, File:h, const primeraLinea[]);
stock GuardarVehiculosJugadorEnCuenta(playerid, File:h);
stock bool:EsLineaPrendaCuenta(const line[]);
forward BajarHambre();
forward ChequearLimitesMapa();
forward AutoGuardadoGlobal();
forward FinalizarRecolectaBasura(playerid);
forward SubirTiempoJugado();
forward ClearPlayerAnimLock(playerid);
forward FinalizarRepostaje(playerid);
forward CheckInactiveVehicles();
forward RestaurarVehiculoTemporal(slot);
forward FinalizarMinado(playerid);
forward FinalizarCajaBusqueda(playerid, cajaidx);
forward FinalizarHorno(hornoidx);
forward ActualizarTextosHornos();
forward TeleportVehiculoLlamado(playerid);
stock CargarMinas();
stock GuardarMinas();
stock CargarHornos();
stock GuardarHornos();
stock CargarCajasLoot();
stock GuardarCajasLoot();
stock CargarPrepiezaPoints();
stock GuardarPrepiezaPoints();
stock MostrarDialogoAdmin(playerid);
stock AplicarTexturaMinaEstatica(objectid);
stock ObtenerDatosCrafteoArmero(tier, listitem, &weaponid, weaponName[], weaponNameLen, &needM, &needH, &needP, &needPr, &needC);
stock GetHornoMasCercano(playerid);
stock GetClosestCasa(playerid);
stock GetClosestCasaOwnedBy(playerid);
stock bool:PlayerTieneAccesoCasa(playerid, casa);
stock EntrarCasa(playerid, casa);
stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
stock CanceladoTrabajo(playerid);
stock FormatTiempoRestante(ms, dest[], len);
stock ActualizarLabelHorno(hornoidx);
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
stock ShowMaleteroMaletero(playerid, vehid);
stock PlayerTieneAccesoVehiculo(playerid, vehid);
stock GetNearbyOwnedVehicle(playerid);
stock CuentaArmasMaletero(vehid);
stock InitGasSystem();
stock ActualizarGasTextoVehiculo(playerid);
stock EncontrarGasCercano(playerid);
stock RecrearPuntoFijo(ePuntoMovible:punto);
stock GetPuntoMovibleNombre(ePuntoMovible:punto, dest[], len);
stock IsNearVentaAutos(playerid);
stock ActualizarLabelVentaAutos();
stock ShowVentaAutosBuyMenu(playerid);
stock GetVentaAutoByListIndex(listindex);
stock ShowVentaAutosAdminMenu(playerid);
stock CargarPrendasConfig();
stock GuardarPrendasConfig();
stock CrearPrendasDefault();
stock ShowPrendasMenu(playerid);
stock AplicarPrendaJugador(playerid, idx);
stock QuitarPrendaJugador(playerid, idx);
stock ShowPrendasAdminEditar(playerid, idx);
stock ShowPrendasAdminMenu(playerid);
stock ShowPrendaUsuarioMenu(playerid);
stock ShowPrendaUsuarioEditar(playerid, idx);
stock IsPrendaSlotEnUsoPorJugadores(idx);
stock ContarPrendasJugador(playerid);
stock GetPrendaBoneName(bone, dest[], len);
stock IsNearPrendas(playerid);
stock ShowVentaAutosRemoveMenu(playerid);
stock GetVentaAutoByAnyListIndex(listindex);
stock ShowAdminEditHint(playerid, const nombreSistema[]);
stock GetNivelPJ(playerid);
stock ActualizarNivelPJ(playerid);
stock ContarAutosJugador(playerid);
stock ContarVehiculosTotalesJugador(playerid);
stock ShowGPSVehiculosMenu(playerid);
stock GetOwnedVehicleByListIndex(playerid, listindex);
stock RestaurarVehiculosJugador(playerid);
stock bool:RestaurarVehiculoSeleccionado(playerid, veh);
stock ContarCasasJugador(playerid);
stock GuardarPuntosMovibles();
stock CargarPuntosMovibles();
stock ShowTelefonoMenu(playerid);
stock ShowTelefonoVehiculosMenu(playerid);
stock GetTelefonoVehiculoByListIndex(playerid, listindex);

// ================= [ MAIN & INIT ] =================
main() {
    printf("Server KameHouse");
}

public OnGameModeInit() {
    SetGameModeText("KH 1.0");
    DisableInteriorEnterExits();
    EnableStuntBonusForAll(false);
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
    PuntoPos[puntoMaletero][0] = 2490.0; PuntoPos[puntoMaletero][1] = -1648.0; PuntoPos[puntoMaletero][2] = 13.3;
    PuntoPos[puntoPintura][0] = 2501.0; PuntoPos[puntoPintura][1] = -1648.0; PuntoPos[puntoPintura][2] = 13.3;
    PuntoPos[puntoMinero][0] = PuntoPos[puntoCamionero][0] + 6.0; PuntoPos[puntoMinero][1] = PuntoPos[puntoCamionero][1]; PuntoPos[puntoMinero][2] = PuntoPos[puntoCamionero][2];
    PuntoPos[puntoPrendas][0] = PuntoPos[puntoSemilleria][0] + 6.0; PuntoPos[puntoPrendas][1] = PuntoPos[puntoSemilleria][1]; PuntoPos[puntoPrendas][2] = PuntoPos[puntoSemilleria][2];
    VentaAutosActiva = true;
    VentaAutosPos[0] = PuntoPos[puntoVentaAutos][0];
    VentaAutosPos[1] = PuntoPos[puntoVentaAutos][1];
    VentaAutosPos[2] = PuntoPos[puntoVentaAutos][2];

    CargarPuntosMovibles();
    CargarPrendasConfig();
    VentaAutosPos[0] = PuntoPos[puntoVentaAutos][0];
    VentaAutosPos[1] = PuntoPos[puntoVentaAutos][1];
    VentaAutosPos[2] = PuntoPos[puntoVentaAutos][2];

    CrearPuntosFijos();
    ActualizarLabelVentaAutos();
    if(BasureroNPC != INVALID_ACTOR_ID) DestroyActor(BasureroNPC);
    BasureroNPC = CreateActor(BASURERO_NPC_SKIN, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 180.0);
    CargarRutasBasura();
    CargarMinas();
    CargarHornos();
    CargarCajasLoot();
    CargarPrepiezaPoints();

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
    SetTimer("CheckInactiveVehicles", 10000, true);
    SetTimer("ActualizarTextosHornos", 1000, true);

    InitGasSystem();
    return 1;
}

// ================= [ SISTEMA DE TRABAJO ] =================

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    #pragma unused oldkeys

    if((newkeys & KEY_YES) && PlayerAdmin[playerid] >= 1) { // Tecla Y (solo admin)
        if(IsNearVentaAutos(playerid)) return ShowVentaAutosAdminMenu(playerid);
        if(IsNearArmeria(playerid)) return ShowAdminArmasMenu(playerid);
        if(IsNearPrendas(playerid)) return ShowPrendasAdminMenu(playerid);
    }

    if((newkeys & KEY_LOOK_BEHIND)) { // Tecla B
        new vehMaletero = GetNearbyOwnedVehicle(playerid);
        if(vehMaletero != INVALID_VEHICLE_ID) {
            ShowMaleteroMaletero(playerid, vehMaletero);
            return 1;
        }
    }

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
        if(random(100) < BASURERO_FLORES_CHANCE) {
            new halladas = random(5) + 1;
            InvFlor[playerid] += halladas;
            BasureroFloresEncontradas[playerid] += halladas;
            new avisof[128];
            format(avisof, sizeof(avisof), "[Basurero] Encontraste %d flor(es) revisando la basura de esta bolsa.", halladas);
            SendClientMessage(playerid, 0xFF66CCFF, avisof);
        }
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
        ShowAdminEditHint(playerid, "venta de autos");
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

    // Sistema de Tienda Kame House
    if(IsNearSemilleria(playerid)) {
        ShowSemilleriaMenu(playerid);
        return 1;
    }

    // Sistema de prendas
    if(IsNearPrendas(playerid)) {
        ShowPrendasMenu(playerid);
        return 1;
    }

    // Sistema de minero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoMinero][0], PuntoPos[puntoMinero][1], PuntoPos[puntoMinero][2])) {
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0 || MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");
        MineroTrabajando[playerid] = true;
        SendClientMessage(playerid, 0x33CCFFFF, "[Minero] Ahora eres minero. Compra un mazo en la Tienda Kame House y busca minas.");
        return 1;
    }

    for(new m = 0; m < TotalMinas; m++) {
        if(!MinaData[m][minaActiva]) continue;
        if(!IsPlayerInRangeOfPoint(playerid, 2.5, MinaData[m][minaX], MinaData[m][minaY], MinaData[m][minaZ])) continue;
        if(!MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Debes tomar el trabajo de minero primero.");
        if(!PlayerTieneMazo[playerid] || MazoDurabilidad[playerid] <= 0) return SendClientMessage(playerid, -1, "Necesitas un mazo con durabilidad. Compralo en Tienda Kame House.");
        if(GetTickCount() < MineroCooldownTick[playerid][m]) { new left[24], msgcd[120]; FormatTiempoRestante(MineroCooldownTick[playerid][m] - GetTickCount(), left, sizeof(left)); format(msgcd, sizeof(msgcd), "[Minero] Mina en cooldown: %s", left); return SendClientMessage(playerid, 0xFFAA00FF, msgcd); }
        if(MineroTimer[playerid] != -1) return SendClientMessage(playerid, -1, "Ya estas minando.");
        new segs = 15 + random(6);
        MineroMinaIndex[playerid] = m;
        MineroDuracionActual[playerid] = segs;
        TogglePlayerControllable(playerid, false);
        SetPlayerAttachedObject(playerid, 8, 19631, 6, 0.11, 0.03, 0.00, 0.0, 0.0, 0.0, 0.90, 0.90, 0.90);
        ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, true, false, false, false, segs * 1000, t_FORCE_SYNC:SYNC_ALL);
        MineroTimer[playerid] = SetTimerEx("FinalizarMinado", segs * 1000, false, "d", playerid);
        new msgm[96]; format(msgm, sizeof(msgm), "[Minero] Minando... tiempo estimado: %d segundos.", segs);
        SendClientMessage(playerid, 0xFFFF66FF, msgm);
        return 1;
    }

    for(new h = 0; h < TotalHornos; h++) {
        if(!HornoData[h][hornoActivo]) continue;
        if(!IsPlayerInRangeOfPoint(playerid, 2.5, HornoData[h][hornoX], HornoData[h][hornoY], HornoData[h][hornoZ])) continue;
        if(HornoData[h][hornoEnUso] && HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Este horno esta en uso por otro jugador.");
        HornoActivoJugador[playerid] = h;
        ShowPlayerDialog(playerid, DIALOG_HORNO_MENU, DIALOG_STYLE_LIST, "Horno", "20 Piedra => 5 Polvora (5 min)\n20 Madera => 5 Carbon (2 min)\nAgregar 1 Carbon (-30s)\nRetirar coccion lista", "Seleccionar", "Cerrar");
        return 1;
    }

    for(new c = 0; c < TotalCajas; c++) {
        if(!CajaDataLoot[c][cajaActiva]) continue;
        if(!IsPlayerInRangeOfPoint(playerid, 2.3, CajaDataLoot[c][cajaX], CajaDataLoot[c][cajaY], CajaDataLoot[c][cajaZ])) continue;
        if(GetTickCount() < CajaCooldownTick[playerid][c]) { new leftCaja[24], msgCaja[120]; FormatTiempoRestante(CajaCooldownTick[playerid][c] - GetTickCount(), leftCaja, sizeof(leftCaja)); format(msgCaja, sizeof(msgCaja), "[Caja] Cooldown restante: %s", leftCaja); return SendClientMessage(playerid, 0xFFAA00FF, msgCaja); }
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, true, false, false, false, 10000, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("FinalizarCajaBusqueda", 10000, false, "dd", playerid, c);
        SendClientMessage(playerid, 0x99FFFFFF, "Buscando en caja... espera 10 segundos.");
        return 1;
    }

    for(new pp = 0; pp < TotalPrepiezaPoints; pp++) {
        if(!PrepiezaPoints[pp][ppActivo]) continue;
        if(!IsPlayerInRangeOfPoint(playerid, 2.5, PrepiezaPoints[pp][ppX], PrepiezaPoints[pp][ppY], PrepiezaPoints[pp][ppZ])) continue;
        if(ArmeroNivel[playerid] <= 0) return SendClientMessage(playerid, -1, "Debes ser armero (minimo nivel 1).");
        if(GetTickCount() < PrepiezaCooldownTick[playerid][pp]) {
            new leftPP[24], msgPP[128];
            FormatTiempoRestante(PrepiezaCooldownTick[playerid][pp] - GetTickCount(), leftPP, sizeof(leftPP));
            format(msgPP, sizeof(msgPP), "Debes esperar para volver a comprar aqui: %s", leftPP);
            return SendClientMessage(playerid, 0xFFAA00FF, msgPP);
        }
        if(GetPlayerMoney(playerid) < 100) return SendClientMessage(playerid, -1, "Necesitas $100.");
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "SHOP", "SHP_Rob_React", 4.1, false, false, false, false, 1200, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("ClearPlayerAnimLock", 1200, false, "d", playerid);
        GivePlayerMoney(playerid, -100);
        InvPrepieza[playerid] += 2;
        PrepiezaCooldownTick[playerid][pp] = GetTickCount() + 300000;
        SendClientMessage(playerid, 0x66FF66FF, "Compraste 2 prepiezas por $100.");
        return 1;
    }

    // Sistema de armeria
    if(IsNearArmeria(playerid)) {
        ShowAdminEditHint(playerid, "la armeria");
        ShowArmeriaMenu(playerid);
        return 1;
    }

// Inicio de trabajo camionero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2]))
    {
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0 || MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");

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
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0 || MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");

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
        if(TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0 || MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Ya estas trabajando. Usa /dejartrabajo para cambiar.");
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
    if(GPSCheckpointActivo[playerid] && TrabajandoCamionero[playerid] == 0 && TrabajandoPizzero[playerid] == 0 && TrabajandoBasurero[playerid] == 0) {
        DisablePlayerCheckpoint(playerid);
        GPSCheckpointActivo[playerid] = false;
        SendClientMessage(playerid, 0x66FF66FF, "Llegaste al punto GPS. Checkpoint removido.");
        return 1;
    }

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
    new pagoDistancia = floatround(distancia * 0.35);
    if(pagoDistancia < 220) pagoDistancia = 220;
    if(pagoDistancia > 1700) pagoDistancia = 1700;
    new pagoNivel = nivelCamionero * 180;
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
    SendClientMessage(playerid, 0xFF8C00FF, "[Trabajo Pizzero] Nueva entrega asignada. Ve al checkpoint y entrega la pizza.");
    return 1;
}

public FinalizarEntregaPizza(playerid) {
    if(!IsPlayerConnected(playerid) || TrabajandoPizzero[playerid] == 0) return 1;
    TogglePlayerControllable(playerid, true);
    new Float:distancia = GetDistanceBetweenPoints(PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], PizzeroDestino[playerid][0], PizzeroDestino[playerid][1], PizzeroDestino[playerid][2]);
    new nivelPizzero = PizzeroNivel[playerid];
    if(nivelPizzero > NIVEL_MAX_TRABAJO) nivelPizzero = NIVEL_MAX_TRABAJO;

    new pagoBase = PAGO_BASE_PIZZERO;
    new pagoDistancia = floatround(distancia * 1.95);
    if(pagoDistancia < 260) pagoDistancia = 260;
    if(pagoDistancia > 1800) pagoDistancia = 1800;
    new pagoNivel = nivelPizzero * 170;
    new pago = pagoBase + pagoDistancia + pagoNivel;
    if(pago > PAGO_MAX_PIZZERO) pago = PAGO_MAX_PIZZERO;
    GivePlayerMoney(playerid, pago);

    PizzeroEntregas[playerid]++;
    if(PizzeroEntregas[playerid] >= PROGRESO_PIZZERO_POR_NIVEL) {
        PizzeroEntregas[playerid] = 0;
        if(PizzeroNivel[playerid] < NIVEL_MAX_TRABAJO) PizzeroNivel[playerid]++;
        SendClientMessage(playerid, 0xFFFF00FF, "Subiste de nivel en el trabajo Pizzero.");
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

    if(!strcmp(cmd, "/m", true)) {
        if(!cmdtext[idx]) return SendClientMessage(playerid, -1, "Uso: /m [accion]");
        new string[170], name[MAX_PLAYER_NAME], Float:p[3];
        GetPlayerName(playerid, name, sizeof(name));
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        format(string, sizeof(string), "* %s %s", name, cmdtext[idx]);
        for(new i = 0; i < MAX_PLAYERS; i++) {
            if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL, p[0], p[1], p[2])) SendClientMessage(i, 0xC2A2DAFF, string);
        }
        return 1;
    }

    if(!strcmp(cmd, "/d", true)) {
        if(!cmdtext[idx]) return SendClientMessage(playerid, -1, "Uso: /d [entorno]");
        new string[180], name[MAX_PLAYER_NAME], Float:p[3];
        GetPlayerName(playerid, name, sizeof(name));
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        format(string, sizeof(string), "[ENTORNO] %s (%d): %s", name, playerid, cmdtext[idx]);
        for(new i = 0; i < MAX_PLAYERS; i++) {
            if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL + 10.0, p[0], p[1], p[2])) SendClientMessage(i, 0x77DD77FF, string);
        }
        return 1;
    }

    if(!strcmp(cmd, "/telefono", true)) {
        if(!PlayerTieneTelefono[playerid]) return SendClientMessage(playerid, -1, "No tienes un telefono. Compralo en Tienda Kame House por $10000.");
        return ShowTelefonoMenu(playerid);
    }

    if(!strcmp(cmd, "/skills", true)) {
        new str[256];
        format(str, sizeof(str), "{FFFFFF}Camionero Nivel: {FFFF00}%d/%d\n{FFFFFF}Viajes: {FFFF00}%d/%d\n\n{FFFFFF}Pizzero Nivel: {FF8C00}%d/%d\n{FFFFFF}Entregas: {FF8C00}%d/%d\n\n{FFFFFF}Basurero Nivel: {66FF66}%d/%d\n{FFFFFF}Recorridos: {66FF66}%d/%d\n\n{FFFFFF}Armero Nivel: {99CCFF}%d/%d\n{FFFFFF}Progreso: {99CCFF}%d/3", CamioneroNivel[playerid], NIVEL_MAX_TRABAJO, CamioneroViajes[playerid], PROGRESO_CAMIONERO_POR_NIVEL, PizzeroNivel[playerid], NIVEL_MAX_TRABAJO, PizzeroEntregas[playerid], PROGRESO_PIZZERO_POR_NIVEL, BasureroNivel[playerid], NIVEL_MAX_TRABAJO, BasureroRecorridos[playerid], PROGRESO_BASURERO_POR_NIVEL, ArmeroNivel[playerid], NIVEL_MAX_TRABAJO, ArmeroExp[playerid]);
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
{33CCFF}Capacidad de vehiculos: {FFFFFF}%d/3", nivel, PlayerTiempoJugadoMin[playerid] / 60, horas, mins, pagoHora, ContarAutosJugador(playerid));
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "{FFD700}Progreso del personaje", body, "Cerrar", "");
        return 1;
    }

    if(!strcmp(cmd, "/comer", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes usar /comer dentro de tu casa.");
        if(PlayerHambre[playerid] >= 100) return SendClientMessage(playerid, -1, "Ya tienes el hambre al maximo.");
        if(GetPlayerMoney(playerid) < PRECIO_COMIDA) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para comprar comida.");

        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        SetTimerEx("ClearPlayerAnimLock", 1600, false, "d", playerid);
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


    if(!strcmp(cmd, "/pintar", true)) {
        if(!IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoPintura][0], PuntoPos[puntoPintura][1], PuntoPos[puntoPintura][2])) return SendClientMessage(playerid, -1, "Debes estar en el CP de pintura.");
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes estar sobre tu vehiculo conduciendo.");
        new vehid = GetPlayerVehicleID(playerid);
        if(!PlayerTieneAccesoVehiculo(playerid, vehid)) return SendClientMessage(playerid, -1, "No tienes acceso a este vehiculo.");
        ShowPlayerDialog(playerid, DIALOG_PINTURA_COLOR, DIALOG_STYLE_LIST, "Taller de pintura ($10000)", "Rojo\nAzul\nVerde\nNegro\nBlanco\nAmarillo", "Pintar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/llenar", true)) {
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes estar sobre tu vehiculo conduciendo.");
        new punto = EncontrarGasCercano(playerid);
        if(punto == -1) return SendClientMessage(playerid, -1, "No estas en una gasolinera.");
        new veh = GetPlayerVehicleID(playerid);
        if(veh == INVALID_VEHICLE_ID) return 1;
        if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 100; }
        if(GasVehiculo[veh] >= 100) return SendClientMessage(playerid, -1, "El tanque ya esta lleno.");
        if(GasRefuelTimer[playerid] != -1) return SendClientMessage(playerid, -1, "Ya estas repostando.");
        new faltante = 100 - GasVehiculo[veh];
        new costo = faltante * GAS_PRECIO_POR_PUNTO;
        if(GetPlayerMoney(playerid) < costo) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para repostar.");
        new segundos = floatround(float(faltante) / 10.0, floatround_ceil);
        if(segundos < 1) segundos = 1;
        if(segundos > 10) segundos = 10;
        TogglePlayerControllable(playerid, false);
        ApplyAnimation(playerid, "CAR", "Sit_relaxed", 4.1, true, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        GasRefuelVeh[playerid] = veh;
        GasRefuelCost[playerid] = costo;
        GasRefuelTimer[playerid] = SetTimerEx("FinalizarRepostaje", segundos * 1000, false, "d", playerid);
        new tx[120];
        format(tx, sizeof(tx), "Repostando... espera %d segundo(s). Costo: $%d.", segundos, costo);
        SendClientMessage(playerid, 0xFFCC00FF, tx);
        return 1;
    }

    if(!strcmp(cmd, "/bidon", true)) {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Debes estar a pie para comprar un bidon.");
        if(EncontrarGasCercano(playerid) == -1) return SendClientMessage(playerid, -1, "Debes estar en una gasolinera.");
        if(BidonGasolina[playerid] > 0) return SendClientMessage(playerid, -1, "Ya tienes un bidon.");
        if(GetPlayerMoney(playerid) < 7500) return SendClientMessage(playerid, -1, "Necesitas $7500 para comprar el bidon.");
        GivePlayerMoney(playerid, -7500);
        BidonGasolina[playerid] = 1;
        SendClientMessage(playerid, 0x00FF00FF, "Compraste un bidon de gasolina. Usa /usarbidon dentro del vehiculo.");
        return 1;
    }

    if(!strcmp(cmd, "/usarbidon", true)) {
        if(BidonGasolina[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes bidon.");
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes ir conduciendo el vehiculo para usar el bidon.");
        new veh = GetPlayerVehicleID(playerid);
        if(veh == INVALID_VEHICLE_ID) return 1;
        if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 0; }
        if(GasVehiculo[veh] >= 100) return SendClientMessage(playerid, -1, "El tanque ya esta lleno.");
        GasVehiculo[veh] += 15;
        if(GasVehiculo[veh] > 100) GasVehiculo[veh] = 100;
        BidonGasolina[playerid] = 0;
        ActualizarGasTextoVehiculo(playerid);
        SendClientMessage(playerid, 0x00FF00FF, "Usaste el bidon. Gasolina +15.");
        return 1;
    }

    if(!strcmp(cmd, "/inventario", true) || !strcmp(cmd, "/inv", true) || !strcmp(cmd, "/cosas", true)) {
        new inv[512];
        new mazoPct = MazoDurabilidad[playerid];
        if(mazoPct < 0) mazoPct = 0;
        if(mazoPct > 100) mazoPct = 100;
        format(inv, sizeof(inv), "{33CCFF}--- INVENTARIO ---\n{66FF66}Hierba:{FFFFFF} %d\n{FF66CC}Flor:{FFFFFF} %d\n{A9A9A9}Hierro:{FFFFFF} %d\n{B87333}Cobre:{FFFFFF} %d\n{C0C0C0}Piedra:{FFFFFF} %d\n{8B4513}Madera:{FFFFFF} %d\n{FFD700}Polvora:{FFFFFF} %d\n{555555}Carbon:{FFFFFF} %d\n{99CCFF}Prepiezas:{FFFFFF} %d\n{99FF99}Dinero:{FFFFFF} $%d\n{66CC66}Banco:{FFFFFF} $%d\n{FFCC66}Mazo:{FFFFFF} %d%%", InvHierba[playerid], InvFlor[playerid], InvHierroMineral[playerid], InvCobre[playerid], InvPiedra[playerid], InvMadera[playerid], InvPolvora[playerid], InvCarbon[playerid], InvPrepieza[playerid], GetPlayerMoney(playerid), PlayerBankMoney[playerid], PlayerTieneMazo[playerid] ? mazoPct : 0);
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
        new semillasExtra = 0;
        new bool:esHierba = (CultivoTipo[playerid][slot] == 1);
        if(esHierba) InvHierba[playerid] += total;
        else InvFlor[playerid] += total;

        if(random(100) < 45) {
            semillasExtra = 1 + random(2);
            if(esHierba) InvSemillaHierba[playerid] += semillasExtra;
            else InvSemillaFlor[playerid] += semillasExtra;
        }

        FinalizarCultivoVisual(playerid, slot);
        CultivoActivo[playerid][slot] = 0;
        if(PlantasColocadas[playerid] > 0) PlantasColocadas[playerid]--;
        CultivoTipo[playerid][slot] = 0;
        CultivoCantidadBase[playerid][slot] = 0;
        CultivoReadyTick[playerid][slot] = 0;

        new ok[160], tipo[16];
        format(tipo, sizeof(tipo), esHierba ? "hierba" : "flores");
        format(ok, sizeof(ok), "Cosechaste %d %s y %d semilla(s). Plantas activas: %d/%d.", total, tipo, semillasExtra, PlantasColocadas[playerid], MAX_PLANTAS_POR_JUGADOR);
        SendClientMessage(playerid, 0x00FF00FF, ok);
        return 1;
    }

    if(!strcmp(cmd, "/consumir", true)) {
        ShowPlayerDialog(playerid, DIALOG_CONSUMIR, DIALOG_STYLE_LIST, "Consumir", "Hierba verde (chaleco)\nFlores (vida)", "Usar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/dejartrabajo", true) || !strcmp(cmd, "/cancelartrabajo", true)) {
        if(TrabajandoCamionero[playerid] == 0 && TrabajandoPizzero[playerid] == 0 && TrabajandoBasurero[playerid] == 0 && !MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "No tienes un trabajo activo.");
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
        if(MineroTrabajando[playerid]) {
            MineroTrabajando[playerid] = false;
            if(MineroTimer[playerid] != -1) { KillTimer(MineroTimer[playerid]); MineroTimer[playerid] = -1; }
            TogglePlayerControllable(playerid, true);
            RemovePlayerAttachedObject(playerid, 8);
            SendClientMessage(playerid, 0xFF0000FF, "Dejaste el trabajo de minero.");
        }
        return 1;
    }

    if(!strcmp(cmd, "/tirarbasura", true) || (!strcmp(cmd, "/tirar", true) && !strcmp(strtok(cmdtext, idx), "basura", true))) {
        if(TrabajandoBasurero[playerid] == 0) return SendClientMessage(playerid, -1, "No estas trabajando de basurero.");
        if(BasureroTieneBolsa[playerid]) return SendClientMessage(playerid, -1, "Primero sube la bolsa a la Rumpo con H.");
        if(BasureroRecolectado[playerid] <= 0) return SendClientMessage(playerid, -1, "No has recolectado bolsas aun.");
        BasureroEntregando[playerid] = 1;
        SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 6.0);
        SendClientMessage(playerid, 0xFFAA00FF, "Entrega activada. Ve al vertedero para cobrar lo recolectado hasta ahora.");
        return 1;
    }

    if(!strcmp(cmd, "/gps", true)) {
        ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS de la ciudad", "{FFD700}Trabajo Camionero\n{AAAAAA}Trabajo Minero\n{CC6600}Trabajo Armero\n{FF4500}Trabajo Pizzero\n{66FF66}Trabajo Basurero\n{FFFFFF}Deposito de Carga\n{33CCFF}Banco KameHouse\n{66FF99}Tienda Kame House\n{CC6600}Armeria\n{99CCFF}Concesionario\n{FF66CC}Taller de pintura\n{FFAA00}Horno mas cercano\n{FFFF66}Restaurar vehiculos ocultos\n{00FFFF}Localizar uno de mis vehiculos", "Ir", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/ayuda", true)) {
        if(PlayerAdmin[playerid] >= 1) ShowPlayerDialog(playerid, DIALOG_AYUDA_CATEGORIA, DIALOG_STYLE_LIST, "Ayuda por categorias", "General\nTrabajos\nCasas y plantado\nEconomia\nAdmin", "Ver", "Cerrar");
        else ShowPlayerDialog(playerid, DIALOG_AYUDA_CATEGORIA, DIALOG_STYLE_LIST, "Ayuda por categorias", "General\nTrabajos\nCasas y plantado\nEconomia", "Ver", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/saldo", true)) {
        new str[96];
        format(str, sizeof(str), "Saldo banco: $%d", PlayerBankMoney[playerid]);
        SendClientMessage(playerid, 0x00FFFFFF, str);
        return 1;
    }

    if(!strcmp(cmd, "/pagar", true)) {
        return SendClientMessage(playerid, -1, "Pagos directos deshabilitados. Usa el banco para transferir dinero.");
    }

    if(!strcmp(cmd, "/comprarauto", true)) {
        return SendClientMessage(playerid, -1, "Ahora se usa la tecla H en el concesionario para ver los autos disponibles.");
    }

    if(!strcmp(cmd, "/maletero", true)) {
        new vehid = GetNearbyOwnedVehicle(playerid);
        if(vehid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "Debes estar junto a un vehiculo propio para usar /maletero.");
        return ShowMaleteroMaletero(playerid, vehid);
    }


    if(!strcmp(cmd, "/ga", true)) {
        new vehid = GetNearbyOwnedVehicle(playerid);
        if(vehid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "Debes estar junto a un vehiculo propio.");
        new WEAPON:arma = GetPlayerWeapon(playerid);
        if(_:arma <= 0 || _:arma >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "Debes tener un arma en mano.");
        new ammo = GetPlayerAmmo(playerid);
        if(ammo <= 0) ammo = PlayerAmmoInventario[playerid][_:arma];
        if(ammo <= 0) return SendClientMessage(playerid, -1, "No tienes municion en esa arma.");
        PlayerAmmoInventario[playerid][_:arma] = ammo;
        new usados = CuentaArmasMaletero(vehid);
        if(usados >= MaleteroSlotsVeh[vehid]) return SendClientMessage(playerid, -1, "Maletero lleno.");
        MaleteroArmasVeh[vehid][_:arma] += ammo;
        ResetPlayerWeapons(playerid);
        for(new w = 1; w < MAX_WEAPON_ID_GM; w++) {
            if(PlayerArmaComprada[playerid][w] && PlayerAmmoInventario[playerid][w] > 0 && w != _:arma) GivePlayerWeapon(playerid, WEAPON:w, PlayerAmmoInventario[playerid][w]);
        }
        PlayerAmmoInventario[playerid][_:arma] = 0;
        SendClientMessage(playerid, 0x00FF00FF, "Arma guardada en el maletero.");
        return 1;
    }

    if(!strcmp(cmd, "/llave", true)) {
        new vehid = IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : GetNearbyOwnedVehicle(playerid);
        if(vehid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No hay vehiculo valido cerca.");
        if(!PlayerTieneAccesoVehiculo(playerid, vehid)) return SendClientMessage(playerid, -1, "No tienes llaves de este vehiculo.");
        VehLocked[vehid] = !VehLocked[vehid];
        if(VehLocked[vehid]) SendClientMessage(playerid, 0xFFAA00FF, "Vehiculo bloqueado.");
        else SendClientMessage(playerid, 0x00FF00FF, "Vehiculo desbloqueado.");
        return 1;
    }

    if(!strcmp(cmd, "/compartirllave", true)) {
        new tmp[16], id, mins;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /compartirllave [id] [minutos]");
        id = strval(tmp);
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /compartirllave [id] [minutos]");
        mins = strval(tmp);
        if(!IsPlayerConnected(id) || mins <= 0) return SendClientMessage(playerid, -1, "Datos invalidos.");
        new vehid = IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : GetNearbyOwnedVehicle(playerid);
        if(vehid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No hay vehiculo valido cerca.");
        if(VehOwner[vehid] != playerid) return SendClientMessage(playerid, -1, "Solo el dueno puede compartir llaves.");
        VehSharedTo[id] = vehid;
        VehSharedUntil[id] = GetTickCount() + (mins * 60000);
        SendClientMessage(playerid, 0x00FF00FF, "Acceso temporal compartido.");
        SendClientMessage(id, 0x00FF00FF, "Recibiste acceso temporal a un vehiculo con /llave.");
        return 1;
    }

    if(!strcmp(cmd, "/comprar", true)) {
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");
        if(strcmp(CasaData[casa][cOwner], "None") != 0) return SendClientMessage(playerid, -1, "Esta casa no esta en venta.");
        if(ContarCasasJugador(playerid) >= 1) return SendClientMessage(playerid, -1, "Solo puedes tener 1 casa por jugador.");
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


    if(!strcmp(cmd, "/ventagas", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(GasTotalPuntos >= MAX_GAS_POINTS) return SendClientMessage(playerid, -1, "Limite de gasolineras alcanzado.");
        new Float:gx, Float:gy, Float:gz;
        GetPlayerPos(playerid, gx, gy, gz);
        GasPos[GasTotalPuntos][0] = gx; GasPos[GasTotalPuntos][1] = gy; GasPos[GasTotalPuntos][2] = gz;
        GasPickup[GasTotalPuntos] = CreatePickup(1650, 1, gx, gy, gz, 0);
        new gastxt[96];
        format(gastxt, sizeof(gastxt), "Gasolinera\nPrecio: $%d por litro\nUsa /llenar (vehiculo)\nUsa /bidon para comprar bidon", GAS_PRECIO_POR_PUNTO);
        GasLabel[GasTotalPuntos] = Create3DTextLabel(gastxt, 0xFFCC00FF, gx, gy, gz + 0.6, 20.0, 0);
        GasTotalPuntos++;
        SendClientMessage(playerid, 0x00FF00FF, "Punto de venta de gasolina creado.");
        return 1;
    }
    if(!strcmp(cmd, "/crearventadeautos", true)) {
        return SendClientMessage(playerid, -1, "Comando eliminado. Usa /mover para ajustar el CP del concesionario.");
    }


    if(!strcmp(cmd, "/agregarauto", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        return SendClientMessage(playerid, -1, "Acercate al concesionario y usa la tecla Y para editar el catalogo.");
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
        return SendClientMessage(playerid, -1, "Acercate a la armeria y usa la tecla Y para editar armas.");
    }

    if(!strcmp(cmd, "/admm", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        return MostrarDialogoAdmin(playerid);
    }

    if(!strcmp(cmd, "/crearmina", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(TotalMinas >= MAX_MINAS) return SendClientMessage(playerid, -1, "Limite de minas alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        MinaData[TotalMinas][minaActiva] = true; MinaData[TotalMinas][minaX] = x; MinaData[TotalMinas][minaY] = y; MinaData[TotalMinas][minaZ] = z;
        MinaData[TotalMinas][minaObj] = CreateObject(748, x, y, z - 1.0, 0.0, 0.0, 0.0);
        AplicarTexturaMinaEstatica(MinaData[TotalMinas][minaObj]);
        MinaData[TotalMinas][minaLabel] = Create3DTextLabel("Mina\nUsa H para minar", 0xCCCCCCFF, x, y, z + 0.7, 12.0, 0);
        TotalMinas++; GuardarMinas();
        return SendClientMessage(playerid, 0x00FF00FF, "Mina creada.");
    }

    if(!strcmp(cmd, "/crearhorno", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(TotalHornos >= MAX_HORNOS) return SendClientMessage(playerid, -1, "Limite de hornos alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        HornoData[TotalHornos][hornoActivo] = true; HornoData[TotalHornos][hornoX] = x; HornoData[TotalHornos][hornoY] = y; HornoData[TotalHornos][hornoZ] = z;
        HornoData[TotalHornos][hornoObj] = CreateObject(19831, x, y, z - 1.0, 0.0, 0.0, 0.0);
        HornoData[TotalHornos][hornoLabel] = Create3DTextLabel("Horno\nUsa H", 0xFFAA00FF, x, y, z + 0.8, 12.0, 0); HornoData[TotalHornos][hornoListoRetiro] = false; HornoData[TotalHornos][hornoEnUso] = false; HornoData[TotalHornos][hornoOwner] = INVALID_PLAYER_ID;
        TotalHornos++; GuardarHornos();
        return SendClientMessage(playerid, 0x00FF00FF, "Horno creado.");
    }

    if(!strcmp(cmd, "/crearcaja", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(TotalCajas >= MAX_CAJAS) return SendClientMessage(playerid, -1, "Limite de cajas alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        CajaDataLoot[TotalCajas][cajaActiva] = true; CajaDataLoot[TotalCajas][cajaX] = x; CajaDataLoot[TotalCajas][cajaY] = y; CajaDataLoot[TotalCajas][cajaZ] = z + 0.25;
        CajaDataLoot[TotalCajas][cajaObj] = CreateObject(2358, x, y, z - 0.75, 0.0, 0.0, 0.0);
        CajaDataLoot[TotalCajas][cajaLabel] = Create3DTextLabel("Caja de busqueda\nUsa H", 0xFFFFFFFF, x, y, z + 0.7, 10.0, 0);
        TotalCajas++; GuardarCajasLoot();
        return SendClientMessage(playerid, 0x00FF00FF, "Caja creada.");
    }

    if(!strcmp(cmd, "/crearprepiezas", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(TotalPrepiezaPoints >= MAX_PREPIEZA_POINTS) return SendClientMessage(playerid, -1, "Limite alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        PrepiezaPoints[TotalPrepiezaPoints][ppActivo] = true; PrepiezaPoints[TotalPrepiezaPoints][ppX] = x; PrepiezaPoints[TotalPrepiezaPoints][ppY] = y; PrepiezaPoints[TotalPrepiezaPoints][ppZ] = z;
        PrepiezaPoints[TotalPrepiezaPoints][ppObj] = CreateObject(1279, x, y, z - 1.0, 0.0, 0.0, 0.0);
        PrepiezaPoints[TotalPrepiezaPoints][ppLabel] = Create3DTextLabel("Punto de prepiezas ($100/2)\nUsa H", 0x99CCFFFF, x, y, z + 0.6, 10.0, 0);
        TotalPrepiezaPoints++; GuardarPrepiezaPoints();
        return SendClientMessage(playerid, 0x00FF00FF, "Punto de prepiezas creado.");
    }

    if(!strcmp(cmd, "/armero", true)) {
        ShowPlayerDialog(playerid, DIALOG_ARMERO_MENU, DIALOG_STYLE_LIST, "Trabajo de Armero", "Craft Lvl1\nCraft Lvl3\nCraft Lvl6\nCraft Lvl10", "Abrir", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/prendas", true)) {
        PrendaEditIndex[playerid] = -1;
        ShowPrendaUsuarioMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/prenda", true)) {
        PrendaEditIndex[playerid] = -1;
        ShowPrendaUsuarioMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/admprendas", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowPrendasAdminMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/mover", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        ShowPlayerDialog(playerid, DIALOG_MOVER_MENU, DIALOG_STYLE_LIST, "Mover iconos y puntos", "Trabajo Camionero\nPizzeria\nTrabajo Basurero\nDeposito de Carga\nBanco\nTienda Kame House\nArmeria\nVenta de autos\nCamper (eliminado)\nCP pintura\nTrabajo Minero\nPrendas Kame House", "Mover aqui", "Cerrar");
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

    if(!strcmp(cmd, "/ir", true)) {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(AdminMapPos[playerid][0] == 0.0) return SendClientMessage(playerid, -1, "Marca el mapa.");
        SetPlayerPos(playerid, AdminMapPos[playerid][0], AdminMapPos[playerid][1], AdminMapPos[playerid][2]);
        return 1;
    }

    if(!strcmp(cmd, "/traer", true)) {
        new tmp[32], id;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /traer [id]");
        id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        new Float:px, Float:py, Float:pz;
        GetPlayerPos(playerid, px, py, pz);
        SetPlayerPos(id, px + 1.0, py, pz);
        return 1;
    }

    if(!strcmp(cmd, "/kill", true)) {
        new tmp[32], id;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /kill [id]");
        id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        SetPlayerHealth(id, 0.0);
        return 1;
    }

    if(!strcmp(cmd, "/cord", true)) {
        new Float:x, Float:y, Float:z, str[128];
        GetPlayerPos(playerid, x, y, z);
        format(str, sizeof(str), "Coords: %.4f %.4f %.4f", x, y, z);
        SendClientMessage(playerid, 0x00FFFFFF, str);
        return 1;
    }

    if(!strcmp(cmd, "/sacarveh", true)) {
        new tmp[32], vid;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /sacarveh [idveh]");
        vid = strval(tmp);
        if(vid <= 0 || vid >= MAX_VEHICLES || !IsValidVehicle(vid)) return SendClientMessage(playerid, -1, "Vehiculo invalido.");
        if(VehTempRestoreTimer[vid] != -1) return SendClientMessage(playerid, -1, "Ese vehiculo ya esta temporalmente retirado.");
        GetVehiclePos(vid, TempVehPos[vid][0], TempVehPos[vid][1], TempVehPos[vid][2]);
        GetVehicleZAngle(vid, TempVehPos[vid][3]);
        TempVehModel[vid] = GetVehicleModel(vid);
        TempVehVW[vid] = GetVehicleVirtualWorld(vid);
        TempVehInterior[vid] = GetVehicleInterior(vid);
        new c1, c2;
        GetVehicleColours(vid, c1, c2);
        TempVehColor1[vid] = c1;
        TempVehColor2[vid] = c2;
        for(new i = 0; i < MAX_PLAYERS; i++) { if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vid)) RemovePlayerFromVehicle(i); }
        DestroyVehicle(vid);
        VehTempRestoreTimer[vid] = SetTimerEx("RestaurarVehiculoTemporal", 600000, false, "d", vid);
        SendClientMessage(playerid, 0xFFAA00FF, "Vehiculo retirado por 10 minutos.");
        return 1;
    }

    if(!strcmp(cmd, "/fly", true)) {
        AdminFlyActivo[playerid] = !AdminFlyActivo[playerid];
        if(AdminFlyActivo[playerid]) {
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
            SendClientMessage(playerid, 0x00FF00FF, "Fly activado.");
        } else {
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            SendClientMessage(playerid, 0xFFAA00FF, "Fly desactivado.");
        }
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
    if(PlayerAdmin[playerid] >= 1) SendClientMessage(playerid, -1, "{FFFF00}Punto marcado. /ir");
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
    TogglePlayerSpectating(playerid, true);
    TogglePlayerControllable(playerid, false);
    PlayerHambre[playerid] = 100;
    BarraHambre[playerid] = CreatePlayerTextDraw(playerid, 545.0, 150.0, "H: 100");
    PlayerTextDrawLetterSize(playerid, BarraHambre[playerid], 0.3, 1.2);
    PlayerTextDrawAlignment(playerid, BarraHambre[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraHambre[playerid], COLOR_HAMBRE);
    PlayerTextDrawSetShadow(playerid, BarraHambre[playerid], 1);
    PlayerTextDrawFont(playerid, BarraHambre[playerid], TEXT_DRAW_FONT_1);

    BarraGas[playerid] = CreatePlayerTextDraw(playerid, 545.0, 164.0, "G: 100");
    PlayerTextDrawLetterSize(playerid, BarraGas[playerid], 0.3, 1.2);
    PlayerTextDrawAlignment(playerid, BarraGas[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraGas[playerid], COLOR_HAMBRE);
    PlayerTextDrawSetShadow(playerid, BarraGas[playerid], 1);
    PlayerTextDrawFont(playerid, BarraGas[playerid], TEXT_DRAW_FONT_1);
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
    VentaAutosAdminModeloPendiente[playerid] = 0;
    VentaAutosAdminPrecioPendiente[playerid] = 0;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    PlayerTiempoJugadoMin[playerid] = 0;
    GasRefuelTimer[playerid] = -1;
    GasRefuelVeh[playerid] = INVALID_VEHICLE_ID;
    GasRefuelCost[playerid] = 0;
    BidonGasolina[playerid] = 0;
    PlayerTieneTelefono[playerid] = false;
    TelefonoMensajeDestino[playerid] = -1;
    CalcValor1Pendiente[playerid] = 0.0;
    CalcOperacionPendiente[playerid] = 0;
    TelefonoVehiculoSeleccionado[playerid] = INVALID_VEHICLE_ID;
    AdminFlyActivo[playerid] = false;
    GPSVehiculoSeleccionado[playerid] = INVALID_VEHICLE_ID;
    InvSemillaHierba[playerid] = 0;
    InvSemillaFlor[playerid] = 0;
    InvHierba[playerid] = 0;
    InvFlor[playerid] = 0;
    InvMadera[playerid] = 0;
    InvPiedra[playerid] = 0;
    InvCobre[playerid] = 0;
    InvHierroMineral[playerid] = 0;
    InvPolvora[playerid] = 0;
    InvPrepieza[playerid] = 0;
    InvCarbon[playerid] = 0;
    PlayerTieneMazo[playerid] = false;
    MazoDurabilidad[playerid] = 0;
    ArmeroNivel[playerid] = 1;
    ArmeroExp[playerid] = 0;
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
    if(fexist(path)) ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{33CCFF}Kame House - Login", "{FFFFFF}Bienvenido de nuevo a {66CCFF}Kame House{FFFFFF}.\n\n{AAAAAA}Ingresa tu clave para continuar:", "Entrar", "Salir");
    else ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{66FF99}Kame House - Registro", "{FFFFFF}Bienvenido a {66CCFF}Kame House{FFFFFF}.\n\n{AAAAAA}Crea una clave para tu cuenta:", "Registrar", "Salir");
    ActualizarNivelPJ(playerid);
    return 1;
}

public OnPlayerSpawn(playerid) {
    if(!IsPlayerLoggedIn[playerid]) return Kick(playerid);
    SetPlayerSkin(playerid, SKIN_POR_DEFECTO);
    SetPlayerHealth(playerid, VIDA_AL_LOGUEAR);
    SetPlayerArmour(playerid, CHALECO_AL_LOGUEAR);

    new Float:sx = 2494.24, Float:sy = -1671.19, Float:sz = 13.33;
    if(GetPVarType(playerid, "SpawnX") == PLAYER_VARTYPE_FLOAT) {
        sx = GetPVarFloat(playerid, "SpawnX");
        sy = GetPVarFloat(playerid, "SpawnY");
        sz = GetPVarFloat(playerid, "SpawnZ");
        DeletePVar(playerid, "SpawnX");
        DeletePVar(playerid, "SpawnY");
        DeletePVar(playerid, "SpawnZ");
    }
    if(sz < -20.0 || sz > 200.0) sz = 13.33;
    SetPlayerPos(playerid, sx, sy, sz + 0.5);
    SetCameraBehindPlayer(playerid);
    PlayerTextDrawShow(playerid, BarraHambre[playerid]);
    PlayerTextDrawHide(playerid, BarraGas[playerid]);
    return 1;
}

stock SpawnPlayerAfterAuth(playerid)
{
    SetSpawnInfo(playerid, 255, SKIN_POR_DEFECTO, 2494.24, -1671.19, 13.33, 0.0, 0, 0, 0, 0, 0, 0);
    TogglePlayerSpectating(playerid, false);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    SetCameraBehindPlayer(playerid);
    SpawnPlayer(playerid);
    SetCameraBehindPlayer(playerid);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

    if(dialogid == DIALOG_AYUDA_CATEGORIA) {
        if(!response) return 1;
        if(listitem == 0) return ShowAyudaDialog(playerid);
        if(listitem == 1) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Trabajos", "[Minero]\n-Informacion del trabajo: extrae piedra/cobre/hierro en minas.\n-Comandos: H en mina, /inventario, /dejartrabajo.\n-Niveles: mejora por tiempo jugado general.\n-Paga: recursos para vender/craftear.\n\n[Basurero]\n-Informacion del trabajo: recoge bolsas y cargalas en la Rumpo con H.\n-Comandos: H en bolsa/camion, /tirar basura, /dejartrabajo.\n-Niveles: 1 a 10 por rutas completadas.\n-Paga: dinero + chance de flores.\n\n[Pizzero]\n-Informacion del trabajo: entrega pizzas en moto por checkpoints.\n-Comandos: H para tomar trabajo, /dejartrabajo.\n-Niveles: 1 a 10 por entregas.\n-Paga: dinero por entrega + bonus por nivel.\n\n[Camionero]\n-Informacion del trabajo: rutas de carga y entrega.\n-Comandos: H para iniciar, /dejartrabajo.\n-Niveles: 1 a 10 por viajes.\n-Paga: pago alto por ruta.\n\n[Armero]\n-Informacion del trabajo: crea armas y municion en armeria.\n-Comandos: H en armeria, /armero, /inventario.\n-Niveles: 1 a 10 por crafteo.\n-Paga: venta/utilidad de armas para combate.", "Cerrar", "");
        if(listitem == 2) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Casas", "/comprar /abrircasa /salir\n/plantar /cosehar /inventario\nMaximo 5 plantas por jugador en su casa", "Cerrar", "");
        if(listitem == 3) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Economia", "/saldo /comprar\n/pagar y transferencias deshabilitadas\nCada hora recibes pago segun nivel PJ", "Cerrar", "");
        if(listitem == 4 && PlayerAdmin[playerid] >= 1) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Admin", "Usa /admm para abrir el panel admin con accesos rapidos.", "Cerrar", "");
        return 1;
    }
    if(dialogid == DIALOG_GPS) {
        if(!response) return 1;
        if(listitem == 0) SetPlayerCheckpoint(playerid, PuntoPos[puntoCamionero][0], PuntoPos[puntoCamionero][1], PuntoPos[puntoCamionero][2], 6.0);
        else if(listitem == 1) SetPlayerCheckpoint(playerid, PuntoPos[puntoMinero][0], PuntoPos[puntoMinero][1], PuntoPos[puntoMinero][2], 6.0);
        else if(listitem == 2) SetPlayerCheckpoint(playerid, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2], 6.0);
        else if(listitem == 3) SetPlayerCheckpoint(playerid, PuntoPos[puntoPizzeria][0], PuntoPos[puntoPizzeria][1], PuntoPos[puntoPizzeria][2], 6.0);
        else if(listitem == 4) SetPlayerCheckpoint(playerid, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 6.0);
        else if(listitem == 5) SetPlayerCheckpoint(playerid, PuntoPos[puntoCarga][0], PuntoPos[puntoCarga][1], PuntoPos[puntoCarga][2], 6.0);
        else if(listitem == 6) SetPlayerCheckpoint(playerid, PuntoPos[puntoBanco][0], PuntoPos[puntoBanco][1], PuntoPos[puntoBanco][2], 6.0);
        else if(listitem == 7) SetPlayerCheckpoint(playerid, PuntoPos[puntoSemilleria][0], PuntoPos[puntoSemilleria][1], PuntoPos[puntoSemilleria][2], 6.0);
        else if(listitem == 8) SetPlayerCheckpoint(playerid, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2], 6.0);
        else if(listitem == 9) SetPlayerCheckpoint(playerid, PuntoPos[puntoVentaAutos][0], PuntoPos[puntoVentaAutos][1], PuntoPos[puntoVentaAutos][2], 6.0);
        else if(listitem == 10) SetPlayerCheckpoint(playerid, PuntoPos[puntoPintura][0], PuntoPos[puntoPintura][1], PuntoPos[puntoPintura][2], 6.0);
        else if(listitem == 11) {
            new horno = GetHornoMasCercano(playerid);
            if(horno == -1) return SendClientMessage(playerid, -1, "No hay hornos disponibles en el mapa.");
            SetPlayerCheckpoint(playerid, HornoData[horno][hornoX], HornoData[horno][hornoY], HornoData[horno][hornoZ], 4.0);
        }
        else if(listitem == 12) {
            new restaurados = RestaurarVehiculosJugador(playerid);
            new msg[96];
            format(msg, sizeof(msg), "GPS: %d vehiculo(s) restaurado(s) en su ultima posicion.", restaurados);
            SendClientMessage(playerid, 0x00FF00FF, msg);
            return 1;
        }
        else if(listitem == 13) {
            return ShowGPSVehiculosMenu(playerid);
        }
        GPSCheckpointActivo[playerid] = true;
        SendClientMessage(playerid, 0x00FFFFFF, "GPS actualizado en tu mapa.");
        return 1;
    }

    if(dialogid == DIALOG_GPS_VEHICULOS) {
        if(!response) return 1;
        new veh = GetOwnedVehicleByListIndex(playerid, listitem);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "Seleccion invalida.");

        GPSVehiculoSeleccionado[playerid] = veh;
        if(VehOculto[veh]) {
            if(!RestaurarVehiculoSeleccionado(playerid, veh)) return SendClientMessage(playerid, -1, "Ese vehiculo no pudo restaurarse ahora.");
            veh = GPSVehiculoSeleccionado[playerid];
            if(veh == INVALID_VEHICLE_ID || !IsValidVehicle(veh)) return SendClientMessage(playerid, -1, "No fue posible restaurar el vehiculo elegido.");
        }

        new Float:vx, Float:vy, Float:vz;
        GetVehiclePos(veh, vx, vy, vz);
        SetPlayerCheckpoint(playerid, vx, vy, vz, 8.0);
        GPSCheckpointActivo[playerid] = true;
        SendClientMessage(playerid, 0x00FFFFFF, "GPS configurado hacia el vehiculo seleccionado.");
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
        GuardarPuntosMovibles();
        if(ePuntoMovible:listitem == puntoVentaAutos) {
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
        if(listitem < 0 || listitem > 3) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        KameTiendaTipoPendiente[playerid] = listitem;
        if(listitem == 2) {
            if(GetPlayerMoney(playerid) < PRECIO_MAZO) return SendClientMessage(playerid, -1, "No tienes dinero para el mazo.");
            GivePlayerMoney(playerid, -PRECIO_MAZO);
            PlayerTieneMazo[playerid] = true;
            MazoDurabilidad[playerid] = 120 + random(61);
            return SendClientMessage(playerid, 0x66FF66FF, "Compraste un mazo para minar.");
        }
        if(listitem == 3) {
            if(PlayerTieneTelefono[playerid]) return SendClientMessage(playerid, -1, "Ya tienes telefono.");
            if(GetPlayerMoney(playerid) < PRECIO_TELEFONO) return SendClientMessage(playerid, -1, "No tienes dinero para el telefono.");
            GivePlayerMoney(playerid, -PRECIO_TELEFONO);
            PlayerTieneTelefono[playerid] = true;
            return SendClientMessage(playerid, 0x66FF66FF, "Compraste un telefono. Usa /telefono para abrirlo.");
        }
        ShowPlayerDialog(playerid, DIALOG_KAMETIENDA_CANTIDAD, DIALOG_STYLE_INPUT, "Tienda Kame House - Cantidad", "Ingresa la cantidad de productos que deseas comprar:", "Continuar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_KAMETIENDA_CANTIDAD) {
        if(!response) return ShowSemilleriaMenu(playerid);
        new cantidad = strval(inputtext);
        if(cantidad <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida. Debe ser mayor a 0.");
        if(cantidad > 200) return SendClientMessage(playerid, -1, "Cantidad muy alta. Maximo por compra: 200.");

        KameTiendaCantidadPendiente[playerid] = cantidad;
        new precio = (KameTiendaTipoPendiente[playerid] == 0) ? SEMILLA_HIERBA_PRECIO : SEMILLA_FLOR_PRECIO;
        new total = precio * cantidad;
        new tipo[32], body[192];
        format(tipo, sizeof(tipo), (KameTiendaTipoPendiente[playerid] == 0) ? "hierba verde" : "flores");
        format(body, sizeof(body), "Comprar semillas de %s\nCantidad: %d\nCosto unitario: $%d\nCosto total: $%d", tipo, cantidad, precio, total);
        ShowPlayerDialog(playerid, DIALOG_KAMETIENDA_CONFIRMAR, DIALOG_STYLE_MSGBOX, "Tienda Kame House - Confirmar compra", body, "Comprar", "Cancelar");
        return 1;
    }

    if(dialogid == DIALOG_KAMETIENDA_CONFIRMAR) {
        if(!response) return 1;
        new cantidad = KameTiendaCantidadPendiente[playerid];
        if(cantidad <= 0) return SendClientMessage(playerid, -1, "No hay compra pendiente.");

        new precio = (KameTiendaTipoPendiente[playerid] == 0) ? SEMILLA_HIERBA_PRECIO : SEMILLA_FLOR_PRECIO;
        new total = precio * cantidad;
        if(GetPlayerMoney(playerid) < total) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para esta compra.");

        GivePlayerMoney(playerid, -total);
        if(KameTiendaTipoPendiente[playerid] == 0) InvSemillaHierba[playerid] += cantidad;
        else InvSemillaFlor[playerid] += cantidad;

        new msg[160], tipo[16];
        format(tipo, sizeof(tipo), (KameTiendaTipoPendiente[playerid] == 0) ? "hierba" : "flores");
        format(msg, sizeof(msg), "Tienda Kame House: compraste %d semillas de %s por $%d.", cantidad, tipo, total);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        KameTiendaCantidadPendiente[playerid] = 0;
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_MENU) {
        if(!response) return 1;
        if(!PlayerTieneTelefono[playerid]) return SendClientMessage(playerid, -1, "No tienes telefono.");

        if(listitem == 0) {
            new hh, mm, ss;
            gettime(hh, mm, ss);
            new msg[64];
            format(msg, sizeof(msg), "Hora actual: %02d:%02d:%02d", hh, mm, ss);
            return SendClientMessage(playerid, 0x66CCFFFF, msg);
        }
        if(listitem == 1) {
            new yy, mo, dd;
            getdate(yy, mo, dd);
            new msg[64];
            format(msg, sizeof(msg), "Fecha actual: %02d/%02d/%04d", dd, mo, yy);
            return SendClientMessage(playerid, 0x66CCFFFF, msg);
        }
        if(listitem == 2) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_MENSAJE_ID, DIALOG_STYLE_INPUT, "Telefono - Enviar mensaje", "Ingresa el ID del jugador:", "Siguiente", "Atras");
        if(listitem == 3) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CALC_VALOR1, DIALOG_STYLE_INPUT, "Telefono - Calculadora", "Ingresa el primer valor:", "Siguiente", "Atras");
        if(listitem == 4) return ShowTelefonoVehiculosMenu(playerid);
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_MENSAJE_ID) {
        if(!response) return ShowTelefonoMenu(playerid);
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido o desconectado.");
        if(id == playerid) return SendClientMessage(playerid, -1, "No puedes enviarte mensajes a ti mismo.");
        TelefonoMensajeDestino[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_TELEFONO_MENSAJE_TEXTO, DIALOG_STYLE_INPUT, "Telefono - Mensaje", "Escribe tu mensaje (costo $100):", "Enviar", "Atras");
    }

    if(dialogid == DIALOG_TELEFONO_MENSAJE_TEXTO) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_MENSAJE_ID, DIALOG_STYLE_INPUT, "Telefono - Enviar mensaje", "Ingresa el ID del jugador:", "Siguiente", "Atras");
        new target = TelefonoMensajeDestino[playerid];
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "El jugador se desconecto.");
        if(strlen(inputtext) < 1) return SendClientMessage(playerid, -1, "Mensaje vacio.");
        if(GetPlayerMoney(playerid) < COSTO_SMS) return SendClientMessage(playerid, -1, "No tienes $100 para enviar el mensaje.");

        GivePlayerMoney(playerid, -COSTO_SMS);
        new msgTo[180], msgFrom[120], sender[MAX_PLAYER_NAME];
        GetPlayerName(playerid, sender, sizeof(sender));
        format(msgTo, sizeof(msgTo), "[SMS] %s(%d): %s", sender, playerid, inputtext);
        format(msgFrom, sizeof(msgFrom), "[SMS] Mensaje enviado a %d. Costo: $%d", target, COSTO_SMS);
        SendClientMessage(target, 0xFFE680FF, msgTo);
        SendClientMessage(playerid, 0x66FF66FF, msgFrom);
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_CALC_VALOR1) {
        if(!response) return ShowTelefonoMenu(playerid);
        CalcValor1Pendiente[playerid] = floatstr(inputtext);
        return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CALC_OPERACION, DIALOG_STYLE_LIST, "Telefono - Calculadora", "Sumar (+)\nRestar (-)\nDividir (/)\nMultiplicar (*)", "Siguiente", "Atras");
    }

    if(dialogid == DIALOG_TELEFONO_CALC_OPERACION) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CALC_VALOR1, DIALOG_STYLE_INPUT, "Telefono - Calculadora", "Ingresa el primer valor:", "Siguiente", "Atras");
        if(listitem < 0 || listitem > 3) return SendClientMessage(playerid, -1, "Operacion invalida.");
        CalcOperacionPendiente[playerid] = listitem;
        return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CALC_VALOR2, DIALOG_STYLE_INPUT, "Telefono - Calculadora", "Ingresa el segundo valor:", "Calcular", "Atras");
    }

    if(dialogid == DIALOG_TELEFONO_CALC_VALOR2) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CALC_OPERACION, DIALOG_STYLE_LIST, "Telefono - Calculadora", "Sumar (+)\nRestar (-)\nDividir (/)\nMultiplicar (*)", "Siguiente", "Atras");
        new Float:v1 = CalcValor1Pendiente[playerid];
        new Float:v2 = floatstr(inputtext);
        new Float:res;
        if(CalcOperacionPendiente[playerid] == 0) res = v1 + v2;
        else if(CalcOperacionPendiente[playerid] == 1) res = v1 - v2;
        else if(CalcOperacionPendiente[playerid] == 2) {
            if(v2 == 0.0) return SendClientMessage(playerid, -1, "No se puede dividir entre 0.");
            res = v1 / v2;
        }
        else res = v1 * v2;

        new body[128];
        format(body, sizeof(body), "Resultado: %.2f", res);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Telefono - Resultado", body, "Aceptar", "");
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_LLAMAR_VEHICULO) {
        if(!response) return ShowTelefonoMenu(playerid);
        new veh = GetTelefonoVehiculoByListIndex(playerid, listitem);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(GetPlayerMoney(playerid) < COSTO_LLAMAR_VEHICULO) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para llamar tu vehiculo.");
        GivePlayerMoney(playerid, -COSTO_LLAMAR_VEHICULO);
        TelefonoVehiculoSeleccionado[playerid] = veh;
        SendClientMessage(playerid, 0x66CCFFFF, "Llamada procesada. Tu vehiculo llegara en 5 segundos.");
        SetTimerEx("TeleportVehiculoLlamado", 5000, false, "d", playerid);
        return 1;
    }

    if(dialogid == DIALOG_PRENDAS_MENU) {
        if(!response) return 1;
        new idxPrenda = -1, cur = 0;
        for(new i = 0; i < MAX_PRENDAS; i++) {
            if(!PrendasData[i][prendaActiva]) continue;
            if(cur == listitem) { idxPrenda = i; break; }
            cur++;
        }
        if(idxPrenda == -1) return SendClientMessage(playerid, -1, "Prenda invalida.");

        if(!PlayerPrendaComprada[playerid][idxPrenda]) {
            if(PrendasData[idxPrenda][prendaStock] <= 0) return SendClientMessage(playerid, -1, "Esta prenda esta agotada.");
            if(ContarPrendasJugador(playerid) >= MAX_PRENDAS_USUARIO) return SendClientMessage(playerid, -1, "Limite alcanzado: solo puedes tener 5 prendas visibles.");
            if(GetPlayerMoney(playerid) < PrendasData[idxPrenda][prendaPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
            GivePlayerMoney(playerid, -PrendasData[idxPrenda][prendaPrecio]);
            PrendasData[idxPrenda][prendaStock]--;
            GuardarPrendasConfig();
            PlayerPrendaComprada[playerid][idxPrenda] = 1;
            PlayerPrendaActiva[playerid][idxPrenda] = 1;
            AplicarPrendaJugador(playerid, idxPrenda);
            SendClientMessage(playerid, 0x66FF66FF, "Compraste y equipaste la prenda.");
            return 1;
        }

        if(PlayerPrendaActiva[playerid][idxPrenda]) {
            QuitarPrendaJugador(playerid, idxPrenda);
            return SendClientMessage(playerid, 0xFFAA00FF, "Prenda oculta. Usa /prendas para volver a mostrarla.");
        }

        if(ContarPrendasJugador(playerid) >= MAX_PRENDAS_USUARIO) return SendClientMessage(playerid, -1, "Limite alcanzado: solo puedes tener 5 prendas visibles.");
        PlayerPrendaActiva[playerid][idxPrenda] = 1;
        AplicarPrendaJugador(playerid, idxPrenda);
        SendClientMessage(playerid, 0x66FF66FF, "Prenda equipada.");
        return 1;
    }

    if(dialogid == DIALOG_PRENDAS_EDITAR) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!response) return ShowPrendasAdminMenu(playerid);
        new idxp = PrendaEditIndex[playerid];
        if(idxp < 0 || idxp >= MAX_PRENDAS) return ShowPrendasAdminMenu(playerid);
        if(listitem == 0) {
            PrendasData[idxp][prendaActiva] = !PrendasData[idxp][prendaActiva];
            GuardarPrendasConfig();
            return ShowPrendasAdminEditar(playerid, idxp);
        }
        if(listitem == 1) {
            PrendaPrecioPendiente[playerid] = idxp;
            return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Prendas Admin - Precio", "Ingresa el nuevo precio de la prenda:", "Guardar", "Atras");
        }
        if(listitem == 2) {
            new txt[64];
            format(txt, sizeof(txt), "Stock actual: %d\nIngresa el nuevo stock:", PrendasData[idxp][prendaStock]);
            PrendaStockPendiente[playerid] = idxp;
            return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_STOCK, DIALOG_STYLE_INPUT, "Prendas Admin - Stock", txt, "Guardar", "Atras");
        }
        return ShowPrendasAdminMenu(playerid);
    }

    if(dialogid == DIALOG_PRENDAS_ADMIN_MENU) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!response) return 1;
        if(listitem == 0) {
            PrendaAdminSlotPendiente[playerid] = -1;
            PrendaAdminModeloPendiente[playerid] = 0;
            PrendaAdminPrecioPendiente[playerid] = 0;
            format(PrendaAdminNombrePendiente[playerid], 32, "");
            return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_MODELO, DIALOG_STYLE_INPUT, "Prendas Admin - Modelo", "Ingresa el ID del modelo:", "Siguiente", "Cancelar");
        }
        if(listitem == 1) {
            new list[1024], line[96], count;
            list[0] = EOS;
            for(new i = 0; i < MAX_PRENDAS; i++) {
                if(!PrendasData[i][prendaActiva]) continue;
                format(line, sizeof(line), "%d) %s (Stock: %d)", i, PrendasData[i][prendaNombre], PrendasData[i][prendaStock]);
                if(strlen(list) > 0) strcat(list, "\n");
                strcat(list, line);
                count++;
            }
            if(!count) return SendClientMessage(playerid, -1, "No hay prendas activas para eliminar.");
            return ShowPlayerDialog(playerid, DIALOG_PRENDAS_REMOVE_LIST, DIALOG_STYLE_LIST, "Prendas Admin - Eliminar", list, "Eliminar", "Atras");
        }
        return 1;
    }

    if(dialogid == DIALOG_PRENDAS_ADD_MODELO) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!response) return ShowPrendasAdminMenu(playerid);
        new modelid = strval(inputtext);
        if(modelid <= 0) return SendClientMessage(playerid, -1, "ID de modelo invalido.");
        PrendaAdminModeloPendiente[playerid] = modelid;
        return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_NOMBRE, DIALOG_STYLE_INPUT, "Prendas Admin - Nombre", "Ingresa el nombre de la prenda:", "Siguiente", "Cancelar");
    }

    if(dialogid == DIALOG_PRENDAS_ADD_NOMBRE) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!response) return ShowPrendasAdminMenu(playerid);
        if(!strlen(inputtext)) return SendClientMessage(playerid, -1, "Nombre invalido.");
        format(PrendaAdminNombrePendiente[playerid], 32, "%s", inputtext);
        return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Prendas Admin - Precio", "Ingresa el precio de la prenda:", "Siguiente", "Cancelar");
    }

    if(dialogid == DIALOG_PRENDAS_ADD_PRECIO) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(PrendaPrecioPendiente[playerid] != -1) {
            if(!response) {
                PrendaPrecioPendiente[playerid] = -1;
                return ShowPrendasAdminEditar(playerid, PrendaEditIndex[playerid]);
            }
            new np = strval(inputtext);
            if(np < 0) return SendClientMessage(playerid, -1, "Precio invalido.");
            new ip = PrendaPrecioPendiente[playerid];
            if(ip >= 0 && ip < MAX_PRENDAS) PrendasData[ip][prendaPrecio] = np;
            PrendaPrecioPendiente[playerid] = -1;
            GuardarPrendasConfig();
            return ShowPrendasAdminEditar(playerid, PrendaEditIndex[playerid]);
        }
        if(!response) return ShowPrendasAdminMenu(playerid);
        new precio = strval(inputtext);
        if(precio < 0) return SendClientMessage(playerid, -1, "Precio invalido.");
        PrendaAdminPrecioPendiente[playerid] = precio;
        return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADD_STOCK, DIALOG_STYLE_INPUT, "Prendas Admin - Stock", "Ingresa el stock inicial:", "Guardar", "Cancelar");
    }

    if(dialogid == DIALOG_PRENDAS_ADD_STOCK) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(PrendaStockPendiente[playerid] != -1) {
            new stockIdx = PrendaStockPendiente[playerid];
            if(!response) { PrendaStockPendiente[playerid] = -1; return ShowPrendasAdminEditar(playerid, stockIdx); }
            new st = strval(inputtext);
            if(st < 0) return SendClientMessage(playerid, -1, "Stock invalido.");
            PrendasData[stockIdx][prendaStock] = st;
            PrendaStockPendiente[playerid] = -1;
            GuardarPrendasConfig();
            return ShowPrendasAdminEditar(playerid, stockIdx);
        }
        if(!response) return ShowPrendasAdminMenu(playerid);
        new stockValue = strval(inputtext);
        if(stockValue < 0) return SendClientMessage(playerid, -1, "Stock invalido.");

        new freeIdx = -1;
        for(new i = 0; i < MAX_PRENDAS; i++) {
            if(!PrendasData[i][prendaActiva] && !IsPrendaSlotEnUsoPorJugadores(i)) { freeIdx = i; break; }
        }
        if(freeIdx == -1) return SendClientMessage(playerid, -1, "No hay slots libres para nuevas prendas.");

        PrendasData[freeIdx][prendaActiva] = true;
        PrendasData[freeIdx][prendaModelo] = PrendaAdminModeloPendiente[playerid];
        PrendasData[freeIdx][prendaPrecio] = PrendaAdminPrecioPendiente[playerid];
        PrendasData[freeIdx][prendaStock] = stockValue;
        PrendasData[freeIdx][prendaBone] = 2;
        PrendasData[freeIdx][prendaOffX] = 0.0;
        PrendasData[freeIdx][prendaOffY] = 0.0;
        PrendasData[freeIdx][prendaOffZ] = 0.0;
        PrendasData[freeIdx][prendaRotX] = 0.0;
        PrendasData[freeIdx][prendaRotY] = 0.0;
        PrendasData[freeIdx][prendaRotZ] = 0.0;
        PrendasData[freeIdx][prendaScaleX] = 1.0;
        PrendasData[freeIdx][prendaScaleY] = 1.0;
        PrendasData[freeIdx][prendaScaleZ] = 1.0;
        format(PrendasData[freeIdx][prendaNombre], 32, "%s", PrendaAdminNombrePendiente[playerid]);

        PrendaAdminModeloPendiente[playerid] = 0;
        PrendaAdminPrecioPendiente[playerid] = 0;
        format(PrendaAdminNombrePendiente[playerid], 32, "");

        GuardarPrendasConfig();
        SendClientMessage(playerid, 0x66FF66FF, "Prenda agregada correctamente.");
        return ShowPrendasAdminEditar(playerid, freeIdx);
    }

    if(dialogid == DIALOG_PRENDAS_REMOVE_LIST) {
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!response) return ShowPrendasAdminMenu(playerid);
        new idxp = -1, cur = 0;
        for(new i = 0; i < MAX_PRENDAS; i++) {
            if(!PrendasData[i][prendaActiva]) continue;
            if(cur == listitem) { idxp = i; break; }
            cur++;
        }
        if(idxp == -1) return SendClientMessage(playerid, -1, "Prenda invalida.");
        PrendasData[idxp][prendaActiva] = false;
        PrendasData[idxp][prendaStock] = 0;
        GuardarPrendasConfig();
        SendClientMessage(playerid, 0xFFAA00FF, "Prenda eliminada de la tienda. Los jugadores que la compraron la conservan.");
        return ShowPrendasAdminMenu(playerid);
    }

    if(dialogid == DIALOG_PRENDAS_BONE) {
        new idxp = PrendaBonePendiente[playerid];
        if(idxp < 0 || idxp >= MAX_PRENDAS) return 1;
        if(!response) {
            if(PlayerAdmin[playerid] >= 1 && PrendaEditIndex[playerid] != -1 && !PlayerPrendaComprada[playerid][idxp]) return ShowPrendasAdminEditar(playerid, PrendaEditIndex[playerid]);
            return ShowPrendaUsuarioEditar(playerid, idxp);
        }
        new bones[] = {1,2,3,4,5,6,7,8,9,10,11};
        if(listitem < 0 || listitem >= sizeof(bones)) return 1;
        if(PlayerAdmin[playerid] >= 1 && PrendaEditIndex[playerid] != -1 && !PlayerPrendaComprada[playerid][idxp]) {
            PrendasData[idxp][prendaBone] = bones[listitem];
            GuardarPrendasConfig();
            return ShowPrendasAdminEditar(playerid, idxp);
        }
        PlayerPrendaBone[playerid][idxp] = bones[listitem];
        AplicarPrendaJugador(playerid, idxp);
        return ShowPrendaUsuarioEditar(playerid, idxp);
    }


    if(dialogid == DIALOG_PRENDA_USUARIO_MENU) {
        if(!response) return 1;
        new idxp = -1, cur = 0;
        for(new i = 0; i < MAX_PRENDAS; i++) {
            if(!PlayerPrendaComprada[playerid][i]) continue;
            if(cur == listitem) { idxp = i; break; }
            cur++;
        }
        if(idxp == -1) return SendClientMessage(playerid, -1, "Prenda invalida.");
        return ShowPrendaUsuarioEditar(playerid, idxp);
    }

    if(dialogid == DIALOG_PRENDA_USUARIO_EDITAR) {
        if(!response) return ShowPrendaUsuarioMenu(playerid);
        new idxp = PrendaUsuarioEditando[playerid];
        if(idxp < 0 || idxp >= MAX_PRENDAS || !PlayerPrendaComprada[playerid][idxp]) return 1;
        if(listitem == 0) {
            PrendaMoveIndex[playerid] = idxp;
            AplicarPrendaJugador(playerid, idxp);
            EditAttachedObject(playerid, idxp);
            return 1;
        }
        if(listitem == 1) {
            PrendaBonePendiente[playerid] = idxp;
            ShowPlayerDialog(playerid, DIALOG_PRENDAS_BONE, DIALOG_STYLE_LIST, "Selecciona parte del cuerpo", "Cabeza\nPecho\nEspalda\nBrazo izquierdo\nBrazo derecho\nMano izquierda\nMano derecha\nMuslo izquierdo\nMuslo derecho\nPie izquierdo\nPie derecho", "Elegir", "Atras");
            return 1;
        }
        if(listitem == 2) {
            if(PlayerPrendaActiva[playerid][idxp]) {
                QuitarPrendaJugador(playerid, idxp);
                SendClientMessage(playerid, 0xFFAA00FF, "Prenda oculta.");
            } else {
                if(ContarPrendasJugador(playerid) >= MAX_PRENDAS_USUARIO) return SendClientMessage(playerid, -1, "Limite alcanzado: solo puedes tener 5 prendas visibles.");
                PlayerPrendaActiva[playerid][idxp] = 1;
                AplicarPrendaJugador(playerid, idxp);
                SendClientMessage(playerid, 0x66FF66FF, "Prenda visible nuevamente.");
            }
            return ShowPrendaUsuarioMenu(playerid);
        }
        if(listitem == 3) {
            QuitarPrendaJugador(playerid, idxp);
            PlayerPrendaComprada[playerid][idxp] = 0;
            PlayerPrendaBone[playerid][idxp] = 0;
            PlayerPrendaOffX[playerid][idxp] = 0.0;
            PlayerPrendaOffY[playerid][idxp] = 0.0;
            PlayerPrendaOffZ[playerid][idxp] = 0.0;
            PlayerPrendaRotX[playerid][idxp] = 0.0;
            PlayerPrendaRotY[playerid][idxp] = 0.0;
            PlayerPrendaRotZ[playerid][idxp] = 0.0;
            PlayerPrendaScaleX[playerid][idxp] = 0.0;
            PlayerPrendaScaleY[playerid][idxp] = 0.0;
            PlayerPrendaScaleZ[playerid][idxp] = 0.0;
            SendClientMessage(playerid, 0xFF4444FF, "Prenda eliminada de tu inventario.");
            return ShowPrendaUsuarioMenu(playerid);
        }
        return 1;
    }

    if(dialogid == DIALOG_HORNO_MENU) {
        if(!response) return 1;
        new h = HornoActivoJugador[playerid];
        if(h < 0 || h >= TotalHornos || !HornoData[h][hornoActivo]) return SendClientMessage(playerid, -1, "Horno invalido.");

        if(HornoData[h][hornoEnUso] && HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Este horno esta en uso por otro jugador.");

        if(listitem == 0 || listitem == 1) {
            if(HornoData[h][hornoEnUso]) return SendClientMessage(playerid, -1, "Este horno ya esta en uso. Espera a terminar y retirar.");
            if(listitem == 0) {
                if(InvPiedra[playerid] < 20) return SendClientMessage(playerid, -1, "Necesitas 20 piedra.");
                InvPiedra[playerid] -= 20;
                HornoData[h][hornoTipo] = 1;
                HornoData[h][hornoCantidadSalida] = 5;
                HornoData[h][hornoReadyTick] = GetTickCount() + 300000;
                SetTimerEx("FinalizarHorno", 300000, false, "d", h);
                SendClientMessage(playerid, 0xFFAA00FF, "Horno encendido: polvora lista en 5 minutos.");
            } else {
                if(InvMadera[playerid] < 20) return SendClientMessage(playerid, -1, "Necesitas 20 madera.");
                InvMadera[playerid] -= 20;
                HornoData[h][hornoTipo] = 2;
                HornoData[h][hornoCantidadSalida] = 5;
                HornoData[h][hornoReadyTick] = GetTickCount() + 120000;
                SetTimerEx("FinalizarHorno", 120000, false, "d", h);
                SendClientMessage(playerid, 0xFFAA00FF, "Horno encendido: carbon listo en 2 minutos.");
            }
            HornoData[h][hornoEnUso] = true;
            HornoData[h][hornoOwner] = playerid;
            HornoData[h][hornoCantidadEntrada] = 20;
            HornoData[h][hornoListoRetiro] = false;
            ActualizarLabelHorno(h);
            return 1;
        }

        if(listitem == 2) {
            if(!HornoData[h][hornoEnUso] || HornoData[h][hornoListoRetiro]) return SendClientMessage(playerid, -1, "El horno no esta cocinando.");
            if(HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Solo el dueño puede acelerar.");
            if(InvCarbon[playerid] <= 0) return SendClientMessage(playerid, -1, "No tienes carbon.");
            InvCarbon[playerid]--;
            HornoData[h][hornoReadyTick] -= 30000;
            if(HornoData[h][hornoReadyTick] <= GetTickCount() + 1000) {
                HornoData[h][hornoReadyTick] = 0;
                HornoData[h][hornoListoRetiro] = true;
                SendClientMessage(playerid, 0x66FF66FF, "Agregaste carbon y la coccion quedo lista para retirar.");
            } else {
                SendClientMessage(playerid, 0x66FF66FF, "Agregaste carbon: -30 segundos.");
            }
            ActualizarLabelHorno(h);
            return 1;
        }

        if(listitem == 3) {
            if(!HornoData[h][hornoEnUso] || !HornoData[h][hornoListoRetiro]) return SendClientMessage(playerid, -1, "No hay coccion lista para retirar.");
            if(HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Solo el dueño puede retirar la coccion.");
            new obtenido = HornoData[h][hornoCantidadSalida];
            new msgHorno[144];
            if(HornoData[h][hornoTipo] == 1) {
                InvPolvora[playerid] += obtenido;
                format(msgHorno, sizeof(msgHorno), "[Horno] Obtuviste %d de polvora.", obtenido);
            } else {
                InvCarbon[playerid] += obtenido;
                format(msgHorno, sizeof(msgHorno), "[Horno] Obtuviste %d de carbon.", obtenido);
            }
            SendClientMessage(playerid, 0x66FF66FF, msgHorno);
            HornoData[h][hornoEnUso] = false;
            HornoData[h][hornoOwner] = INVALID_PLAYER_ID;
            HornoData[h][hornoTipo] = 0;
            HornoData[h][hornoCantidadEntrada] = 0;
            HornoData[h][hornoCantidadSalida] = 0;
            HornoData[h][hornoReadyTick] = 0;
            HornoData[h][hornoListoRetiro] = false;
            ActualizarLabelHorno(h);
            return 1;
        }
        return 1;
    }

    if(dialogid == DIALOG_ARMERO_MENU) {
        if(!response) return 1;
        new list[1024], line[160], weaponid, needM, needH, needP, needPr, needC, arma[32];
        list[0] = EOS;
        for(new i = 0; i < ((listitem == 3) ? 2 : 3); i++) {
            if(!ObtenerDatosCrafteoArmero(listitem, i, weaponid, arma, sizeof(arma), needM, needH, needP, needPr, needC)) continue;
            if(needC > 0) format(line, sizeof(line), "%s [Mad:%d Hier:%d Pol:%d Pre:%d Cob:%d]", arma, needM, needH, needP, needPr, needC);
            else format(line, sizeof(line), "%s [Mad:%d Hier:%d Pol:%d Pre:%d]", arma, needM, needH, needP, needPr);
            strcat(list, line);
            if(i < (((listitem == 3) ? 2 : 3) - 1)) strcat(list, "\n");
        }
        ShowPlayerDialog(playerid, DIALOG_MINERO_MINAR, DIALOG_STYLE_LIST, "Armero - Selecciona arma", list, "Crear", "Atras");
        SetPVarInt(playerid, "ArmeroTier", listitem);
        return 1;
    }

    if(dialogid == DIALOG_MINERO_MINAR) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ARMERO_MENU, DIALOG_STYLE_LIST, "Trabajo de Armero", "Craft Lvl1\nCraft Lvl3\nCraft Lvl6\nCraft Lvl10", "Abrir", "Cerrar");
        new tier = GetPVarInt(playerid, "ArmeroTier");
        new reqLvl = (tier == 0) ? 1 : ((tier == 1) ? 3 : ((tier == 2) ? 6 : 10));
        if(ArmeroNivel[playerid] < reqLvl) return SendClientMessage(playerid, -1, "Tu nivel de armero es insuficiente para este tier.");
        new weaponid, arma[32], needM, needH, needP, needPr, needC;
        if(!ObtenerDatosCrafteoArmero(tier, listitem, weaponid, arma, sizeof(arma), needM, needH, needP, needPr, needC)) return 1;
        if(InvMadera[playerid] < needM || InvHierroMineral[playerid] < needH || InvPolvora[playerid] < needP || InvPrepieza[playerid] < needPr || InvCobre[playerid] < needC) return SendClientMessage(playerid, -1, "No tienes materiales suficientes.");
        InvMadera[playerid] -= needM; InvHierroMineral[playerid] -= needH; InvPolvora[playerid] -= needP; InvPrepieza[playerid] -= needPr; InvCobre[playerid] -= needC;
        PlayerArmaComprada[playerid][weaponid] = true;
        if(PlayerAmmoInventario[playerid][weaponid] < 9999) PlayerAmmoInventario[playerid][weaponid] = 9999;
        GivePlayerWeapon(playerid, WEAPON:weaponid, PlayerAmmoInventario[playerid][weaponid]);
        ArmeroExp[playerid]++;
        if(ArmeroExp[playerid] >= 3 && ArmeroNivel[playerid] < NIVEL_MAX_TRABAJO) { ArmeroExp[playerid] = 0; ArmeroNivel[playerid]++; }
        SendClientMessage(playerid, 0x66FF66FF, "Arma creada con exito y equipada. Subes armero creando armas.");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_MENU) {
        if(!response) return 1;
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_DINERO_ID, DIALOG_STYLE_INPUT, "Admin - Dar dinero", "Ingresa ID del jugador", "Siguiente", "Cancelar");
        if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_MINERAL_TIPO, DIALOG_STYLE_INPUT, "Admin - Dar minerales", "Tipo mineral (piedra/cobre/hierro/madera/polvora/prepieza/carbon)", "Siguiente", "Atras");
        if(listitem == 2) {
            new cmdMover[] = "/mover";
            return OnPlayerCommandText(playerid, cmdMover);
        }
        if(listitem == 3) return ShowPlayerDialog(playerid, DIALOG_ADMIN_CREAR_MENU, DIALOG_STYLE_LIST, "Admin - Crear puntos", "Parada camionero\nParada pizzero\nParada basurero\nMina\nHorno\nCaja loot\nPunto prepiezas\nGasolinera", "Crear", "Atras");
        if(listitem == 4) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Admin - Comandos", "/tp /ir /traer /kick /kill /cord /sacarveh /fly /admprendas", "Cerrar", "");
        if(listitem == 5) {
            new cmdAdmPrendas[] = "/admprendas";
            return OnPlayerCommandText(playerid, cmdAdmPrendas);
        }
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_CREAR_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(listitem == 0) {
            new cmdCrearParada[] = "/crearparada";
            return OnPlayerCommandText(playerid, cmdCrearParada);
        }
        if(listitem == 1) {
            new cmdCrearParadaPizza[] = "/crearparadapizza";
            return OnPlayerCommandText(playerid, cmdCrearParadaPizza);
        }
        if(listitem == 2) {
            new cmdCrearParadaBasura[] = "/crearparadabasura";
            return OnPlayerCommandText(playerid, cmdCrearParadaBasura);
        }
        if(listitem == 3) {
            new cmdCrearMina[] = "/crearmina";
            return OnPlayerCommandText(playerid, cmdCrearMina);
        }
        if(listitem == 4) {
            new cmdCrearHorno[] = "/crearhorno";
            return OnPlayerCommandText(playerid, cmdCrearHorno);
        }
        if(listitem == 5) {
            new cmdCrearCaja[] = "/crearcaja";
            return OnPlayerCommandText(playerid, cmdCrearCaja);
        }
        if(listitem == 6) {
            new cmdCrearPrepiezas[] = "/crearprepiezas";
            return OnPlayerCommandText(playerid, cmdCrearPrepiezas);
        }
        if(listitem == 7) {
            new cmdVentagas[] = "/ventagas";
            return OnPlayerCommandText(playerid, cmdVentagas);
        }
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_DAR_DINERO_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        AdminTargetIdPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_DINERO_MONTO, DIALOG_STYLE_INPUT, "Admin - Dar dinero", "Ingresa el monto", "Dar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_DAR_DINERO_MONTO) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_DINERO_ID, DIALOG_STYLE_INPUT, "Admin - Dar dinero", "Ingresa ID del jugador", "Siguiente", "Cancelar");
        new amount = strval(inputtext);
        new id = AdminTargetIdPendiente[playerid];
        if(amount <= 0 || !IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Datos invalidos.");
        GivePlayerMoney(id, amount);
        SendClientMessage(playerid, 0x00FF00FF, "Dinero entregado correctamente.");
        return 1;
    }


    if(dialogid == DIALOG_ADMIN_DAR_MINERAL_TIPO) { if(!response) return MostrarDialogoAdmin(playerid); if(!strcmp(inputtext,"piedra",true)) AdminMineralTipoPendiente[playerid]=0; else if(!strcmp(inputtext,"cobre",true)) AdminMineralTipoPendiente[playerid]=1; else if(!strcmp(inputtext,"hierro",true)) AdminMineralTipoPendiente[playerid]=2; else if(!strcmp(inputtext,"madera",true)) AdminMineralTipoPendiente[playerid]=3; else if(!strcmp(inputtext,"polvora",true)) AdminMineralTipoPendiente[playerid]=4; else if(!strcmp(inputtext,"prepieza",true)||!strcmp(inputtext,"prepiezas",true)) AdminMineralTipoPendiente[playerid]=5; else if(!strcmp(inputtext,"carbon",true)) AdminMineralTipoPendiente[playerid]=6; else return SendClientMessage(playerid,-1,"Tipo invalido."); return ShowPlayerDialog(playerid,DIALOG_ADMIN_DAR_MINERAL_MONTO,DIALOG_STYLE_INPUT,"Admin - Dar minerales","Monto","Siguiente","Atras"); }
    if(dialogid == DIALOG_ADMIN_DAR_MINERAL_MONTO) { if(!response) return ShowPlayerDialog(playerid,DIALOG_ADMIN_DAR_MINERAL_TIPO,DIALOG_STYLE_INPUT,"Admin - Dar minerales","Tipo mineral","Siguiente","Atras"); AdminMineralCantidadPendiente[playerid]=strval(inputtext); if(AdminMineralCantidadPendiente[playerid]<=0) return SendClientMessage(playerid,-1,"Monto invalido."); return ShowPlayerDialog(playerid,DIALOG_ADMIN_DAR_MINERAL_ID,DIALOG_STYLE_INPUT,"Admin - Dar minerales","ID del jugador","Dar","Atras"); }
    if(dialogid == DIALOG_ADMIN_DAR_MINERAL_ID) { if(!response) return ShowPlayerDialog(playerid,DIALOG_ADMIN_DAR_MINERAL_MONTO,DIALOG_STYLE_INPUT,"Admin - Dar minerales","Monto","Siguiente","Atras"); new id=strval(inputtext),cant=AdminMineralCantidadPendiente[playerid],tipo=AdminMineralTipoPendiente[playerid]; if(!IsPlayerConnected(id)||cant<=0||tipo<0) return SendClientMessage(playerid,-1,"Datos invalidos."); if(tipo==0) InvPiedra[id]+=cant; else if(tipo==1) InvCobre[id]+=cant; else if(tipo==2) InvHierroMineral[id]+=cant; else if(tipo==3) InvMadera[id]+=cant; else if(tipo==4) InvPolvora[id]+=cant; else if(tipo==5) InvPrepieza[id]+=cant; else InvCarbon[id]+=cant; return SendClientMessage(playerid,0x66FF66FF,"Minerales entregados."); }
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
        new Float:angulo;
        GetPlayerFacingAngle(playerid, angulo);
        CultivoPos[playerid][slot][0] = px + (floatsin(-angulo, degrees) * (1.4 + float(slot) * 0.25));
        CultivoPos[playerid][slot][1] = py + (floatcos(-angulo, degrees) * (1.4 + float(slot) * 0.25));
        CultivoPos[playerid][slot][2] = pz - 0.35;

        CultivoActivo[playerid][slot] = 1;
        PlantasColocadas[playerid]++;
        new duracion = TIEMPO_CULTIVO_MIN + random(TIEMPO_CULTIVO_MAX - TIEMPO_CULTIVO_MIN + 1);
        CultivoReadyTick[playerid][slot] = GetTickCount() + (duracion * 1000);
        CultivoCantidadBase[playerid][slot] = 2;

        new modeloCultivo = (CultivoTipo[playerid][slot] == 2) ? MODELO_FLOR_OBJ : MODELO_HIERBA_OBJ;
        CultivoObj[playerid][slot] = CreateObject(modeloCultivo, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2], 0.0, 0.0, 0.0, 200.0);
        CultivoLabel[playerid][slot] = Create3DTextLabel("Cultivo en progreso", 0x00FF00FF, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2] + 0.9, 20.0, PlayerInCasa[playerid] + 1);
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
        if(listitem == 0) {
            ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD_ID, DIALOG_STYLE_INPUT, "Admin Armas - Paso 1", "Ingresa el ID del arma a agregar:", "Siguiente", "Atras");
            return 1;
        }
        new body[1024], line[128], nombreArma[32], count;
        body[0] = EOS;
        for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
            if(!ArmeriaItems[i][aiActiva]) continue;
            GetWeaponNameGM(ArmeriaItems[i][aiArma], nombreArma, sizeof(nombreArma));
            format(line, sizeof(line), "%d) %s | Arma:$%d | %s\n", i, nombreArma, ArmeriaItems[i][aiPrecioArma], ArmeriaItems[i][aiStockArma] > 0 ? "DISPONIBLE" : "NO DISPONIBLE");
            strcat(body, line);
            count++;
        }
        if(count == 0) return SendClientMessage(playerid, -1, "No hay armas cargadas para editar.");
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_EDITAR, DIALOG_STYLE_LIST, "Admin Armas - Editar", body, "Editar", "Atras");
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
        if(GetPVarInt(playerid, "AdminEditArmaPrecio") == 1) {
            DeletePVar(playerid, "AdminEditArmaPrecio");
            new item = ArmeriaAdminItemEditando[playerid];
            if(item < 0 || item >= MAX_ARMAS_TIENDA || !ArmeriaItems[item][aiActiva]) return SendClientMessage(playerid, -1, "Item invalido.");
            ArmeriaItems[item][aiPrecioArma] = precioArma;
            SendClientMessage(playerid, 0x00FF00FF, "Precio de arma actualizado.");
            return ShowAdminArmasMenu(playerid);
        }
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

    if(dialogid == DIALOG_ADMIN_ARMAS_EDITAR) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new item = GetArmeriaItemByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Item invalido.");
        ArmeriaAdminItemEditando[playerid] = item;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_PRECIO, DIALOG_STYLE_LIST, "Admin Armas - Accion", "Cambiar precio\nAlternar disponibilidad", "Elegir", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_PRECIO) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new item = ArmeriaAdminItemEditando[playerid];
        if(item < 0 || item >= MAX_ARMAS_TIENDA || !ArmeriaItems[item][aiActiva]) return SendClientMessage(playerid, -1, "Item invalido.");
        if(listitem == 0) {
            ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Admin Armas - Precio", "Ingresa nuevo precio para el arma:", "Guardar", "Atras");
            SetPVarInt(playerid, "AdminEditArmaPrecio", 1);
            return 1;
        }
        if(ArmeriaItems[item][aiStockArma] > 0) ArmeriaItems[item][aiStockArma] = 0;
        else ArmeriaItems[item][aiStockArma] = 1;
        SendClientMessage(playerid, 0x00FF00FF, "Disponibilidad de arma actualizada.");
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
        if(listitem == 0) { if(ArmeroNivel[playerid] < 1) ArmeroNivel[playerid] = 1; return SendClientMessage(playerid, 0x66CCFFFF, "Trabajo de armero activado."); }
        if(listitem == 1) return ShowArmeriaArmasDisponibles(playerid);
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

    if(dialogid == DIALOG_VENTA_AUTOS_ADMIN_MENU) {
        if(!response) return 1;
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
        if(!IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");

        if(listitem == 0) {
            VentaAutosAdminModeloPendiente[playerid] = 0;
            VentaAutosAdminPrecioPendiente[playerid] = 0;
            ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADD_ID, DIALOG_STYLE_INPUT, "Concesionario Admin - Paso 1", "Ingresa el ID del vehiculo (400-611):", "Siguiente", "Cancelar");
            return 1;
        }
        if(listitem == 1) return ShowVentaAutosRemoveMenu(playerid);
        return 1;
    }

    if(dialogid == DIALOG_VENTA_AUTOS_ADD_ID) {
        if(!response) return ShowVentaAutosAdminMenu(playerid);
        if(PlayerAdmin[playerid] < 1 || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
        new modelo = strval(inputtext);
        if(modelo < 400 || modelo > 611) return SendClientMessage(playerid, -1, "ID de vehiculo invalido. Usa un modelo entre 400 y 611.");
        VentaAutosAdminModeloPendiente[playerid] = modelo;
        ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Concesionario Admin - Paso 2", "Ingresa el precio del vehiculo:", "Siguiente", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_VENTA_AUTOS_ADD_PRECIO) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADD_ID, DIALOG_STYLE_INPUT, "Concesionario Admin - Paso 1", "Ingresa el ID del vehiculo (400-611):", "Siguiente", "Cancelar");
        if(PlayerAdmin[playerid] < 1 || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
        new precio = strval(inputtext);
        if(precio <= 0) return SendClientMessage(playerid, -1, "Precio invalido.");
        VentaAutosAdminPrecioPendiente[playerid] = precio;
        ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADD_STOCK, DIALOG_STYLE_INPUT, "Concesionario Admin - Paso 3", "Ingresa el stock inicial a agregar:", "Guardar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_VENTA_AUTOS_ADD_STOCK) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Concesionario Admin - Paso 2", "Ingresa el precio del vehiculo:", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1 || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
        new stockVehiculos = strval(inputtext);
        if(stockVehiculos <= 0) return SendClientMessage(playerid, -1, "Stock invalido.");

        new modelo = VentaAutosAdminModeloPendiente[playerid];
        new precio = VentaAutosAdminPrecioPendiente[playerid];
        if(modelo < 400 || modelo > 611 || precio <= 0) return SendClientMessage(playerid, -1, "No hay datos de edicion validos. Reinicia el proceso con Y.");

        for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
            if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaModelo] == modelo) {
                VentaAutosData[i][vaPrecio] = precio;
                VentaAutosData[i][vaStock] += stockVehiculos;
                SendClientMessage(playerid, 0x00FF00FF, "Auto actualizado correctamente en el concesionario.");
                ActualizarLabelVentaAutos();
                return ShowVentaAutosAdminMenu(playerid);
            }
        }

        for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
            if(!VentaAutosData[i][vaActiva]) {
                VentaAutosData[i][vaActiva] = true;
                VentaAutosData[i][vaModelo] = modelo;
                VentaAutosData[i][vaPrecio] = precio;
                VentaAutosData[i][vaStock] = stockVehiculos;
                SendClientMessage(playerid, 0x00FF00FF, "Auto agregado correctamente al concesionario.");
                ActualizarLabelVentaAutos();
                return ShowVentaAutosAdminMenu(playerid);
            }
        }
        return SendClientMessage(playerid, -1, "No hay espacio para mas modelos.");
    }

    if(dialogid == DIALOG_VENTA_AUTOS_REMOVE_LIST) {
        if(!response) return ShowVentaAutosAdminMenu(playerid);
        if(PlayerAdmin[playerid] < 1 || !IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
        new item = GetVentaAutoByAnyListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        VentaAutosData[item][vaActiva] = false;
        VentaAutosData[item][vaModelo] = 0;
        VentaAutosData[item][vaPrecio] = 0;
        VentaAutosData[item][vaStock] = 0;
        SendClientMessage(playerid, 0x00FF00FF, "Modelo eliminado de la venta.");
        ActualizarLabelVentaAutos();
        return ShowVentaAutosAdminMenu(playerid);
    }

    if(dialogid == DIALOG_VENTA_AUTOS_BUY) {
        if(!response) return 1;
        new item = GetVentaAutoByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(ContarAutosJugador(playerid) >= MAX_AUTOS_NORMALES_JUGADOR) return SendClientMessage(playerid, -1, "Limite alcanzado: maximo 3 autos por jugador.");
        if(GetPlayerMoney(playerid) < VentaAutosData[item][vaPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");

        new Float:px, Float:py, Float:pz, Float:pa;
        GetPlayerPos(playerid, px, py, pz);
        GetPlayerFacingAngle(playerid, pa);
        new veh = CreateVehicle(VentaAutosData[item][vaModelo], px + 3.0, py, pz, pa, -1, -1, 120);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No se pudo crear el vehiculo.");
        GivePlayerMoney(playerid, -VentaAutosData[item][vaPrecio]);
        PutPlayerInVehicle(playerid, veh, 0);
        VehOwner[veh] = playerid;
        VehLocked[veh] = false;
        VehOculto[veh] = false;
        VehLastUseTick[veh] = GetTickCount();
        VehModelData[veh] = VentaAutosData[item][vaModelo];
        VehColor1Data[veh] = -1;
        VehColor2Data[veh] = -1;
        VehPosData[veh][0] = px + 3.0;
        VehPosData[veh][1] = py;
        VehPosData[veh][2] = pz;
        VehPosData[veh][3] = pa;
        VentaAutosData[item][vaStock]--;
        ActualizarLabelVentaAutos();
        SendClientMessage(playerid, 0x00FF00FF, "Compra confirmada. El concesionario te entrega las llaves de tu nuevo auto.");
        return 1;
    }
    if(dialogid == DIALOG_MALETERO_MENU) {
        if(!response) return 1;
        new veh = GetPVarInt(playerid, "MaleteroMaleteroVeh");
        if(!PlayerTieneAccesoVehiculo(playerid, veh)) return SendClientMessage(playerid, -1, "No puedes abrir este maletero.");

        new armas = CuentaArmasMaletero(veh);
        if(listitem >= armas) return 1; // cerrar

        new idx;
        for(new w = 1; w < MAX_WEAPON_ID_GM; w++) {
            if(MaleteroArmasVeh[veh][w] <= 0) continue;
            if(idx == listitem) {
                GivePlayerWeapon(playerid, WEAPON:w, MaleteroArmasVeh[veh][w]);
                PlayerArmaComprada[playerid][w] = true;
                PlayerAmmoInventario[playerid][w] += MaleteroArmasVeh[veh][w];
                MaleteroArmasVeh[veh][w] = 0;
                SendClientMessage(playerid, 0x00FF00FF, "Sacaste el arma del maletero.");
                return ShowMaleteroMaletero(playerid, veh);
            }
            idx++;
        }
        return 1;
    }


    if(dialogid == DIALOG_PINTURA_COLOR) {
        if(!response) return 1;
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes estar conduciendo para pintar.");
        if(GetPlayerMoney(playerid) < 10000) return SendClientMessage(playerid, -1, "Necesitas $10000 para pintar.");
        new veh = GetPlayerVehicleID(playerid);
        if(!PlayerTieneAccesoVehiculo(playerid, veh)) return SendClientMessage(playerid, -1, "No tienes acceso a este vehiculo.");

        new color = 3;
        switch(listitem) {
            case 0: color = 3;
            case 1: color = 79;
            case 2: color = 86;
            case 3: color = 0;
            case 4: color = 1;
            case 5: color = 6;
        }
        ChangeVehicleColours(veh, color, color);
        VehColor1Data[veh] = color;
        VehColor2Data[veh] = color;
        GivePlayerMoney(playerid, -10000);
        SendClientMessage(playerid, 0x00FF00FF, "Pintura aplicada correctamente. Costo: $10000.");
        return 1;
    }

    if(dialogid == DIALOG_BANK_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            ShowPlayerDialog(playerid, DIALOG_BANK_DEPOSIT, DIALOG_STYLE_INPUT, "Banco - Depositar", "Ingresa la cantidad a depositar:", "Depositar", "Atras");
        } else if(listitem == 1) {
            ShowPlayerDialog(playerid, DIALOG_BANK_WITHDRAW, DIALOG_STYLE_INPUT, "Banco - Retirar", "Ingresa la cantidad a retirar:", "Retirar", "Atras");
        } else if(listitem == 2) {
            ShowPlayerDialog(playerid, DIALOG_BANK_TR_ID, DIALOG_STYLE_INPUT, "Banco - Transferir", "Ingresa el ID del jugador destino:", "Siguiente", "Atras");
        }
        return 1;
    }

    if(dialogid == DIALOG_BANK_TR_ID) {
        if(!response) return ShowBankMenu(playerid);
        new target = strval(inputtext);
        if(target == playerid) return SendClientMessage(playerid, -1, "No puedes transferirte a ti mismo.");
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "Jugador no conectado.");
        BankTransferTarget[playerid] = target;
        return ShowPlayerDialog(playerid, DIALOG_BANK_TR_AMT, DIALOG_STYLE_INPUT, "Banco - Transferir", "Ingresa la cantidad a transferir:", "Transferir", "Cancelar");
    }

    if(dialogid == DIALOG_BANK_TR_AMT) {
        if(!response) return ShowBankMenu(playerid);
        new target = BankTransferTarget[playerid];
        if(target == -1 || !IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "El jugador destino ya no esta conectado.");
        new monto = strval(inputtext);
        if(monto <= 0) return SendClientMessage(playerid, -1, "Cantidad invalida.");
        if(PlayerBankMoney[playerid] < monto) return SendClientMessage(playerid, -1, "No tienes saldo suficiente en el banco.");
        PlayerBankMoney[playerid] -= monto;
        PlayerBankMoney[target] += monto;
        new n[MAX_PLAYER_NAME], msg[128];
        GetPlayerName(target, n, sizeof(n));
        format(msg, sizeof(msg), "Transferiste $%d a %s.", monto, n);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        GetPlayerName(playerid, n, sizeof(n));
        format(msg, sizeof(msg), "%s te transfirio $%d al banco.", n, monto);
        SendClientMessage(target, 0x00FF00FF, msg);
        BankTransferTarget[playerid] = -1;
        return ShowBankMenu(playerid);
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

    new name[MAX_PLAYER_NAME], path[64], line[128];
    GetPlayerName(playerid, name, sizeof(name));
    format(path, sizeof(path), PATH_USUARIOS, name);
    if(dialogid == DIALOG_REGISTRO) {
        if(!response) return Kick(playerid);
        if(strlen(inputtext) < 3) return ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{66FF99}Kame House - Registro", "{FF6666}La clave debe tener al menos 3 caracteres.\n{AAAAAA}Ingresa una clave valida:", "Registrar", "Salir");
        strmid(PlayerPassword[playerid], inputtext, 0, sizeof(PlayerPassword[]), sizeof(PlayerPassword[]));
        new File:h = fopen(path, io_write);
        if(h) {
            format(line, 128, "%s\n%d\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n2494.24\n-1671.19\n13.33", PlayerPassword[playerid], DINERO_INICIAL);
            fwrite(h, line); fclose(h);
            IsPlayerLoggedIn[playerid] = true;
            GivePlayerMoney(playerid, DINERO_INICIAL);
            ActualizarNivelPJ(playerid);
            GuardarCuenta(playerid);
            SendClientMessage(playerid, 0x66CCFFFF, "{66FF99}Bienvenido a Kame House.");
            SpawnPlayerAfterAuth(playerid);
        }
    }
    if(dialogid == DIALOG_LOGIN) {
        if(!response) return Kick(playerid);
        new File:h = fopen(path, io_read);
        if(h) {
            fread(h, PlayerPassword[playerid]);
            for(new i=0; i<strlen(PlayerPassword[playerid]); i++) if(PlayerPassword[playerid][i] < 32) PlayerPassword[playerid][i] = '\0';
            if(strlen(PlayerPassword[playerid]) < 3) { fclose(h); ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Error de cuenta", "Tu cuenta tiene una clave invalida o vacia. Contacta a un admin para repararla.", "Cerrar", ""); return 1; }
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
                    ArmeroNivel[playerid] = 1;
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
                        ArmeroNivel[playerid] = 1;
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
                            ArmeroNivel[playerid] = 1;
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

                if(fread(h, line)) {
                    new dataVersion = strval(line);
                    if(dataVersion >= 2) {
                        fread(h, line); InvMadera[playerid] = strval(line);
                        fread(h, line); InvPiedra[playerid] = strval(line);
                        fread(h, line); InvCobre[playerid] = strval(line);
                        fread(h, line); InvHierroMineral[playerid] = strval(line);
                        fread(h, line); InvPolvora[playerid] = strval(line);
                        fread(h, line); InvPrepieza[playerid] = strval(line);
                        fread(h, line); InvCarbon[playerid] = strval(line);
                        fread(h, line); PlayerTieneMazo[playerid] = strval(line) != 0;
                        fread(h, line); MazoDurabilidad[playerid] = strval(line);
                        fread(h, line); ArmeroNivel[playerid] = strval(line);
                        fread(h, line); ArmeroExp[playerid] = strval(line);
                        fread(h, line); BasureroNivel[playerid] = strval(line);
                        fread(h, line); BasureroRecorridos[playerid] = strval(line);
                        fread(h, line); BidonGasolina[playerid] = strval(line);
                        PlayerTieneTelefono[playerid] = false;
                        if(dataVersion >= 3) {
                            if(fread(h, line)) PlayerTieneTelefono[playerid] = strval(line) != 0;
                        }

                        if(fread(h, line)) {
                            if(strcmp(line, CUENTA_SECCION_PRENDAS, false) == 0) {
                                for(new pi = 0; pi < MAX_PRENDAS; pi++) {
                                    if(!fread(h, line)) break;
                                    if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) {
                                        CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                        break;
                                    }
                                    if(!EsLineaPrendaCuenta(line)) continue;
                                    new idxp = 0;
                                    PlayerPrendaComprada[playerid][pi] = strval(strtok(line, idxp));
                                    PlayerPrendaActiva[playerid][pi] = strval(strtok(line, idxp));
                                    PlayerPrendaBone[playerid][pi] = strval(strtok(line, idxp));
                                    PlayerPrendaOffX[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaOffY[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaOffZ[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotX[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotY[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotZ[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleX[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleY[playerid][pi] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleZ[playerid][pi] = floatstr(strtok(line, idxp));
                                }
                            } else {
                                if(EsLineaPrendaCuenta(line)) {
                                    new idxp = 0;
                                    PlayerPrendaComprada[playerid][0] = strval(strtok(line, idxp));
                                    PlayerPrendaActiva[playerid][0] = strval(strtok(line, idxp));
                                    PlayerPrendaBone[playerid][0] = strval(strtok(line, idxp));
                                    PlayerPrendaOffX[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaOffY[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaOffZ[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotX[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotY[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaRotZ[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleX[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleY[playerid][0] = floatstr(strtok(line, idxp));
                                    PlayerPrendaScaleZ[playerid][0] = floatstr(strtok(line, idxp));
                                    for(new pi = 1; pi < MAX_PRENDAS; pi++) {
                                        if(!fread(h, line)) break;
                                        if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) {
                                            CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                            break;
                                        }
                                        if(!EsLineaPrendaCuenta(line)) continue;
                                        idxp = 0;
                                        PlayerPrendaComprada[playerid][pi] = strval(strtok(line, idxp));
                                        PlayerPrendaActiva[playerid][pi] = strval(strtok(line, idxp));
                                        PlayerPrendaBone[playerid][pi] = strval(strtok(line, idxp));
                                        PlayerPrendaOffX[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaOffY[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaOffZ[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaRotX[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaRotY[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaRotZ[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaScaleX[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaScaleY[playerid][pi] = floatstr(strtok(line, idxp));
                                        PlayerPrendaScaleZ[playerid][pi] = floatstr(strtok(line, idxp));
                                    }
                                } else {
                                    CargarVehiculosJugadorDesdeLinea(playerid, h, line);
                                }
                            }
                        }
                    }
                }

                ActualizarNivelPJ(playerid);
                SendClientMessage(playerid, 0x66CCFFFF, "{33CCFF}Bienvenido de nuevo a Kame House.");
                fclose(h); SpawnPlayerAfterAuth(playerid);
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
            format(line, 256, "%s\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%f\n%f\n%f\n%d",
                PlayerPassword[playerid], GetPlayerMoney(playerid), PlayerAdmin[playerid],
                CamioneroNivel[playerid], CamioneroViajes[playerid], PizzeroNivel[playerid], PizzeroEntregas[playerid], PlayerBankMoney[playerid], InvSemillaHierba[playerid], InvSemillaFlor[playerid], InvHierba[playerid], InvFlor[playerid], PlayerTiempoJugadoMin[playerid], p[0], p[1], p[2], CUENTA_DATA_VERSION);
            fwrite(h, line);

            format(line, sizeof(line), "\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d",
                InvMadera[playerid], InvPiedra[playerid], InvCobre[playerid], InvHierroMineral[playerid], InvPolvora[playerid], InvPrepieza[playerid], InvCarbon[playerid],
                PlayerTieneMazo[playerid] ? 1 : 0, MazoDurabilidad[playerid], ArmeroNivel[playerid], ArmeroExp[playerid], BasureroNivel[playerid], BasureroRecorridos[playerid], BidonGasolina[playerid], PlayerTieneTelefono[playerid] ? 1 : 0);
            fwrite(h, line);

            format(line, sizeof(line), "\n%s", CUENTA_SECCION_PRENDAS);
            fwrite(h, line);

            for(new pi = 0; pi < MAX_PRENDAS; pi++) {
                format(line, sizeof(line), "\n%d %d %d %f %f %f %f %f %f %f %f %f",
                    PlayerPrendaComprada[playerid][pi], PlayerPrendaActiva[playerid][pi], PlayerPrendaBone[playerid][pi],
                    PlayerPrendaOffX[playerid][pi], PlayerPrendaOffY[playerid][pi], PlayerPrendaOffZ[playerid][pi],
                    PlayerPrendaRotX[playerid][pi], PlayerPrendaRotY[playerid][pi], PlayerPrendaRotZ[playerid][pi],
                    PlayerPrendaScaleX[playerid][pi], PlayerPrendaScaleY[playerid][pi], PlayerPrendaScaleZ[playerid][pi]);
                fwrite(h, line);
            }

            format(line, sizeof(line), "\n%s", CUENTA_SECCION_VEHICULOS);
            fwrite(h, line);

            GuardarVehiculosJugadorEnCuenta(playerid, h);
            fclose(h);
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

stock GuardarPuntosMovibles() {
    new File:h = fopen(PATH_PUNTOS_MOVIBLES, io_write);
    if(!h) return 0;

    new line[96];
    for(new i = 0; i < _:totalPuntosMovibles; i++) {
        format(line, sizeof(line), "%f %f %f\n", PuntoPos[ePuntoMovible:i][0], PuntoPos[ePuntoMovible:i][1], PuntoPos[ePuntoMovible:i][2]);
        fwrite(h, line);
    }
    fclose(h);
    return 1;
}

stock CargarPuntosMovibles() {
    new File:h = fopen(PATH_PUNTOS_MOVIBLES, io_read);
    if(!h) return 0;

    new line[96], idx = 0;
    while(fread(h, line) && idx < _:totalPuntosMovibles) {
        new Float:px, Float:py, Float:pz;
        sscanf_manual(line, px, py, pz);
        PuntoPos[ePuntoMovible:idx][0] = px;
        PuntoPos[ePuntoMovible:idx][1] = py;
        PuntoPos[ePuntoMovible:idx][2] = pz;
        idx++;
    }
    fclose(h);
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
            if(IsPlayerInAnyVehicle(i) && GetPlayerState(i) == PLAYER_STATE_DRIVER) {
                new vehid = GetPlayerVehicleID(i);
                if(vehid != INVALID_VEHICLE_ID && GasInitVehiculo[vehid] && GasVehiculo[vehid] > 0) {
                    GasVehiculo[vehid] -= GAS_CONSUMO_POR_MINUTO;
                    if(GasVehiculo[vehid] < 0) GasVehiculo[vehid] = 0;
                    ActualizarGasTextoVehiculo(i);
                }
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
    GuardarPuntosMovibles();
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
    if(GasRefuelTimer[playerid] != -1) { KillTimer(GasRefuelTimer[playerid]); GasRefuelTimer[playerid] = -1; }
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
    VentaAutosAdminModeloPendiente[playerid] = 0;
    VentaAutosAdminPrecioPendiente[playerid] = 0;
    PlayerBankMoney[playerid] = 0;
    BankTransferTarget[playerid] = -1;
    FinalizarTodosLosCultivos(playerid);
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(MaleteroOwner[v] == playerid) {
            DestroyVehicle(v);
            MaleteroOwner[v] = -1;
            MaleteroSlotsVeh[v] = 0;
            MaleteroHierbaVeh[v] = 0;
            MaleteroFloresVeh[v] = 0;
        }
    }
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
    if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) {
        new vehid = GetPlayerVehicleID(playerid);
        if(vehid != INVALID_VEHICLE_ID) {
            VehLastUseTick[vehid] = GetTickCount();
            VehOculto[vehid] = false;
            if(VehLocked[vehid] && !PlayerTieneAccesoVehiculo(playerid, vehid)) {
                RemovePlayerFromVehicle(playerid);
                SendClientMessage(playerid, 0xFF0000FF, "Vehiculo bloqueado. No tienes llave.");
                return 1;
            }
            if(!GasInitVehiculo[vehid]) { GasInitVehiculo[vehid] = true; GasVehiculo[vehid] = 70 + random(31); }
            PlayerTextDrawShow(playerid, BarraGas[playerid]);
            ActualizarGasTextoVehiculo(playerid);
            if(newstate == PLAYER_STATE_DRIVER && TrabajandoBasurero[playerid] > 0 && BasureroTieneBolsa[playerid]) {
                if(vehid == BasureroVehiculo[playerid]) {
                    RemovePlayerFromVehicle(playerid);
                    SendClientMessage(playerid, 0xFF0000FF, "Debes presionar H para subir la bolsa antes de conducir la Rumpo.");
                    return 1;
                }
            }
            if(newstate == PLAYER_STATE_DRIVER && GasVehiculo[vehid] <= 0) {
                new Float:vx, Float:vy, Float:vz;
                GetVehicleVelocity(vehid, vx, vy, vz);
                SetVehicleVelocity(vehid, vx * 0.2, vy * 0.2, vz);
                SendClientMessage(playerid, 0xFF0000FF, "Sin gasolina. Ve a una gasolinera y usa /llenar para repostar.");
            }
        }
    } else {
        PlayerTextDrawHide(playerid, BarraGas[playerid]);
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

stock IsNearPrendas(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoPrendas][0], PuntoPos[puntoPrendas][1], PuntoPos[puntoPrendas][2])) return 1;
    return 0;
}

stock IsNearArmeria(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoArmeria][0], PuntoPos[puntoArmeria][1], PuntoPos[puntoArmeria][2])) return 1;
    return 0;
}

stock IsNearVentaAutos(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoVentaAutos][0], PuntoPos[puntoVentaAutos][1], PuntoPos[puntoVentaAutos][2])) return 1;
    return 0;
}

stock ActualizarLabelVentaAutos() {
    if(VentaAutosLabel != Text3D:-1) { Delete3DTextLabel(VentaAutosLabel); VentaAutosLabel = Text3D:-1; }
    if(!VentaAutosActiva) return 1;
    new texto[256], disponibles;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaStock] > 0) disponibles++;
    format(texto, sizeof(texto), "Concesionario Kame House\nModelos en venta: %d\nUsa H para comprar", disponibles);
    VentaAutosLabel = Create3DTextLabel(texto, 0x33CCFFFF, VentaAutosPos[0], VentaAutosPos[1], VentaAutosPos[2] + 0.6, 18.0, 0);
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

stock ShowVentaAutosAdminMenu(playerid) {
    if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, -1, "No eres admin.");
    if(!IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
    ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADMIN_MENU, DIALOG_STYLE_LIST, "Concesionario Admin", "Agregar/actualizar auto\nQuitar auto", "Seleccionar", "Cerrar");
    return 1;
}

stock ShowVentaAutosRemoveMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(!VentaAutosData[i][vaActiva]) continue;
        format(line, sizeof(line), "Modelo %d | Precio:$%d | Stock:%d\n", VentaAutosData[i][vaModelo], VentaAutosData[i][vaPrecio], VentaAutosData[i][vaStock]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay modelos cargados para eliminar.");
    ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_REMOVE_LIST, DIALOG_STYLE_LIST, "Quitar auto del concesionario", body, "Quitar", "Atras");
    return 1;
}

stock GetVentaAutoByAnyListIndex(listindex) {
    new current;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(!VentaAutosData[i][vaActiva]) continue;
        if(current == listindex) return i;
        current++;
    }
    return -1;
}

stock ShowAdminEditHint(playerid, const nombreSistema[]) {
    if(PlayerAdmin[playerid] < 1) return 0;
    new msg[96];
    format(msg, sizeof(msg), "Admin: usa la tecla Y aqui para editar %s.", nombreSistema);
    SendClientMessage(playerid, 0xFFE082FF, msg);
    return 1;
}

stock ShowArmeriaMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ARMERIA_CATEGORIA, DIALOG_STYLE_LIST, "Armeria KameHouse", "Obtener trabajo de armero\nArmas disponibles (municion alta)", "Abrir", "Cerrar");
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
    ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_MENU, DIALOG_STYLE_LIST, "Admin Armas", "Agregar arma (ID + stock)\nEditar precio/disponibilidad", "Seleccionar", "Cerrar");
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
        new pagoRecolecta = BasureroRecolectado[playerid] * 180;
        new pagoNivel = nivel * 150;
        new pago = pagoBase + pagoRecolecta + pagoNivel;
        if(pago > PAGO_MAX_BASURERO) pago = PAGO_MAX_BASURERO;
        GivePlayerMoney(playerid, pago);

        BasureroRecorridos[playerid]++;
        if(BasureroRecorridos[playerid] >= PROGRESO_BASURERO_POR_NIVEL) {
            BasureroRecorridos[playerid] = 0;
            if(BasureroNivel[playerid] < NIVEL_MAX_TRABAJO) BasureroNivel[playerid]++;
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

stock ShowTelefonoMenu(playerid) {
    ShowPlayerDialog(playerid, DIALOG_TELEFONO_MENU, DIALOG_STYLE_LIST, "Telefono celular", "Hora\nFecha\nEnviar mensaje ($100)\nCalculadora\nLlamar vehiculo ($5000)", "Abrir", "Cerrar");
    return 1;
}

stock ShowTelefonoVehiculosMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        format(line, sizeof(line), "ID:%d | Modelo:%d\n", v, VehModelData[v]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No tienes vehiculos registrados.");
    ShowPlayerDialog(playerid, DIALOG_TELEFONO_LLAMAR_VEHICULO, DIALOG_STYLE_LIST, "Telefono - Llamar vehiculo", body, "Llamar", "Atras");
    return 1;
}

stock GetTelefonoVehiculoByListIndex(playerid, listindex) {
    new current;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        if(current == listindex) return v;
        current++;
    }
    return INVALID_VEHICLE_ID;
}

stock ShowSemilleriaMenu(playerid) {
    new body[192];
    format(body, sizeof(body), "Semillas de hierba verde\nSemillas de flores\nMazo de minero ($10000)\nTelefono celular ($10000)");
    ShowPlayerDialog(playerid, DIALOG_SEMILLERIA, DIALOG_STYLE_LIST, "Tienda Kame House", body, "Elegir", "Cerrar");
    return 1;
}

stock ActualizarLabelCultivo(playerid, slot) {
    if(!CultivoActivo[playerid][slot]) return 0;
    new restante = CultivoReadyTick[playerid][slot] - GetTickCount();
    if(restante < 0) restante = 0;
    new label[128], tipo[20];
    if(CultivoTipo[playerid][slot] == 2) format(tipo, sizeof(tipo), "Flor");
    else format(tipo, sizeof(tipo), "Hierba");
    if(restante == 0) format(label, sizeof(label), "%s lista para cosechar\nUsa /cosechar cerca", tipo);
    else format(label, sizeof(label), "%s en cultivo\nTiempo restante: %d segundo(s)", tipo, restante / 1000);
    if(CultivoLabel[playerid][slot] != Text3D:-1) Update3DTextLabelText(CultivoLabel[playerid][slot], 0xFFFFFFFF, label);
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
        case puntoSemilleria: format(dest, len, "Tienda Kame House");
        case puntoArmeria: format(dest, len, "Armeria");
        case puntoVentaAutos: format(dest, len, "Venta de autos");
        case puntoMaletero: format(dest, len, "Camper eliminado");
        case puntoPintura: format(dest, len, "CP pintura");
        case puntoMinero: format(dest, len, "Trabajo minero");
        case puntoPrendas: format(dest, len, "Prendas Kame House");
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
            PuntoPickup[punto] = 0;
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
            PuntoLabel[punto] = Create3DTextLabel("Tienda Kame House\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoArmeria: {
            PuntoPickup[punto] = CreatePickup(1242, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{AA0000}Mercado de armas\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoVentaAutos: {
            PuntoPickup[punto] = CreatePickup(1274, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
        }
        case puntoMaletero: {
            // Sistema camper eliminado: no crear pickup ni label.
        }
        case puntoPintura: {
            PuntoPickup[punto] = CreatePickup(1210, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{00CCFF}CP pintura\n{FFFFFF}Conduce aqui y usa {FFFF00}/pintar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 14.0, 0);
        }
        case puntoMinero: {
            PuntoPickup[punto] = CreatePickup(1239, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{CCCCCC}Trabajo minero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para iniciar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoPrendas: {
            PuntoPickup[punto] = CreatePickup(2704, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{00CCFF}Prendas Kame House\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
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

stock FormatTiempoRestante(ms, dest[], len) { if(ms < 0) ms = 0; new total = ms / 1000; format(dest, len, "%02d:%02d", total / 60, total % 60); return 1; }

stock ShowAyudaDialog(playerid) {
    new texto[1024];
    format(texto, sizeof(texto), "{00FF00}Comandos basicos:\n{FFFFFF}/g /m /d /telefono /skills /lvl /comer /llenar /pintar /bidon /usarbidon /inventario /plantar /cosechar /consumir /dejartrabajo /cancelartrabajo /tirarbasura (/tirar basura) /gps /saldo /salir /comprar /maletero /ga /llave /compartirllave /abrircasa /ayuda\n\n{AAAAAA}Tip: si eres admin usa /admm para ver las herramientas administrativas.");
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


stock PlayerTieneAccesoVehiculo(playerid, vehid) {
    if(vehid == INVALID_VEHICLE_ID) return 0;
    if(VehOwner[vehid] == playerid) return 1;
    if(VehSharedTo[playerid] == vehid && GetTickCount() <= VehSharedUntil[playerid]) return 1;
    return 0;
}

stock GetNearbyOwnedVehicle(playerid) {
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(!PlayerTieneAccesoVehiculo(playerid, v)) continue;
        new Float:vx, Float:vy, Float:vz;
        GetVehiclePos(v, vx, vy, vz);
        if(IsPlayerInRangeOfPoint(playerid, 4.0, vx, vy, vz)) return v;
    }
    return INVALID_VEHICLE_ID;
}

stock CuentaArmasMaletero(vehid) {
    new total;
    for(new w = 1; w < MAX_WEAPON_ID_GM; w++) if(MaleteroArmasVeh[vehid][w] > 0) total++;
    return total;
}

stock InitGasSystem() {
    GasTotalPuntos = 0;
    for(new v = 0; v < MAX_VEHICLES; v++) {
        GasVehiculo[v] = 100;
        GasInitVehiculo[v] = false;
        VehOwner[v] = -1;
        VehLocked[v] = false;
        VehOculto[v] = false;
        VehLastUseTick[v] = 0;
        VehModelData[v] = 0;
        VehColor1Data[v] = -1;
        VehColor2Data[v] = -1;
        MaleteroOwner[v] = -1;
        MaleteroSlotsVeh[v] = 4;
        MaleteroHierbaVeh[v] = 0;
        MaleteroFloresVeh[v] = 0;
        MaleteroSemillaHierbaVeh[v] = 0;
        MaleteroSemillaFlorVeh[v] = 0;
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[v][w] = 0;
    }
    for(new i = 0; i < MAX_PLAYERS; i++) { VehSharedTo[i] = INVALID_VEHICLE_ID; VehSharedUntil[i] = 0; }
    return 1;
}

stock ShowMaleteroMaletero(playerid, vehid) {
    if(!PlayerTieneAccesoVehiculo(playerid, vehid)) return SendClientMessage(playerid, -1, "No tienes acceso a este vehiculo.");
    new info[128], body[768], line[64], totalArmas = CuentaArmasMaletero(vehid);
    new usados = totalArmas;
    format(info, sizeof(info), "Armas guardadas: %d/%d slots usados", usados, MaleteroSlotsVeh[vehid]);
    SendClientMessage(playerid, 0x99FFFFFF, info);

    body[0] = EOS;
    for(new w = 1; w < MAX_WEAPON_ID_GM; w++) {
        if(MaleteroArmasVeh[vehid][w] <= 0) continue;
        new wn[32];
        GetWeaponNameGM(w, wn, sizeof(wn));
        format(line, sizeof(line), "Sacar %s (%d)\n", wn, MaleteroArmasVeh[vehid][w]);
        strcat(body, line);
    }
    strcat(body, "Cerrar maletero");

    SetPVarInt(playerid, "MaleteroMaleteroVeh", vehid);
    ShowPlayerDialog(playerid, DIALOG_MALETERO_MENU, DIALOG_STYLE_LIST, "Maletero del vehiculo", body, "Elegir", "Cerrar");
    return 1;
}

stock ActualizarGasTextoVehiculo(playerid) {
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return 1;
    new veh = GetPlayerVehicleID(playerid);
    if(veh == INVALID_VEHICLE_ID) return 1;
    if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 100; }
    new gt[16]; format(gt, sizeof(gt), "G: %d", GasVehiculo[veh]);
    PlayerTextDrawSetString(playerid, BarraGas[playerid], gt);
    PlayerTextDrawShow(playerid, BarraGas[playerid]);
    return 1;
}

stock EncontrarGasCercano(playerid) {
    for(new i = 0; i < GasTotalPuntos; i++) {
        if(IsPlayerInRangeOfPoint(playerid, 6.0, GasPos[i][0], GasPos[i][1], GasPos[i][2])) return i;
    }
    return -1;
}

public TeleportVehiculoLlamado(playerid) {
    if(!IsPlayerConnected(playerid)) return 1;
    new veh = TelefonoVehiculoSeleccionado[playerid];
    TelefonoVehiculoSeleccionado[playerid] = INVALID_VEHICLE_ID;
    if(veh == INVALID_VEHICLE_ID || !IsValidVehicle(veh)) return 1;
    if(VehOwner[veh] != playerid) return 1;

    new Float:px, Float:py, Float:pz, Float:ang;
    GetPlayerPos(playerid, px, py, pz);
    GetPlayerFacingAngle(playerid, ang);
    new Float:tx = px + (2.5 * floatsin(-ang, degrees));
    new Float:ty = py + (2.5 * floatcos(-ang, degrees));
    SetVehiclePos(veh, tx, ty, pz);
    SetVehicleZAngle(veh, ang);
    SetVehicleVirtualWorld(veh, GetPlayerVirtualWorld(playerid));
    LinkVehicleToInterior(veh, GetPlayerInterior(playerid));
    SendClientMessage(playerid, 0x66FF66FF, "Tu vehiculo ha llegado a tu posicion.");
    return 1;
}

public FinalizarRepostaje(playerid) {
    GasRefuelTimer[playerid] = -1;
    if(!IsPlayerConnected(playerid)) return 1;
    if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
        TogglePlayerControllable(playerid, true);
        ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
        return 1;
    }

    new veh = GetPlayerVehicleID(playerid);
    if(veh == INVALID_VEHICLE_ID || veh != GasRefuelVeh[playerid]) {
        TogglePlayerControllable(playerid, true);
        ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
        return 1;
    }

    GivePlayerMoney(playerid, -GasRefuelCost[playerid]);
    GasVehiculo[veh] = 100;
    ActualizarGasTextoVehiculo(playerid);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    SendClientMessage(playerid, 0x00FF00FF, "Repostaje completado.");
    return 1;
}

public CheckInactiveVehicles() {
    new now = GetTickCount();
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] == -1 || VehOculto[v]) continue;
        if(now - VehLastUseTick[v] < 120000) continue;
        if(!IsValidVehicle(v)) continue;
        GetVehiclePos(v, VehPosData[v][0], VehPosData[v][1], VehPosData[v][2]);
        GetVehicleZAngle(v, VehPosData[v][3]);
        DestroyVehicle(v);
        VehOculto[v] = true;
    }
    return 1;
}

stock ContarAutosJugador(playerid) {
    new count;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        count++;
    }
    return count;
}

stock ContarVehiculosTotalesJugador(playerid) {
    return ContarAutosJugador(playerid);
}

stock ShowGPSVehiculosMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        format(line, sizeof(line), "ID:%d | Modelo:%d | %s\n", v, VehModelData[v], VehOculto[v] ? "Oculto" : "Activo");
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No tienes vehiculos registrados.");
    ShowPlayerDialog(playerid, DIALOG_GPS_VEHICULOS, DIALOG_STYLE_LIST, "GPS - Tus vehiculos", body, "Localizar", "Cerrar");
    return 1;
}

stock GetOwnedVehicleByListIndex(playerid, listindex) {
    new current;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        if(current == listindex) return v;
        current++;
    }
    return INVALID_VEHICLE_ID;
}

stock RestaurarVehiculosJugador(playerid) {
    new restaurados;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid || !VehOculto[v]) continue;
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;
        new nv = CreateVehicle(VehModelData[v], VehPosData[v][0], VehPosData[v][1], VehPosData[v][2], VehPosData[v][3], VehColor1Data[v], VehColor2Data[v], 120);
        if(nv == INVALID_VEHICLE_ID) continue;

        VehOwner[nv] = VehOwner[v];
        VehLocked[nv] = VehLocked[v];
        VehOculto[nv] = false;
        VehLastUseTick[nv] = GetTickCount();
        VehModelData[nv] = VehModelData[v];
        VehColor1Data[nv] = VehColor1Data[v];
        VehColor2Data[nv] = VehColor2Data[v];
        VehPosData[nv][0] = VehPosData[v][0];
        VehPosData[nv][1] = VehPosData[v][1];
        VehPosData[nv][2] = VehPosData[v][2];
        VehPosData[nv][3] = VehPosData[v][3];
        GasInitVehiculo[nv] = GasInitVehiculo[v];
        GasVehiculo[nv] = GasVehiculo[v];

        if(MaleteroOwner[v] == playerid) {
            MaleteroOwner[nv] = MaleteroOwner[v];
            MaleteroSlotsVeh[nv] = MaleteroSlotsVeh[v];
            MaleteroHierbaVeh[nv] = MaleteroHierbaVeh[v];
            MaleteroFloresVeh[nv] = MaleteroFloresVeh[v];
            MaleteroSemillaHierbaVeh[nv] = MaleteroSemillaHierbaVeh[v];
            MaleteroSemillaFlorVeh[nv] = MaleteroSemillaFlorVeh[v];
            for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[nv][w] = MaleteroArmasVeh[v][w];
            MaleteroOwner[v] = -1;
            MaleteroSlotsVeh[v] = 0;
            MaleteroHierbaVeh[v] = 0;
            MaleteroFloresVeh[v] = 0;
            MaleteroSemillaHierbaVeh[v] = 0;
            MaleteroSemillaFlorVeh[v] = 0;
            for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[v][w] = 0;
        }

        VehOwner[v] = -1;
        VehLocked[v] = false;
        VehOculto[v] = false;
        VehLastUseTick[v] = 0;
        VehModelData[v] = 0;
        if(GPSVehiculoSeleccionado[playerid] == v) GPSVehiculoSeleccionado[playerid] = nv;
        restaurados++;
    }
    return restaurados;
}

stock bool:RestaurarVehiculoSeleccionado(playerid, veh) {
    if(VehOwner[veh] != playerid || !VehOculto[veh]) return false;
    if(VehModelData[veh] < 400 || VehModelData[veh] > 611) return false;

    new nv = CreateVehicle(VehModelData[veh], VehPosData[veh][0], VehPosData[veh][1], VehPosData[veh][2], VehPosData[veh][3], VehColor1Data[veh], VehColor2Data[veh], 120);
    if(nv == INVALID_VEHICLE_ID) return false;

    VehOwner[nv] = VehOwner[veh];
    VehLocked[nv] = VehLocked[veh];
    VehOculto[nv] = false;
    VehLastUseTick[nv] = GetTickCount();
    VehModelData[nv] = VehModelData[veh];
    VehColor1Data[nv] = VehColor1Data[veh];
    VehColor2Data[nv] = VehColor2Data[veh];
    VehPosData[nv][0] = VehPosData[veh][0];
    VehPosData[nv][1] = VehPosData[veh][1];
    VehPosData[nv][2] = VehPosData[veh][2];
    VehPosData[nv][3] = VehPosData[veh][3];
    GasInitVehiculo[nv] = GasInitVehiculo[veh];
    GasVehiculo[nv] = GasVehiculo[veh];

    if(MaleteroOwner[veh] == playerid) {
        MaleteroOwner[nv] = MaleteroOwner[veh];
        MaleteroSlotsVeh[nv] = MaleteroSlotsVeh[veh];
        MaleteroHierbaVeh[nv] = MaleteroHierbaVeh[veh];
        MaleteroFloresVeh[nv] = MaleteroFloresVeh[veh];
        MaleteroSemillaHierbaVeh[nv] = MaleteroSemillaHierbaVeh[veh];
        MaleteroSemillaFlorVeh[nv] = MaleteroSemillaFlorVeh[veh];
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[nv][w] = MaleteroArmasVeh[veh][w];
        MaleteroOwner[veh] = -1;
        MaleteroSlotsVeh[veh] = 0;
        MaleteroHierbaVeh[veh] = 0;
        MaleteroFloresVeh[veh] = 0;
        MaleteroSemillaHierbaVeh[veh] = 0;
        MaleteroSemillaFlorVeh[veh] = 0;
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[veh][w] = 0;
    }

    VehOwner[veh] = -1;
    VehLocked[veh] = false;
    VehOculto[veh] = false;
    VehLastUseTick[veh] = 0;
    VehModelData[veh] = 0;
    GPSVehiculoSeleccionado[playerid] = nv;
    return true;
}

stock CargarVehiculosJugadorDesdeCuenta(playerid, File:h) {
    new line[256];
    if(!fread(h, line)) return 0;
    return CargarVehiculosJugadorDesdeLinea(playerid, h, line);
}

stock CargarVehiculosJugadorDesdeLinea(playerid, File:h, const primeraLinea[]) {
    new line[256];
    strmid(line, primeraLinea, 0, sizeof(line), sizeof(line));

    new cantidad = strval(line);
    if(cantidad < 0) cantidad = 0;
    if(cantidad > MAX_VEHICULOS_TOTALES_JUGADOR) cantidad = MAX_VEHICULOS_TOTALES_JUGADOR;

    for(new i = 0; i < cantidad; i++) {
        if(!fread(h, line)) break;
        new idx = 0;
        new model = strval(strtok(line, idx));
        new color1 = strval(strtok(line, idx));
        new color2 = strval(strtok(line, idx));
        new Float:x = floatstr(strtok(line, idx));
        new Float:y = floatstr(strtok(line, idx));
        new Float:z = floatstr(strtok(line, idx));
        new Float:a = floatstr(strtok(line, idx));
        new locked = strval(strtok(line, idx));
        new gas = strval(strtok(line, idx));
        new isMaletero = strval(strtok(line, idx));
        new maleteroSlots = strval(strtok(line, idx));
        new maleteroHierba = strval(strtok(line, idx));
        new maleteroFlores = strval(strtok(line, idx));
        new maleteroSemHierba = strval(strtok(line, idx));
        new maleteroSemFlor = strval(strtok(line, idx));

        new veh = CreateVehicle(model, x, y, z, a, color1, color2, 120);
        if(veh == INVALID_VEHICLE_ID) continue;

        VehOwner[veh] = playerid;
        VehLocked[veh] = (locked != 0);
        VehOculto[veh] = false;
        VehLastUseTick[veh] = GetTickCount();
        VehModelData[veh] = model;
        VehColor1Data[veh] = color1;
        VehColor2Data[veh] = color2;
        VehPosData[veh][0] = x;
        VehPosData[veh][1] = y;
        VehPosData[veh][2] = z;
        VehPosData[veh][3] = a;
        GasInitVehiculo[veh] = true;
        GasVehiculo[veh] = gas;

        if(isMaletero) {
            MaleteroOwner[veh] = playerid;
            MaleteroSlotsVeh[veh] = maleteroSlots;
            MaleteroHierbaVeh[veh] = maleteroHierba;
            MaleteroFloresVeh[veh] = maleteroFlores;
            MaleteroSemillaHierbaVeh[veh] = maleteroSemHierba;
            MaleteroSemillaFlorVeh[veh] = maleteroSemFlor;
        }
    }
    return 1;
}

stock bool:EsLineaPrendaCuenta(const line[]) {
    if(strfind(line, ".") == -1) return false;

    new espacios;
    for(new i = 0; line[i] != EOS; i++) {
        if(line[i] == ' ') espacios++;
    }
    return espacios == 11;
}

stock GuardarVehiculosJugadorEnCuenta(playerid, File:h) {
    new line[256];
    new cantidad = ContarAutosJugador(playerid);
    if(cantidad > MAX_VEHICULOS_TOTALES_JUGADOR) cantidad = MAX_VEHICULOS_TOTALES_JUGADOR;
    format(line, sizeof(line), "\n%d", cantidad);
    fwrite(h, line);

    new guardados = 0;
    for(new v = 1; v < MAX_VEHICLES && guardados < cantidad; v++) {
        if(VehOwner[v] != playerid) continue;
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;

        new Float:x, Float:y, Float:z, Float:a;
        GetVehiclePos(v, x, y, z);
        GetVehicleZAngle(v, a);
        VehPosData[v][0] = x; VehPosData[v][1] = y; VehPosData[v][2] = z; VehPosData[v][3] = a;

        format(line, sizeof(line), "\n%d %d %d %f %f %f %f %d %d %d %d %d %d %d %d",
            VehModelData[v], VehColor1Data[v], VehColor2Data[v], x, y, z, a,
            VehLocked[v] ? 1 : 0, GasVehiculo[v],
            MaleteroOwner[v] == playerid ? 1 : 0, MaleteroSlotsVeh[v], MaleteroHierbaVeh[v], MaleteroFloresVeh[v], MaleteroSemillaHierbaVeh[v], MaleteroSemillaFlorVeh[v]);
        fwrite(h, line);
        guardados++;
    }
    return 1;
}

stock ContarCasasJugador(playerid) {
    new name[MAX_PLAYER_NAME], total;
    GetPlayerName(playerid, name, sizeof(name));
    for(new i = 0; i < TotalCasas; i++) {
        if(strcmp(CasaData[i][cOwner], name) == 0) total++;
    }
    return total;
}

public RestaurarVehiculoTemporal(slot) {
    if(slot <= 0 || slot >= MAX_VEHICLES) return 1;
    VehTempRestoreTimer[slot] = -1;
    if(TempVehModel[slot] < 400 || TempVehModel[slot] > 611) return 1;

    new nv = CreateVehicle(TempVehModel[slot], TempVehPos[slot][0], TempVehPos[slot][1], TempVehPos[slot][2], TempVehPos[slot][3], TempVehColor1[slot], TempVehColor2[slot], 120);
    if(nv == INVALID_VEHICLE_ID) return 1;
    SetVehicleVirtualWorld(nv, TempVehVW[slot]);
    LinkVehicleToInterior(nv, TempVehInterior[slot]);

    VehOwner[nv] = VehOwner[slot];
    VehLocked[nv] = VehLocked[slot];
    VehOculto[nv] = false;
    VehLastUseTick[nv] = GetTickCount();
    VehModelData[nv] = (VehModelData[slot] != 0) ? VehModelData[slot] : TempVehModel[slot];
    VehColor1Data[nv] = TempVehColor1[slot];
    VehColor2Data[nv] = TempVehColor2[slot];
    VehPosData[nv][0] = TempVehPos[slot][0];
    VehPosData[nv][1] = TempVehPos[slot][1];
    VehPosData[nv][2] = TempVehPos[slot][2];
    VehPosData[nv][3] = TempVehPos[slot][3];
    GasInitVehiculo[nv] = GasInitVehiculo[slot];
    GasVehiculo[nv] = GasVehiculo[slot];

    if(MaleteroOwner[slot] != -1) {
        MaleteroOwner[nv] = MaleteroOwner[slot];
        MaleteroSlotsVeh[nv] = MaleteroSlotsVeh[slot];
        MaleteroHierbaVeh[nv] = MaleteroHierbaVeh[slot];
        MaleteroFloresVeh[nv] = MaleteroFloresVeh[slot];
        MaleteroSemillaHierbaVeh[nv] = MaleteroSemillaHierbaVeh[slot];
        MaleteroSemillaFlorVeh[nv] = MaleteroSemillaFlorVeh[slot];
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[nv][w] = MaleteroArmasVeh[slot][w];
        MaleteroOwner[slot] = -1;
        MaleteroSlotsVeh[slot] = 0;
        MaleteroHierbaVeh[slot] = 0;
        MaleteroFloresVeh[slot] = 0;
        MaleteroSemillaHierbaVeh[slot] = 0;
        MaleteroSemillaFlorVeh[slot] = 0;
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[slot][w] = 0;
    }

    VehOwner[slot] = -1;
    VehLocked[slot] = false;
    VehOculto[slot] = false;
    VehLastUseTick[slot] = 0;
    VehModelData[slot] = 0;
    TempVehModel[slot] = 0;
    TempVehColor1[slot] = 0;
    TempVehColor2[slot] = 0;
    TempVehVW[slot] = 0;
    TempVehInterior[slot] = 0;
    return 1;
}


public FinalizarMinado(playerid) {
    if(!IsPlayerConnected(playerid)) return 1;
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    RemovePlayerAttachedObject(playerid, 8);
    MineroTimer[playerid] = -1;
    if(MineroMinaIndex[playerid] < 0) return 1;
    new tiempo = MineroDuracionActual[playerid];
    if(tiempo < 10) tiempo = 10;
    new piedra = 1 + (tiempo / 4) + random(3);
    new cobre = (tiempo / 6) + random(3);
    new hierro = (tiempo / 8) + random(2);
    if(cobre < 1 && random(100) < 35) cobre = 1;
    if(hierro < 1 && random(100) < 22) hierro = 1;
    InvPiedra[playerid] += piedra;
    InvCobre[playerid] += cobre;
    InvHierroMineral[playerid] += hierro;
    new desgaste = MineroDuracionActual[playerid] / 8;
    if(desgaste < 1) desgaste = 1;
    if(MazoDurabilidad[playerid] > 0) MazoDurabilidad[playerid] -= desgaste;
    MineroDuracionActual[playerid] = 0;
    if(MazoDurabilidad[playerid] <= 0) { PlayerTieneMazo[playerid] = false; MazoDurabilidad[playerid] = 0; SendClientMessage(playerid, 0xFF0000FF, "Tu mazo se rompio."); }
    new msg[144];
    MineroCooldownTick[playerid][MineroMinaIndex[playerid]] = GetTickCount() + 180000;
    format(msg, sizeof(msg), "[Minero] Piedra:%d | Cobre:%d | Hierro:%d", piedra, cobre, hierro);
    SendClientMessage(playerid, 0x66FF66FF, msg);
    return 1;
}

public FinalizarCajaBusqueda(playerid, cajaidx) {
    if(!IsPlayerConnected(playerid)) return 1;
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    RemovePlayerAttachedObject(playerid, 7);
    if(cajaidx < 0 || cajaidx >= TotalCajas) return 1;
    CajaCooldownTick[playerid][cajaidx] = GetTickCount() + 300000;
    new madera = 1 + random(3), prep = 1 + random(3), dinero = 800 + random(801), pol = 0, piedra = random(3), cobre = 0, hierro = 0;
    if(random(100) < 15) pol = 1 + random(2);
    if(random(100) < 20) cobre = 1 + random(2);
    if(random(100) < 14) hierro = 1 + random(2);
    InvMadera[playerid] += madera; InvPrepieza[playerid] += prep; InvPolvora[playerid] += pol; InvPiedra[playerid] += piedra; InvCobre[playerid] += cobre; InvHierroMineral[playerid] += hierro;
    GivePlayerMoney(playerid, dinero);
    new out[200];
    format(out, sizeof(out), "[Caja] Dinero:$%d | Madera:%d | Prepiezas:%d | Polvora:%d | Piedra:%d | Cobre:%d | Hierro:%d", dinero, madera, prep, pol, piedra, cobre, hierro);
    SendClientMessage(playerid, 0xFFFFFFFF, out);
    if(CajaDataLoot[cajaidx][cajaObj] != 0) DestroyObject(CajaDataLoot[cajaidx][cajaObj]);
    CajaDataLoot[cajaidx][cajaObj] = CreateObject(2359, CajaDataLoot[cajaidx][cajaX], CajaDataLoot[cajaidx][cajaY], CajaDataLoot[cajaidx][cajaZ] - 1.0, 0.0, 0.0, 0.0);
    SetTimerEx("FinalizarHorno", 300000, false, "d", -1000 - cajaidx);
    return 1;
}

public FinalizarHorno(hornoidx) {
    if(hornoidx <= -1000) {
        new cidx = -1000 - hornoidx;
        if(cidx >= 0 && cidx < TotalCajas && CajaDataLoot[cidx][cajaActiva]) { if(CajaDataLoot[cidx][cajaObj] != 0) DestroyObject(CajaDataLoot[cidx][cajaObj]); CajaDataLoot[cidx][cajaObj] = CreateObject(2358, CajaDataLoot[cidx][cajaX], CajaDataLoot[cidx][cajaY], CajaDataLoot[cidx][cajaZ] - 1.0, 0.0, 0.0, 0.0); }
        return 1;
    }
    if(hornoidx < 0 || hornoidx >= TotalHornos || !HornoData[hornoidx][hornoActivo] || !HornoData[hornoidx][hornoEnUso] || HornoData[hornoidx][hornoListoRetiro]) return 1;
    HornoData[hornoidx][hornoReadyTick] = 0;
    HornoData[hornoidx][hornoListoRetiro] = true;
    new owner = HornoData[hornoidx][hornoOwner];
    if(IsPlayerConnected(owner)) {
        SendClientMessage(owner, 0x66FF66FF, "Tu horno termino la coccion. Presiona H y elige 'Retirar coccion lista'.");
    }
    ActualizarLabelHorno(hornoidx);
    return 1;
}

public ActualizarTextosHornos() {
    for(new h = 0; h < TotalHornos; h++) {
        if(!HornoData[h][hornoActivo]) continue;
        ActualizarLabelHorno(h);
    }
    return 1;
}

stock ActualizarLabelHorno(hornoidx) {
    if(hornoidx < 0 || hornoidx >= TotalHornos || !HornoData[hornoidx][hornoActivo]) return 0;
    new txt[144];
    if(!HornoData[hornoidx][hornoEnUso]) {
        format(txt, sizeof(txt), "Horno\nUsa H");
        Update3DTextLabelText(HornoData[hornoidx][hornoLabel], 0xFFAA00FF, txt);
        return 1;
    }

    new owner = HornoData[hornoidx][hornoOwner];
    new ownerName[MAX_PLAYER_NAME] = "Jugador";
    if(IsPlayerConnected(owner)) GetPlayerName(owner, ownerName, sizeof(ownerName));

    if(HornoData[hornoidx][hornoListoRetiro]) {
        format(txt, sizeof(txt), "Horno en uso\nDueno: %s\n{66FF66}LISTO: presiona H para retirar", ownerName);
        Update3DTextLabelText(HornoData[hornoidx][hornoLabel], 0x66FF66FF, txt);
        return 1;
    }

    new restante = HornoData[hornoidx][hornoReadyTick] - GetTickCount();
    if(restante < 0) restante = 0;
    new left[24];
    FormatTiempoRestante(restante, left, sizeof(left));
    format(txt, sizeof(txt), "Horno en uso\nDueno: %s\nTiempo: %s", ownerName, left);
    Update3DTextLabelText(HornoData[hornoidx][hornoLabel], 0xFFAA00FF, txt);
    return 1;
}

stock GetHornoMasCercano(playerid) {
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    new best = -1;
    new Float:bestDist = 999999.0;
    for(new h = 0; h < TotalHornos; h++) {
        if(!HornoData[h][hornoActivo]) continue;
        new Float:d = GetDistanceBetweenPoints(px, py, pz, HornoData[h][hornoX], HornoData[h][hornoY], HornoData[h][hornoZ]);
        if(d < bestDist) {
            bestDist = d;
            best = h;
        }
    }
    return best;
}

stock MostrarDialogoAdmin(playerid) {
    ShowPlayerDialog(playerid, DIALOG_ADMIN_MENU, DIALOG_STYLE_LIST, "Panel Admin", "Dar dinero\nDar minerales\nMover puntos y CP\nCrear puntos/sistemas\nComandos admin\nAdministrar prendas", "Abrir", "Cerrar");
    return 1;
}

stock GuardarMinas() {
    new File:h = fopen(PATH_MINAS, io_write);
    if(!h) return 0;
    new line[96];
    for(new i = 0; i < TotalMinas; i++) { if(!MinaData[i][minaActiva]) continue; format(line, sizeof(line), "%f %f %f\n", MinaData[i][minaX], MinaData[i][minaY], MinaData[i][minaZ]); fwrite(h, line); }
    fclose(h);
    return 1;
}
stock CargarMinas() {
    new File:h = fopen(PATH_MINAS, io_read), line[96];
    if(!h) return 0;
    TotalMinas = 0;
    while(fread(h, line) && TotalMinas < MAX_MINAS) {
        new idx, Float:x = floatstr(strtok(line, idx)), Float:y = floatstr(strtok(line, idx)), Float:z = floatstr(strtok(line, idx));
        MinaData[TotalMinas][minaActiva] = true; MinaData[TotalMinas][minaX] = x; MinaData[TotalMinas][minaY] = y; MinaData[TotalMinas][minaZ] = z;
        MinaData[TotalMinas][minaObj] = CreateObject(748, x, y, z - 1.0, 0.0, 0.0, 0.0);
        AplicarTexturaMinaEstatica(MinaData[TotalMinas][minaObj]);
        MinaData[TotalMinas][minaLabel] = Create3DTextLabel("Mina\nUsa H para minar", 0xCCCCCCFF, x, y, z + 0.7, 12.0, 0);
        TotalMinas++;
    }
    fclose(h);
    return 1;
}

stock AplicarTexturaMinaEstatica(objectid) {
    if(objectid == 0) return 0;
    // Modelo 748 (sm_scrb_grp1) ya incluye la textura objetivo.
    return 1;
}

stock ObtenerDatosCrafteoArmero(tier, listitem, &weaponid, weaponName[], weaponNameLen, &needM, &needH, &needP, &needPr, &needC) {
    weaponid = 0;
    needM = 0; needH = 0; needP = 0; needPr = 0; needC = 0;
    switch(tier) {
        case 0: {
            if(listitem == 0) { weaponid = 22; format(weaponName, weaponNameLen, "Colt 45"); needM = 12; needH = 22; needP = 50; needPr = 20; }
            else if(listitem == 1) { weaponid = 23; format(weaponName, weaponNameLen, "Silenced Pistol"); needM = 14; needH = 24; needP = 60; needPr = 25; needC = 6; }
            else if(listitem == 2) { weaponid = 24; format(weaponName, weaponNameLen, "Desert Eagle"); needM = 20; needH = 38; needP = 95; needPr = 35; needC = 12; }
        }
        case 1: {
            if(listitem == 0) { weaponid = 32; format(weaponName, weaponNameLen, "Tec-9"); needM = 18; needH = 22; needP = 85; needPr = 40; }
            else if(listitem == 1) { weaponid = 28; format(weaponName, weaponNameLen, "Uzi"); needM = 20; needH = 24; needP = 90; needPr = 45; }
            else if(listitem == 2) { weaponid = 29; format(weaponName, weaponNameLen, "MP5"); needM = 22; needH = 32; needP = 120; needPr = 55; needC = 12; }
        }
        case 2: {
            if(listitem == 0) { weaponid = 25; format(weaponName, weaponNameLen, "Shotgun"); needM = 28; needH = 38; needP = 130; needPr = 50; }
            else if(listitem == 1) { weaponid = 26; format(weaponName, weaponNameLen, "Sawn-Off"); needM = 24; needH = 34; needP = 120; needPr = 45; }
            else if(listitem == 2) { weaponid = 27; format(weaponName, weaponNameLen, "SPAS-12"); needM = 34; needH = 48; needP = 160; needPr = 65; needC = 18; }
        }
        case 3: {
            if(listitem == 0) { weaponid = 33; format(weaponName, weaponNameLen, "Country Rifle"); needM = 38; needH = 45; needP = 150; needPr = 60; }
            else if(listitem == 1) { weaponid = 34; format(weaponName, weaponNameLen, "Sniper Rifle"); needM = 48; needH = 65; needP = 230; needPr = 95; needC = 28; }
        }
    }
    return (weaponid > 0);
}
stock GuardarHornos() {
    new File:h = fopen(PATH_HORNOS, io_write);
    if(!h) return 0;

    new line[96];
    for(new i = 0; i < TotalHornos; i++) {
        if(!HornoData[i][hornoActivo]) continue;
        format(line, sizeof(line), "%f %f %f\n", HornoData[i][hornoX], HornoData[i][hornoY], HornoData[i][hornoZ]);
        fwrite(h, line);
    }

    fclose(h);
    return 1;
}
stock CargarHornos() {
    new File:h = fopen(PATH_HORNOS, io_read), line[96];
    if(!h) return 0;

    TotalHornos = 0;
    while(fread(h, line) && TotalHornos < MAX_HORNOS) {
        new idx;
        new Float:x = floatstr(strtok(line, idx));
        new Float:y = floatstr(strtok(line, idx));
        new Float:z = floatstr(strtok(line, idx));

        HornoData[TotalHornos][hornoActivo] = true;
        HornoData[TotalHornos][hornoX] = x;
        HornoData[TotalHornos][hornoY] = y;
        HornoData[TotalHornos][hornoZ] = z;
        HornoData[TotalHornos][hornoObj] = CreateObject(19831, x, y, z - 1.0, 0.0, 0.0, 0.0);
        HornoData[TotalHornos][hornoLabel] = Create3DTextLabel("Horno\nUsa H", 0xFFAA00FF, x, y, z + 0.8, 12.0, 0);
        HornoData[TotalHornos][hornoListoRetiro] = false;
        HornoData[TotalHornos][hornoEnUso] = false;
        HornoData[TotalHornos][hornoOwner] = INVALID_PLAYER_ID;
        TotalHornos++;
    }

    fclose(h);
    return 1;
}
stock GuardarCajasLoot() {
    new File:h = fopen(PATH_CAJAS, io_write);
    if(!h) return 0;

    new line[96];
    for(new i = 0; i < TotalCajas; i++) {
        if(!CajaDataLoot[i][cajaActiva]) continue;
        format(line, sizeof(line), "%f %f %f\n", CajaDataLoot[i][cajaX], CajaDataLoot[i][cajaY], CajaDataLoot[i][cajaZ]);
        fwrite(h, line);
    }

    fclose(h);
    return 1;
}
stock CargarCajasLoot() {
    new File:h = fopen(PATH_CAJAS, io_read), line[96];
    if(!h) return 0;

    TotalCajas = 0;
    while(fread(h, line) && TotalCajas < MAX_CAJAS) {
        new idx;
        new Float:x = floatstr(strtok(line, idx));
        new Float:y = floatstr(strtok(line, idx));
        new Float:z = floatstr(strtok(line, idx));

        CajaDataLoot[TotalCajas][cajaActiva] = true;
        CajaDataLoot[TotalCajas][cajaX] = x;
        CajaDataLoot[TotalCajas][cajaY] = y;
        CajaDataLoot[TotalCajas][cajaZ] = z;
        CajaDataLoot[TotalCajas][cajaObj] = CreateObject(2358, x, y, z - 1.0, 0.0, 0.0, 0.0);
        CajaDataLoot[TotalCajas][cajaLabel] = Create3DTextLabel("Caja de busqueda\nUsa H", 0xFFFFFFFF, x, y, z + 0.7, 10.0, 0);
        TotalCajas++;
    }

    fclose(h);
    return 1;
}
stock GuardarPrepiezaPoints() {
    new File:h = fopen(PATH_PREPIEZAS, io_write);
    if(!h) return 0;

    new line[96];
    for(new i = 0; i < TotalPrepiezaPoints; i++) {
        if(!PrepiezaPoints[i][ppActivo]) continue;
        format(line, sizeof(line), "%f %f %f\n", PrepiezaPoints[i][ppX], PrepiezaPoints[i][ppY], PrepiezaPoints[i][ppZ]);
        fwrite(h, line);
    }

    fclose(h);
    return 1;
}
stock CargarPrepiezaPoints() {
    new File:h = fopen(PATH_PREPIEZAS, io_read), line[96];
    if(!h) return 0;

    TotalPrepiezaPoints = 0;
    while(fread(h, line) && TotalPrepiezaPoints < MAX_PREPIEZA_POINTS) {
        new idx;
        new Float:x = floatstr(strtok(line, idx));
        new Float:y = floatstr(strtok(line, idx));
        new Float:z = floatstr(strtok(line, idx));

        PrepiezaPoints[TotalPrepiezaPoints][ppActivo] = true;
        PrepiezaPoints[TotalPrepiezaPoints][ppX] = x;
        PrepiezaPoints[TotalPrepiezaPoints][ppY] = y;
        PrepiezaPoints[TotalPrepiezaPoints][ppZ] = z;
        PrepiezaPoints[TotalPrepiezaPoints][ppObj] = CreateObject(1279, x, y, z - 1.0, 0.0, 0.0, 0.0);
        PrepiezaPoints[TotalPrepiezaPoints][ppLabel] = Create3DTextLabel("Punto de prepiezas ($100/2)\nUsa H", 0x99CCFFFF, x, y, z + 0.6, 10.0, 0);
        TotalPrepiezaPoints++;
    }

    fclose(h);
    return 1;
}

stock CrearPrendasDefault() {
    for(new i = 0; i < MAX_PRENDAS; i++) {
        PrendasData[i][prendaActiva] = false;
        PrendasData[i][prendaModelo] = 0;
        PrendasData[i][prendaPrecio] = 0;
        PrendasData[i][prendaStock] = 0;
        PrendasData[i][prendaBone] = 2;
        PrendasData[i][prendaOffX] = 0.0;
        PrendasData[i][prendaOffY] = 0.0;
        PrendasData[i][prendaOffZ] = 0.0;
        PrendasData[i][prendaRotX] = 0.0;
        PrendasData[i][prendaRotY] = 0.0;
        PrendasData[i][prendaRotZ] = 0.0;
        PrendasData[i][prendaScaleX] = 1.0;
        PrendasData[i][prendaScaleY] = 1.0;
        PrendasData[i][prendaScaleZ] = 1.0;
        format(PrendasData[i][prendaNombre], 32, "");
    }
}

stock GuardarPrendasConfig() {
    new File:h = fopen(PATH_PRENDAS, io_write);
    if(!h) return 0;
    new line[256];
    for(new i = 0; i < MAX_PRENDAS; i++) {
        format(line, sizeof(line), "%d %d %d %d %d %f %f %f %f %f %f %f %f %f %s\n",
            PrendasData[i][prendaActiva], PrendasData[i][prendaModelo], PrendasData[i][prendaPrecio], PrendasData[i][prendaStock], PrendasData[i][prendaBone],
            PrendasData[i][prendaOffX], PrendasData[i][prendaOffY], PrendasData[i][prendaOffZ],
            PrendasData[i][prendaRotX], PrendasData[i][prendaRotY], PrendasData[i][prendaRotZ],
            PrendasData[i][prendaScaleX], PrendasData[i][prendaScaleY], PrendasData[i][prendaScaleZ], PrendasData[i][prendaNombre]);
        fwrite(h, line);
    }
    fclose(h);
    return 1;
}

stock CargarPrendasConfig() {
    CrearPrendasDefault();
    new File:h = fopen(PATH_PRENDAS, io_read), line[256];
    if(!h) {
        GuardarPrendasConfig();
        return 1;
    }
    new i = 0;
    while(fread(h, line) && i < MAX_PRENDAS) {
        new idx = 0;
        PrendasData[i][prendaActiva] = strval(strtok(line, idx)) != 0;
        PrendasData[i][prendaModelo] = strval(strtok(line, idx));
        PrendasData[i][prendaPrecio] = strval(strtok(line, idx));
        PrendasData[i][prendaStock] = strval(strtok(line, idx));
        PrendasData[i][prendaBone] = strval(strtok(line, idx));
        PrendasData[i][prendaOffX] = floatstr(strtok(line, idx));
        PrendasData[i][prendaOffY] = floatstr(strtok(line, idx));
        PrendasData[i][prendaOffZ] = floatstr(strtok(line, idx));
        PrendasData[i][prendaRotX] = floatstr(strtok(line, idx));
        PrendasData[i][prendaRotY] = floatstr(strtok(line, idx));
        PrendasData[i][prendaRotZ] = floatstr(strtok(line, idx));
        PrendasData[i][prendaScaleX] = floatstr(strtok(line, idx));
        PrendasData[i][prendaScaleY] = floatstr(strtok(line, idx));
        PrendasData[i][prendaScaleZ] = floatstr(strtok(line, idx));
        strmid(PrendasData[i][prendaNombre], strtok(line, idx), 0, 32, 32);
        i++;
    }
    fclose(h);
    for(new j = i; j < MAX_PRENDAS; j++) {
        PrendasData[j][prendaActiva] = false;
        PrendasData[j][prendaModelo] = 0;
        PrendasData[j][prendaPrecio] = 0;
        PrendasData[j][prendaStock] = 0;
        format(PrendasData[j][prendaNombre], 32, "");
    }
    return 1;
}

stock ShowPrendasMenu(playerid) {
    new list[1024], line[128];
    list[0] = EOS;
    for(new i = 0; i < MAX_PRENDAS; i++) {
        if(!PrendasData[i][prendaActiva]) continue;
        format(line, sizeof(line), "%s - $%d (Stock: %d)", PrendasData[i][prendaNombre], PrendasData[i][prendaPrecio], PrendasData[i][prendaStock]);
        if(PlayerPrendaComprada[playerid][i]) {
            if(PlayerPrendaActiva[playerid][i]) strcat(line, " {66FF66}(EQUIPADA)");
            else strcat(line, " {FFAA00}(COMPRADA)");
        }
        if(strlen(list) > 0) strcat(list, "\n");
        strcat(list, line);
    }
    if(!strlen(list)) return SendClientMessage(playerid, -1, "No hay prendas disponibles en este momento.");
    ShowPlayerDialog(playerid, DIALOG_PRENDAS_MENU, DIALOG_STYLE_LIST, "Prendas Kame House", list, "Seleccionar", "Cerrar");
    return 1;
}

stock ShowPrendasAdminMenu(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_PRENDAS_ADMIN_MENU, DIALOG_STYLE_LIST, "Prendas Admin", "Agregar prenda\nEliminar prenda", "Seleccionar", "Cerrar");
}

stock ShowPrendasAdminEditar(playerid, idx) {
    if(idx < 0 || idx >= MAX_PRENDAS) return ShowPrendasAdminMenu(playerid);
    PrendaEditIndex[playerid] = idx;
    new body[256];
    format(body, sizeof(body), "Activar/Desactivar (actual: %s)\nEditar precio (actual: $%d)\nEditar stock (actual: %d)", PrendasData[idx][prendaActiva] ? "ON" : "OFF", PrendasData[idx][prendaPrecio], PrendasData[idx][prendaStock]);
    return ShowPlayerDialog(playerid, DIALOG_PRENDAS_EDITAR, DIALOG_STYLE_LIST, "Prendas Admin - Editar", body, "Seleccionar", "Atras");
}

stock AplicarPrendaJugador(playerid, idx) {
    if(idx < 0 || idx >= MAX_PRENDAS) return 0;
    if(!PlayerPrendaComprada[playerid][idx]) return 0;
    new bone = PlayerPrendaBone[playerid][idx] > 0 ? PlayerPrendaBone[playerid][idx] : PrendasData[idx][prendaBone];
    new Float:offX = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaOffX[playerid][idx] : PrendasData[idx][prendaOffX];
    new Float:offY = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaOffY[playerid][idx] : PrendasData[idx][prendaOffY];
    new Float:offZ = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaOffZ[playerid][idx] : PrendasData[idx][prendaOffZ];
    new Float:rotX = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaRotX[playerid][idx] : PrendasData[idx][prendaRotX];
    new Float:rotY = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaRotY[playerid][idx] : PrendasData[idx][prendaRotY];
    new Float:rotZ = (PlayerPrendaOffX[playerid][idx] != 0.0 || PlayerPrendaOffY[playerid][idx] != 0.0 || PlayerPrendaOffZ[playerid][idx] != 0.0 || PlayerPrendaRotX[playerid][idx] != 0.0 || PlayerPrendaRotY[playerid][idx] != 0.0 || PlayerPrendaRotZ[playerid][idx] != 0.0) ? PlayerPrendaRotZ[playerid][idx] : PrendasData[idx][prendaRotZ];
    new Float:scX = PlayerPrendaScaleX[playerid][idx] > 0.0 ? PlayerPrendaScaleX[playerid][idx] : PrendasData[idx][prendaScaleX];
    new Float:scY = PlayerPrendaScaleY[playerid][idx] > 0.0 ? PlayerPrendaScaleY[playerid][idx] : PrendasData[idx][prendaScaleY];
    new Float:scZ = PlayerPrendaScaleZ[playerid][idx] > 0.0 ? PlayerPrendaScaleZ[playerid][idx] : PrendasData[idx][prendaScaleZ];
    SetPlayerAttachedObject(playerid, idx, PrendasData[idx][prendaModelo], bone, offX, offY, offZ, rotX, rotY, rotZ, scX, scY, scZ);
    return 1;
}

stock QuitarPrendaJugador(playerid, idx) {
    if(idx < 0 || idx >= MAX_PRENDAS) return 0;
    PlayerPrendaActiva[playerid][idx] = 0;
    if(IsPlayerAttachedObjectSlotUsed(playerid, idx)) RemovePlayerAttachedObject(playerid, idx);
    return 1;
}

stock GetPrendaBoneName(bone, dest[], len) {
    switch(bone) {
        case 1: format(dest, len, "Cabeza");
        case 2: format(dest, len, "Pecho");
        case 3: format(dest, len, "Espalda");
        case 4: format(dest, len, "Brazo izq");
        case 5: format(dest, len, "Brazo der");
        case 6: format(dest, len, "Mano izq");
        case 7: format(dest, len, "Mano der");
        case 8: format(dest, len, "Muslo izq");
        case 9: format(dest, len, "Muslo der");
        case 10: format(dest, len, "Pie izq");
        case 11: format(dest, len, "Pie der");
        default: format(dest, len, "Pecho");
    }
    return 1;
}


stock ContarPrendasJugador(playerid) {
    new total;
    for(new i = 0; i < MAX_PRENDAS; i++) if(PlayerPrendaActiva[playerid][i]) total++;
    return total;
}


stock IsPrendaSlotEnUsoPorJugadores(idx) {
    if(idx < 0 || idx >= MAX_PRENDAS) return 0;
    for(new p = 0; p < MAX_PLAYERS; p++) {
        if(PlayerPrendaComprada[p][idx]) return 1;
    }
    return 0;
}

stock ShowPrendaUsuarioMenu(playerid) {
    PrendaEditIndex[playerid] = -1;
    new list[1024], line[128], count;
    list[0] = EOS;
    for(new i = 0; i < MAX_PRENDAS; i++) {
        if(!PlayerPrendaComprada[playerid][i]) continue;
        format(line, sizeof(line), "%d) %s%s", i, PrendasData[i][prendaNombre], PlayerPrendaActiva[playerid][i] ? " {66FF66}(Visible)" : " {FFAA00}(Oculta)");
        if(strlen(list) > 0) strcat(list, "\n");
        strcat(list, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No tienes prendas compradas para editar.");
    return ShowPlayerDialog(playerid, DIALOG_PRENDA_USUARIO_MENU, DIALOG_STYLE_LIST, "Mis prendas", list, "Editar", "Cerrar");
}

stock ShowPrendaUsuarioEditar(playerid, idx) {
    PrendaEditIndex[playerid] = -1;
    PrendaUsuarioEditando[playerid] = idx;
    return ShowPlayerDialog(playerid, DIALOG_PRENDA_USUARIO_EDITAR, DIALOG_STYLE_LIST, "Editar prenda", "Editar posicion/rotacion\nCambiar parte del cuerpo\nMostrar/Ocultar\nEliminar permanentemente", "Elegir", "Atras");
}

public OnPlayerEditAttachedObject(playerid, EDIT_RESPONSE:response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ) {
    #pragma unused modelid
    #pragma unused boneid
    if(response == EDIT_RESPONSE_FINAL && PrendaMoveIndex[playerid] == index && index >= 0 && index < MAX_PRENDAS) {
        if(PlayerAdmin[playerid] >= 1 && PrendaEditIndex[playerid] == index && !PlayerPrendaComprada[playerid][index]) {
            PrendasData[index][prendaOffX] = fOffsetX;
            PrendasData[index][prendaOffY] = fOffsetY;
            PrendasData[index][prendaOffZ] = fOffsetZ;
            PrendasData[index][prendaRotX] = fRotX;
            PrendasData[index][prendaRotY] = fRotY;
            PrendasData[index][prendaRotZ] = fRotZ;
            PrendasData[index][prendaScaleX] = fScaleX;
            PrendasData[index][prendaScaleY] = fScaleY;
            PrendasData[index][prendaScaleZ] = fScaleZ;
            GuardarPrendasConfig();
        } else {
            PlayerPrendaOffX[playerid][index] = fOffsetX;
            PlayerPrendaOffY[playerid][index] = fOffsetY;
            PlayerPrendaOffZ[playerid][index] = fOffsetZ;
            PlayerPrendaRotX[playerid][index] = fRotX;
            PlayerPrendaRotY[playerid][index] = fRotY;
            PlayerPrendaRotZ[playerid][index] = fRotZ;
            PlayerPrendaScaleX[playerid][index] = fScaleX;
            PlayerPrendaScaleY[playerid][index] = fScaleY;
            PlayerPrendaScaleZ[playerid][index] = fScaleZ;
        }
        SendClientMessage(playerid, 0x00FF00FF, "Posicion de prenda guardada.");
    }
    PrendaMoveIndex[playerid] = -1;
    return 1;
}
