#include <open.mp>
#include <string>
#include <file>

#pragma dynamic 32768

// ================= [ CONFIGURACION EDITABLE ] =================
#define SKIN_POR_DEFECTO    229
#define VIDA_AL_LOGUEAR     100.0
#define CHALECO_AL_LOGUEAR  100.0
#define DINERO_INICIAL      500
#define COLOR_HAMBRE        0xFFA500FF
#define COLOR_GAS           0x33CCFFFF
#define RADIO_CHAT_LOCAL    20.0
#define PRECIO_COMIDA       1000
#define HAMBRE_POR_COMIDA   15
#define DISTANCIA_PAGO_MULT  3.0
#define DISTANCIA_PAGO_PIZZA 2.2
#define HORAS_POR_NIVEL_PJ   4
#define COBRO_DIARIO_POR_VEHICULO 750

#define PAGO_MAX_PIZZERO     2600
#define PAGO_MAX_CAMIONERO   6800
#define PAGO_MAX_BASURERO    4500

#define PAGO_BASE_CAMIONERO   1700
#define PAGO_BASE_PIZZERO       50
#define PAGO_BASE_BASURERO     100

#define NIVEL_MAX_TRABAJO    10
#define PROGRESO_CAMIONERO_POR_NIVEL 30
#define PROGRESO_PIZZERO_POR_NIVEL   25
#define PROGRESO_BASURERO_POR_NIVEL  28

#define TIEMPO_CULTIVO_MIN   4
#define TIEMPO_CULTIVO_MAX   5
#define COOLDOWN_MINA_MS     600000

#define SEMILLA_HIERBA_PRECIO 45
#define SEMILLA_FLOR_PRECIO   65

#define MAX_WEAPON_ID_GM     47

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
#define DIR_SCRIPTFILES     "scriptfiles"
#define DIR_DATA            "scriptfiles/kame_house"
#define DIR_USUARIOS        "scriptfiles/kame_house/usuarios"
#define DIR_USUARIOS_LEGACY "usuarios"
#define PATH_USUARIOS       "scriptfiles/kame_house/usuarios/%s.txt"
#define PATH_USUARIOS_LEGACY "usuarios/%s.ini"
#define PATH_RUTAS          "rutas_camionero.txt"
#define PATH_RUTAS_PIZZA    "rutas_pizzero.txt"
#define PATH_RUTAS_BASURA   "rutas_basurero.txt"
#define PATH_CASAS          "casas.txt"
#define PATH_PUNTOS_MOVIBLES "puntos_movibles.txt"
#define PATH_MINAS "minas.txt"
#define PATH_HORNOS "hornos.txt"
#define PATH_CAJAS "cajas_busqueda.txt"
#define PATH_PREPIEZAS "prepiezas_puntos.txt"
#define PATH_BANDAS_SPAWNS "bandas_spawns.txt"
#define PATH_FACCIONES "facciones.txt"
#define PATH_FACCIONES_BAK "facciones.bak"
#define PATH_FACCIONES_LEGACY "scriptfiles/kame_house/facciones.txt"
#define PATH_PRENDAS "scriptfiles/kame_house/prendas_config.txt"
#define PATH_PRENDAS_LEGACY "prendas_config.txt"
#define PATH_EDITMAP "scriptfiles/kame_house/editmap.txt"
#define PATH_EDITMAP_LEGACY "editmap.txt"
#define PATH_VENTA_AUTOS "scriptfiles/kame_house/venta_autos_config.txt"
#define PATH_VENTA_AUTOS_LEGACY "venta_autos_config.txt"
#define PATH_VENTA_SKINS "scriptfiles/kame_house/venta_skins_config.txt"
#define PATH_VENTA_SKINS_LEGACY "venta_skins_config.txt"
#define PATH_ARMERIA "scriptfiles/kame_house/armeria_config.txt"
#define PATH_ARMERIA_LEGACY "armeria_config.txt"
#define PATH_TIENDA_VIRTUAL "scriptfiles/kame_house/tienda_virtual_config.txt"
#define PATH_TIENDA_VIRTUAL_LEGACY "tienda_virtual_config.txt"
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
#define DIALOG_TUNING_MENU 119
#define DIALOG_CHATARRA_VEHICULO 120
#define DIALOG_FACCION_MENU 121
#define DIALOG_FACCION_CREAR_NOMBRE 122
#define DIALOG_FACCION_CREAR_COLOR_CONFIRM 123
#define DIALOG_FACCION_CREAR_COLOR_LISTA 124
#define DIALOG_FACCION_CREAR_RESUMEN 125
#define DIALOG_FACCION_COMPRAR_COLOR_LISTA 126
#define DIALOG_FACCION_OWNER_MENU 127
#define DIALOG_FACCION_INVITAR_ID 128
#define DIALOG_FACCION_INVITACION 129
#define DIALOG_FACCION_EDITAR_RANGO 130
#define DIALOG_ADMIN_FACCIONES_MENU 131
#define DIALOG_ADMIN_FACCIONES_LISTA 132
#define DIALOG_ADMIN_FACCION_RENOMBRAR 133
#define DIALOG_ADMIN_FACCION_CONFIRM_ELIMINAR 134
#define DIALOG_ADMIN_FACCION_COLOR_LISTA 135
#define DIALOG_ADMIN_FACCION_UNIR_LISTA 136
#define DIALOG_TIENDA_VIRTUAL_MENU 137
#define DIALOG_TIENDA_VIRTUAL_DIAMANTES 138
#define DIALOG_ADMIN_MEMBRESIAS_MENU 139
#define DIALOG_ADMIN_MEMBRESIA_ID 140
#define DIALOG_ADMIN_MEMBRESIA_DIAS 141
#define DIALOG_ADMIN_MEMBRESIA_ELIMINAR_ID 142
#define DIALOG_ADMIN_PRECIOS_MEMBRESIA_MENU 143
#define DIALOG_ADMIN_PRECIO_VIP_DINERO 144
#define DIALOG_ADMIN_PRECIO_VIP_DIAMANTES 145
#define DIALOG_ADMIN_PRECIO_DIAMANTE 146
#define DIALOG_ANUNCIO_TEXTO 147
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
#define DIALOG_TELEFONO_CUENTA_MENU 111
#define DIALOG_TELEFONO_CUENTA_CLAVE_ACTUAL 112
#define DIALOG_TELEFONO_CUENTA_CLAVE_NUEVA 113
#define DIALOG_TELEFONO_CUENTA_CORREO 114
#define DIALOG_ADMIN_MODO_DIOS 115
#define DIALOG_ADMIN_IR_JUGADOR_ID 80
#define DIALOG_ADMIN_SKIN_ID 81
#define DIALOG_ADMIN_SKIN_VALOR 82
#define DIALOG_ADMIN_VIDA_CHALECO_TIPO 83
#define DIALOG_ADMIN_VIDA_CHALECO_ID 84
#define DIALOG_ADMIN_VIDA_CHALECO_VALOR 85
#define DIALOG_CREAR_CASA_INTERIOR 86
#define DIALOG_CREAR_CASA_PRECIO 87
#define DIALOG_EDITMAP_MENU 88
#define DIALOG_EDITMAP_ADD_MODEL 89
#define DIALOG_EDITMAP_EDIT_LIST 90
#define DIALOG_EDITMAP_DELETE_LIST 91
#define DIALOG_EDITMAP_LISTA 92
#define DIALOG_EDITMAP_LISTA_ACCION 93
#define DIALOG_EDITMAP_ADD_NOMBRE 94
#define DIALOG_ADMIN_SANCION_CONCEPTO 95
#define DIALOG_ADMIN_SANCION_ID 96
#define DIALOG_ADMIN_SANCION_MINUTOS 97
#define DIALOG_ADMIN_UNSAN_ID 98
#define DIALOG_ADMIN_UNSAN_MOTIVO 99
#define DIALOG_MOD_MENU 100
#define DIALOG_ADMIN_ADD_MOD_ID 101
#define DIALOG_ADMIN_REMOVE_MOD_ID 102
#define DIALOG_VENTA_SKINS_ADMIN_MENU 103
#define DIALOG_VENTA_SKINS_ADD_ID 104
#define DIALOG_VENTA_SKINS_ADD_PRECIO 105
#define DIALOG_VENTA_SKINS_REMOVE_LIST 106
#define DIALOG_VENTA_SKINS_BUY 107
#define DIALOG_DUDA_TEXTO 108
#define DIALOG_RD_TARGET 109
#define DIALOG_RD_RESPUESTA 110
#define DIALOG_ADMIN_BANDAS_MENU 116
#define DIALOG_ADMIN_BANDAS_SPAWN_BORRAR 117
#define DIALOG_ADMIN_BANDAS_SPAWN_CONFIRM 118

#define RANGO_NINGUNO 0
#define RANGO_DUENO 1
#define RANGO_MOD 2

#define FACCION_RANGO_MIEMBRO 1
#define FACCION_RANGO_RECLUTA 2
#define FACCION_RANGO_OWNER 3

#define MODELO_HIERBA_OBJ 15038
#define MODELO_FLOR_OBJ 2253
#define MAX_GAS_POINTS 64
#define MAX_MINAS 128
#define MAX_HORNOS 64
#define MAX_CAJAS 128
#define MAX_PREPIEZA_POINTS 64
#define MAX_PRENDAS 10
#define MAX_EDITMAP_OBJECTS 10000
#define VEHICULO_TEMP_SIN_USO_MS 300000
#define MAX_PRENDAS_USUARIO 10
#define MAX_SLOTS_MALETERO 15
#define PRECIO_MAZO 10000
#define PRECIO_TELEFONO 10000
#define COSTO_SMS 100
#define COSTO_LLAMAR_VEHICULO 5000
#define COSTO_CREAR_FACCION 1000000
#define PRECIO_MEMBRESIA_VIP 200000
#define DURACION_MEMBRESIA_VIP_DIAS 10
#define PRECIO_DIAMANTE_TIENDA 20000
#define COSTO_ANUNCIO 2000
#define COSTO_COLOR_CREAR_FACCION 100000
#define COSTO_COMPRAR_COLOR_FACCION 200000
#define POS_FACCION_X 2504.40
#define POS_FACCION_Y -1663.20
#define POS_FACCION_Z 13.35

#define MAX_PLANTAS_POR_JUGADOR 15
#define BOLSA_OBJ_MODEL 1264
#define BASURERO_NPC_SKIN 16
#define BASURERO_FLORES_CHANCE 30
#define GAS_PRECIO_POR_PUNTO 10
#define GAS_CONSUMO_POR_MINUTO 5

#define MAX_BANDAS_PVE 30
#define MAX_FACCIONES 30
#define MAX_MIEMBROS_FACCION 10
#define MAX_COLORES_FACCION 10
#define MAX_BANDEROS_POR_GRUPO 5
#define MAX_BANDA_SPAWNS 30
#define MIN_BANDEROS_POR_GRUPO 2
#define VIDA_BANDERO_PVE 200.0
#define BANDA_RANGO_VISION 35.0
#define BANDA_DANO_MIN 6.0
#define BANDA_DANO_MAX 14.0
#define BANDA_INACTIVA_MS 300000
#define BANDA_DROP_DINERO_MAX 800
#define BANDA_DISTANCIA_ATAQUE 18.0
#define BANDA_DISTANCIA_CUERPO 2.6
#define BANDA_PASO_CORRER 1.25
#define BANDA_PASO_CAMINAR 0.55
#define BANDA_PASO_PATRULLA 0.38
#define BANDA_RECALCULO_PATRULLA_MS 4500

#define MAX_AUTOS_NORMALES_JUGADOR 5
#define MAX_VEHICULOS_TOTALES_JUGADOR 5
#define SANCION_VW_BASE 20000
#define CUENTA_DATA_VERSION 8
#define CUENTA_SECCION_PRENDAS "PRENDAS_BEGIN"
#define CUENTA_SECCION_VEHICULOS "VEHICULOS_BEGIN"
#define CUENTA_SECCION_ARMAS "ARMAS_BEGIN"

#if !defined WEAPON_NONE
    #define WEAPON_NONE (WEAPON:-1)
#endif

// ================= [ VARIABLES ] =================
new bool:IsPlayerLoggedIn[MAX_PLAYERS];
new PlayerPassword[MAX_PLAYERS][16];
new PlayerAdmin[MAX_PLAYERS];
new PlayerHambre[MAX_PLAYERS];
new PlayerText:BarraHambre[MAX_PLAYERS];
new PlayerText:BarraHambreFondo[MAX_PLAYERS];
new PlayerText:TextoBarraHambre[MAX_PLAYERS];
new PlayerText:BarraGas[MAX_PLAYERS];
new PlayerText:BarraGasFondo[MAX_PLAYERS];
new PlayerText:TextoBarraGas[MAX_PLAYERS];
new Float:AdminMapPos[MAX_PLAYERS][3];
new PlayerInCasa[MAX_PLAYERS] = {-1, ...};
new PlayerBankMoney[MAX_PLAYERS];
new BankTransferTarget[MAX_PLAYERS] = {-1, ...};
new PlayerTiempoJugadoMin[MAX_PLAYERS];
new PlayerCorreo[MAX_PLAYERS][64];
new bool:AdminModoDios[MAX_PLAYERS];
new PlayerDiamantes[MAX_PLAYERS];
new PlayerMembresiaTipo[MAX_PLAYERS];
new PlayerMembresiaExpiraTick[MAX_PLAYERS];
new AdminMembresiaTipoPendiente[MAX_PLAYERS];
new AdminMembresiaTargetPendiente[MAX_PLAYERS] = {-1, ...};
new AdminPrecioVipDineroPendiente[MAX_PLAYERS];

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
new CasaInteriorPendiente[MAX_PLAYERS] = {-1, ...};

// Variables Casas
enum eCasa {
    Float:cX,
    Float:cY,
    Float:cZ,
    cInteriorSlot,
    cPrecio,
    cOwner[MAX_PLAYER_NAME],
    cFriends[128]
}
new CasaData[MAX_CASAS][eCasa];
new TotalCasas = 0;
new CasaPickup[MAX_CASAS];
new Text3D:CasaLabel[MAX_CASAS];
new Text3D:PlayerPrefixLabel[MAX_PLAYERS] = {Text3D:-1, ...};
new UltimaActualizacionLabelFaccionTick[MAX_PLAYERS];
new PlayerText:AnuncioTextDraw[MAX_PLAYERS];
new AnuncioTimerOcultar[MAX_PLAYERS] = {-1, ...};

new Float:CamioneroDestino[MAX_PLAYERS][3];

static const CasaInteriorNombre[5][] = {
    "Safe House 1",
    "Safe House 4",
    "Vank Hoff Hotel",
    "Willowfield safehouse",
    "Unknown safe house"
};

static const CasaInteriorJuegoID[5] = {10, 1, 5, 11, 9};

static const Float:CasaInteriorPos[5][3] = {
    {2262.83, -1137.71, 1050.63},
    {2217.28, -1076.27, 1050.48},
    {227.76, 1114.39, 1080.99},
    {1240.39, -2036.88, 59.96},
    {2318.16, -1026.75, 1050.21}
};

new Float:BandaSpawnPos[MAX_BANDA_SPAWNS][4];
new TotalBandaSpawns;

enum eFaccionData {
    bool:facActiva,
    facNombre[17],
    facOwner,
    facColor,
    facMiembros[MAX_MIEMBROS_FACCION],
    facRangos[MAX_MIEMBROS_FACCION]
}
new FaccionData[MAX_FACCIONES][eFaccionData];
new FaccionOwnerNombre[MAX_FACCIONES][MAX_PLAYER_NAME];
new FaccionMiembroNombre[MAX_FACCIONES][MAX_MIEMBROS_FACCION][MAX_PLAYER_NAME];
new PlayerFaccionId[MAX_PLAYERS] = {-1, ...};
new PlayerFaccionRango[MAX_PLAYERS];
new InvitacionFaccionId[MAX_PLAYERS] = {-1, ...};
new InvitacionFaccionOwner[MAX_PLAYERS] = {-1, ...};
new FaccionCrearColorPendiente[MAX_PLAYERS] = {-1, ...};
new bool:FaccionCrearCompraColor[MAX_PLAYERS];
new FaccionAdminSeleccion[MAX_PLAYERS] = {-1, ...};
new Text3D:FaccionCPLabel = Text3D:-1;
new FaccionCPPickup = 0;

static const FaccionColoresNombre[MAX_COLORES_FACCION][] = {
    "Rojo", "Azul", "Verde", "Amarillo", "Morado", "Naranja", "Cian", "Rosa", "Blanco", "Negro"
};
static const FaccionColoresValor[MAX_COLORES_FACCION] = {
    0xE74C3CFF, 0x3498DBFF, 0x2ECC71FF, 0xF1C40FFF, 0x9B59B6FF,
    0xE67E22FF, 0x1ABC9CFF, 0xFF66CCFF, 0xECF0F1FF, 0x2C3E50FF
};

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
    puntoVentaSkins,
    puntoMaletero,
    puntoPintura,
    puntoMinero,
    puntoPrendas,
    puntoFacciones,
    puntoTiendaVirtual,
    totalPuntosMovibles
}

#define MEMBRESIA_NINGUNA 0
#define MEMBRESIA_VIP 1
#define MEMBRESIA_DIAMANTE 2

new PrecioMembresiaVIPDinero = PRECIO_MEMBRESIA_VIP;
new PrecioMembresiaVIPDiamantes = 1;
new PrecioDiamanteTienda = PRECIO_DIAMANTE_TIENDA;
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
new PlayerPrendaModelo[MAX_PLAYERS][MAX_PRENDAS];
new PlayerPrendaNombre[MAX_PLAYERS][MAX_PRENDAS][32];

enum eEditMapData {
    bool:emActivo,
    emModelo,
    emNombre[32],
    Float:emX,
    Float:emY,
    Float:emZ,
    Float:emRX,
    Float:emRY,
    Float:emRZ,
    emObj
}
new EditMapData[MAX_EDITMAP_OBJECTS][eEditMapData];
new TotalEditMap;
new EditMapEditandoSlot[MAX_PLAYERS] = {-1, ...};
new EditMapListaSlotSeleccionado[MAX_PLAYERS] = {-1, ...};
new EditMapModeloPendiente[MAX_PLAYERS];
new PlayerSkinGuardada[MAX_PLAYERS];

new bool:PlayerSancionado[MAX_PLAYERS];
new SancionConcepto[MAX_PLAYERS];
new SancionAdminIdPendiente[MAX_PLAYERS] = {-1, ...};
new UnsanTargetPendiente[MAX_PLAYERS] = {-1, ...};
new BandaSpawnBorrarPendiente[MAX_PLAYERS] = {-1, ...};
new SancionFinTick[MAX_PLAYERS];
new Float:SancionPos[MAX_PLAYERS][3];
new SancionPrevVW[MAX_PLAYERS];
new SancionPrevInterior[MAX_PLAYERS];
new Text3D:SancionLabel[MAX_PLAYERS] = {Text3D:-1, ...};
new bool:BandasPVEActivas = true;
new bool:BandaGrupoActivo[MAX_BANDAS_PVE];
new BandaGrupoMiembros[MAX_BANDAS_PVE];
new BandaUltimaAccionTick[MAX_BANDAS_PVE];
new Float:BandaGrupoCentro[MAX_BANDAS_PVE][3];
new BandaActorId[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new BandaArmaObjetoId[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new Float:BandaVida[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new BandaArma[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new bool:BandaVivo[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new BandaGrupoAtacandoA[MAX_BANDAS_PVE] = {-1, ...};
new BandaSpawnAsignado[MAX_BANDAS_PVE] = {-1, ...};
new Float:BandaPatrullaObjetivo[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO][2];
new BandaPatrullaRecalculoTick[MAX_BANDAS_PVE][MAX_BANDEROS_POR_GRUPO];
new UltimoControlArmaProhibidaTick[MAX_PLAYERS];

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

#define MAX_SKINS_VENTA 100
enum eVentaSkin {
    bool:vsActiva,
    vsSkin,
    vsPrecio
}
new VentaSkinsData[MAX_SKINS_VENTA][eVentaSkin];
new VentaSkinsAdminSkinPendiente[MAX_PLAYERS];
new VentaSkinsPickup;
new Text3D:VentaSkinsLabel = Text3D:-1;
new Float:VentaSkinsPos[3] = {2503.50, -1660.20, 13.35};
new RdTargetPendiente[MAX_PLAYERS] = {-1, ...};

new MaleteroOwner[MAX_VEHICLES] = {-1, ...};
new MaleteroSlotsVeh[MAX_VEHICLES];
new MaleteroHierbaVeh[MAX_VEHICLES];
new MaleteroFloresVeh[MAX_VEHICLES];
new MaleteroSemillaHierbaVeh[MAX_VEHICLES];
new MaleteroSemillaFlorVeh[MAX_VEHICLES];
new MaleteroArmasVeh[MAX_VEHICLES][MAX_WEAPON_ID_GM];
new MaleteroArmaSlotIdVeh[MAX_VEHICLES][MAX_SLOTS_MALETERO];
new MaleteroArmaSlotAmmoVeh[MAX_VEHICLES][MAX_SLOTS_MALETERO];

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
new UltimoVehiculoGasMostrado[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};
new UltimoAvisoGasCeroTick[MAX_PLAYERS];
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
new bool:VehTempVanilla[MAX_VEHICLES];

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
new MinaCooldownTick[MAX_MINAS];
new bool:MineroGPSActivo[MAX_PLAYERS];
new bool:OmitirArmasEnProximoSpawn[MAX_PLAYERS];
new TuningVehLista[MAX_PLAYERS][MAX_AUTOS_NORMALES_JUGADOR];
new TuningVehCount[MAX_PLAYERS];

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
new AdminSkinTargetPendiente[MAX_PLAYERS] = {-1, ...};
new AdminVidaChalecoTipoPendiente[MAX_PLAYERS];
new AdminVidaChalecoTargetPendiente[MAX_PLAYERS] = {-1, ...};

// Adelantos de funciones usadas antes de su implementacion
forward strtok(const string[], &index);
forward strtok_sep(const string[], &index, separator = ' ');
forward sscanf_manual(const string[], &Float:x, &Float:y, &Float:z);
forward GuardarCasas();
forward GuardarCuenta(playerid);
stock CargarVehiculosJugadorDesdeCuenta(playerid, File:h);
stock CargarVehiculosJugadorDesdeLinea(playerid, File:h, const primeraLinea[]);
stock GuardarVehiculosJugadorEnCuenta(playerid, File:h);
stock CargarArmasJugadorDesdeCuenta(playerid, File:h);
stock CargarArmasJugadorDesdeLinea(playerid, File:h, const primeraLinea[]);
stock GuardarArmasJugadorEnCuenta(playerid, File:h);
stock bool:EsLineaPrendaCuenta(const line[]);
stock ResolverPathCuenta(playerid, dest[], len);
stock File:AbrirCuentaEscritura(playerid, dest[], len);
stock MigrarArchivoLegacy(const legacyPath[], const newPath[]);
stock CargarPrendaJugadorDesdeLinea(playerid, idxPrenda, const line[]);
stock ReconciliarPrendasJugador(playerid);
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
forward ProcesarBandasPVE();
forward OcultarAnuncioJugador(playerid);
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
stock bool:GetCasaInteriorData(slot, &interiorid, &Float:px, &Float:py, &Float:pz);
stock bool:EsDueno(playerid);
stock bool:EsModerador(playerid);
stock bool:EsStaff(playerid);
stock ShowCrearCasaInteriorDialog(playerid);
stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
stock CanceladoTrabajo(playerid);
stock FormatTiempoRestante(ms, dest[], len);
stock ActualizarLabelHorno(hornoidx);
stock SetCheckpointMinaMasCercana(playerid);
stock GetMinaDisponibleMasCercana(playerid, ignorar = -1);
stock GetPrecioOriginalVehiculo(modelo);
stock MostrarMenuTuning(playerid);
stock MostrarListaVehiculosChatarra(playerid);
stock EliminarVehiculoJugador(veh);
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
stock IsNearTiendaVirtual(playerid);
stock ShowTiendaVirtualMenu(playerid);
stock GetMembresiaNombre(tipo, dest[], len);
stock GetMembresiaColor(tipo);
stock ActualizarBeneficiosMembresia(playerid);
stock GetLimiteVehiculosJugador(playerid);
stock GetLimitePrendasJugador(playerid);
stock GetLimiteMaleteroJugador(playerid);
stock GetLimiteTrabajosJugador(playerid);
stock GetBonusTrabajoMembresia(playerid);
stock GetLimiteCasasJugador(playerid);
stock GetLimitePlantasJugador(playerid);
stock ExpirarMembresiaSiCorresponde(playerid);
stock bool:NombreRoleplayValido(const nombre[]);
stock TieneTrabajoActivo(playerid);
stock ContarTrabajosActivos(playerid);
stock MostrarMenuAdminMembresias(playerid);
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
stock ResetMaleteroVehiculo(vehid, ownerid = -1);
stock PlayerTieneAccesoVehiculo(playerid, vehid);
stock GetNearbyOwnedVehicle(playerid);
stock ActualizarBarrasEstado(playerid);
stock CuentaArmasMaletero(vehid);
stock FormatearBarraEstado(const etiqueta[], valor, dest[], len);
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
stock CargarVentaAutosConfig();
stock GuardarVentaAutosConfig();
stock CargarVentaSkinsConfig();
stock GuardarVentaSkinsConfig();
stock ActualizarLabelVentaSkins();
stock ShowVentaSkinsBuyMenu(playerid);
stock ShowVentaSkinsAdminMenu(playerid);
stock ShowVentaSkinsRemoveMenu(playerid);
stock GetVentaSkinByListIndex(listindex);
stock GetVentaSkinByAnyListIndex(listindex);
stock IsNearVentaSkins(playerid);
stock CargarArmeriaConfig();
stock GuardarArmeriaConfig();
stock CargarTiendaVirtualConfig();
stock GuardarTiendaVirtualConfig();
stock SetDefaultCJAnimations(playerid);
stock CrearPrendasDefault();
stock ShowPrendasMenu(playerid);
stock AplicarPrendaJugador(playerid, idx);
stock QuitarPrendaJugador(playerid, idx);
stock ShowPrendasAdminEditar(playerid, idx);
stock ShowPrendasAdminMenu(playerid);
stock ShowPrendaUsuarioMenu(playerid);
stock ShowPrendaUsuarioEditar(playerid, idx);
stock ObtenerNombrePrendaJugador(playerid, idx, dest[], len);
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
stock GetNombreVehiculoVanilla(modelid, nombre[], len);
stock FormatearVehiculoIdentificador(vehid, dest[], len, valor = 0);
stock FormatearDineroCorto(monto, dest[], len);
stock SanearTextoLabel(const origen[], destino[], len);
stock ConvertirColorAHexRGB(color, dest[], len);
stock MostrarMenuAdminPreciosMembresia(playerid);
stock MostrarAnuncioGlobal(const emisor[], const texto[]);
stock MostrarAnuncioJugador(playerid, const texto[]);
stock InicializarSistemaFacciones();
stock CargarFacciones();
stock GuardarFacciones();
stock CargarFaccionesDesdeArchivo(const path[]);
stock MostrarMenuFaccionesCP(playerid);
stock MostrarPanelFaccionOwner(playerid);
stock ActualizarLabelJugadorFaccion(playerid, bool:forzar = false);
stock EliminarFaccion(fid);
stock strtok_sep(const string[], &index, separator = ' ') {
    new length = strlen(string), offset = index, result[128], pos = 0;
    while(offset < length && (string[offset] <= ' ' || string[offset] == separator)) offset++;
    while(offset < length && string[offset] > ' ' && string[offset] != separator && pos < sizeof(result) - 1) {
        result[pos++] = string[offset++];
    }
    result[pos] = EOS;
    index = offset;
    return result;
}

stock bool:NombreRoleplayValido(const nombre[]) {
    new largo = strlen(nombre);
    if(largo < 3 || largo > 24) return false;

    new posGuion = -1;
    for(new i = 0; i < largo; i++) {
        new c = nombre[i];
        if(c == '_') {
            if(posGuion != -1) return false;
            posGuion = i;
            continue;
        }
        if(!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))) return false;
    }

    if(posGuion <= 0 || posGuion >= largo - 1) return false;
    return true;
}

stock BuscarFaccionLibre();
stock bool:AgregarMiembroFaccion(fid, playerid, rango);
stock RemoverMiembroFaccion(fid, playerid);
stock ActualizarMiembrosFaccion(fid);
stock GuardarNombreJugadorEnFaccion(playerid, fid, miembroSlot = -1);
stock GuardarEditMap();
stock CargarEditMap();
stock ShowEditMapMenu(playerid);
stock ShowEditMapEditList(playerid);
stock ShowEditMapDeleteList(playerid);
stock ShowEditMapViewList(playerid);
stock GetEditMapSlotByListIndex(listindex);
stock GetEditMapSlotLibre();
stock GetConceptoSancionNombre(concepto, dest[], len);
stock AplicarSancionJugador(adminid, targetid, concepto, minutos);
stock RemoverSancionJugador(targetid);
stock ShowReglasDialog(playerid);
stock CosecharCultivoCercano(playerid);
stock InicializarSistemaBandasPVE();
stock LimpiarBandasPVE();
stock CrearGrupoBandaPVE(slot);
stock RespawnBandasPVE();
stock EncontrarBanderoCercano(Float:x, Float:y, Float:z, &grupo, &miembro);
stock GetNombreArmaPVE(weaponid, dest[], len);
stock CargarBandasSpawns();
stock GuardarBandasSpawns();
stock EnviarEntornoAccion(playerid, const accion[]);
stock LimpiarIconosBandasParaJugador(playerid);
stock bool:EsArmaProhibida(weaponid);
stock ShowAdminBandasSpawnBorrarList(playerid);
stock EliminarSpawnBandaPorIndice(index);

stock ResetMaleteroVehiculo(vehid, ownerid = -1) {
    if(vehid <= 0 || vehid >= MAX_VEHICLES) return 0;
    MaleteroOwner[vehid] = ownerid;
    new limiteMaletero = 5;
    if(ownerid != -1) {
        if(PlayerMembresiaTipo[ownerid] == MEMBRESIA_DIAMANTE) limiteMaletero = 15;
        else if(PlayerMembresiaTipo[ownerid] == MEMBRESIA_VIP) limiteMaletero = 7;
    }
    MaleteroSlotsVeh[vehid] = limiteMaletero;
    MaleteroHierbaVeh[vehid] = 0;
    MaleteroFloresVeh[vehid] = 0;
    MaleteroSemillaHierbaVeh[vehid] = 0;
    MaleteroSemillaFlorVeh[vehid] = 0;
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[vehid][w] = 0;
    for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[vehid][ms] = 0; MaleteroArmaSlotAmmoVeh[vehid][ms] = 0; }
    return 1;
}

stock bool:TieneDatosMaleteroVehiculo(vehid, ownerid) {
    if(vehid <= 0 || vehid >= MAX_VEHICLES) return false;
    if(MaleteroOwner[vehid] == ownerid) return true;
    if(MaleteroHierbaVeh[vehid] > 0 || MaleteroFloresVeh[vehid] > 0 || MaleteroSemillaHierbaVeh[vehid] > 0 || MaleteroSemillaFlorVeh[vehid] > 0) return true;

    new limiteSlots = MaleteroSlotsVeh[vehid];
    if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
    for(new ms = 0; ms < limiteSlots; ms++) {
        if(MaleteroArmaSlotIdVeh[vehid][ms] > 0 && MaleteroArmaSlotAmmoVeh[vehid][ms] > 0) return true;
    }
    return false;
}

stock ResolverPathCuenta(playerid, dest[], len) {
    new name[MAX_PLAYER_NAME], pathNuevo[64], pathLegacy[64];
    GetPlayerName(playerid, name, sizeof(name));
    format(pathNuevo, sizeof(pathNuevo), PATH_USUARIOS, name);
    format(pathLegacy, sizeof(pathLegacy), PATH_USUARIOS_LEGACY, name);
    if(fexist(pathNuevo)) return format(dest, len, "%s", pathNuevo);
    if(fexist(pathLegacy)) return format(dest, len, "%s", pathLegacy);
    return format(dest, len, "%s", pathNuevo);
}

stock File:AbrirCuentaEscritura(playerid, dest[], len) {
    new name[MAX_PLAYER_NAME], pathNuevo[64], pathLegacy[64];
    GetPlayerName(playerid, name, sizeof(name));
    format(pathNuevo, sizeof(pathNuevo), PATH_USUARIOS, name);
    format(pathLegacy, sizeof(pathLegacy), PATH_USUARIOS_LEGACY, name);

    fcreatedir(DIR_DATA);
    fcreatedir(DIR_USUARIOS);

    new File:h = fopen(pathNuevo, io_write);
    if(h) {
        format(dest, len, "%s", pathNuevo);
        return h;
    }

    fcreatedir(DIR_USUARIOS_LEGACY);
    h = fopen(pathLegacy, io_write);
    if(h) format(dest, len, "%s", pathLegacy);
    return h;
}

stock MigrarArchivoLegacy(const legacyPath[], const newPath[]) {
    if(fexist(newPath) || !fexist(legacyPath)) return 0;

    new File:hSrc = fopen(legacyPath, io_read);
    if(!hSrc) return 0;

    new File:hDst = fopen(newPath, io_write);
    if(!hDst) {
        fclose(hSrc);
        return 0;
    }

    new line[256];
    while(fread(hSrc, line)) fwrite(hDst, line);

    fclose(hDst);
    fclose(hSrc);
    return 1;
}

// ================= [ MAIN & INIT ] =================
main() {
    printf("Server KameHouse");
}

public OnGameModeInit() {
    SetGameModeText("KH 1.0");
    DisableInteriorEnterExits();
    EnableStuntBonusForAll(false);
    UsePlayerPedAnims();
    fcreatedir(DIR_DATA);
    fcreatedir(DIR_USUARIOS);
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
    PuntoPos[puntoVentaSkins][0] = VentaSkinsPos[0];
    PuntoPos[puntoVentaSkins][1] = VentaSkinsPos[1];
    PuntoPos[puntoVentaSkins][2] = VentaSkinsPos[2];
    PuntoPos[puntoMaletero][0] = 2490.0; PuntoPos[puntoMaletero][1] = -1648.0; PuntoPos[puntoMaletero][2] = 13.3;
    PuntoPos[puntoPintura][0] = 2501.0; PuntoPos[puntoPintura][1] = -1648.0; PuntoPos[puntoPintura][2] = 13.3;
    PuntoPos[puntoMinero][0] = PuntoPos[puntoCamionero][0] + 6.0; PuntoPos[puntoMinero][1] = PuntoPos[puntoCamionero][1]; PuntoPos[puntoMinero][2] = PuntoPos[puntoCamionero][2];
    PuntoPos[puntoPrendas][0] = PuntoPos[puntoSemilleria][0] + 6.0; PuntoPos[puntoPrendas][1] = PuntoPos[puntoSemilleria][1]; PuntoPos[puntoPrendas][2] = PuntoPos[puntoSemilleria][2];
    PuntoPos[puntoFacciones][0] = POS_FACCION_X; PuntoPos[puntoFacciones][1] = POS_FACCION_Y; PuntoPos[puntoFacciones][2] = POS_FACCION_Z;
    PuntoPos[puntoTiendaVirtual][0] = PuntoPos[puntoSemilleria][0] + 12.0; PuntoPos[puntoTiendaVirtual][1] = PuntoPos[puntoSemilleria][1]; PuntoPos[puntoTiendaVirtual][2] = PuntoPos[puntoSemilleria][2];
    VentaAutosActiva = true;
    VentaAutosPos[0] = PuntoPos[puntoVentaAutos][0];
    VentaAutosPos[1] = PuntoPos[puntoVentaAutos][1];
    VentaAutosPos[2] = PuntoPos[puntoVentaAutos][2];

    CargarPuntosMovibles();
    MigrarArchivoLegacy(PATH_PRENDAS_LEGACY, PATH_PRENDAS);
    MigrarArchivoLegacy(PATH_EDITMAP_LEGACY, PATH_EDITMAP);
    MigrarArchivoLegacy(PATH_VENTA_AUTOS_LEGACY, PATH_VENTA_AUTOS);
    MigrarArchivoLegacy(PATH_VENTA_SKINS_LEGACY, PATH_VENTA_SKINS);
    MigrarArchivoLegacy(PATH_ARMERIA_LEGACY, PATH_ARMERIA);
    MigrarArchivoLegacy(PATH_TIENDA_VIRTUAL_LEGACY, PATH_TIENDA_VIRTUAL);
    MigrarArchivoLegacy(PATH_FACCIONES_LEGACY, PATH_FACCIONES);
    CargarPrendasConfig();
    CargarVentaAutosConfig();
    CargarVentaSkinsConfig();
    CargarArmeriaConfig();
    CargarTiendaVirtualConfig();
    VentaAutosPos[0] = PuntoPos[puntoVentaAutos][0];
    VentaAutosPos[1] = PuntoPos[puntoVentaAutos][1];
    VentaAutosPos[2] = PuntoPos[puntoVentaAutos][2];

    CrearPuntosFijos();
    ActualizarLabelVentaAutos();
    PuntoPos[puntoVentaSkins][0] = VentaSkinsPos[0];
    PuntoPos[puntoVentaSkins][1] = VentaSkinsPos[1];
    PuntoPos[puntoVentaSkins][2] = VentaSkinsPos[2];
    ActualizarLabelVentaSkins();
    if(BasureroNPC != INVALID_ACTOR_ID) DestroyActor(BasureroNPC);
    BasureroNPC = CreateActor(BASURERO_NPC_SKIN, PuntoPos[puntoBasurero][0], PuntoPos[puntoBasurero][1], PuntoPos[puntoBasurero][2], 180.0);
    CargarRutasBasura();
    CargarMinas();
    CargarHornos();
    CargarCajasLoot();
    CargarPrepiezaPoints();
    CargarEditMap();

    // Cargar casas
    new File:h = fopen(PATH_CASAS, io_read);
    if(h) {
        new str[512];
        while(fread(h, str) && TotalCasas < MAX_CASAS) {
            new idx = 0;
            CasaData[TotalCasas][cX] = floatstr(strtok(str, idx));
            CasaData[TotalCasas][cY] = floatstr(strtok(str, idx));
            CasaData[TotalCasas][cZ] = floatstr(strtok(str, idx));

            new tokenA[32], tokenB[32], ownerTok[MAX_PLAYER_NAME], friendsTok[128];
            format(tokenA, sizeof(tokenA), "%s", strtok(str, idx));
            format(tokenB, sizeof(tokenB), "%s", strtok(str, idx));

            if(strval(tokenA) >= 1 && strval(tokenA) <= 5 && strval(tokenB) > 0) {
                CasaData[TotalCasas][cInteriorSlot] = strval(tokenA);
                CasaData[TotalCasas][cPrecio] = strval(tokenB);
                format(ownerTok, sizeof(ownerTok), "%s", strtok(str, idx));
                format(friendsTok, sizeof(friendsTok), "%s", strtok(str, idx));
            } else {
                CasaData[TotalCasas][cInteriorSlot] = 1;
                CasaData[TotalCasas][cPrecio] = strval(tokenA);
                format(ownerTok, sizeof(ownerTok), "%s", tokenB);
                format(friendsTok, sizeof(friendsTok), "%s", strtok(str, idx));
            }

            strmid(CasaData[TotalCasas][cOwner], ownerTok, 0, MAX_PLAYER_NAME, MAX_PLAYER_NAME);
            strmid(CasaData[TotalCasas][cFriends], friendsTok, 0, 128, 128);

            CasaPickup[TotalCasas] = CreatePickup(strcmp(CasaData[TotalCasas][cOwner], "None") == 0 ? 1273 : 1559, strcmp(CasaData[TotalCasas][cOwner], "None") == 0 ? 2 : 23, CasaData[TotalCasas][cX], CasaData[TotalCasas][cY], CasaData[TotalCasas][cZ], 0);

            new labelstr[64];
            if(!strcmp(CasaData[TotalCasas][cOwner], "None")) {
                format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d\nInt: %s", CasaData[TotalCasas][cPrecio], CasaInteriorNombre[CasaData[TotalCasas][cInteriorSlot] - 1]);
            } else {
                format(labelstr, sizeof(labelstr), "Casa de %s\nInt: %s", CasaData[TotalCasas][cOwner], CasaInteriorNombre[CasaData[TotalCasas][cInteriorSlot] - 1]);
            }
            CasaLabel[TotalCasas] = Create3DTextLabel(labelstr, 0x00FF00FF, CasaData[TotalCasas][cX], CasaData[TotalCasas][cY], CasaData[TotalCasas][cZ] + 0.5, 10.0, 0);
            TotalCasas++;
        }
        fclose(h);
    }

    SetTimer("AutoGuardadoGlobal", 60000, true);
    SetTimer("BajarHambre", 60000, true);
    SetTimer("ChequearLimitesMapa", 1000, true);
    SetTimer("SubirTiempoJugado", 60000, true);
    SetTimer("CheckInactiveVehicles", 10000, true);
    SetTimer("ActualizarTextosHornos", 1000, true);

    InitGasSystem();
    InicializarSistemaFacciones();
    return 1;
}

// ================= [ SISTEMA DE TRABAJO ] =================

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    new bool:presionoY = ((newkeys & KEY_YES) && !(oldkeys & KEY_YES));
    new bool:presionoH = ((newkeys & KEY_CTRL_BACK) && !(oldkeys & KEY_CTRL_BACK));

    if(presionoY && PlayerAdmin[playerid] >= 1) { // Tecla Y (staff)
        if(IsNearVentaAutos(playerid)) return ShowVentaAutosAdminMenu(playerid);
        if(IsNearArmeria(playerid)) return ShowAdminArmasMenu(playerid);
        if(IsNearPrendas(playerid)) return ShowPrendasAdminMenu(playerid);
        if(IsNearVentaSkins(playerid)) return ShowVentaSkinsAdminMenu(playerid);
        if(IsNearTiendaVirtual(playerid)) return MostrarMenuAdminPreciosMembresia(playerid);
    }

    // Teclas B/L deshabilitadas por estabilidad del sistema.

    if(!presionoH) return 1; // Tecla H

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

    if(PlayerInCasa[playerid] != -1) {
        if(CosecharCultivoCercano(playerid)) return 1;
    }

    if(IsNearVentaAutos(playerid)) {
        ShowAdminEditHint(playerid, "venta de autos");
        return ShowVentaAutosBuyMenu(playerid);
    }

    if(IsNearVentaSkins(playerid)) {
        ShowAdminEditHint(playerid, "venta de skins");
        return ShowVentaSkinsBuyMenu(playerid);
    }

    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoFacciones][0], PuntoPos[puntoFacciones][1], PuntoPos[puntoFacciones][2])) {
        return MostrarMenuFaccionesCP(playerid);
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

    if(IsNearTiendaVirtual(playerid)) {
        ShowTiendaVirtualMenu(playerid);
        return 1;
    }

    // Sistema de prendas
    if(IsNearPrendas(playerid)) {
        ShowPrendasMenu(playerid);
        return 1;
    }

    // Sistema de minero
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoMinero][0], PuntoPos[puntoMinero][1], PuntoPos[puntoMinero][2])) {
        if(ContarTrabajosActivos(playerid) >= GetLimiteTrabajosJugador(playerid)) return SendClientMessage(playerid, -1, "Ya alcanzaste tu limite de trabajos activos. Usa /dejartrabajo para liberar un cupo.");
        MineroTrabajando[playerid] = true;
        MineroGPSActivo[playerid] = true;
        SetCheckpointMinaMasCercana(playerid);
        SendClientMessage(playerid, 0x33CCFFFF, "[Minero] Ahora eres minero. Compra un mazo en la Tienda Kame House, usa /mina y sigue el checkpoint.");
        return 1;
    }

    for(new m = 0; m < TotalMinas; m++) {
        if(!MinaData[m][minaActiva]) continue;
        if(!IsPlayerInRangeOfPoint(playerid, 2.5, MinaData[m][minaX], MinaData[m][minaY], MinaData[m][minaZ])) continue;
        if(!MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Debes tomar el trabajo de minero primero.");
        if(!PlayerTieneMazo[playerid] || MazoDurabilidad[playerid] <= 0) return SendClientMessage(playerid, -1, "Necesitas un mazo con durabilidad. Compralo en Tienda Kame House.");
        if(GetTickCount() < MinaCooldownTick[m]) { new left[24], msgcd[120]; FormatTiempoRestante(MinaCooldownTick[m] - GetTickCount(), left, sizeof(left)); format(msgcd, sizeof(msgcd), "[Minero] Mina en cooldown: %s", left); return SendClientMessage(playerid, 0xFFAA00FF, msgcd); }
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
        if(ContarTrabajosActivos(playerid) >= GetLimiteTrabajosJugador(playerid)) return SendClientMessage(playerid, -1, "Ya alcanzaste tu limite de trabajos activos. Usa /dejartrabajo para liberar un cupo.");

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
        if(ContarTrabajosActivos(playerid) >= GetLimiteTrabajosJugador(playerid)) return SendClientMessage(playerid, -1, "Ya alcanzaste tu limite de trabajos activos. Usa /dejartrabajo para liberar un cupo.");

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
        if(ContarTrabajosActivos(playerid) >= GetLimiteTrabajosJugador(playerid)) return SendClientMessage(playerid, -1, "Ya alcanzaste tu limite de trabajos activos. Usa /dejartrabajo para liberar un cupo.");
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
    new bonusMembresia = GetBonusTrabajoMembresia(playerid);
    if(bonusMembresia > 0) pago += bonusMembresia;
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
    format(str, sizeof(str), "{FFD700}[Camionero]{FFFFFF} Pago base:$%d | Nivel:$%d | Distancia:$%d | Bonus membresia:$%d | Total:$%d", pagoBase, pagoNivel, pagoDistancia, bonusMembresia, pago);
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
    new pagoDistancia = floatround(distancia * DISTANCIA_PAGO_PIZZA);
    if(pagoDistancia < 25) pagoDistancia = 25;
    new pagoNivel = nivelPizzero * 40;
    new pago = pagoBase + pagoDistancia + pagoNivel;
    if(pago > 1000) pago = 1000;
    new bonusMembresia = GetBonusTrabajoMembresia(playerid);
    if(bonusMembresia > 0) pago += bonusMembresia;
    GivePlayerMoney(playerid, pago);

    PizzeroEntregas[playerid]++;
    if(PizzeroEntregas[playerid] >= PROGRESO_PIZZERO_POR_NIVEL) {
        PizzeroEntregas[playerid] = 0;
        if(PizzeroNivel[playerid] < NIVEL_MAX_TRABAJO) PizzeroNivel[playerid]++;
        SendClientMessage(playerid, 0xFFFF00FF, "Subiste de nivel en el trabajo Pizzero.");
    }

    new info[160];
    format(info, sizeof(info), "{FF4500}[Pizzero]{FFFFFF} Pago base:$%d | Nivel:$%d | Distancia:$%d | Bonus membresia:$%d | Total:$%d", pagoBase, pagoNivel, pagoDistancia, bonusMembresia, pago);
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
        new prefijo[16];
        GetPrefijoGlobal(playerid, prefijo, sizeof(prefijo));
        if(prefijo[0]) format(string, sizeof(string), "[GLOBAL] %s %s: %s", prefijo, name, cmdtext[idx]);
        else format(string, sizeof(string), "[GLOBAL] %s: %s", name, cmdtext[idx]);
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
            if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL + 10.0, p[0], p[1], p[2])) SendClientMessage(i, 0x33CC33FF, string);
        }
        return 1;
    }

    if(!strcmp(cmd, "/fc", true)) {
        if(PlayerFaccionId[playerid] == -1) return SendClientMessage(playerid, -1, "No perteneces a ninguna faccion.");
        if(!cmdtext[idx]) return SendClientMessage(playerid, -1, "Uso: /fc [mensaje]");
        new fid = PlayerFaccionId[playerid];
        new nombre[MAX_PLAYER_NAME], msg[200];
        GetPlayerName(playerid, nombre, sizeof(nombre));
        format(msg, sizeof(msg), "[RADIO %s] %s: %s", FaccionData[fid][facNombre], nombre, cmdtext[idx]);
        for(new i = 0; i < MAX_PLAYERS; i++) {
            if(IsPlayerConnected(i) && PlayerFaccionId[i] == fid) SendClientMessage(i, FaccionData[fid][facColor], msg);
        }
        return 1;
    }

    if(!strcmp(cmd, "/faccion", true)) {
        if(PlayerFaccionId[playerid] == -1) return SendClientMessage(playerid, -1, "No perteneces a ninguna faccion.");
        if(PlayerFaccionRango[playerid] == FACCION_RANGO_MIEMBRO) return SendClientMessage(playerid, -1, "Solo owner/recluta pueden gestionar la faccion.");
        return MostrarPanelFaccionOwner(playerid);
    }

    if(!strcmp(cmd, "/duda", true)) {
        return ShowPlayerDialog(playerid, DIALOG_DUDA_TEXTO, DIALOG_STYLE_INPUT, "Sistema de Dudas", "Escribe tu duda para enviarla a todos:", "Enviar", "Cancelar");
    }

    if(!strcmp(cmd, "/rd", true)) {
        return ShowPlayerDialog(playerid, DIALOG_RD_TARGET, DIALOG_STYLE_INPUT, "Responder Duda", "Ingresa el ID del jugador que hizo la duda:", "Siguiente", "Cancelar");
    }

    if(!strcmp(cmd, "/anuncio", true)) {
        if(GetPlayerMoney(playerid) < COSTO_ANUNCIO) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para publicar un anuncio ($2000).");
        return ShowPlayerDialog(playerid, DIALOG_ANUNCIO_TEXTO, DIALOG_STYLE_INPUT, "Publicar anuncio", "Escribe el texto del anuncio (max 65).\nCosto por anuncio: $2000", "Publicar", "Cancelar");
    }

    if(!strcmp(cmd, "/telefono", true)) {
        if(!PlayerTieneTelefono[playerid]) return SendClientMessage(playerid, -1, "No tienes un telefono. Compralo en Tienda Kame House por $10000.");
        return ShowTelefonoMenu(playerid);
    }

    if(!strcmp(cmd, "/skills", true)) {
        new str[512];
        format(str, sizeof(str), "{FFFF00}Camionero{FFFFFF} Nivel: {FFFF00}%d/%d\n{FFFF00}Viajes:{FFFFFF} %d/%d\n\n{FF8C00}Pizzero{FFFFFF} Nivel: {FF8C00}%d/%d\n{FF8C00}Entregas:{FFFFFF} %d/%d\n\n{00C853}Basurero{FFFFFF} Nivel: {00C853}%d/%d\n{00C853}Recorridos:{FFFFFF} %d/%d\n\n{99CCFF}Armero{FFFFFF} Nivel: {99CCFF}%d/%d\n{99CCFF}Progreso:{FFFFFF} %d/3", CamioneroNivel[playerid], NIVEL_MAX_TRABAJO, CamioneroViajes[playerid], PROGRESO_CAMIONERO_POR_NIVEL, PizzeroNivel[playerid], NIVEL_MAX_TRABAJO, PizzeroEntregas[playerid], PROGRESO_PIZZERO_POR_NIVEL, BasureroNivel[playerid], NIVEL_MAX_TRABAJO, BasureroRecorridos[playerid], PROGRESO_BASURERO_POR_NIVEL, ArmeroNivel[playerid], NIVEL_MAX_TRABAJO, ArmeroExp[playerid]);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Mis Habilidades", str, "Aceptar", "");
        return 1;
    }

    if(!strcmp(cmd, "/pj", true) || !strcmp(cmd, "/nivel", true)) {
        ExpirarMembresiaSiCorresponde(playerid);
        new nivelActual = GetNivelPJ(playerid);
        new minutosObjetivo = 0;
        for(new n = 1; n <= nivelActual; n++) minutosObjetivo += HORAS_POR_NIVEL_PJ * n * 60;
        new faltanMin = minutosObjetivo - PlayerTiempoJugadoMin[playerid];
        if(faltanMin < 0) faltanMin = 0;
        new horas = faltanMin / 60;
        new mins = faltanMin % 60;

        new body[1024], pagoHora = nivelActual * 500, faccionTexto[32], membresiaTexto[24], vigenciaTexto[48], faccionColorHex[8];
        if(PlayerFaccionId[playerid] != -1) {
            format(faccionTexto, sizeof(faccionTexto), "%s", FaccionData[PlayerFaccionId[playerid]][facNombre]);
            ConvertirColorAHexRGB(FaccionData[PlayerFaccionId[playerid]][facColor], faccionColorHex, sizeof(faccionColorHex));
        } else {
            format(faccionTexto, sizeof(faccionTexto), "Ninguna");
            format(faccionColorHex, sizeof(faccionColorHex), "FFFFFF");
        }

        GetMembresiaNombre(PlayerMembresiaTipo[playerid], membresiaTexto, sizeof(membresiaTexto));
        if(PlayerMembresiaTipo[playerid] == MEMBRESIA_NINGUNA) format(vigenciaTexto, sizeof(vigenciaTexto), "Sin membresia activa");
        else {
            new restanteMs = PlayerMembresiaExpiraTick[playerid] - GetTickCount();
            if(restanteMs < 0) restanteMs = 0;
            new dias = (restanteMs + 86399999) / 86400000;
            format(vigenciaTexto, sizeof(vigenciaTexto), "%d dia(s)", dias);
        }

        new limiteVeh = GetLimiteVehiculosJugador(playerid);
        new limiteMaletero = GetLimiteMaleteroJugador(playerid);
        new limitePrendas = GetLimitePrendasJugador(playerid);
        new limiteTrabajos = GetLimiteTrabajosJugador(playerid);
        new bonusTrabajo = GetBonusTrabajoMembresia(playerid);

        format(body, sizeof(body), "{3399FF}Nivel PJ: {FFFFFF}%d\n{33CCFF}Tiempo jugado: {FFFFFF}%d horas\n{33CCFF}Prox nivel en: {FFFFFF}%dh %dm\n{33CCFF}Pago por hora: {00FF00}$%d\n{33CCFF}Faccion: {%s}%s\n\n{66FFFF}Membresia: {FFFFFF}%s\n{66FFFF}Vigencia: {FFFFFF}%s\n{66FFFF}Diamantes: {FFFFFF}%d\n\n{FFD166}Vehiculos: {FFFFFF}%d/%d\n{FFD166}Plantas en casa: {FFFFFF}%d\n{FFD166}Maletero: {FFFFFF}%d espacios\n{FFD166}Prendas visibles: {FFFFFF}%d\n{FFD166}Trabajos simultaneos: {FFFFFF}%d\n{FFD166}Bonus por trabajo: {00FF00}$%d", nivelActual, PlayerTiempoJugadoMin[playerid] / 60, horas, mins, pagoHora, faccionColorHex, faccionTexto, membresiaTexto, vigenciaTexto, PlayerDiamantes[playerid], ContarAutosJugador(playerid), limiteVeh, GetLimitePlantasJugador(playerid), limiteMaletero, limitePrendas, limiteTrabajos, bonusTrabajo);
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

        new msg[96];
        format(msg, sizeof(msg), "Compraste comida por $%d. Hambre actual: %d/100", PRECIO_COMIDA, PlayerHambre[playerid]);
        SendClientMessage(playerid, 0x00FF00FF, msg);
        ActualizarBarrasEstado(playerid);
        return 1;
    }


    if(!strcmp(cmd, "/tuning", true) || !strcmp(cmd, "/pintar", true)) {
        if(!IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoPintura][0], PuntoPos[puntoPintura][1], PuntoPos[puntoPintura][2])) return SendClientMessage(playerid, -1, "Debes estar en Tuning Kame House.");
        return MostrarMenuTuning(playerid);
    }

    if(!strcmp(cmd, "/mina", true)) {
        if(!MineroTrabajando[playerid]) return SendClientMessage(playerid, -1, "Debes tener el trabajo de minero para usar /mina.");
        if(!SetCheckpointMinaMasCercana(playerid)) return SendClientMessage(playerid, -1, "No hay minas disponibles cercanas en este momento.");
        MineroGPSActivo[playerid] = true;
        return SendClientMessage(playerid, 0x66CCFFFF, "[Minero] GPS de mina activado. Te marcamos la mina disponible mas cercana.");
    }

    if(!strcmp(cmd, "/llenar", true)) {
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes estar sobre tu vehiculo conduciendo.");
        new punto = EncontrarGasCercano(playerid);
        if(punto == -1) return SendClientMessage(playerid, -1, "No estas en una gasolinera.");
        new veh = GetPlayerVehicleID(playerid);
        if(veh == INVALID_VEHICLE_ID) return 1;
        if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 100; }
        if(GasVehiculo[veh] >= 100) return SendClientMessage(playerid, -1, "El tanque ya esta lleno.");
        if(GasRefuelTimer[playerid] != -1) return SendClientMessage(playerid, -1, "Ya estas llenando el tanque de gasolina.");
        new faltante = 100 - GasVehiculo[veh];
        if(faltante <= 0) return SendClientMessage(playerid, -1, "El tanque ya esta lleno.");
        new costo = faltante * GAS_PRECIO_POR_PUNTO;
        if(GetPlayerMoney(playerid) < costo) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para llenar el tanque.");
        new segundos = floatround(float(faltante) / 10.0, floatround_ceil);
        if(segundos < 1) segundos = 1;
        if(segundos > 10) segundos = 10;
        TogglePlayerControllable(playerid, false);
        GasRefuelVeh[playerid] = veh;
        GasRefuelCost[playerid] = costo;
        GasRefuelTimer[playerid] = SetTimerEx("FinalizarRepostaje", segundos * 1000, false, "d", playerid);
        new tx[140];
        format(tx, sizeof(tx), "Llenando tanque de gasolina: %.0f litros... espera %d segundo(s). Costo: $%d.", float(faltante), segundos, costo);
        SendClientMessage(playerid, 0xFFCC00FF, tx);
        EnviarEntornoAccion(playerid, "detiene su vehiculo en la gasolinera y comienza a llenar el tanque.");
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
        format(inv, sizeof(inv), "{66FF66}Hierba:{FFFFFF} %d\n{FF66CC}Flor:{FFFFFF} %d\n{A9A9A9}Hierro:{FFFFFF} %d\n{B87333}Cobre:{FFFFFF} %d\n{C0C0C0}Piedra:{FFFFFF} %d\n{8B4513}Madera:{FFFFFF} %d\n{FFD700}Polvora:{FFFFFF} %d\n{555555}Carbon:{FFFFFF} %d\n{99CCFF}Prepiezas:{FFFFFF} %d\n{99FF99}Dinero:{FFFFFF} $%d\n{66CC66}Banco:{FFFFFF} $%d\n{FFCC66}Mazo:{FFFFFF} %d%%", InvHierba[playerid], InvFlor[playerid], InvHierroMineral[playerid], InvCobre[playerid], InvPiedra[playerid], InvMadera[playerid], InvPolvora[playerid], InvCarbon[playerid], InvPrepieza[playerid], GetPlayerMoney(playerid), PlayerBankMoney[playerid], PlayerTieneMazo[playerid] ? mazoPct : 0);
        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Inventario", inv, "Cerrar", "");
        return 1;
    }

    if(!strcmp(cmd, "/plantar", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes plantar dentro de una casa.");
        if(PlantasColocadas[playerid] >= GetLimitePlantasJugador(playerid)) {
            new aviso[96];
            format(aviso, sizeof(aviso), "Limite alcanzado: maximo %d plantas segun tu membresia.", GetLimitePlantasJugador(playerid));
            return SendClientMessage(playerid, -1, aviso);
        }
        ShowPlayerDialog(playerid, DIALOG_PLANTAR, DIALOG_STYLE_LIST, "Plantar", "Hierba verde\nFlores", "Plantar", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/cosehar", true) || !strcmp(cmd, "/cosechar", true)) {
        return SendClientMessage(playerid, -1, "Ahora se cosecha con la tecla H cerca de la planta lista.");
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
            MineroGPSActivo[playerid] = false;
            DisablePlayerCheckpoint(playerid);
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

    if(!strcmp(cmd, "/gps", true)) return SendClientMessage(playerid, -1, "El GPS ahora solo se usa desde /telefono.");

    if(!strcmp(cmd, "/ayuda", true)) {
        ShowPlayerDialog(playerid, DIALOG_AYUDA_CATEGORIA, DIALOG_STYLE_LIST, "Ayuda por categorias", "General\nTrabajos\nSistemas\nMembresias\nRol y reglas", "Ver", "Cerrar");
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
        if(MaleteroOwner[vehid] == -1) MaleteroOwner[vehid] = playerid;
        if(MaleteroSlotsVeh[vehid] < 1 || MaleteroSlotsVeh[vehid] > MAX_SLOTS_MALETERO) {
            MaleteroSlotsVeh[vehid] = (PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) ? 15 : ((PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) ? 7 : 5);
        }
        new WEAPON:arma = GetPlayerWeapon(playerid);
        if(_:arma <= 0 || _:arma >= MAX_WEAPON_ID_GM) return SendClientMessage(playerid, -1, "Debes tener un arma en mano.");
        new ammo = GetPlayerAmmo(playerid);
        if(ammo <= 0) ammo = PlayerAmmoInventario[playerid][_:arma];
        if(ammo <= 0) return SendClientMessage(playerid, -1, "No tienes municion en esa arma.");

        new slotLibre = -1;
        new limiteSlots = MaleteroSlotsVeh[vehid];
        if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
        new limiteMembresiaMaletero = GetLimiteMaleteroJugador(playerid);
        if(limiteSlots > limiteMembresiaMaletero) limiteSlots = limiteMembresiaMaletero;
        for(new i = 0; i < limiteSlots; i++) {
            if(MaleteroArmaSlotIdVeh[vehid][i] <= 0 || MaleteroArmaSlotAmmoVeh[vehid][i] <= 0) {
                slotLibre = i;
                break;
            }
        }
        if(slotLibre == -1) return SendClientMessage(playerid, -1, "Maletero lleno.");

        MaleteroArmaSlotIdVeh[vehid][slotLibre] = _:arma;
        MaleteroArmaSlotAmmoVeh[vehid][slotLibre] = ammo;
        MaleteroArmasVeh[vehid][_:arma] += ammo;

        ResetPlayerWeapons(playerid);
        PlayerAmmoInventario[playerid][_:arma] = 0;
        PlayerArmaComprada[playerid][_:arma] = false;
        for(new w = 1; w < MAX_WEAPON_ID_GM; w++) {
            if(PlayerArmaComprada[playerid][w] && PlayerAmmoInventario[playerid][w] > 0) GivePlayerWeapon(playerid, WEAPON:w, PlayerAmmoInventario[playerid][w]);
        }

        GuardarCuenta(playerid);
        GuardarFacciones();
        SendClientMessage(playerid, 0x00FF00FF, "Arma guardada en el maletero.");
        return 1;
    }

    if(!strcmp(cmd, "/llave", true)) {
        new vehid = IsPlayerInAnyVehicle(playerid) ? GetPlayerVehicleID(playerid) : GetNearbyOwnedVehicle(playerid);
        if(vehid == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No hay vehiculo valido cerca.");
        if(!PlayerTieneAccesoVehiculo(playerid, vehid)) return SendClientMessage(playerid, -1, "No tienes llaves de este vehiculo.");
        VehLocked[vehid] = !VehLocked[vehid];
        if(VehLocked[vehid]) {
            SendClientMessage(playerid, 0xFFAA00FF, "Vehiculo bloqueado.");
            EnviarEntornoAccion(playerid, "saca una llave de su bolsillo y asegura la puerta del vehiculo.");
        } else {
            SendClientMessage(playerid, 0x00FF00FF, "Vehiculo desbloqueado.");
            EnviarEntornoAccion(playerid, "saca una llave de su bolsillo y quita el seguro de la puerta del vehiculo.");
        }
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
        EnviarEntornoAccion(playerid, "entrega una copia de llave temporal para un vehiculo.");
        SendClientMessage(id, 0x00FF00FF, "Recibiste acceso temporal a un vehiculo con /llave.");
        return 1;
    }

    if(!strcmp(cmd, "/comprar", true)) {
        new casa = GetClosestCasa(playerid);
        if(casa == -1) return SendClientMessage(playerid, -1, "No estas cerca de una casa.");
        if(strcmp(CasaData[casa][cOwner], "None") != 0) return SendClientMessage(playerid, -1, "Esta casa no esta en venta.");
        new limiteCasas = GetLimiteCasasJugador(playerid);
        if(ContarCasasJugador(playerid) >= limiteCasas) {
            new aviso[96];
            format(aviso, sizeof(aviso), "Tu membresia actual te permite %d casa(s).", limiteCasas);
            return SendClientMessage(playerid, -1, aviso);
        }
        if(GetPlayerMoney(playerid) < CasaData[casa][cPrecio]) return SendClientMessage(playerid, -1, "No tienes suficiente dinero.");
        GivePlayerMoney(playerid, -CasaData[casa][cPrecio]);
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof(name));
        strmid(CasaData[casa][cOwner], name, 0, strlen(name)+1, MAX_PLAYER_NAME);
        CasaData[casa][cFriends][0] = EOS;
        new labelstr[64];
        format(labelstr, sizeof(labelstr), "Casa de %s\nInt: %s", name, CasaInteriorNombre[CasaData[casa][cInteriorSlot] - 1]);
        Update3DTextLabelText(CasaLabel[casa], 0x00FF00FF, labelstr);
        if(CasaPickup[casa] != 0) DestroyPickup(CasaPickup[casa]);
        CasaPickup[casa] = CreatePickup(1559, 23, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ], 0);
        SendClientMessage(playerid, 0x00FF00FF, "Casa comprada exitosamente.");
        EnviarEntornoAccion(playerid, "firma papeles y compra una propiedad de la ciudad.");
        GuardarCasas();
        return 1;
    }


    if(!strcmp(cmd, "/crearbanda", true) || !strcmp(cmd, "/borrarbanda", true)) {
        return SendClientMessage(playerid, -1, "El sistema de Bandas fue eliminado de esta gamemode.");
    }




    if(!EsStaff(playerid)) return SendClientMessage(playerid, 0xFF4444FF, "[SEERVER] Comando no encontrado en Kame House RP");

    if(!strcmp(cmd, "/crearparada", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
        return SendClientMessage(playerid, -1, "Acercate al concesionario y usa la tecla Y para editar el catalogo.");
    }

    if(!strcmp(cmd, "/kick", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
        new tmp[32], id, razon[64];
        format(tmp, 32, "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /kick [id] [razon]");
        id = strval(tmp);
        format(razon, 64, "%s", cmdtext[idx]);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        new str[128], n1[24], n2[24];
        GetPlayerName(playerid, n1, 24); GetPlayerName(id, n2, 24);
        format(str, 128, "SERVER: %s expulso a %s. Razon: %s", n1, n2, razon);
        SendClientMessageToAll(0xFF0000FF, str);
        Kick(id);
        return 1;
    }

    if(!strcmp(cmd, "/dardinero", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        format(str, sizeof(str), "SERVER: %s dio $%d a %s.", n1, monto, n2);
        SendClientMessageToAll(0x00FF00FF, str);
        return 1;
    }

    if(!strcmp(cmd, "/dararma", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        return SendClientMessage(playerid, -1, "Acercate a la armeria y usa la tecla Y para editar armas.");
    }

    if(!strcmp(cmd, "/admm", true)) {
        if(EsDueno(playerid)) return MostrarDialogoAdmin(playerid);
        if(EsModerador(playerid)) return MostrarDialogoMod(playerid);
        return SendClientMessage(playerid, -1, "No eres staff.");
    }

    if(!strcmp(cmd, "/reglas", true)) {
        return ShowReglasDialog(playerid);
    }

    if(!strcmp(cmd, "/editmp", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
        return ShowEditMapMenu(playerid);
    }

    if(!strcmp(cmd, "/crearmina", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(TotalHornos >= MAX_HORNOS) return SendClientMessage(playerid, -1, "Limite de hornos alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        HornoData[TotalHornos][hornoActivo] = true; HornoData[TotalHornos][hornoX] = x; HornoData[TotalHornos][hornoY] = y; HornoData[TotalHornos][hornoZ] = z;
        HornoData[TotalHornos][hornoObj] = CreateObject(19831, x, y, z - 1.0, 0.0, 0.0, 0.0);
        HornoData[TotalHornos][hornoLabel] = Create3DTextLabel("Horno\nUsa H", 0xFFAA00FF, x, y, z + 0.8, 12.0, 0); HornoData[TotalHornos][hornoListoRetiro] = false; HornoData[TotalHornos][hornoEnUso] = false; HornoData[TotalHornos][hornoOwner] = INVALID_PLAYER_ID;
        TotalHornos++; GuardarHornos();
        return SendClientMessage(playerid, 0x00FF00FF, "Horno creado.");
    }

    if(!strcmp(cmd, "/crearcaja", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(TotalCajas >= MAX_CAJAS) return SendClientMessage(playerid, -1, "Limite de cajas alcanzado.");
        new Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
        CajaDataLoot[TotalCajas][cajaActiva] = true; CajaDataLoot[TotalCajas][cajaX] = x; CajaDataLoot[TotalCajas][cajaY] = y; CajaDataLoot[TotalCajas][cajaZ] = z + 0.25;
        CajaDataLoot[TotalCajas][cajaObj] = CreateObject(2358, x, y, z - 0.75, 0.0, 0.0, 0.0);
        CajaDataLoot[TotalCajas][cajaLabel] = Create3DTextLabel("Caja de busqueda\nUsa H", 0xFFFFFFFF, x, y, z + 0.7, 10.0, 0);
        TotalCajas++; GuardarCajasLoot();
        return SendClientMessage(playerid, 0x00FF00FF, "Caja creada.");
    }

    if(!strcmp(cmd, "/crearprepiezas", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        ShowPrendasAdminMenu(playerid);
        return 1;
    }

    if(!strcmp(cmd, "/mover", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        ShowPlayerDialog(playerid, DIALOG_MOVER_MENU, DIALOG_STYLE_LIST, "Mover iconos y puntos", "Trabajo Camionero\nPizzeria\nTrabajo Basurero\nDeposito de Carga\nBanco\nTienda Kame House\nArmeria\nVenta de autos\nVenta de skins\nTuning Kame House\nTrabajo Minero\nPrendas Kame House\nFacciones Kame House\nTienda Virtual Kame House", "Mover aqui", "Cerrar");
        return 1;
    }

    if(!strcmp(cmd, "/tp", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
        if(AdminMapPos[playerid][0] == 0.0) return SendClientMessage(playerid, -1, "Marca el mapa.");
        SetPlayerPos(playerid, AdminMapPos[playerid][0], AdminMapPos[playerid][1], AdminMapPos[playerid][2]);
        return 1;
    }

    if(!strcmp(cmd, "/ir", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
        new tmp[32], id;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /ir [id]");
        id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        new Float:p[3]; GetPlayerPos(id, p[0], p[1], p[2]);
        SetPlayerPos(playerid, p[0], p[1], p[2]+1.5);
        return 1;
    }

    if(!strcmp(cmd, "/traer", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new tmp[32], id;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /kill [id]");
        id = strval(tmp);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        SetPlayerHealth(id, 0.0);
        return 1;
    }

    if(!strcmp(cmd, "/cord", true)) {
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new Float:x, Float:y, Float:z, str[128];
        GetPlayerPos(playerid, x, y, z);
        format(str, sizeof(str), "Coords: %.4f %.4f %.4f", x, y, z);
        SendClientMessage(playerid, 0x00FFFFFF, str);
        return 1;
    }

    if(!strcmp(cmd, "/sacarveh", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
        new tmp[32], modelo;
        format(tmp, sizeof(tmp), "%s", strtok(cmdtext, idx));
        if(!tmp[0]) return SendClientMessage(playerid, -1, "Uso: /sacarveh [modelo GTA 400-611]");
        modelo = strval(tmp);
        if(modelo < 400 || modelo > 611) return SendClientMessage(playerid, -1, "Modelo invalido. Usa un modelo GTA entre 400 y 611.");

        new Float:px, Float:py, Float:pz, Float:ang;
        GetPlayerPos(playerid, px, py, pz);
        GetPlayerFacingAngle(playerid, ang);

        new Float:sx = px + (3.0 * floatsin(-ang, degrees));
        new Float:sy = py + (3.0 * floatcos(-ang, degrees));
        new c1 = random(126), c2 = random(126);
        new veh = CreateVehicle(modelo, sx, sy, pz, ang, c1, c2, -1);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No se pudo crear el vehiculo. Intenta nuevamente.");

        VehOwner[veh] = -1;
        VehLocked[veh] = false;
        VehOculto[veh] = false;
        VehLastUseTick[veh] = GetTickCount();
        VehModelData[veh] = modelo;
        VehColor1Data[veh] = c1;
        VehColor2Data[veh] = c2;
        VehPosData[veh][0] = sx;
        VehPosData[veh][1] = sy;
        VehPosData[veh][2] = pz;
        VehPosData[veh][3] = ang;
        VehTempVanilla[veh] = true;
        GasInitVehiculo[veh] = true;
        GasVehiculo[veh] = 100;
        ResetMaleteroVehiculo(veh);

        new msg[120];
        new ident[96];
        FormatearVehiculoIdentificador(veh, ident, sizeof(ident));
        format(msg, sizeof(msg), "Vehiculo creado: %s. Se elimina solo tras 5 min sin uso.", ident);
        SendClientMessage(playerid, 0x66FF66FF, msg);
        return 1;
    }

    if(!strcmp(cmd, "/rc", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
        if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "Debes conducir un vehiculo.");
        new veh = GetPlayerVehicleID(playerid);
        RepairVehicle(veh);
        SetVehicleHealth(veh, 1000.0);
        SendClientMessage(playerid, 0x66FF66FF, "Vehiculo reparado: carroceria y motor al 1000.");
        return 1;
    }

    if(!strcmp(cmd, "/fly", true)) {
        if(!EsStaff(playerid)) return SendClientMessage(playerid, -1, "No eres staff.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres admin.");
        if(TotalCasas >= MAX_CASAS) return SendClientMessage(playerid, -1, "Maximo de casas alcanzado.");
        return ShowCrearCasaInteriorDialog(playerid);
    }

    if(!strcmp(cmd, "/salir", true)) {
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "No estas en una casa.");
        new casa = PlayerInCasa[playerid];
        PlayerInCasa[playerid] = -1;
        CasaInteriorPendiente[playerid] = -1;
        SetPlayerPos(playerid, CasaData[casa][cX], CasaData[casa][cY], CasaData[casa][cZ] + 1.0);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        SetCameraBehindPlayer(playerid);
        SendClientMessage(playerid, -1, "Has salido de la casa.");
        EnviarEntornoAccion(playerid, "abre la puerta y sale de su vivienda.");
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
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
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
            CasaData[i][cInteriorSlot] = CasaData[i + 1][cInteriorSlot];
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
            }
        }

        // Recrear pickups/labels con indices y mundos correctos
        for(new i = 0; i < TotalCasas; i++) {
            CasaPickup[i] = CreatePickup(strcmp(CasaData[i][cOwner], "None") == 0 ? 1273 : 1559, strcmp(CasaData[i][cOwner], "None") == 0 ? 2 : 23, CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ], 0);

            new labelstr[64];
            if(!strcmp(CasaData[i][cOwner], "None")) format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d\nInt: %s", CasaData[i][cPrecio], CasaInteriorNombre[CasaData[i][cInteriorSlot] - 1]);
            else format(labelstr, sizeof(labelstr), "Casa de %s\nInt: %s", CasaData[i][cOwner], CasaInteriorNombre[CasaData[i][cInteriorSlot] - 1]);
            CasaLabel[i] = Create3DTextLabel(labelstr, 0x00FF00FF, CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ] + 0.5, 10.0, 0);

        }

        GuardarCasas();
        SendClientMessage(playerid, 0x00FF00FF, "Casa eliminada correctamente.");
        return 1;
    }

    return SendClientMessage(playerid, 0xFF4444FF, "[SEERVER] Comando no encontrado en Kame House RP");
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

    new interiorid;
    new Float:intX, Float:intY, Float:intZ;
    if(!GetCasaInteriorData(CasaData[casa][cInteriorSlot], interiorid, intX, intY, intZ)) {
        interiorid = 10;
        intX = CasaInteriorPos[0][0];
        intY = CasaInteriorPos[0][1];
        intZ = CasaInteriorPos[0][2];
    }

    SetPlayerPos(playerid, intX, intY, intZ);
    SetPlayerInterior(playerid, interiorid);
    SetPlayerVirtualWorld(playerid, casa + 1);
    SetCameraBehindPlayer(playerid);
    SendClientMessage(playerid, -1, "Has entrado a la casa. Aqui puedes usar /comer y descansar.");
    return 1;
}


stock bool:GetCasaInteriorData(slot, &interiorid, &Float:px, &Float:py, &Float:pz) {
    if(slot < 1 || slot > 5) return false;
    new idx = slot - 1;
    interiorid = CasaInteriorJuegoID[idx];
    px = CasaInteriorPos[idx][0];
    py = CasaInteriorPos[idx][1];
    pz = CasaInteriorPos[idx][2];
    return true;
}

stock ShowCrearCasaInteriorDialog(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_CREAR_CASA_INTERIOR, DIALOG_STYLE_INPUT,
        "Crear casa",
        "1) Safe House 1 (ID 10)\n2) Safe House 4 (ID 1)\n3) Vank Hoff Hotel (ID 5)\n4) Willowfield safehouse (ID 11)\n5) Unknown safe house (ID 9)\n\nIngresa el numero de interior (1-5):",
        "Siguiente", "Cancelar");
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

stock LimpiarLinea(line[]) {
    new len = strlen(line);
    while(len > 0 && line[len - 1] <= ' ') {
        line[len - 1] = EOS;
        len--;
    }
    return 1;
}

stock sscanf_manual(const string[], &Float:x, &Float:y, &Float:z) {
    new idx = 0;
    x = floatstr(strtok(string, idx));
    y = floatstr(strtok(string, idx));
    z = floatstr(strtok(string, idx));
}

stock bool:EsDueno(playerid) { return PlayerAdmin[playerid] == RANGO_DUENO; }
stock bool:EsModerador(playerid) { return PlayerAdmin[playerid] == RANGO_MOD; }
stock bool:EsStaff(playerid) { return PlayerAdmin[playerid] == RANGO_DUENO || PlayerAdmin[playerid] == RANGO_MOD; }

stock GetPrefijoGlobal(playerid, prefijo[], len) {
    if(EsDueno(playerid)) format(prefijo, len, "[Owner]");
    else if(EsModerador(playerid)) format(prefijo, len, "[MOD]");
    else prefijo[0] = EOS;
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
    AdminMapPos[playerid][0] = fX; AdminMapPos[playerid][1] = fY; AdminMapPos[playerid][2] = fZ;
    if(PlayerAdmin[playerid] >= 1) SendClientMessage(playerid, -1, "{FFFF00}Punto marcado. Usa /tp para ir al punto.");
    return 1;
}

public OnPlayerText(playerid, text[]) {
    if(!IsPlayerLoggedIn[playerid]) return 0;
    new string[144], name[MAX_PLAYER_NAME], Float:p[3];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerPos(playerid, p[0], p[1], p[2]);
    new prefijo[16];
    GetPrefijoGlobal(playerid, prefijo, sizeof(prefijo));
    if(prefijo[0]) format(string, sizeof(string), "%s %s dice: %s", prefijo, name, text);
    else format(string, sizeof(string), "%s dice: %s", name, text);
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL, p[0], p[1], p[2])) SendClientMessage(i, -1, string);
    }
    return 0;
}

public OnPlayerConnect(playerid) {
    new nombreJugador[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nombreJugador, sizeof(nombreJugador));
    if(!NombreRoleplayValido(nombreJugador)) {
        SendClientMessage(playerid, 0xFF4444FF, "Debes usar formato Nombre_Apellido para jugar (ej: Juan_Perez).");
        SendClientMessage(playerid, 0xFF4444FF, "Cambia tu nombre antes de registrarte para evitar nombres antirol.");
        return Kick(playerid);
    }

    IsPlayerLoggedIn[playerid] = false;
    TogglePlayerSpectating(playerid, true);
    TogglePlayerControllable(playerid, false);
    PlayerHambre[playerid] = 100;
    UltimoControlArmaProhibidaTick[playerid] = 0;

    BarraHambreFondo[playerid] = CreatePlayerTextDraw(playerid, 286.0, 409.0, "_");
    PlayerTextDrawLetterSize(playerid, BarraHambreFondo[playerid], 0.0, 0.55);
    PlayerTextDrawTextSize(playerid, BarraHambreFondo[playerid], 326.0, 0.0);
    PlayerTextDrawAlignment(playerid, BarraHambreFondo[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraHambreFondo[playerid], 0x00000099);
    PlayerTextDrawUseBox(playerid, BarraHambreFondo[playerid], true);
    PlayerTextDrawBoxColour(playerid, BarraHambreFondo[playerid], 0x00000099);
    PlayerTextDrawFont(playerid, BarraHambreFondo[playerid], TEXT_DRAW_FONT_1);

    TextoBarraHambre[playerid] = CreatePlayerTextDraw(playerid, 272.0, 408.4, "H");
    PlayerTextDrawLetterSize(playerid, TextoBarraHambre[playerid], 0.16, 0.62);
    PlayerTextDrawAlignment(playerid, TextoBarraHambre[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TextoBarraHambre[playerid], 0xFFFFFFFF);
    PlayerTextDrawFont(playerid, TextoBarraHambre[playerid], TEXT_DRAW_FONT_1);

    BarraHambre[playerid] = CreatePlayerTextDraw(playerid, 286.0, 409.0, "_");
    PlayerTextDrawLetterSize(playerid, BarraHambre[playerid], 0.0, 0.55);
    PlayerTextDrawTextSize(playerid, BarraHambre[playerid], 326.0, 0.0);
    PlayerTextDrawAlignment(playerid, BarraHambre[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraHambre[playerid], COLOR_HAMBRE);
    PlayerTextDrawUseBox(playerid, BarraHambre[playerid], true);
    PlayerTextDrawBoxColour(playerid, BarraHambre[playerid], COLOR_HAMBRE);
    PlayerTextDrawFont(playerid, BarraHambre[playerid], TEXT_DRAW_FONT_1);

    TextoBarraGas[playerid] = CreatePlayerTextDraw(playerid, 269.0, 417.2, "Gas");
    PlayerTextDrawLetterSize(playerid, TextoBarraGas[playerid], 0.16, 0.62);
    PlayerTextDrawAlignment(playerid, TextoBarraGas[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, TextoBarraGas[playerid], 0xFFFFFFFF);
    PlayerTextDrawFont(playerid, TextoBarraGas[playerid], TEXT_DRAW_FONT_1);

    BarraGasFondo[playerid] = CreatePlayerTextDraw(playerid, 286.0, 418.0, "_");
    PlayerTextDrawLetterSize(playerid, BarraGasFondo[playerid], 0.0, 0.55);
    PlayerTextDrawTextSize(playerid, BarraGasFondo[playerid], 326.0, 0.0);
    PlayerTextDrawAlignment(playerid, BarraGasFondo[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraGasFondo[playerid], 0x00000099);
    PlayerTextDrawUseBox(playerid, BarraGasFondo[playerid], true);
    PlayerTextDrawBoxColour(playerid, BarraGasFondo[playerid], 0x00000099);
    PlayerTextDrawFont(playerid, BarraGasFondo[playerid], TEXT_DRAW_FONT_1);

    BarraGas[playerid] = CreatePlayerTextDraw(playerid, 286.0, 418.0, "_");
    PlayerTextDrawLetterSize(playerid, BarraGas[playerid], 0.0, 0.55);
    PlayerTextDrawTextSize(playerid, BarraGas[playerid], 326.0, 0.0);
    PlayerTextDrawAlignment(playerid, BarraGas[playerid], TEXT_DRAW_ALIGN_LEFT);
    PlayerTextDrawColour(playerid, BarraGas[playerid], COLOR_GAS);
    PlayerTextDrawUseBox(playerid, BarraGas[playerid], true);
    PlayerTextDrawBoxColour(playerid, BarraGas[playerid], COLOR_GAS);
    PlayerTextDrawFont(playerid, BarraGas[playerid], TEXT_DRAW_FONT_1);

    AnuncioTextDraw[playerid] = CreatePlayerTextDraw(playerid, 635.0, 218.0, "~w~");
    PlayerTextDrawLetterSize(playerid, AnuncioTextDraw[playerid], 0.19, 0.95);
    PlayerTextDrawAlignment(playerid, AnuncioTextDraw[playerid], TEXT_DRAW_ALIGN_RIGHT);
    PlayerTextDrawColour(playerid, AnuncioTextDraw[playerid], 0xFFFFFFFF);
    PlayerTextDrawBackgroundColour(playerid, AnuncioTextDraw[playerid], 0x00000000);
    PlayerTextDrawFont(playerid, AnuncioTextDraw[playerid], TEXT_DRAW_FONT_1);
    PlayerTextDrawSetProportional(playerid, AnuncioTextDraw[playerid], true);
    PlayerTextDrawUseBox(playerid, AnuncioTextDraw[playerid], false);
    PlayerTextDrawBoxColour(playerid, AnuncioTextDraw[playerid], 0x00000000);
    PlayerTextDrawTextSize(playerid, AnuncioTextDraw[playerid], 635.0, 0.0);
    AnuncioTimerOcultar[playerid] = -1;
    PlayerInCasa[playerid] = -1;
    CasaInteriorPendiente[playerid] = -1;
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
    AdminModoDios[playerid] = false;
    PlayerDiamantes[playerid] = 0;
    PlayerMembresiaTipo[playerid] = MEMBRESIA_NINGUNA;
    PlayerMembresiaExpiraTick[playerid] = 0;
    AdminMembresiaTipoPendiente[playerid] = MEMBRESIA_NINGUNA;
    AdminMembresiaTargetPendiente[playerid] = -1;
    AdminPrecioVipDineroPendiente[playerid] = 0;
    format(PlayerCorreo[playerid], sizeof(PlayerCorreo[]), "");
    GasRefuelTimer[playerid] = -1;
    GasRefuelVeh[playerid] = INVALID_VEHICLE_ID;
    GasRefuelCost[playerid] = 0;
    BidonGasolina[playerid] = 0;
    UltimoVehiculoGasMostrado[playerid] = INVALID_VEHICLE_ID;
    UltimoAvisoGasCeroTick[playerid] = 0;
    AdminSkinTargetPendiente[playerid] = -1;
    AdminVidaChalecoTipoPendiente[playerid] = 0;
    AdminVidaChalecoTargetPendiente[playerid] = -1;
    PlayerTieneTelefono[playerid] = false;
    TelefonoMensajeDestino[playerid] = -1;
    CalcValor1Pendiente[playerid] = 0.0;
    CalcOperacionPendiente[playerid] = 0;
    TelefonoVehiculoSeleccionado[playerid] = INVALID_VEHICLE_ID;
    AdminFlyActivo[playerid] = false;
    GPSVehiculoSeleccionado[playerid] = INVALID_VEHICLE_ID;
    EditMapEditandoSlot[playerid] = -1;
    EditMapListaSlotSeleccionado[playerid] = -1;
    EditMapModeloPendiente[playerid] = 0;
    PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
    PlayerSancionado[playerid] = false;
    SancionConcepto[playerid] = 0;
    SancionAdminIdPendiente[playerid] = -1;
    UnsanTargetPendiente[playerid] = -1;
    BandaSpawnBorrarPendiente[playerid] = -1;
    MineroGPSActivo[playerid] = false;
    OmitirArmasEnProximoSpawn[playerid] = false;
    PlayerFaccionId[playerid] = -1;
    PlayerFaccionRango[playerid] = 0;
    InvitacionFaccionId[playerid] = -1;
    InvitacionFaccionOwner[playerid] = -1;
    FaccionCrearColorPendiente[playerid] = -1;
    FaccionCrearCompraColor[playerid] = false;
    FaccionAdminSeleccion[playerid] = -1;
    SancionFinTick[playerid] = 0;
    SancionPos[playerid][0] = 0.0;
    SancionPos[playerid][1] = 0.0;
    SancionPos[playerid][2] = 0.0;
    SancionPrevVW[playerid] = 0;
    SancionPrevInterior[playerid] = 0;
    SancionLabel[playerid] = Text3D:-1;
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
    for(new pi = 0; pi < MAX_PRENDAS; pi++) {
        PlayerPrendaComprada[playerid][pi] = 0;
        PlayerPrendaActiva[playerid][pi] = 0;
        PlayerPrendaBone[playerid][pi] = 0;
        PlayerPrendaOffX[playerid][pi] = 0.0; PlayerPrendaOffY[playerid][pi] = 0.0; PlayerPrendaOffZ[playerid][pi] = 0.0;
        PlayerPrendaRotX[playerid][pi] = 0.0; PlayerPrendaRotY[playerid][pi] = 0.0; PlayerPrendaRotZ[playerid][pi] = 0.0;
        PlayerPrendaScaleX[playerid][pi] = 0.0; PlayerPrendaScaleY[playerid][pi] = 0.0; PlayerPrendaScaleZ[playerid][pi] = 0.0;
        PlayerPrendaModelo[playerid][pi] = 0;
        format(PlayerPrendaNombre[playerid][pi], 32, "");
        RemovePlayerAttachedObject(playerid, pi);
    }

    new path[64];
    ResolverPathCuenta(playerid, path, sizeof(path));
    if(fexist(path)) ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{33CCFF}Kame House - Login", "{FFFFFF}Bienvenido de nuevo a {66CCFF}Kame House{FFFFFF}.\n\n{AAAAAA}Ingresa tu clave para continuar:", "Entrar", "Salir");
    else ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{66FF99}Kame House - Registro", "{FFFFFF}Bienvenido a {66CCFF}Kame House{FFFFFF}.\n\n{AAAAAA}Crea una clave para tu cuenta:", "Registrar", "Salir");
    ActualizarNivelPJ(playerid);
    return 1;
}

public OnPlayerSpawn(playerid) {
    if(!IsPlayerLoggedIn[playerid]) return Kick(playerid);
    ExpirarMembresiaSiCorresponde(playerid);
    ActualizarBeneficiosMembresia(playerid);
    SetPlayerSkin(playerid, PlayerSkinGuardada[playerid]);
    SetDefaultCJAnimations(playerid);
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
    if(PlayerSancionado[playerid]) {
        SetPlayerPos(playerid, SancionPos[playerid][0], SancionPos[playerid][1], SancionPos[playerid][2]);
        TogglePlayerControllable(playerid, false);
    }
    SetCameraBehindPlayer(playerid);
    for(new pi = 0; pi < MAX_PRENDAS; pi++) {
        RemovePlayerAttachedObject(playerid, pi);
        if(PlayerPrendaComprada[playerid][pi] && PlayerPrendaActiva[playerid][pi]) AplicarPrendaJugador(playerid, pi);
    }
    ActualizarLabelJugadorFaccion(playerid, true);
    if(!OmitirArmasEnProximoSpawn[playerid]) {
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) {
            if(PlayerArmaComprada[playerid][w] && PlayerAmmoInventario[playerid][w] > 0) GivePlayerWeapon(playerid, WEAPON:w, PlayerAmmoInventario[playerid][w]);
        }
    }
    OmitirArmasEnProximoSpawn[playerid] = false;
    InvitacionFaccionId[playerid] = -1;
    InvitacionFaccionOwner[playerid] = -1;
    FaccionCrearColorPendiente[playerid] = -1;
    FaccionCrearCompraColor[playerid] = false;
    FaccionAdminSeleccion[playerid] = -1;
    ActualizarBarrasEstado(playerid);
    PlayerTextDrawShow(playerid, TextoBarraHambre[playerid]);
    PlayerTextDrawShow(playerid, BarraHambreFondo[playerid]);
    PlayerTextDrawShow(playerid, BarraHambre[playerid]);
    PlayerTextDrawShow(playerid, TextoBarraGas[playerid]);
    PlayerTextDrawShow(playerid, BarraGasFondo[playerid]);
    PlayerTextDrawHide(playerid, BarraGas[playerid]);
    return 1;
}

stock SpawnPlayerAfterAuth(playerid)
{
    SetSpawnInfo(playerid, 255, SKIN_POR_DEFECTO, 2494.24, -1671.19, 13.33, 0.0, WEAPON_NONE, 0, WEAPON_NONE, 0, WEAPON_NONE, 0);
    TogglePlayerSpectating(playerid, false);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    SetCameraBehindPlayer(playerid);
    SpawnPlayer(playerid);
    SetCameraBehindPlayer(playerid);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

    if(dialogid == DIALOG_DUDA_TEXTO) {
        if(!response) return 1;
        if(strlen(inputtext) < 3) return SendClientMessage(playerid, -1, "Escribe una duda valida.");
        new nombre[MAX_PLAYER_NAME], msg[192];
        GetPlayerName(playerid, nombre, sizeof(nombre));
        format(msg, sizeof(msg), "[DUDAS] (%s - %d) %s", nombre, playerid, inputtext);
        SendClientMessageToAll(0xFFD166FF, msg);
        return 1;
    }

    if(dialogid == DIALOG_RD_TARGET) {
        if(!response) return 1;
        new target = strval(inputtext);
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "ID invalido o jugador desconectado.");
        RdTargetPendiente[playerid] = target;
        return ShowPlayerDialog(playerid, DIALOG_RD_RESPUESTA, DIALOG_STYLE_INPUT, "Responder Duda", "Escribe tu respuesta:", "Enviar", "Cancelar");
    }

    if(dialogid == DIALOG_RD_RESPUESTA) {
        if(!response) return 1;
        new target = RdTargetPendiente[playerid];
        if(target == -1 || !IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "El jugador objetivo ya no esta conectado.");
        if(strlen(inputtext) < 2) return SendClientMessage(playerid, -1, "Respuesta invalida.");
        new nTarget[MAX_PLAYER_NAME], nResp[MAX_PLAYER_NAME], msg[220];
        GetPlayerName(target, nTarget, sizeof(nTarget));
        GetPlayerName(playerid, nResp, sizeof(nResp));
        format(msg, sizeof(msg), "[DUDAS] (%s) Respuesta: %s Att: %s", nTarget, inputtext, nResp);
        SendClientMessageToAll(0xFFB347FF, msg);
        RdTargetPendiente[playerid] = -1;
        return 1;
    }


    if(dialogid == DIALOG_FACCION_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            if(PlayerFaccionId[playerid] != -1) return SendClientMessage(playerid, -1, "Ya perteneces a una faccion.");
            if(GetPlayerMoney(playerid) < COSTO_CREAR_FACCION) return SendClientMessage(playerid, -1, "Necesitas $1000000 para crear una faccion.");
            return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_NOMBRE, DIALOG_STYLE_INPUT, "Crear Faccion", "Escribe nombre de la faccion (maximo 16 caracteres):", "Siguiente", "Cancelar");
        }
        if(listitem == 1) {
            if(PlayerFaccionId[playerid] == -1 || PlayerFaccionRango[playerid] != FACCION_RANGO_OWNER) return SendClientMessage(playerid, -1, "Solo el owner de faccion puede comprar color.");
            if(GetPlayerMoney(playerid) < COSTO_COMPRAR_COLOR_FACCION) return SendClientMessage(playerid, -1, "No tienes dinero suficiente ($200000).");
            new lista[256]; lista[0]=EOS;
            for(new c=0;c<MAX_COLORES_FACCION;c++) { if(c>0) strcat(lista, "\n"); strcat(lista, FaccionColoresNombre[c]); }
            return ShowPlayerDialog(playerid, DIALOG_FACCION_COMPRAR_COLOR_LISTA, DIALOG_STYLE_LIST, "Comprar Color Faccion ($200000)", lista, "Comprar", "Atras");
        }
        return 1;
    }

    if(dialogid == DIALOG_FACCION_CREAR_NOMBRE) {
        if(!response) return 1;
        if(strlen(inputtext) < 3 || strlen(inputtext) > 16) return SendClientMessage(playerid, -1, "El nombre debe tener entre 3 y 16 caracteres.");
        SetPVarString(playerid, "FaccionNombreTmp", inputtext);
        return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_COLOR_CONFIRM, DIALOG_STYLE_MSGBOX, "Crear Faccion", "Deseas elegir un color por $100000?\nPuedes omitirlo y usar color predeterminado.", "Elegir", "Omitir");
    }

    if(dialogid == DIALOG_FACCION_CREAR_COLOR_CONFIRM) {
        FaccionCrearCompraColor[playerid] = bool:response;
        if(response) {
            new lista[256]; lista[0]=EOS;
            for(new c=0;c<MAX_COLORES_FACCION;c++) { if(c>0) strcat(lista, "\n"); strcat(lista, FaccionColoresNombre[c]); }
            return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_COLOR_LISTA, DIALOG_STYLE_LIST, "Crear Faccion - Colores", lista, "Elegir", "Atras");
        }
        FaccionCrearColorPendiente[playerid] = -1;
        return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_RESUMEN, DIALOG_STYLE_MSGBOX, "Crear Faccion - Confirmar", "Se cobrara $1000000 por crear tu faccion.\nSin color adicional.", "Confirmar", "Cancelar");
    }

    if(dialogid == DIALOG_FACCION_CREAR_COLOR_LISTA) {
        if(!response) { FaccionCrearCompraColor[playerid] = false; FaccionCrearColorPendiente[playerid] = -1; return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_RESUMEN, DIALOG_STYLE_MSGBOX, "Crear Faccion - Confirmar", "Se cobrara $1000000 por crear tu faccion.\nSin color adicional.", "Confirmar", "Cancelar"); }
        if(listitem < 0 || listitem >= MAX_COLORES_FACCION) return 1;
        FaccionCrearColorPendiente[playerid] = listitem;
        return ShowPlayerDialog(playerid, DIALOG_FACCION_CREAR_RESUMEN, DIALOG_STYLE_MSGBOX, "Crear Faccion - Confirmar", "Se cobrara $1100000 por crear tu faccion con color personalizado.", "Confirmar", "Cancelar");
    }

    if(dialogid == DIALOG_FACCION_CREAR_RESUMEN) {
        if(!response) return 1;
        if(PlayerFaccionId[playerid] != -1) return SendClientMessage(playerid, -1, "Ya perteneces a una faccion.");
        new costo = COSTO_CREAR_FACCION + ((FaccionCrearCompraColor[playerid] && FaccionCrearColorPendiente[playerid] != -1) ? COSTO_COLOR_CREAR_FACCION : 0);
        if(GetPlayerMoney(playerid) < costo) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        new fid = BuscarFaccionLibre();
        if(fid == -1) return SendClientMessage(playerid, -1, "No hay espacio para mas facciones.");
        new nombre[17]; GetPVarString(playerid, "FaccionNombreTmp", nombre, sizeof(nombre));
        if(!nombre[0]) return SendClientMessage(playerid, -1, "Nombre invalido.");
        GivePlayerMoney(playerid, -costo);
        FaccionData[fid][facActiva] = true;
        format(FaccionData[fid][facNombre], 17, "%s", nombre);
        FaccionData[fid][facOwner] = playerid;
        FaccionData[fid][facColor] = (FaccionCrearCompraColor[playerid] && FaccionCrearColorPendiente[playerid] != -1) ? FaccionColoresValor[FaccionCrearColorPendiente[playerid]] : 0x95A5A6FF;
        GuardarNombreJugadorEnFaccion(playerid, fid);
        for(new m=0;m<MAX_MIEMBROS_FACCION;m++){ FaccionData[fid][facMiembros][m] = -1; FaccionData[fid][facRangos][m]=0; FaccionMiembroNombre[fid][m][0] = EOS; }
        AgregarMiembroFaccion(fid, playerid, FACCION_RANGO_OWNER);
        DeletePVar(playerid, "FaccionNombreTmp");
        GuardarFacciones();
        ActualizarLabelJugadorFaccion(playerid, true);
        SendClientMessage(playerid, 0x66FF66FF, "Faccion creada correctamente.");
        return 1;
    }

    if(dialogid == DIALOG_FACCION_COMPRAR_COLOR_LISTA) {
        if(!response) return 1;
        new fid = PlayerFaccionId[playerid];
        if(fid == -1 || PlayerFaccionRango[playerid] != FACCION_RANGO_OWNER) return 1;
        if(listitem < 0 || listitem >= MAX_COLORES_FACCION) return 1;
        if(GetPlayerMoney(playerid) < COSTO_COMPRAR_COLOR_FACCION) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        GivePlayerMoney(playerid, -COSTO_COMPRAR_COLOR_FACCION);
        FaccionData[fid][facColor] = FaccionColoresValor[listitem];
        ActualizarMiembrosFaccion(fid);
        GuardarFacciones();
        SendClientMessage(playerid, 0x66FF66FF, "Color de faccion actualizado.");
        return 1;
    }

    if(dialogid == DIALOG_CREAR_CASA_INTERIOR) {
        if(!response) { CasaInteriorPendiente[playerid] = -1; return 1; }
        new interiorSlot = strval(inputtext);
        if(interiorSlot < 1 || interiorSlot > 5) return ShowPlayerDialog(playerid, DIALOG_CREAR_CASA_INTERIOR, DIALOG_STYLE_INPUT, "Crear casa", "Interior invalido.\n\n1) Safe House 1 (ID 10)\n2) Safe House 4 (ID 1)\n3) Vank Hoff Hotel (ID 5)\n4) Willowfield safehouse (ID 11)\n5) Unknown safe house (ID 9)\n\nIngresa el numero de interior (1-5):", "Siguiente", "Cancelar");
        CasaInteriorPendiente[playerid] = interiorSlot;
        return ShowPlayerDialog(playerid, DIALOG_CREAR_CASA_PRECIO, DIALOG_STYLE_INPUT, "Crear casa", "Ingresa el precio de la casa:", "Crear", "Atras");
    }

    if(dialogid == DIALOG_CREAR_CASA_PRECIO) {
        if(!response) return ShowCrearCasaInteriorDialog(playerid);
        if(CasaInteriorPendiente[playerid] < 1 || CasaInteriorPendiente[playerid] > 5) return ShowCrearCasaInteriorDialog(playerid);

        new precio = strval(inputtext);
        if(precio <= 0) return ShowPlayerDialog(playerid, DIALOG_CREAR_CASA_PRECIO, DIALOG_STYLE_INPUT, "Crear casa", "Precio invalido. Ingresa un precio mayor a 0:", "Crear", "Atras");
        if(TotalCasas >= MAX_CASAS) return SendClientMessage(playerid, -1, "Maximo de casas alcanzado.");

        new Float:p[3];
        GetPlayerPos(playerid, p[0], p[1], p[2]);

        CasaData[TotalCasas][cX] = p[0];
        CasaData[TotalCasas][cY] = p[1];
        CasaData[TotalCasas][cZ] = p[2];
        CasaData[TotalCasas][cInteriorSlot] = CasaInteriorPendiente[playerid];
        CasaData[TotalCasas][cPrecio] = precio;
        strmid(CasaData[TotalCasas][cOwner], "None", 0, strlen("None")+1, MAX_PLAYER_NAME);
        CasaData[TotalCasas][cFriends][0] = EOS;

        CasaPickup[TotalCasas] = CreatePickup(1273, 2, p[0], p[1], p[2], 0);

        new labelstr[96];
        format(labelstr, sizeof(labelstr), "Casa en venta\nPrecio: $%d\nInt: %s", precio, CasaInteriorNombre[CasaData[TotalCasas][cInteriorSlot] - 1]);
        CasaLabel[TotalCasas] = Create3DTextLabel(labelstr, 0x00FF00FF, p[0], p[1], p[2] + 0.5, 10.0, 0);

        TotalCasas++;
        CasaInteriorPendiente[playerid] = -1;
        GuardarCasas();
        SendClientMessage(playerid, 0x00FF00FF, "Casa creada y guardada correctamente.");
        return 1;
    }

    if(dialogid == DIALOG_AYUDA_CATEGORIA) {
        if(!response) return 1;
        if(listitem == 0) return ShowAyudaDialog(playerid);
        if(listitem == 1) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Trabajos", "{CCCCCC}[Minero]{FFFFFF}\n- Extrae piedra/cobre/hierro en minas y hornos.\n- Comandos: H en mina, H en horno, /inventario, /dejartrabajo.\n\n{00C853}[Basurero]{FFFFFF}\n- Recoge bolsas y cargalas en la Rumpo con H.\n- Comandos: H en bolsa/camion, /tirarbasura, /dejartrabajo.\n\n{FF8C00}[Pizzero]{FFFFFF}\n- Entrega pizzas en moto por checkpoints.\n- Comandos: H para tomar trabajo, /dejartrabajo.\n\n{FFFF00}[Camionero]{FFFFFF}\n- Rutas de carga y entrega para subir nivel.\n- Comandos: H para iniciar, /dejartrabajo.\n\n{99CCFF}[Armero]{FFFFFF}\n- Crea armas y municion con materiales.\n- Comandos: H en armeria, /armero, /inventario.", "Cerrar", "");
        if(listitem == 2) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Sistemas", "{33CCFF}Economia:{FFFFFF} /saldo, banco con H en Banco KameHouse, pago por hora segun nivel PJ.\n\n{66FF99}Propiedades:{FFFFFF} /comprar, /abrircasa, /salir.\n\n{FFCC66}Vehiculos:{FFFFFF} /maletero, /llave, /compartirllave, /tuning, GPS desde /telefono (vehiculos).\n\n{CC99FF}Facciones:{FFFFFF} CP de facciones, /faccion, /f para radio interna.\n\n{AAAAAA}Cultivo e inventario:{FFFFFF} /plantar, H para cosechar, /inventario, /consumir.", "Cerrar", "");
        if(listitem == 3) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Ayuda - Membresias", "{66FFFF}Membresias Kame House{FFFFFF}\n\n{FFFFFF}Normal:\n- 1 casa\n- 1 vehiculo propio\n- Hasta 3 plantas en casa\n\n{FFD54F}VIP:\n- 3 casas\n- 3 vehiculos propios\n- Hasta 5 plantas\n- Probabilidad de cosecha x2 en cultivos de casa\n\n{00E5FF}Diamante:\n- 10 casas\n- 10 vehiculos propios\n- Hasta 15 plantas\n- Probabilidad de cosecha x4 en cultivos de casa\n\n{AAAAAA}Adquisicion:{FFFFFF} compra en Tienda Virtual Kame House (H en el punto) o mediante eventos del staff.", "Cerrar", "");
        if(listitem == 4) return ShowReglasDialog(playerid);
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
        else if(listitem == 11) SetPlayerCheckpoint(playerid, PuntoPos[puntoFacciones][0], PuntoPos[puntoFacciones][1], PuntoPos[puntoFacciones][2], 6.0);
        else if(listitem == 12) SetPlayerCheckpoint(playerid, PuntoPos[puntoTiendaVirtual][0], PuntoPos[puntoTiendaVirtual][1], PuntoPos[puntoTiendaVirtual][2], 6.0);
        else if(listitem == 13) {
            new horno = GetHornoMasCercano(playerid);
            if(horno == -1) return SendClientMessage(playerid, -1, "No hay hornos disponibles en el mapa.");
            SetPlayerCheckpoint(playerid, HornoData[horno][hornoX], HornoData[horno][hornoY], HornoData[horno][hornoZ], 4.0);
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
        if(!IsValidVehicle(veh) && VehOwner[veh] == playerid && VehModelData[veh] >= 400 && VehModelData[veh] <= 611) {
            VehOculto[veh] = true;
        }

        if(VehOculto[veh]) {
            if(!RestaurarVehiculoSeleccionado(playerid, veh)) return SendClientMessage(playerid, -1, "Ese vehiculo no pudo restaurarse ahora.");
            veh = GPSVehiculoSeleccionado[playerid];
            if(veh == INVALID_VEHICLE_ID || !IsValidVehicle(veh)) return SendClientMessage(playerid, -1, "No fue posible restaurar el vehiculo elegido.");
        }

        if(!IsValidVehicle(veh)) return SendClientMessage(playerid, -1, "Ese vehiculo no esta disponible para localizarse ahora.");

        new Float:vx, Float:vy, Float:vz;
        GetVehiclePos(veh, vx, vy, vz);
        SetPlayerCheckpoint(playerid, vx, vy, vz, 8.0);
        GPSCheckpointActivo[playerid] = true;
        SendClientMessage(playerid, 0x00FFFFFF, "GPS configurado hacia el vehiculo seleccionado.");
        return 1;
    }

    if(dialogid == DIALOG_MOVER_MENU) {
        if(!response) return 1;
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");

        new ePuntoMovible:puntoMover;
        switch(listitem) {
            case 0: puntoMover = puntoCamionero;
            case 1: puntoMover = puntoPizzeria;
            case 2: puntoMover = puntoBasurero;
            case 3: puntoMover = puntoCarga;
            case 4: puntoMover = puntoBanco;
            case 5: puntoMover = puntoSemilleria;
            case 6: puntoMover = puntoArmeria;
            case 7: puntoMover = puntoVentaAutos;
            case 8: puntoMover = puntoVentaSkins;
            case 9: puntoMover = puntoPintura;
            case 10: puntoMover = puntoMinero;
            case 11: puntoMover = puntoPrendas;
            case 12: puntoMover = puntoFacciones;
            case 13: puntoMover = puntoTiendaVirtual;
            default: return SendClientMessage(playerid, -1, "Punto invalido.");
        }

        new Float:px, Float:py, Float:pz, nombre[48], msg[144];
        GetPlayerPos(playerid, px, py, pz);
        PuntoPos[puntoMover][0] = px;
        PuntoPos[puntoMover][1] = py;
        PuntoPos[puntoMover][2] = pz;
        RecrearPuntoFijo(puntoMover);
        GuardarPuntosMovibles();
        if(puntoMover == puntoVentaAutos) {
            VentaAutosPos[0] = px;
            VentaAutosPos[1] = py;
            VentaAutosPos[2] = pz;
            if(VentaAutosPickup != 0) DestroyPickup(VentaAutosPickup);
            VentaAutosPickup = CreatePickup(1274, 1, px, py, pz, 0);
            ActualizarLabelVentaAutos();
        }
        if(puntoMover == puntoVentaSkins) {
            VentaSkinsPos[0] = px;
            VentaSkinsPos[1] = py;
            VentaSkinsPos[2] = pz;
            ActualizarLabelVentaSkins();
            GuardarVentaSkinsConfig();
        }
        if(puntoMover == puntoFacciones) {
            if(FaccionCPPickup != 0) DestroyPickup(FaccionCPPickup);
            FaccionCPPickup = CreatePickup(1274, 23, px, py, pz, 0);
            if(FaccionCPLabel != Text3D:-1) Delete3DTextLabel(FaccionCPLabel);
            FaccionCPLabel = Create3DTextLabel("CP Facciones Kame House\nPresiona H", 0x9B59B6FF, px, py, pz + 0.8, 20.0, 0);
        }
        GetPuntoMovibleNombre(puntoMover, nombre, sizeof(nombre));
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

    if(dialogid == DIALOG_TIENDA_VIRTUAL_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return SendClientMessage(playerid, -1, "Ya tienes membresia Diamante.");
            if(PlayerDiamantes[playerid] < PrecioMembresiaVIPDiamantes) return SendClientMessage(playerid, -1, "No tienes suficientes diamantes para comprar VIP.");
            if(GetPlayerMoney(playerid) < PrecioMembresiaVIPDinero) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para VIP.");
            GivePlayerMoney(playerid, -PrecioMembresiaVIPDinero);
            PlayerDiamantes[playerid] -= PrecioMembresiaVIPDiamantes;
            PlayerMembresiaTipo[playerid] = MEMBRESIA_VIP;
            PlayerMembresiaExpiraTick[playerid] = GetTickCount() + (DURACION_MEMBRESIA_VIP_DIAS * 86400000);
            GuardarCuenta(playerid);
            return SendClientMessage(playerid, 0x66FF66FF, "Compraste membresia VIP por 10 dias.");
        }
        if(listitem == 1) {
            return ShowPlayerDialog(playerid, DIALOG_TIENDA_VIRTUAL_DIAMANTES, DIALOG_STYLE_INPUT, "Tienda Virtual - Diamantes", "Cuantos diamantes deseas comprar?", "Comprar", "Atras");
        }
        if(listitem == 2) {
            new msgd[96];
            format(msgd, sizeof(msgd), "Tienes %d diamante(s).", PlayerDiamantes[playerid]);
            return SendClientMessage(playerid, 0x66CCFFFF, msgd);
        }
        return 1;
    }

    if(dialogid == DIALOG_TIENDA_VIRTUAL_DIAMANTES) {
        if(!response) return ShowTiendaVirtualMenu(playerid);
        new cantidad = strval(inputtext);
        if(cantidad <= 0 || cantidad > 1000) return SendClientMessage(playerid, -1, "Cantidad invalida (1-1000).");
        new costoTotal = cantidad * PrecioDiamanteTienda;
        if(GetPlayerMoney(playerid) < costoTotal) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        GivePlayerMoney(playerid, -costoTotal);
        PlayerDiamantes[playerid] += cantidad;
        GuardarCuenta(playerid);
        new msgd2[144];
        format(msgd2, sizeof(msgd2), "Compraste %d diamante(s) por $%d.", cantidad, costoTotal);
        SendClientMessage(playerid, 0x66FF66FF, msgd2);
        return 1;
    }

    if(dialogid == DIALOG_ANUNCIO_TEXTO) {
        if(!response) return 1;
        if(strlen(inputtext) < 4) return SendClientMessage(playerid, -1, "El anuncio es muy corto (min 4 caracteres).");
        if(strlen(inputtext) > 65) return SendClientMessage(playerid, -1, "El anuncio es muy largo (max 65 caracteres).");
        if(GetPlayerMoney(playerid) < COSTO_ANUNCIO) return SendClientMessage(playerid, -1, "No tienes dinero suficiente para publicar un anuncio ($2000).");

        new limpio[128], j = 0;
        for(new i = 0; inputtext[i] != EOS && j < sizeof(limpio) - 1; i++) {
            new c = inputtext[i];
            if(c == '\n' || c == '\r' || c == '\t') c = ' ';
            limpio[j++] = c;
        }
        limpio[j] = EOS;

        GivePlayerMoney(playerid, -COSTO_ANUNCIO);
        new nombre[MAX_PLAYER_NAME];
        GetPlayerName(playerid, nombre, sizeof(nombre));
        MostrarAnuncioGlobal(nombre, limpio);
        SendClientMessage(playerid, 0x66FF66FF, "Anuncio publicado por 10 segundos.");
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
        if(listitem == 5) return ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS de la ciudad", "{FFD700}Trabajo Camionero\n{AAAAAA}Trabajo Minero\n{CC6600}Trabajo Armero\n{FF4500}Trabajo Pizzero\n{66FF66}Trabajo Basurero\n{FFFFFF}Deposito de Carga\n{33CCFF}Banco KameHouse\n{66FF99}Tienda Kame House\n{CC6600}Armeria\n{99CCFF}Concesionario\n{FF66CC}Tuning Kame House\n{CC99FF}Facciones Kame House\n{66FFFF}Tienda Virtual Kame House\n{FFAA00}Horno mas cercano", "Ir", "Cerrar");
        if(listitem == 6) {
            new restaurados = RestaurarVehiculosJugador(playerid);
            new msg[96];
            format(msg, sizeof(msg), "Telefono: %d vehiculo(s) restaurado(s).", restaurados);
            return SendClientMessage(playerid, 0x00FF00FF, msg);
        }
        if(listitem == 7) return ShowGPSVehiculosMenu(playerid);
        if(listitem == 8) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_MENU, DIALOG_STYLE_LIST, "Telefono - Cuenta", "Cambiar clave\nCorreo", "Abrir", "Atras");
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

    if(dialogid == DIALOG_TELEFONO_CUENTA_MENU) {
        if(!response) return ShowTelefonoMenu(playerid);
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_CLAVE_ACTUAL, DIALOG_STYLE_PASSWORD, "Telefono - Cambiar clave", "Escribe tu clave actual:", "Siguiente", "Atras");
        if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_CORREO, DIALOG_STYLE_INPUT, "Telefono - Correo", "Escribe tu correo electronico:", "Guardar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_CUENTA_CLAVE_ACTUAL) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_MENU, DIALOG_STYLE_LIST, "Telefono - Cuenta", "Cambiar clave\nCorreo", "Abrir", "Atras");
        if(strcmp(inputtext, PlayerPassword[playerid], false) != 0) return SendClientMessage(playerid, 0xFF4444FF, "La clave actual no coincide.");
        return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_CLAVE_NUEVA, DIALOG_STYLE_PASSWORD, "Telefono - Cambiar clave", "Escribe tu nueva clave (min. 3):", "Guardar", "Atras");
    }

    if(dialogid == DIALOG_TELEFONO_CUENTA_CLAVE_NUEVA) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_CLAVE_ACTUAL, DIALOG_STYLE_PASSWORD, "Telefono - Cambiar clave", "Escribe tu clave actual:", "Siguiente", "Atras");
        if(strlen(inputtext) < 3) return SendClientMessage(playerid, -1, "La nueva clave debe tener al menos 3 caracteres.");
        strmid(PlayerPassword[playerid], inputtext, 0, sizeof(PlayerPassword[]), sizeof(PlayerPassword[]));
        GuardarCuenta(playerid);
        SendClientMessage(playerid, 0x66FF66FF, "Clave actualizada correctamente.");
        return 1;
    }

    if(dialogid == DIALOG_TELEFONO_CUENTA_CORREO) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_TELEFONO_CUENTA_MENU, DIALOG_STYLE_LIST, "Telefono - Cuenta", "Cambiar clave\nCorreo", "Abrir", "Atras");
        if(strlen(inputtext) < 5 || strfind(inputtext, "@") == -1) return SendClientMessage(playerid, -1, "Correo invalido.");
        format(PlayerCorreo[playerid], sizeof(PlayerCorreo[]), "%s", inputtext);
        GuardarCuenta(playerid);
        SendClientMessage(playerid, 0x66FF66FF, "Correo guardado correctamente.");
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
            if(ContarPrendasJugador(playerid) >= GetLimitePrendasJugador(playerid)) {
                new msgPrendas[96];
                format(msgPrendas, sizeof(msgPrendas), "Limite alcanzado: solo puedes tener %d prendas visibles.", GetLimitePrendasJugador(playerid));
                return SendClientMessage(playerid, -1, msgPrendas);
            }
            if(GetPlayerMoney(playerid) < PrendasData[idxPrenda][prendaPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
            GivePlayerMoney(playerid, -PrendasData[idxPrenda][prendaPrecio]);
            PrendasData[idxPrenda][prendaStock]--;
            GuardarPrendasConfig();
            PlayerPrendaComprada[playerid][idxPrenda] = 1;
            PlayerPrendaActiva[playerid][idxPrenda] = 1;
            PlayerPrendaModelo[playerid][idxPrenda] = PrendasData[idxPrenda][prendaModelo];
            format(PlayerPrendaNombre[playerid][idxPrenda], 32, "%s", PrendasData[idxPrenda][prendaNombre]);
            AplicarPrendaJugador(playerid, idxPrenda);
            GuardarCuenta(playerid);
            SendClientMessage(playerid, 0x66FF66FF, "Compraste y equipaste la prenda.");
            return 1;
        }

        if(PlayerPrendaActiva[playerid][idxPrenda]) {
            QuitarPrendaJugador(playerid, idxPrenda);
            GuardarCuenta(playerid);
            return SendClientMessage(playerid, 0xFFAA00FF, "Prenda oculta. Usa /prendas para volver a mostrarla.");
        }

        if(ContarPrendasJugador(playerid) >= GetLimitePrendasJugador(playerid)) {
            new msgPrendas2[96];
            format(msgPrendas2, sizeof(msgPrendas2), "Limite alcanzado: solo puedes tener %d prendas visibles.", GetLimitePrendasJugador(playerid));
            return SendClientMessage(playerid, -1, msgPrendas2);
        }
        PlayerPrendaActiva[playerid][idxPrenda] = 1;
        AplicarPrendaJugador(playerid, idxPrenda);
        GuardarCuenta(playerid);
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
                format(line, sizeof(line), "%d) %s (Disponibilidad: %s)", i, PrendasData[i][prendaNombre], PrendasData[i][prendaStock] > 0 ? "[Disponible]" : "[No Disponible]");
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
        new bones[] = {2,1,1,3,4,5,6,7,8,9,10};
        if(listitem < 0 || listitem >= sizeof(bones)) return 1;
        if(PlayerAdmin[playerid] >= 1 && PrendaEditIndex[playerid] != -1 && !PlayerPrendaComprada[playerid][idxp]) {
            PrendasData[idxp][prendaBone] = bones[listitem];
            GuardarPrendasConfig();
            return ShowPrendasAdminEditar(playerid, idxp);
        }
        PlayerPrendaBone[playerid][idxp] = bones[listitem];
        AplicarPrendaJugador(playerid, idxp);
        GuardarCuenta(playerid);
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
                GuardarCuenta(playerid);
                SendClientMessage(playerid, 0xFFAA00FF, "Prenda oculta.");
            } else {
                if(ContarPrendasJugador(playerid) >= GetLimitePrendasJugador(playerid)) {
                new msgPrendas[96];
                format(msgPrendas, sizeof(msgPrendas), "Limite alcanzado: solo puedes tener %d prendas visibles.", GetLimitePrendasJugador(playerid));
                return SendClientMessage(playerid, -1, msgPrendas);
            }
                PlayerPrendaActiva[playerid][idxp] = 1;
                AplicarPrendaJugador(playerid, idxp);
                GuardarCuenta(playerid);
                SendClientMessage(playerid, 0x66FF66FF, "Prenda visible nuevamente.");
            }
            return ShowPrendaUsuarioMenu(playerid);
        }
        if(listitem == 3) {
            QuitarPrendaJugador(playerid, idxp);
            PlayerPrendaComprada[playerid][idxp] = 0;
            PlayerPrendaModelo[playerid][idxp] = 0;
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
            format(PlayerPrendaNombre[playerid][idxp], 32, "");
            GuardarCuenta(playerid);
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
            if(HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Solo el owner puede acelerar.");
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
            if(HornoData[h][hornoOwner] != playerid) return SendClientMessage(playerid, -1, "Solo el owner puede retirar la coccion.");
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

    if(dialogid == DIALOG_FACCION_OWNER_MENU) {
        if(!response) return 1;
        new fid = PlayerFaccionId[playerid];
        if(fid == -1) return 1;
        if(listitem == 0) {
            new info[256], miembros = 0;
            for(new i=0;i<MAX_MIEMBROS_FACCION;i++) if(FaccionData[fid][facMiembros][i] != -1) miembros++;
            format(info, sizeof(info), "Faccion: %s\nMiembros: %d/%d\nOwner ID: %d", FaccionData[fid][facNombre], miembros, MAX_MIEMBROS_FACCION, FaccionData[fid][facOwner]);
            return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Info Faccion", info, "Cerrar", "");
        }
        if(PlayerFaccionRango[playerid] != FACCION_RANGO_OWNER && PlayerFaccionRango[playerid] != FACCION_RANGO_RECLUTA) return SendClientMessage(playerid, -1, "No tienes permisos en la faccion.");
        if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_FACCION_INVITAR_ID, DIALOG_STYLE_INPUT, "Faccion - Invitar", "ID del jugador a invitar:", "Invitar", "Atras");
        if(listitem == 2 && PlayerFaccionRango[playerid] == FACCION_RANGO_OWNER) return ShowPlayerDialog(playerid, DIALOG_FACCION_EDITAR_RANGO, DIALOG_STYLE_INPUT, "Faccion - Editar rango", "ID del miembro:\n(Alterna Miembro/Recluta)", "Editar", "Atras");
        if(listitem == 3 && PlayerFaccionRango[playerid] == FACCION_RANGO_OWNER) return ShowPlayerDialog(playerid, DIALOG_FACCION_EDITAR_RANGO+1, DIALOG_STYLE_INPUT, "Faccion - Expulsar", "ID del miembro a expulsar:", "Expulsar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_FACCION_INVITAR_ID) {
        if(!response) return MostrarPanelFaccionOwner(playerid);
        new target = strval(inputtext), fid = PlayerFaccionId[playerid];
        if(fid == -1 || !IsPlayerConnected(target) || target == playerid) return SendClientMessage(playerid, -1, "ID invalido.");
        if(PlayerFaccionId[target] != -1) return SendClientMessage(playerid, -1, "Ese jugador ya pertenece a una faccion.");
        InvitacionFaccionId[target] = fid;
        InvitacionFaccionOwner[target] = playerid;
        new nombre[MAX_PLAYER_NAME], txt[180]; GetPlayerName(playerid, nombre, sizeof(nombre));
        format(txt, sizeof(txt), "%s quiere invitarte a la faccion %s", nombre, FaccionData[fid][facNombre]);
        ShowPlayerDialog(target, DIALOG_FACCION_INVITACION, DIALOG_STYLE_MSGBOX, "Invitacion de faccion", txt, "Aceptar", "Rechazar");
        SendClientMessage(playerid, 0x66FF66FF, "Invitacion enviada.");
        return 1;
    }

    if(dialogid == DIALOG_FACCION_INVITACION) {
        new fid = InvitacionFaccionId[playerid];
        if(fid == -1 || !FaccionData[fid][facActiva]) return 1;
        if(response) {
            if(!AgregarMiembroFaccion(fid, playerid, FACCION_RANGO_MIEMBRO)) return SendClientMessage(playerid, -1, "La faccion esta llena.");
            GuardarFacciones();
            SendClientMessage(playerid, 0x66FF66FF, "Te uniste a la faccion.");
        }
        InvitacionFaccionId[playerid] = -1;
        InvitacionFaccionOwner[playerid] = -1;
        return 1;
    }

    if(dialogid == DIALOG_FACCION_EDITAR_RANGO) {
        if(!response) return MostrarPanelFaccionOwner(playerid);
        new target = strval(inputtext), fid = PlayerFaccionId[playerid];
        if(fid == -1 || target == playerid || !IsPlayerConnected(target) || PlayerFaccionId[target] != fid) return SendClientMessage(playerid, -1, "Jugador invalido.");
        PlayerFaccionRango[target] = (PlayerFaccionRango[target] == FACCION_RANGO_RECLUTA) ? FACCION_RANGO_MIEMBRO : FACCION_RANGO_RECLUTA;
        for(new i=0;i<MAX_MIEMBROS_FACCION;i++) if(FaccionData[fid][facMiembros][i] == target) FaccionData[fid][facRangos][i] = PlayerFaccionRango[target];
        GuardarFacciones();
        SendClientMessage(playerid, 0x66FF66FF, "Rango actualizado.");
        return 1;
    }

    if(dialogid == DIALOG_FACCION_EDITAR_RANGO+1) {
        if(!response) return MostrarPanelFaccionOwner(playerid);
        new target = strval(inputtext), fid = PlayerFaccionId[playerid];
        if(fid == -1 || target == playerid || !IsPlayerConnected(target) || PlayerFaccionId[target] != fid) return SendClientMessage(playerid, -1, "Jugador invalido.");
        RemoverMiembroFaccion(fid, target);
        GuardarFacciones();
        SendClientMessage(playerid, 0x66FF66FF, "Miembro expulsado.");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_FACCIONES_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        SetPVarInt(playerid, "AdminFaccionAccion", listitem);
        new lista[1024], line[64]; lista[0]=EOS;
        for(new f=0; f<MAX_FACCIONES; f++) {
            if(!FaccionData[f][facActiva]) continue;
            if(lista[0]) strcat(lista, "\n");
            format(line, sizeof(line), "[%d] %s", f, FaccionData[f][facNombre]);
            strcat(lista, line);
        }
        if(!lista[0]) return SendClientMessage(playerid, -1, "No hay facciones registradas.");
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCIONES_LISTA, DIALOG_STYLE_LIST, "Admin - Selecciona faccion", lista, "Elegir", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_FACCIONES_LISTA) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCIONES_MENU, DIALOG_STYLE_LIST, "Admin - Facciones", "Renombrar faccion\nEliminar faccion\nEditar color\nUnir faccion", "Abrir", "Atras");
        new fid = -1, seen = -1;
        for(new f=0; f<MAX_FACCIONES; f++) { if(!FaccionData[f][facActiva]) continue; seen++; if(seen == listitem){ fid=f; break; } }
        if(fid == -1) return 1;
        FaccionAdminSeleccion[playerid] = fid;
        new accion = GetPVarInt(playerid, "AdminFaccionAccion");
        if(accion == 0) return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCION_RENOMBRAR, DIALOG_STYLE_INPUT, "Renombrar Faccion", "Nuevo nombre (max 16):", "Guardar", "Cancelar");
        if(accion == 1) {
            new msg[128];
            format(msg, sizeof(msg), "Eliminaras la faccion:\n[%d] %s\n\nConfirmar eliminacion?", fid, FaccionData[fid][facNombre]);
            return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCION_CONFIRM_ELIMINAR, DIALOG_STYLE_MSGBOX, "Eliminar Faccion", msg, "Eliminar", "Cancelar");
        }
        if(accion == 2) return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCION_COLOR_LISTA, DIALOG_STYLE_LIST, "Editar color", "Rojo\nAzul\nVerde\nAmarillo\nMorado\nNaranja\nCian\nRosa\nBlanco\nNegro", "Aplicar", "Cancelar");
        if(accion == 3) return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCION_UNIR_LISTA, DIALOG_STYLE_INPUT, "Unir faccion", "ID del jugador a unir:", "Unir", "Cancelar");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_FACCION_RENOMBRAR) { if(!response) return 1; new fid = FaccionAdminSeleccion[playerid]; if(fid == -1) return 1; if(strlen(inputtext)<3 || strlen(inputtext)>16) return SendClientMessage(playerid,-1,"Nombre invalido."); format(FaccionData[fid][facNombre],17,"%s",inputtext); GuardarFacciones(); return SendClientMessage(playerid,0x66FF66FF,"Faccion renombrada."); }
    if(dialogid == DIALOG_ADMIN_FACCION_CONFIRM_ELIMINAR) { if(!response) return 1; new fid = FaccionAdminSeleccion[playerid]; if(fid==-1) return 1; EliminarFaccion(fid); GuardarFacciones(); return SendClientMessage(playerid,0x66FF66FF,"Faccion eliminada."); }
    if(dialogid == DIALOG_ADMIN_FACCION_COLOR_LISTA) { if(!response) return 1; new fid = FaccionAdminSeleccion[playerid]; if(fid==-1 || listitem<0 || listitem>=MAX_COLORES_FACCION) return 1; FaccionData[fid][facColor] = FaccionColoresValor[listitem]; ActualizarMiembrosFaccion(fid); GuardarFacciones(); return SendClientMessage(playerid,0x66FF66FF,"Color de faccion actualizado."); }
    if(dialogid == DIALOG_ADMIN_FACCION_UNIR_LISTA) { if(!response) return 1; new target=strval(inputtext), fid=FaccionAdminSeleccion[playerid]; if(fid==-1 || !IsPlayerConnected(target)) return SendClientMessage(playerid,-1,"ID invalido."); if(PlayerFaccionId[target]!=-1) RemoverMiembroFaccion(PlayerFaccionId[target], target); if(!AgregarMiembroFaccion(fid,target,FACCION_RANGO_MIEMBRO)) return SendClientMessage(playerid,-1,"Faccion llena."); GuardarFacciones(); return SendClientMessage(playerid,0x66FF66FF,"Jugador unido a la faccion."); }

    if(dialogid == DIALOG_ADMIN_MENU) {
        if(!response) return 1;
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_ADMIN_IR_JUGADOR_ID, DIALOG_STYLE_INPUT, "Admin - Ir a jugador", "Ingresa ID del jugador", "Ir", "Atras");
        if(listitem == 1) {
            new cmdMover[] = "/mover";
            return OnPlayerCommandText(playerid, cmdMover);
        }
        if(listitem == 2) return ShowPlayerDialog(playerid, DIALOG_ADMIN_CREAR_MENU, DIALOG_STYLE_LIST, "Admin - Crear puntos", "Parada camionero\nParada pizzero\nParada basurero\nMina\nHorno\nCaja loot\nPunto prepiezas\nGasolinera", "Crear", "Atras");
        if(listitem == 3) return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Admin - Comandos", "/ir [id] /tp (mapa) /traer /kick /kill /cord /sacarveh /fly /rc /admprendas", "Cerrar", "");
        if(listitem == 4) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_CONCEPTO, DIALOG_STYLE_LIST, "Admin - Sancionar", "PG\nDM\nMG\nRK\nCK\nNRE\nNVVPJ\nER\nFR", "Siguiente", "Atras");
        if(listitem == 5) return ShowPlayerDialog(playerid, DIALOG_ADMIN_UNSAN_ID, DIALOG_STYLE_INPUT, "Admin - Quitar sancion", "Ingresa ID del jugador sancionado", "Siguiente", "Atras");
        if(listitem == 6) return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_DINERO_ID, DIALOG_STYLE_INPUT, "Admin - Dar dinero", "Ingresa ID del jugador", "Siguiente", "Cancelar");
        if(listitem == 7) return ShowPlayerDialog(playerid, DIALOG_ADMIN_DAR_MINERAL_TIPO, DIALOG_STYLE_INPUT, "Admin - Dar minerales", "Tipo mineral (piedra/cobre/hierro/madera/polvora/prepieza/carbon)", "Siguiente", "Atras");
        if(listitem == 8) return ShowPlayerDialog(playerid, DIALOG_ADMIN_VIDA_CHALECO_TIPO, DIALOG_STYLE_LIST, "Admin - Vida/Chaleco", "Vida\nChaleco", "Siguiente", "Atras");
        if(listitem == 9) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SKIN_ID, DIALOG_STYLE_INPUT, "Admin - Cambiar skin", "Ingresa ID del jugador", "Siguiente", "Atras");
        if(listitem == 10) {
            new cmdAdmPrendas[] = "/admprendas";
            return OnPlayerCommandText(playerid, cmdAdmPrendas);
        }
        if(listitem == 11) return ShowEditMapMenu(playerid);
        if(listitem == 12) return ShowPlayerDialog(playerid, DIALOG_ADMIN_ADD_MOD_ID, DIALOG_STYLE_INPUT, "Asignar Moderador", "Ingresa ID del jugador que sera Moderador", "Asignar", "Atras");
        if(listitem == 13) return ShowPlayerDialog(playerid, DIALOG_ADMIN_REMOVE_MOD_ID, DIALOG_STYLE_INPUT, "Eliminar Moderador", "Ingresa ID del Moderador a eliminar", "Eliminar", "Atras");
        if(listitem == 14) {
            new texto[96];
            format(texto, sizeof(texto), "Activo\nInactivo\n\nEstado actual: %s", AdminModoDios[playerid] ? "Activo" : "Inactivo");
            return ShowPlayerDialog(playerid, DIALOG_ADMIN_MODO_DIOS, DIALOG_STYLE_LIST, "Admin - Modo Dios", texto, "Seleccionar", "Atras");
        }
        if(listitem == 15) return ShowPlayerDialog(playerid, DIALOG_ADMIN_FACCIONES_MENU, DIALOG_STYLE_LIST, "Admin - Facciones", "Renombrar faccion\nEliminar faccion\nEditar color\nUnir faccion", "Abrir", "Atras");
        if(listitem == 16) return MostrarMenuAdminMembresias(playerid);
        return 1;
    }

    if(dialogid == DIALOG_MOD_MENU) {
        if(!response) return 1;
        if(!EsModerador(playerid)) return SendClientMessage(playerid, -1, "No eres Moderador.");
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_ADMIN_IR_JUGADOR_ID, DIALOG_STYLE_INPUT, "MOD - Ir a jugador", "Ingresa ID del jugador", "Ir", "Atras");
        if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_ADMIN_UNSAN_ID+1000, DIALOG_STYLE_INPUT, "MOD - Traer jugador", "Ingresa ID del jugador", "Traer", "Atras");
        if(listitem == 2) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_CONCEPTO, DIALOG_STYLE_LIST, "MOD - Sancionar", "PG\nDM\nMG\nRK\nCK\nNRE\nNVVPJ\nER\nFR", "Siguiente", "Atras");
        if(listitem == 3) return ShowPlayerDialog(playerid, DIALOG_ADMIN_UNSAN_ID, DIALOG_STYLE_INPUT, "MOD - Quitar sancion", "Ingresa ID del jugador sancionado", "Siguiente", "Atras");
        if(listitem == 4) { new cmdTp[] = "/tp"; return OnPlayerCommandText(playerid, cmdTp); }
        if(listitem == 5) { new cmdFly[] = "/fly"; return OnPlayerCommandText(playerid, cmdFly); }
        if(listitem == 6) { new cmdRc[] = "/rc"; return OnPlayerCommandText(playerid, cmdRc); }
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_CREAR_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
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

    if(dialogid == DIALOG_ADMIN_UNSAN_ID+1000) {
        if(!response) return MostrarDialogoMod(playerid);
        if(!EsModerador(playerid)) return SendClientMessage(playerid, -1, "No eres Moderador.");
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        new cmdTraer[24];
        format(cmdTraer, sizeof(cmdTraer), "/traer %d", id);
        return OnPlayerCommandText(playerid, cmdTraer);
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

    if(dialogid == DIALOG_ADMIN_IR_JUGADOR_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        new Float:p[3]; GetPlayerPos(id, p[0], p[1], p[2]);
        SetPlayerPos(playerid, p[0], p[1], p[2] + 1.5);
        return SendClientMessage(playerid, 0x66FF66FF, "Teletransportado al jugador seleccionado.");
    }

    if(dialogid == DIALOG_ADMIN_SKIN_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        AdminSkinTargetPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_SKIN_VALOR, DIALOG_STYLE_INPUT, "Admin - Cambiar skin", "Ingresa ID de skin", "Aplicar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_SKIN_VALOR) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SKIN_ID, DIALOG_STYLE_INPUT, "Admin - Cambiar skin", "Ingresa ID del jugador", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1) return 1;
        new target = AdminSkinTargetPendiente[playerid];
        new skin = strval(inputtext);
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        if(skin < 0 || skin > 311) return SendClientMessage(playerid, -1, "Skin invalida (0-311).");
        SetPlayerSkin(target, skin);
        PlayerSkinGuardada[target] = skin;
        GuardarCuenta(target);
        SendClientMessage(playerid, 0x66FF66FF, "Skin cambiada correctamente.");
        SendClientMessage(target, 0x66FF66FF, "Un admin cambio tu skin.");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_VIDA_CHALECO_TIPO) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        if(listitem < 0 || listitem > 1) return 1;
        AdminVidaChalecoTipoPendiente[playerid] = listitem;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_VIDA_CHALECO_ID, DIALOG_STYLE_INPUT, "Admin - Vida/Chaleco", "Ingresa ID del jugador", "Siguiente", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_VIDA_CHALECO_ID) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_VIDA_CHALECO_TIPO, DIALOG_STYLE_LIST, "Admin - Vida/Chaleco", "Vida\nChaleco", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1) return 1;
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        AdminVidaChalecoTargetPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_VIDA_CHALECO_VALOR, DIALOG_STYLE_INPUT, "Admin - Vida/Chaleco", "Ingresa porcentaje (0-100)", "Aplicar", "Atras");
    }

    if(dialogid == DIALOG_EDITMAP_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_EDITMAP_ADD_MODEL, DIALOG_STYLE_INPUT, "EditMap - Agregar", "Ingresa ID del modelo GTA (objeto):", "Siguiente", "Atras");
        if(listitem == 1) return ShowEditMapEditList(playerid);
        if(listitem == 2) return ShowEditMapDeleteList(playerid);
        if(listitem == 3) return ShowEditMapViewList(playerid);
        return 1;
    }

    if(dialogid == DIALOG_EDITMAP_ADD_MODEL) {
        if(!response) return ShowEditMapMenu(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new modelid = strval(inputtext);
        if(modelid < 300 || modelid > 20000) return ShowPlayerDialog(playerid, DIALOG_EDITMAP_ADD_MODEL, DIALOG_STYLE_INPUT, "EditMap - Agregar", "ID invalido. Ingresa un modelo valido (300-20000):", "Siguiente", "Atras");
        new slot = GetEditMapSlotLibre();
        if(slot == -1) return SendClientMessage(playerid, -1, "Limite de objetos EditMap alcanzado.");
        EditMapModeloPendiente[playerid] = modelid;
        return ShowPlayerDialog(playerid, DIALOG_EDITMAP_ADD_NOMBRE, DIALOG_STYLE_INPUT, "EditMap - Nombre", "Ingresa nombre para identificar este objeto en la lista:", "Crear", "Atras");
    }

    if(dialogid == DIALOG_EDITMAP_ADD_NOMBRE) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_EDITMAP_ADD_MODEL, DIALOG_STYLE_INPUT, "EditMap - Agregar", "Ingresa ID del modelo GTA (objeto):", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1) return 1;
        if(!inputtext[0]) return ShowPlayerDialog(playerid, DIALOG_EDITMAP_ADD_NOMBRE, DIALOG_STYLE_INPUT, "EditMap - Nombre", "Nombre invalido. Ingresa un nombre para identificar este objeto:", "Crear", "Atras");

        new slot = GetEditMapSlotLibre();
        if(slot == -1) return SendClientMessage(playerid, -1, "Limite de objetos EditMap alcanzado.");

        new modelid = EditMapModeloPendiente[playerid];
        if(modelid < 300 || modelid > 20000) return SendClientMessage(playerid, -1, "Modelo pendiente invalido. Intenta de nuevo.");

        new Float:px, Float:py, Float:pz;
        GetPlayerPos(playerid, px, py, pz);

        EditMapData[slot][emActivo] = true;
        EditMapData[slot][emModelo] = modelid;
        format(EditMapData[slot][emNombre], 32, "%s", inputtext);
        EditMapData[slot][emX] = px;
        EditMapData[slot][emY] = py + 2.0;
        EditMapData[slot][emZ] = pz;
        EditMapData[slot][emRX] = 0.0;
        EditMapData[slot][emRY] = 0.0;
        EditMapData[slot][emRZ] = 0.0;
        EditMapData[slot][emObj] = CreateObject(modelid, EditMapData[slot][emX], EditMapData[slot][emY], EditMapData[slot][emZ], 0.0, 0.0, 0.0);
        if(slot >= TotalEditMap) TotalEditMap = slot + 1;
        GuardarEditMap();
        EditMapEditandoSlot[playerid] = slot;
        EditObject(playerid, EditMapData[slot][emObj]);
        SendClientMessage(playerid, 0x66FF66FF, "Objeto creado. Ajusta posicion/rotacion y confirma para guardar.");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_SANCION_CONCEPTO) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        if(listitem < 0 || listitem > 8) return 1;
        SancionConcepto[playerid] = listitem;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_ID, DIALOG_STYLE_INPUT, "Admin - Sancionar", "Ingresa ID del jugador", "Siguiente", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_SANCION_ID) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_CONCEPTO, DIALOG_STYLE_LIST, "Admin - Sancionar", "PG\nDM\nMG\nRK\nCK\nNRE\nNVVPJ\nER\nFR", "Siguiente", "Atras");
        if(!EsStaff(playerid)) return 1;
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        SancionAdminIdPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_MINUTOS, DIALOG_STYLE_INPUT, "Admin - Sancionar", "Ingresa minutos de sancion", "Sancionar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_SANCION_MINUTOS) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_SANCION_ID, DIALOG_STYLE_INPUT, "Admin - Sancionar", "Ingresa ID del jugador", "Siguiente", "Atras");
        if(!EsStaff(playerid)) return 1;
        new minutos = strval(inputtext);
        new id = SancionAdminIdPendiente[playerid];
        if(!IsPlayerConnected(id) || minutos <= 0) return SendClientMessage(playerid, -1, "Datos invalidos para sancionar.");
        return AplicarSancionJugador(playerid, id, SancionConcepto[playerid], minutos);
    }

    if(dialogid == DIALOG_ADMIN_UNSAN_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsStaff(playerid)) return 1;
        new id = strval(inputtext);
        if(!IsPlayerConnected(id) || !PlayerSancionado[id]) return SendClientMessage(playerid, -1, "ID invalido o el jugador no esta sancionado.");
        UnsanTargetPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_UNSAN_MOTIVO, DIALOG_STYLE_INPUT, "Admin - Quitar sancion", "Escribe motivo de liberacion", "Liberar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_UNSAN_MOTIVO) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_UNSAN_ID, DIALOG_STYLE_INPUT, "Admin - Quitar sancion", "Ingresa ID del jugador sancionado", "Siguiente", "Atras");
        if(!EsStaff(playerid)) return 1;
        new id = UnsanTargetPendiente[playerid];
        if(!IsPlayerConnected(id) || !PlayerSancionado[id]) return SendClientMessage(playerid, -1, "El jugador ya no esta sancionado.");
        if(!inputtext[0]) return SendClientMessage(playerid, -1, "Debes indicar un motivo.");
        RemoverSancionJugador(id);
        new msg[160], admName[MAX_PLAYER_NAME], tarName[MAX_PLAYER_NAME];
        GetPlayerName(playerid, admName, sizeof(admName));
        GetPlayerName(id, tarName, sizeof(tarName));
        format(msg, sizeof(msg), "SERVER: %s libero de sancion a %s. Motivo: %s", admName, tarName, inputtext);
        SendClientMessageToAll(0x66FF66FF, msg);
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_BANDAS_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(listitem == 0) {
            BandasPVEActivas = true;
            SendClientMessage(playerid, 0x66FF66FF, "[Bandas PVE] Sistema activado.");
        } else if(listitem == 1) {
            DesactivarSistemaBandasPVE();
            SendClientMessage(playerid, 0xFFAA00FF, "[Bandas PVE] Sistema desactivado.");
        } else if(listitem == 2) {
            if(!BandasPVEActivas) return SendClientMessage(playerid, 0xFFAA00FF, "[Bandas PVE] Activa el sistema antes de reiniciar.");
            RespawnBandasPVE();
            SendClientMessage(playerid, 0x66CCFFFF, "[Bandas PVE] Bandas reiniciadas.");
        } else if(listitem == 3) {
            new cmdCrearBanda[] = "/crearbanda";
            return OnPlayerCommandText(playerid, cmdCrearBanda);
        } else if(listitem == 4) {
            return ShowAdminBandasSpawnBorrarList(playerid);
        }
        return MostrarDialogoAdmin(playerid);
    }

    if(dialogid == DIALOG_ADMIN_BANDAS_SPAWN_BORRAR) {
        if(!response) {
            new textoBandas[144];
            format(textoBandas, sizeof(textoBandas), "Sistema de Bandas PVE: %s\nSpawns cargados: %d/%d\n\nActivar sistema\nDesactivar sistema\nReiniciar bandas\nAgregar spawn aqui\nBorrar spawn por lista", BandasPVEActivas ? "ACTIVO" : "INACTIVO", TotalBandaSpawns, MAX_BANDA_SPAWNS);
            return ShowPlayerDialog(playerid, DIALOG_ADMIN_BANDAS_MENU, DIALOG_STYLE_LIST, "Admin - Bandas", textoBandas, "Seleccionar", "Atras");
        }
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(listitem < 0 || listitem >= TotalBandaSpawns) return SendClientMessage(playerid, -1, "Indice invalido de spawn.");

        BandaSpawnBorrarPendiente[playerid] = listitem;
        new texto[160];
        format(texto, sizeof(texto), "Vas a eliminar el punto ID %d\nPosicion: X %.2f | Y %.2f | Z %.2f\n\nEsta accion no se puede deshacer.", listitem, BandaSpawnPos[listitem][0], BandaSpawnPos[listitem][1], BandaSpawnPos[listitem][2]);
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_BANDAS_SPAWN_CONFIRM, DIALOG_STYLE_MSGBOX, "Bandas - Confirmar borrado", texto, "Eliminar punto", "Volver");
    }

    if(dialogid == DIALOG_ADMIN_BANDAS_SPAWN_CONFIRM) {
        if(!response) return ShowAdminBandasSpawnBorrarList(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");

        new idxBorrar = BandaSpawnBorrarPendiente[playerid];
        BandaSpawnBorrarPendiente[playerid] = -1;
        MineroGPSActivo[playerid] = false;
        OmitirArmasEnProximoSpawn[playerid] = false;
        PlayerFaccionId[playerid] = -1;
        PlayerFaccionRango[playerid] = 0;
        InvitacionFaccionId[playerid] = -1;
        InvitacionFaccionOwner[playerid] = -1;
        FaccionCrearColorPendiente[playerid] = -1;
        FaccionCrearCompraColor[playerid] = false;
        FaccionAdminSeleccion[playerid] = -1;
        if(!EliminarSpawnBandaPorIndice(idxBorrar)) return SendClientMessage(playerid, -1, "No se pudo borrar el punto seleccionado.");

        GuardarBandasSpawns();
        RespawnBandasPVE();
        new msg[96];
        format(msg, sizeof(msg), "Spawn de banda ID %d eliminado.", idxBorrar);
        SendClientMessage(playerid, 0xFFAA00FF, msg);
        return ShowAdminBandasSpawnBorrarList(playerid);
    }

    if(dialogid == DIALOG_ADMIN_MODO_DIOS) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(listitem == 0) {
            AdminModoDios[playerid] = true;
            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 100.0);
            SendClientMessage(playerid, 0x66FF66FF, "Modo Dios activado.");
        } else if(listitem == 1) {
            AdminModoDios[playerid] = false;
            SendClientMessage(playerid, 0xFFAA00FF, "Modo Dios desactivado.");
        }
        return MostrarDialogoAdmin(playerid);
    }

    if(dialogid == DIALOG_ADMIN_ADD_MOD_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        PlayerAdmin[id] = RANGO_MOD;
        GuardarCuenta(id);
        SendClientMessage(playerid, 0x66FF66FF, "Moderador asignado correctamente.");
        new nombreNuevo[MAX_PLAYER_NAME], anuncio[180];
        GetPlayerName(id, nombreNuevo, sizeof(nombreNuevo));
        format(anuncio, sizeof(anuncio), "Ahora Kame-House tiene un nuevo Moderador (%s). Felicidades!", nombreNuevo);
        SendClientMessageToAll(0x66CCFFFF, anuncio);
        return MostrarDialogoAdmin(playerid);
    }

    if(dialogid == DIALOG_ADMIN_REMOVE_MOD_ID) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        PlayerAdmin[id] = RANGO_NINGUNO;
        GuardarCuenta(id);
        SendClientMessage(playerid, 0x66FF66FF, "Moderador eliminado correctamente.");
        SendClientMessage(id, 0xFFAA00FF, "Tu rango de Moderador fue removido por un Owner.");
        return MostrarDialogoAdmin(playerid);
    }

    if(dialogid == DIALOG_ADMIN_MEMBRESIAS_MENU) {
        if(!response) return MostrarDialogoAdmin(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(listitem == 0) { AdminMembresiaTipoPendiente[playerid] = MEMBRESIA_VIP; return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIA_ID, DIALOG_STYLE_INPUT, "Admin - Membresia VIP", "ID del jugador:", "Siguiente", "Atras"); }
        if(listitem == 1) { AdminMembresiaTipoPendiente[playerid] = MEMBRESIA_DIAMANTE; return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIA_ID, DIALOG_STYLE_INPUT, "Admin - Membresia Diamante", "ID del jugador:", "Siguiente", "Atras"); }
        if(listitem == 2) return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIA_ELIMINAR_ID, DIALOG_STYLE_INPUT, "Admin - Eliminar membresia", "ID del jugador:", "Eliminar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_PRECIOS_MEMBRESIA_MENU) {
        if(!response) return 1;
        if(PlayerAdmin[playerid] < 1) return 1;
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_ADMIN_PRECIO_VIP_DINERO, DIALOG_STYLE_INPUT, "Admin - Precio VIP", "Ingresa el precio en dinero para VIP:", "Siguiente", "Atras");
        if(listitem == 1) return ShowPlayerDialog(playerid, DIALOG_ADMIN_PRECIO_DIAMANTE, DIALOG_STYLE_INPUT, "Admin - Precio Diamante", "Ingresa el precio por diamante:", "Guardar", "Atras");
        return 1;
    }

    if(dialogid == DIALOG_ADMIN_PRECIO_VIP_DINERO) {
        if(!response) return MostrarMenuAdminPreciosMembresia(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new precioDinero = strval(inputtext);
        if(precioDinero <= 0) return SendClientMessage(playerid, -1, "Precio invalido. Debe ser mayor a 0.");
        AdminPrecioVipDineroPendiente[playerid] = precioDinero;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_PRECIO_VIP_DIAMANTES, DIALOG_STYLE_INPUT, "Admin - Costo VIP en diamantes", "Ingresa la cantidad de diamantes requerida para VIP:", "Guardar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_PRECIO_VIP_DIAMANTES) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_PRECIO_VIP_DINERO, DIALOG_STYLE_INPUT, "Admin - Precio VIP", "Ingresa el precio en dinero para VIP:", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1) return 1;
        new costoDiamantes = strval(inputtext);
        if(costoDiamantes < 0) return SendClientMessage(playerid, -1, "Cantidad de diamantes invalida.");
        PrecioMembresiaVIPDinero = AdminPrecioVipDineroPendiente[playerid];
        PrecioMembresiaVIPDiamantes = costoDiamantes;
        new aviso[144];
        format(aviso, sizeof(aviso), "Precio VIP actualizado: $%d + %d diamante(s).", PrecioMembresiaVIPDinero, PrecioMembresiaVIPDiamantes);
        SendClientMessage(playerid, 0x66FF66FF, aviso);
        GuardarTiendaVirtualConfig();
        return MostrarMenuAdminPreciosMembresia(playerid);
    }

    if(dialogid == DIALOG_ADMIN_PRECIO_DIAMANTE) {
        if(!response) return MostrarMenuAdminPreciosMembresia(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new nuevoPrecio = strval(inputtext);
        if(nuevoPrecio <= 0) return SendClientMessage(playerid, -1, "Precio invalido. Debe ser mayor a 0.");
        PrecioDiamanteTienda = nuevoPrecio;
        new aviso[128];
        format(aviso, sizeof(aviso), "Precio de diamante actualizado: $%d por unidad.", PrecioDiamanteTienda);
        SendClientMessage(playerid, 0x66FF66FF, aviso);
        GuardarTiendaVirtualConfig();
        return MostrarMenuAdminPreciosMembresia(playerid);
    }

    if(dialogid == DIALOG_ADMIN_MEMBRESIA_ID) {
        if(!response) return MostrarMenuAdminMembresias(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        AdminMembresiaTargetPendiente[playerid] = id;
        return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIA_DIAS, DIALOG_STYLE_INPUT, "Admin - Dias de membresia", "Ingresa cantidad de dias:", "Asignar", "Atras");
    }

    if(dialogid == DIALOG_ADMIN_MEMBRESIA_DIAS) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIA_ID, DIALOG_STYLE_INPUT, "Admin - Membresias", "ID del jugador:", "Siguiente", "Atras");
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new id = AdminMembresiaTargetPendiente[playerid];
        new dias = strval(inputtext);
        if(!IsPlayerConnected(id) || dias <= 0) return SendClientMessage(playerid, -1, "Datos invalidos.");
        new tipo = AdminMembresiaTipoPendiente[playerid];
        PlayerMembresiaTipo[id] = tipo;
        PlayerMembresiaExpiraTick[id] = GetTickCount() + (dias * 86400000);
        GuardarCuenta(id);
        new txt[128], nom[24];
        GetMembresiaNombre(tipo, nom, sizeof(nom));
        format(txt, sizeof(txt), "Asignaste membresia %s por %d dia(s) al jugador %d.", nom, dias, id);
        SendClientMessage(playerid, 0x66FF66FF, txt);
        format(txt, sizeof(txt), "Un Owner te asigno membresia %s por %d dia(s).", nom, dias);
        SendClientMessage(id, GetMembresiaColor(tipo), txt);
        return MostrarMenuAdminMembresias(playerid);
    }

    if(dialogid == DIALOG_ADMIN_MEMBRESIA_ELIMINAR_ID) {
        if(!response) return MostrarMenuAdminMembresias(playerid);
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        new id = strval(inputtext);
        if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "ID invalido.");
        PlayerMembresiaTipo[id] = MEMBRESIA_NINGUNA;
        PlayerMembresiaExpiraTick[id] = 0;
        GuardarCuenta(id);
        SendClientMessage(playerid, 0x66FF66FF, "Membresia eliminada correctamente.");
        SendClientMessage(id, 0xFFAA00FF, "Tu membresia fue removida por un Owner.");
        return MostrarMenuAdminMembresias(playerid);
    }

    if(dialogid == DIALOG_EDITMAP_EDIT_LIST) {
        if(!response) return ShowEditMapMenu(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new slot = GetEditMapSlotByListIndex(listitem);
        if(slot == -1) return SendClientMessage(playerid, -1, "Objeto invalido.");
        EditMapEditandoSlot[playerid] = slot;
        EditObject(playerid, EditMapData[slot][emObj]);
        SendClientMessage(playerid, 0x66FF66FF, "Editando objeto seleccionado. Confirma para guardar.");
        return 1;
    }

    if(dialogid == DIALOG_EDITMAP_DELETE_LIST) {
        if(!response) return ShowEditMapMenu(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new slot = GetEditMapSlotByListIndex(listitem);
        if(slot == -1) return SendClientMessage(playerid, -1, "Objeto invalido.");
        if(EditMapData[slot][emObj] != INVALID_OBJECT_ID) DestroyObject(EditMapData[slot][emObj]);
        EditMapData[slot][emActivo] = false;
        EditMapData[slot][emObj] = INVALID_OBJECT_ID;
        GuardarEditMap();
        SendClientMessage(playerid, 0xFFAA00FF, "Objeto eliminado del editmap.");
        return ShowEditMapDeleteList(playerid);
    }

    if(dialogid == DIALOG_EDITMAP_LISTA) {
        if(!response) return ShowEditMapMenu(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new slot = GetEditMapSlotByListIndex(listitem);
        if(slot == -1) return SendClientMessage(playerid, -1, "Objeto invalido.");
        EditMapListaSlotSeleccionado[playerid] = slot;
        return ShowPlayerDialog(playerid, DIALOG_EDITMAP_LISTA_ACCION, DIALOG_STYLE_LIST, "EditMap - Accion", "Editar objeto\nEliminar objeto", "Elegir", "Atras");
    }

    if(dialogid == DIALOG_EDITMAP_LISTA_ACCION) {
        if(!response) return ShowEditMapViewList(playerid);
        if(PlayerAdmin[playerid] < 1) return 1;
        new slot = EditMapListaSlotSeleccionado[playerid];
        if(slot < 0 || slot >= TotalEditMap || !EditMapData[slot][emActivo]) {
            EditMapListaSlotSeleccionado[playerid] = -1;
            return SendClientMessage(playerid, -1, "Objeto invalido.");
        }

        if(listitem == 0) {
            EditMapEditandoSlot[playerid] = slot;
            EditObject(playerid, EditMapData[slot][emObj]);
            SendClientMessage(playerid, 0x66FF66FF, "Editando objeto seleccionado. Confirma para guardar.");
            EditMapListaSlotSeleccionado[playerid] = -1;
            return 1;
        }

        if(listitem == 1) {
            if(EditMapData[slot][emObj] != INVALID_OBJECT_ID) DestroyObject(EditMapData[slot][emObj]);
            EditMapData[slot][emActivo] = false;
            EditMapData[slot][emObj] = INVALID_OBJECT_ID;
            GuardarEditMap();
            EditMapListaSlotSeleccionado[playerid] = -1;
            SendClientMessage(playerid, 0xFFAA00FF, "Objeto eliminado del editmap.");
            return ShowEditMapViewList(playerid);
        }

        return 1;
    }

    if(dialogid == DIALOG_ADMIN_VIDA_CHALECO_VALOR) {
        if(!response) return ShowPlayerDialog(playerid, DIALOG_ADMIN_VIDA_CHALECO_ID, DIALOG_STYLE_INPUT, "Admin - Vida/Chaleco", "Ingresa ID del jugador", "Siguiente", "Atras");
        if(PlayerAdmin[playerid] < 1) return 1;
        new target = AdminVidaChalecoTargetPendiente[playerid];
        new porcentaje = strval(inputtext);
        if(!IsPlayerConnected(target)) return SendClientMessage(playerid, -1, "Jugador desconectado.");
        if(porcentaje < 0 || porcentaje > 100) return SendClientMessage(playerid, -1, "Porcentaje invalido (0-100).");
        if(AdminVidaChalecoTipoPendiente[playerid] == 0) {
            SetPlayerHealth(target, float(porcentaje));
            SendClientMessage(playerid, 0x66FF66FF, "Vida aplicada correctamente.");
        } else {
            SetPlayerArmour(target, float(porcentaje));
            SendClientMessage(playerid, 0x66FF66FF, "Chaleco aplicado correctamente.");
        }
        SendClientMessage(target, 0x66FF66FF, "Un admin actualizo tu vida/chaleco.");
        return 1;
    }
    if(dialogid == DIALOG_PLANTAR) {
        if(!response) return 1;
        if(PlayerInCasa[playerid] == -1) return SendClientMessage(playerid, -1, "Solo puedes plantar dentro de una casa.");
        if(PlantasColocadas[playerid] >= GetLimitePlantasJugador(playerid)) {
            new aviso[96];
            format(aviso, sizeof(aviso), "Limite alcanzado: maximo %d plantas segun tu membresia.", GetLimitePlantasJugador(playerid));
            return SendClientMessage(playerid, -1, aviso);
        }

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
        CultivoReadyTick[playerid][slot] = GetTickCount() + (duracion * 60000);
        CultivoCantidadBase[playerid][slot] = 2;

        new modeloCultivo = (CultivoTipo[playerid][slot] == 2) ? MODELO_FLOR_OBJ : MODELO_HIERBA_OBJ;
        CultivoObj[playerid][slot] = CreateObject(modeloCultivo, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2], 0.0, 0.0, 0.0, 200.0);
        CultivoLabel[playerid][slot] = Create3DTextLabel("Cultivo en progreso", 0x00FF00FF, CultivoPos[playerid][slot][0], CultivoPos[playerid][slot][1], CultivoPos[playerid][slot][2] + 0.9, 20.0, PlayerInCasa[playerid] + 1);
        ActualizarLabelCultivo(playerid, slot);

        if(CultivoTimer[playerid] == -1) CultivoTimer[playerid] = SetTimerEx("ActualizarCultivo", 1000, true, "d", playerid);

        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
        new plantmsg[120];
        format(plantmsg, sizeof(plantmsg), "Semilla plantada (%d/%d). Revisa el tiempo en el texto de la planta.", PlantasColocadas[playerid], GetLimitePlantasJugador(playerid));
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
            GuardarArmeriaConfig();
            SendClientMessage(playerid, 0x00FF00FF, "Precio de arma actualizado.");
            return ShowAdminArmasMenu(playerid);
        }

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
                ArmeriaItems[i][aiStockArma] = 1;
                ArmeriaItems[i][aiStockMunicion] = 9999;
                GuardarArmeriaConfig();
                SendClientMessage(playerid, 0x00FF00FF, "Arma agregada a la tienda correctamente.");
                return ShowAdminArmasMenu(playerid);
            }
        }
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
        GuardarArmeriaConfig();
        SendClientMessage(playerid, 0x00FF00FF, "Disponibilidad de arma actualizada.");
        return ShowAdminArmasMenu(playerid);
    }

    if(dialogid == DIALOG_ADMIN_ARMAS_REMOVE) {
        if(!response) return ShowAdminArmasMenu(playerid);
        new item = GetArmeriaItemByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Item invalido.");
        ArmeriaItems[item][aiActiva] = false;
        GuardarArmeriaConfig();
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
        GuardarCuenta(playerid);
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
        GuardarCuenta(playerid);
        return ShowArmeriaMunicionDisponible(playerid);
    }

    if(dialogid == DIALOG_VENTA_SKINS_ADMIN_MENU) {
        if(!response) return 1;
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
        if(!IsNearVentaSkins(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de skins.");
        if(listitem == 0) return ShowPlayerDialog(playerid, DIALOG_VENTA_SKINS_ADD_ID, DIALOG_STYLE_INPUT, "Venta de Skins - Paso 1", "Ingresa ID de skin (0-311):", "Siguiente", "Cancelar");
        if(listitem == 1) return ShowVentaSkinsRemoveMenu(playerid);
        return 1;
    }

    if(dialogid == DIALOG_VENTA_SKINS_ADD_ID) {
        if(!response) return ShowVentaSkinsAdminMenu(playerid);
        if(!EsDueno(playerid) || !IsNearVentaSkins(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de skins.");
        new skin = strval(inputtext);
        if(skin < 0 || skin > 311) return SendClientMessage(playerid, -1, "ID de skin invalido (0-311).");
        VentaSkinsAdminSkinPendiente[playerid] = skin;
        return ShowPlayerDialog(playerid, DIALOG_VENTA_SKINS_ADD_PRECIO, DIALOG_STYLE_INPUT, "Venta de Skins - Paso 2", "Ingresa el precio de la skin:", "Guardar", "Atras");
    }

    if(dialogid == DIALOG_VENTA_SKINS_ADD_PRECIO) {
        if(!response) return ShowVentaSkinsAdminMenu(playerid);
        if(!EsDueno(playerid) || !IsNearVentaSkins(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de skins.");
        new precio = strval(inputtext);
        if(precio <= 0) return SendClientMessage(playerid, -1, "Precio invalido.");
        new skin = VentaSkinsAdminSkinPendiente[playerid];
        if(skin < 0 || skin > 311) return SendClientMessage(playerid, -1, "No hay skin pendiente valida.");

        for(new i = 0; i < MAX_SKINS_VENTA; i++) {
            if(VentaSkinsData[i][vsActiva] && VentaSkinsData[i][vsSkin] == skin) {
                VentaSkinsData[i][vsPrecio] = precio;
                GuardarVentaSkinsConfig();
                ActualizarLabelVentaSkins();
                SendClientMessage(playerid, 0x00FF00FF, "Skin actualizada correctamente.");
                return ShowVentaSkinsAdminMenu(playerid);
            }
        }

        for(new i = 0; i < MAX_SKINS_VENTA; i++) {
            if(!VentaSkinsData[i][vsActiva]) {
                VentaSkinsData[i][vsActiva] = true;
                VentaSkinsData[i][vsSkin] = skin;
                VentaSkinsData[i][vsPrecio] = precio;
                GuardarVentaSkinsConfig();
                ActualizarLabelVentaSkins();
                SendClientMessage(playerid, 0x00FF00FF, "Skin agregada correctamente.");
                return ShowVentaSkinsAdminMenu(playerid);
            }
        }
        return SendClientMessage(playerid, -1, "No hay espacio para mas skins.");
    }

    if(dialogid == DIALOG_VENTA_SKINS_REMOVE_LIST) {
        if(!response) return ShowVentaSkinsAdminMenu(playerid);
        if(!EsDueno(playerid) || !IsNearVentaSkins(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de skins.");
        new item = GetVentaSkinByAnyListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        VentaSkinsData[item][vsActiva] = false;
        VentaSkinsData[item][vsSkin] = 0;
        VentaSkinsData[item][vsPrecio] = 0;
        GuardarVentaSkinsConfig();
        ActualizarLabelVentaSkins();
        SendClientMessage(playerid, 0x00FF00FF, "Skin eliminada de la venta.");
        return ShowVentaSkinsAdminMenu(playerid);
    }

    if(dialogid == DIALOG_VENTA_SKINS_BUY) {
        if(!response) return 1;
        new item = GetVentaSkinByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        if(GetPlayerMoney(playerid) < VentaSkinsData[item][vsPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");
        GivePlayerMoney(playerid, -VentaSkinsData[item][vsPrecio]);
        SetPlayerSkin(playerid, VentaSkinsData[item][vsSkin]);
        PlayerSkinGuardada[playerid] = VentaSkinsData[item][vsSkin];
        GuardarCuenta(playerid);
        SendClientMessage(playerid, 0x00FF00FF, "Compra completada. Tu skin fue actualizada y guardada.");
        return 1;
    }

    if(dialogid == DIALOG_VENTA_AUTOS_ADMIN_MENU) {
        if(!response) return 1;
        if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
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
                GuardarVentaAutosConfig();
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
                GuardarVentaAutosConfig();
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
        GuardarVentaAutosConfig();
        SendClientMessage(playerid, 0x00FF00FF, "Modelo eliminado de la venta.");
        ActualizarLabelVentaAutos();
        return ShowVentaAutosAdminMenu(playerid);
    }

    if(dialogid == DIALOG_VENTA_AUTOS_BUY) {
        if(!response) return 1;
        new item = GetVentaAutoByListIndex(listitem);
        if(item == -1) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        new limiteVeh = GetLimiteVehiculosJugador(playerid);
        if(ContarVehiculosTotalesJugador(playerid) >= limiteVeh) {
            new msgLimite[96];
            format(msgLimite, sizeof(msgLimite), "Limite alcanzado: maximo %d autos por jugador.", limiteVeh);
            return SendClientMessage(playerid, -1, msgLimite);
        }
        if(GetPlayerMoney(playerid) < VentaAutosData[item][vaPrecio]) return SendClientMessage(playerid, -1, "No tienes dinero suficiente.");

        new Float:px, Float:py, Float:pz, Float:pa;
        GetPlayerPos(playerid, px, py, pz);
        GetPlayerFacingAngle(playerid, pa);
        new veh = CreateVehicle(VentaAutosData[item][vaModelo], px + 3.0, py, pz, pa, -1, -1, 120);
        if(veh == INVALID_VEHICLE_ID) return SendClientMessage(playerid, -1, "No se pudo crear el vehiculo.");
        if(VehOwner[veh] != -1 && VehModelData[veh] >= 400 && VehModelData[veh] <= 611) {
            DestroyVehicle(veh);
            return SendClientMessage(playerid, -1, "No se pudo entregar el auto sin riesgo de perder tus vehiculos. Intenta nuevamente.");
        }
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
        ResetMaleteroVehiculo(veh, playerid);
        VentaAutosData[item][vaStock]--;
        GuardarVentaAutosConfig();
        GuardarCuenta(playerid);
        ActualizarLabelVentaAutos();
        SendClientMessage(playerid, 0x00FF00FF, "Compra confirmada. El concesionario te entrega las llaves de tu nuevo auto.");
        return 1;
    }
    if(dialogid == DIALOG_MALETERO_MENU) {
        if(!response) return 1;
        new veh = GetPVarInt(playerid, "MaleteroMaleteroVeh");
        if(!PlayerTieneAccesoVehiculo(playerid, veh)) return SendClientMessage(playerid, -1, "No puedes abrir este maletero.");

        new armas;
        new limiteSlots = MaleteroSlotsVeh[veh];
        if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
        new limiteMembresiaMaletero = GetLimiteMaleteroJugador(playerid);
        if(limiteSlots > limiteMembresiaMaletero) limiteSlots = limiteMembresiaMaletero;
        for(new c = 0; c < limiteSlots; c++) {
            if(MaleteroArmaSlotIdVeh[veh][c] > 0 && MaleteroArmaSlotAmmoVeh[veh][c] > 0) armas++;
        }
        if(listitem >= armas) return 1; // cerrar

        new idx = 0;
        for(new i = 0; i < limiteSlots; i++) {
            new w = MaleteroArmaSlotIdVeh[veh][i];
            new ammo = MaleteroArmaSlotAmmoVeh[veh][i];
            if(w <= 0 || w >= MAX_WEAPON_ID_GM || ammo <= 0) continue;
            if(idx == listitem) {
                GivePlayerWeapon(playerid, WEAPON:w, ammo);
                PlayerArmaComprada[playerid][w] = true;
                PlayerAmmoInventario[playerid][w] += ammo;
                MaleteroArmaSlotIdVeh[veh][i] = 0;
                MaleteroArmaSlotAmmoVeh[veh][i] = 0;
                if(MaleteroArmasVeh[veh][w] >= ammo) MaleteroArmasVeh[veh][w] -= ammo;
                else MaleteroArmasVeh[veh][w] = 0;
                GuardarCuenta(playerid);
                SendClientMessage(playerid, 0x00FF00FF, "Sacaste el arma del maletero.");
                return ShowMaleteroMaletero(playerid, veh);
            }
            idx++;
        }
        return 1;
    }


    if(dialogid == DIALOG_TUNING_MENU) {
        if(!response) return 1;
        if(listitem == 0) {
            new colores[512];
            format(colores, sizeof(colores), "{FF0000}Rojo\n{0000FF}Azul\n{00FF00}Verde\n{000000}Negro\n{FFFFFF}Blanco\n{FFFF00}Amarillo\n{FF00FF}Fucsia\n{00FFFF}Cian\n{FFA500}Naranja\n{800080}Morado\n{8B4513}Cafe\n{A9A9A9}Gris");
            return ShowPlayerDialog(playerid, DIALOG_PINTURA_COLOR, DIALOG_STYLE_LIST, "Tuning Kame House - Colores ($10000)", colores, "Pintar", "Atras");
        }
        if(listitem == 1) return MostrarListaVehiculosChatarra(playerid);
        return 1;
    }

    if(dialogid == DIALOG_PINTURA_COLOR) {
        if(!response) return MostrarMenuTuning(playerid);
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
            case 6: color = 126;
            case 7: color = 128;
            case 8: color = 158;
            case 9: color = 149;
            case 10: color = 55;
            case 11: color = 8;
        }
        ChangeVehicleColours(veh, color, color);
        VehColor1Data[veh] = color;
        VehColor2Data[veh] = color;
        GivePlayerMoney(playerid, -10000);
        SendClientMessage(playerid, 0x00FF00FF, "Pintura aplicada correctamente. Costo: $10000.");
        return 1;
    }

    if(dialogid == DIALOG_CHATARRA_VEHICULO) {
        if(!response) return MostrarMenuTuning(playerid);
        if(listitem < 0 || listitem >= TuningVehCount[playerid]) return SendClientMessage(playerid, -1, "Seleccion invalida.");
        new veh = TuningVehLista[playerid][listitem];
        if(veh <= 0 || veh >= MAX_VEHICLES || VehOwner[veh] != playerid) return SendClientMessage(playerid, -1, "El vehiculo seleccionado ya no esta disponible.");
        new precioOriginal = GetPrecioOriginalVehiculo(VehModelData[veh]);
        if(precioOriginal <= 0) precioOriginal = 100000;
        new pago = (precioOriginal * 70) / 100;
        GivePlayerMoney(playerid, pago);
        EliminarVehiculoJugador(veh);
        GuardarCuenta(playerid);
        new msg[144];
        format(msg, sizeof(msg), "Vendiste tu vehiculo como chatarra y recibiste $%d (70%% del precio original).", pago);
        SendClientMessage(playerid, 0x66FF66FF, msg);
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

    new path[128], line[256];
    ResolverPathCuenta(playerid, path, sizeof(path));
    if(dialogid == DIALOG_REGISTRO) {
        if(!response) return Kick(playerid);
        if(strlen(inputtext) < 3) return ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{66FF99}Kame House - Registro", "{FF6666}La clave debe tener al menos 3 caracteres.\n{AAAAAA}Ingresa una clave valida:", "Registrar", "Salir");
        strmid(PlayerPassword[playerid], inputtext, 0, sizeof(PlayerPassword[]), sizeof(PlayerPassword[]));
        new File:h = AbrirCuentaEscritura(playerid, path, sizeof(path));
        if(h) {
            format(line, 128, "%s\n%d\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n0\n2494.24\n-1671.19\n13.33", PlayerPassword[playerid], DINERO_INICIAL);
            fwrite(h, line); fclose(h);
            IsPlayerLoggedIn[playerid] = true;
            GivePlayerMoney(playerid, DINERO_INICIAL);
            ActualizarNivelPJ(playerid);
            GuardarCuenta(playerid);
            SendClientMessage(playerid, 0x66CCFFFF, "{66FF99}Bienvenido a Kame House.");
            SpawnPlayerAfterAuth(playerid);
        } else {
            SendClientMessage(playerid, 0xFF4444FF, "No se pudo crear tu cuenta. Revisa la carpeta 'usuarios' del servidor.");
            ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{66FF99}Kame House - Registro", "{FF6666}Error guardando la cuenta.\n{AAAAAA}Intenta nuevamente:", "Registrar", "Salir");
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
                    PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
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
                        PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
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
                            PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
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
                                PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
                                v[0] = floatstr(line);
                                fread(h, line); v[1] = floatstr(line);
                                fread(h, line); v[2] = floatstr(line);
                            } else {
                                PlayerTiempoJugadoMin[playerid] = strval(line);
                                fread(h, line);
                                if(strfind(line, ".") != -1) {
                                    PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
                                    v[0] = floatstr(line);
                                    fread(h, line); v[1] = floatstr(line);
                                    fread(h, line); v[2] = floatstr(line);
                                } else {
                                    PlayerSkinGuardada[playerid] = strval(line);
                                    if(PlayerSkinGuardada[playerid] < 0 || PlayerSkinGuardada[playerid] > 311) PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
                                    fread(h, line); v[0] = floatstr(line);
                                    fread(h, line); v[1] = floatstr(line);
                                    fread(h, line); v[2] = floatstr(line);
                                }
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
                        PlayerDiamantes[playerid] = 0;
                        PlayerMembresiaTipo[playerid] = MEMBRESIA_NINGUNA;
                        PlayerMembresiaExpiraTick[playerid] = 0;
                        if(dataVersion >= 8) {
                            if(fread(h, line)) PlayerDiamantes[playerid] = strval(line);
                            if(fread(h, line)) PlayerMembresiaTipo[playerid] = strval(line);
                            if(fread(h, line)) PlayerMembresiaExpiraTick[playerid] = strval(line);
                        }
                        format(PlayerCorreo[playerid], sizeof(PlayerCorreo[]), "");
                        if(dataVersion >= 6) {
                            if(fread(h, line)) {
                                LimpiarLinea(line);
                                format(PlayerCorreo[playerid], sizeof(PlayerCorreo[]), "%s", line);
                            }
                        }

                        if(fread(h, line)) {
                            LimpiarLinea(line);
                            if(strcmp(line, CUENTA_SECCION_PRENDAS, false) == 0) {
                                new bool:vehiculosCargados = false;
                                for(new pi = 0; pi < MAX_PRENDAS; pi++) {
                                    if(!fread(h, line)) break;
                                    LimpiarLinea(line);
                                    if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) {
                                        CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                        vehiculosCargados = true;
                                        break;
                                    }
                                    if(!EsLineaPrendaCuenta(line)) continue;
                                    CargarPrendaJugadorDesdeLinea(playerid, pi, line);
                                }
                                if(!vehiculosCargados && fread(h, line)) {
                                    LimpiarLinea(line);
                                    if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                    else CargarVehiculosJugadorDesdeLinea(playerid, h, line);
                                }
                            } else {
                                if(EsLineaPrendaCuenta(line)) {
                                    new bool:vehiculosCargados = false;
                                    CargarPrendaJugadorDesdeLinea(playerid, 0, line);
                                    for(new pi = 1; pi < MAX_PRENDAS; pi++) {
                                        if(!fread(h, line)) break;
                                        LimpiarLinea(line);
                                        if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) {
                                            CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                            vehiculosCargados = true;
                                            break;
                                        }
                                        if(!EsLineaPrendaCuenta(line)) continue;
                                        CargarPrendaJugadorDesdeLinea(playerid, pi, line);
                                    }
                                    if(!vehiculosCargados && fread(h, line)) {
                                        LimpiarLinea(line);
                                        if(strcmp(line, CUENTA_SECCION_VEHICULOS, false) == 0) CargarVehiculosJugadorDesdeCuenta(playerid, h);
                                        else CargarVehiculosJugadorDesdeLinea(playerid, h, line);
                                    }
                                } else {
                                    CargarVehiculosJugadorDesdeLinea(playerid, h, line);
                                }
                            }
                        }
                    }
                }
                ReconciliarPrendasJugador(playerid);

                PlayerFaccionId[playerid] = -1;
                PlayerFaccionRango[playerid] = 0;
                new nombreCuenta[MAX_PLAYER_NAME];
                GetPlayerName(playerid, nombreCuenta, sizeof(nombreCuenta));
                for(new f = 0; f < MAX_FACCIONES; f++) {
                    if(!FaccionData[f][facActiva]) continue;
                    if(FaccionOwnerNombre[f][0] && !strcmp(FaccionOwnerNombre[f], nombreCuenta, true)) {
                        FaccionData[f][facOwner] = playerid;
                        GuardarNombreJugadorEnFaccion(playerid, f);
                    }
                    for(new m = 0; m < MAX_MIEMBROS_FACCION; m++) {
                        if(FaccionMiembroNombre[f][m][0] && !strcmp(FaccionMiembroNombre[f][m], nombreCuenta, true)) {
                            FaccionData[f][facMiembros][m] = playerid;
                            PlayerFaccionId[playerid] = f;
                            PlayerFaccionRango[playerid] = FaccionData[f][facRangos][m];
                            if(PlayerFaccionRango[playerid] == FACCION_RANGO_OWNER) FaccionData[f][facOwner] = playerid;
                            GuardarNombreJugadorEnFaccion(playerid, f, m);
                            break;
                        }
                    }
                    if(PlayerFaccionId[playerid] != -1) break;
                }
                if(PlayerFaccionId[playerid] != -1) GuardarFacciones();

                ActualizarNivelPJ(playerid);
                SendClientMessage(playerid, 0x66CCFFFF, "{33CCFF}Bienvenido de nuevo a Kame House.");
                fclose(h); SpawnPlayerAfterAuth(playerid);
            } else { fclose(h); ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Error", "Clave incorrecta.", "Entrar", "Salir"); }
        }
    }
    return 1;
}

public GuardarCuenta(playerid) {
    if(IsPlayerLoggedIn[playerid]) {
        new path[128], line[256], Float:p[3];
        GetPlayerPos(playerid, p[0], p[1], p[2]);
        new File:h = AbrirCuentaEscritura(playerid, path, sizeof(path));
        if(h) {
            if(PlayerSkinGuardada[playerid] < 0 || PlayerSkinGuardada[playerid] > 311) PlayerSkinGuardada[playerid] = SKIN_POR_DEFECTO;
            format(line, 256, "%s\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%f\n%f\n%f\n%d",
                PlayerPassword[playerid], GetPlayerMoney(playerid), PlayerAdmin[playerid],
                CamioneroNivel[playerid], CamioneroViajes[playerid], PizzeroNivel[playerid], PizzeroEntregas[playerid], PlayerBankMoney[playerid], InvSemillaHierba[playerid], InvSemillaFlor[playerid], InvHierba[playerid], InvFlor[playerid], PlayerTiempoJugadoMin[playerid], PlayerSkinGuardada[playerid], p[0], p[1], p[2], CUENTA_DATA_VERSION);
            fwrite(h, line);

            format(line, sizeof(line), "\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d",
                InvMadera[playerid], InvPiedra[playerid], InvCobre[playerid], InvHierroMineral[playerid], InvPolvora[playerid], InvPrepieza[playerid], InvCarbon[playerid],
                PlayerTieneMazo[playerid] ? 1 : 0, MazoDurabilidad[playerid], ArmeroNivel[playerid], ArmeroExp[playerid], BasureroNivel[playerid], BasureroRecorridos[playerid], BidonGasolina[playerid], PlayerTieneTelefono[playerid] ? 1 : 0,
                PlayerDiamantes[playerid], PlayerMembresiaTipo[playerid], PlayerMembresiaExpiraTick[playerid]);
            fwrite(h, line);

            format(line, sizeof(line), "\n%s", PlayerCorreo[playerid]);
            fwrite(h, line);

            format(line, sizeof(line), "\n%s", CUENTA_SECCION_PRENDAS);
            fwrite(h, line);

            for(new pi = 0; pi < MAX_PRENDAS; pi++) {
                if(PlayerPrendaComprada[playerid][pi] && PlayerPrendaModelo[playerid][pi] <= 0) PlayerPrendaModelo[playerid][pi] = PrendasData[pi][prendaModelo];
                ObtenerNombrePrendaJugador(playerid, pi, PlayerPrendaNombre[playerid][pi], 32);
                format(line, sizeof(line), "\n%d %d %d %f %f %f %f %f %f %f %f %f %d %s",
                    PlayerPrendaComprada[playerid][pi], PlayerPrendaActiva[playerid][pi], PlayerPrendaBone[playerid][pi],
                    PlayerPrendaOffX[playerid][pi], PlayerPrendaOffY[playerid][pi], PlayerPrendaOffZ[playerid][pi],
                    PlayerPrendaRotX[playerid][pi], PlayerPrendaRotY[playerid][pi], PlayerPrendaRotZ[playerid][pi],
                    PlayerPrendaScaleX[playerid][pi], PlayerPrendaScaleY[playerid][pi], PlayerPrendaScaleZ[playerid][pi], PlayerPrendaModelo[playerid][pi], PlayerPrendaNombre[playerid][pi]);
                fwrite(h, line);
            }

            format(line, sizeof(line), "\n%s", CUENTA_SECCION_VEHICULOS);
            fwrite(h, line);

            GuardarVehiculosJugadorEnCuenta(playerid, h);
            GuardarArmasJugadorEnCuenta(playerid, h);
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
            format(line, sizeof(line), "%f %f %f %d %d %s %s\n",
                CasaData[i][cX], CasaData[i][cY], CasaData[i][cZ],
                CasaData[i][cInteriorSlot], CasaData[i][cPrecio], CasaData[i][cOwner], CasaData[i][cFriends]);
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

    VentaAutosPos[0] = PuntoPos[puntoVentaAutos][0];
    VentaAutosPos[1] = PuntoPos[puntoVentaAutos][1];
    VentaAutosPos[2] = PuntoPos[puntoVentaAutos][2];
    VentaSkinsPos[0] = PuntoPos[puntoVentaSkins][0];
    VentaSkinsPos[1] = PuntoPos[puntoVentaSkins][1];
    VentaSkinsPos[2] = PuntoPos[puntoVentaSkins][2];
    return 1;
}

public BajarHambre() {
    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && IsPlayerLoggedIn[i]) {
        ActualizarLabelJugadorFaccion(i);
        if(PlayerHambre[i] > 0) {
            PlayerHambre[i]--;
            ActualizarBarrasEstado(i);
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
                new paymsg[128];
                format(paymsg, sizeof(paymsg), "Pago horario recibido por nivel PJ: $%d", pago);
                SendClientMessage(i, 0x00FF00FF, paymsg);
            }
            if(PlayerTiempoJugadoMin[i] % 1440 == 0) {
                new totalVehiculos = ContarVehiculosTotalesJugador(i);
                if(totalVehiculos > 0) {
                    new cobro = totalVehiculos * COBRO_DIARIO_POR_VEHICULO;
                    GivePlayerMoney(i, -cobro);
                    new msgCobro[144];
                    format(msgCobro, sizeof(msgCobro), "Cobro diario por tenencia vehicular: -$%d (%d vehiculos).", cobro, totalVehiculos);
                    SendClientMessage(i, 0xFFAA00FF, msgCobro);
                }
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

stock GetNombreArmaPVE(weaponid, dest[], len) {
    if(weaponid == 22) return format(dest, len, "Colt 45");
    if(weaponid == 23) return format(dest, len, "Silenciada");
    if(weaponid == 24) return format(dest, len, "Desert Eagle");
    if(weaponid == 25) return format(dest, len, "Escopeta");
    if(weaponid == 29) return format(dest, len, "MP5");
    if(weaponid == 30) return format(dest, len, "AK-47");
    if(weaponid == 31) return format(dest, len, "M4");
    if(weaponid == 3) return format(dest, len, "Palo de billar");
    if(weaponid == 4) return format(dest, len, "Cuchillo");
    return format(dest, len, "Arma %d", weaponid);
}

stock LimpiarBandasPVE() {
    for(new g = 0; g < MAX_BANDAS_PVE; g++) {
        BandaGrupoActivo[g] = false;
        BandaGrupoMiembros[g] = 0;
        BandaUltimaAccionTick[g] = 0;
        BandaGrupoAtacandoA[g] = -1;
        BandaSpawnAsignado[g] = -1;
        for(new m = 0; m < MAX_BANDEROS_POR_GRUPO; m++) {
            if(BandaActorId[g][m] != INVALID_ACTOR_ID) DestroyActor(BandaActorId[g][m]);
            BandaActorId[g][m] = INVALID_ACTOR_ID;
            if(BandaArmaObjetoId[g][m] != INVALID_OBJECT_ID) DestroyObject(BandaArmaObjetoId[g][m]);
            BandaArmaObjetoId[g][m] = INVALID_OBJECT_ID;
            BandaVida[g][m] = 0.0;
            BandaArma[g][m] = 0;
            BandaVivo[g][m] = false;
            BandaPatrullaObjetivo[g][m][0] = 0.0;
            BandaPatrullaObjetivo[g][m][1] = 0.0;
            BandaPatrullaRecalculoTick[g][m] = 0;
        }
    }
    for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i)) LimpiarIconosBandasParaJugador(i);
    return 1;
}

stock GetModeloObjetoArmaBandero(weaponid) {
    switch(weaponid) {
        case 22: return 346;
        case 23: return 347;
        case 24: return 348;
        case 25: return 349;
        case 29: return 353;
        case 30: return 355;
        case 31: return 356;
        case 3: return 336;
        case 4: return 335;
    }
    return 0;
}

stock ActualizarArmaVisibleBandero(grupo, miembro) {
    if(grupo < 0 || grupo >= MAX_BANDAS_PVE || miembro < 0 || miembro >= MAX_BANDEROS_POR_GRUPO) return 0;

    if(BandaArmaObjetoId[grupo][miembro] != INVALID_OBJECT_ID) {
        DestroyObject(BandaArmaObjetoId[grupo][miembro]);
        BandaArmaObjetoId[grupo][miembro] = INVALID_OBJECT_ID;
    }

    if(!BandaVivo[grupo][miembro] || BandaActorId[grupo][miembro] == INVALID_ACTOR_ID) return 1;

    new model = GetModeloObjetoArmaBandero(BandaArma[grupo][miembro]);
    if(model == 0) return 1;

    new Float:x, Float:y, Float:z;
    GetActorPos(BandaActorId[grupo][miembro], x, y, z);
    BandaArmaObjetoId[grupo][miembro] = CreateObject(model, x, y, z + 0.85, 0.0, 0.0, 0.0);
    return 1;
}

stock AplicarAnimacionBandero(actorid, weaponid, bool:atacando = false, bool:corriendo = false) {
    if(actorid == INVALID_ACTOR_ID) return 0;

    if(atacando) {
        switch(weaponid) {
            case 22, 23:
                ApplyActorAnimation(actorid, "COLT45", "colt45_fire", 4.1, false, false, false, true, 0);
            case 24:
                ApplyActorAnimation(actorid, "COLT45", "sawnoff_reload", 4.1, false, false, false, true, 0);
            case 25:
                ApplyActorAnimation(actorid, "SHOTGUN", "shotgun_fire", 4.1, false, false, false, true, 0);
            case 29:
                ApplyActorAnimation(actorid, "UZI", "UZI_fire", 4.1, false, false, false, true, 0);
            case 30, 31:
                ApplyActorAnimation(actorid, "RIFLE", "RIFLE_fire", 4.1, false, false, false, true, 0);
            case 3, 4:
                ApplyActorAnimation(actorid, "KNIFE", "KILL_Knife_Ped_Damage", 4.1, false, false, false, true, 0);
            default:
                ApplyActorAnimation(actorid, "PED", "IDLE_GANG1", 4.1, true, false, false, true, 0);
        }
        return 1;
    }

    if(corriendo) {
        ApplyActorAnimation(actorid, "PED", "JOG_maleA", 4.1, true, false, false, true, 0);
        return 1;
    }

    ApplyActorAnimation(actorid, "PED", "WALK_gang1", 4.1, true, false, false, true, 0);
    return 1;
}

stock RecalcularPatrullaBandero(grupo, miembro) {
    if(grupo < 0 || grupo >= MAX_BANDAS_PVE || miembro < 0 || miembro >= MAX_BANDEROS_POR_GRUPO) return 0;
    if(BandaSpawnAsignado[grupo] < 0 || BandaSpawnAsignado[grupo] >= TotalBandaSpawns) return 0;

    new idxSpawn = BandaSpawnAsignado[grupo];
    new Float:baseX = BandaSpawnPos[idxSpawn][0];
    new Float:baseY = BandaSpawnPos[idxSpawn][1];
    new Float:ox = float(random(900) - 450) / 100.0;
    new Float:oy = float(random(900) - 450) / 100.0;

    BandaPatrullaObjetivo[grupo][miembro][0] = baseX + ox;
    BandaPatrullaObjetivo[grupo][miembro][1] = baseY + oy;
    BandaPatrullaRecalculoTick[grupo][miembro] = GetTickCount();
    return 1;
}

stock MoverBanderoHaciaObjetivo(grupo, miembro, Float:tx, Float:ty, Float:distancia) {
    if(grupo < 0 || grupo >= MAX_BANDAS_PVE || miembro < 0 || miembro >= MAX_BANDEROS_POR_GRUPO) return 0;
    if(!BandaVivo[grupo][miembro] || BandaActorId[grupo][miembro] == INVALID_ACTOR_ID) return 0;

    new Float:ax, Float:ay, Float:az;
    GetActorPos(BandaActorId[grupo][miembro], ax, ay, az);

    new Float:dx = tx - ax;
    new Float:dy = ty - ay;
    new Float:plano = floatsqroot((dx * dx) + (dy * dy));
    if(plano < 0.05) return 1;

    new Float:paso = (distancia > BANDA_DISTANCIA_ATAQUE) ? BANDA_PASO_CORRER : BANDA_PASO_CAMINAR;
    if(distancia < BANDA_DISTANCIA_CUERPO) paso = BANDA_PASO_PATRULLA;
    if(plano < paso) paso = plano;

    new Float:nx = ax + (dx / plano) * paso;
    new Float:ny = ay + (dy / plano) * paso;
    new Float:angulo = atan2(dy, dx);

    SetActorPos(BandaActorId[grupo][miembro], nx, ny, az);
    SetActorFacingAngle(BandaActorId[grupo][miembro], angulo);

    if(BandaArmaObjetoId[grupo][miembro] != INVALID_OBJECT_ID) {
        SetObjectPos(BandaArmaObjetoId[grupo][miembro], nx, ny, az + 0.85);
        SetObjectRot(BandaArmaObjetoId[grupo][miembro], 0.0, 0.0, angulo);
    }
    return 1;
}

stock DesactivarSistemaBandasPVE() {
    BandasPVEActivas = false;
    LimpiarBandasPVE();
    return 1;
}

stock CrearGrupoBandaPVE(slot) {
    if(slot < 0 || slot >= MAX_BANDAS_PVE) return 0;
    if(TotalBandaSpawns <= 0) return 0;
    new idxSpawn = random(TotalBandaSpawns);
    new miembros = MIN_BANDEROS_POR_GRUPO + random((MAX_BANDEROS_POR_GRUPO - MIN_BANDEROS_POR_GRUPO) + 1);
    BandaGrupoActivo[slot] = true;
    BandaGrupoMiembros[slot] = miembros;
    BandaUltimaAccionTick[slot] = GetTickCount();
    BandaGrupoAtacandoA[slot] = -1;
    BandaSpawnAsignado[slot] = idxSpawn;

    BandaGrupoCentro[slot][0] = BandaSpawnPos[idxSpawn][0];
    BandaGrupoCentro[slot][1] = BandaSpawnPos[idxSpawn][1];
    BandaGrupoCentro[slot][2] = BandaSpawnPos[idxSpawn][2];

    static const armasDisponibles[] = {22, 23, 24, 25, 29, 30, 31, 3, 4};

    for(new m = 0; m < MAX_BANDEROS_POR_GRUPO; m++) {
        if(BandaActorId[slot][m] != INVALID_ACTOR_ID) DestroyActor(BandaActorId[slot][m]);
        BandaActorId[slot][m] = INVALID_ACTOR_ID;
        if(BandaArmaObjetoId[slot][m] != INVALID_OBJECT_ID) DestroyObject(BandaArmaObjetoId[slot][m]);
        BandaArmaObjetoId[slot][m] = INVALID_OBJECT_ID;
        BandaVida[slot][m] = 0.0;
        BandaArma[slot][m] = 0;
        BandaVivo[slot][m] = false;
        if(m >= miembros) continue;

        new Float:ox = float(random(500) - 250) / 100.0;
        new Float:oy = float(random(500) - 250) / 100.0;
        new Float:x = BandaGrupoCentro[slot][0] + ox;
        new Float:y = BandaGrupoCentro[slot][1] + oy;
        new Float:z = BandaGrupoCentro[slot][2];
        new Float:a = BandaSpawnPos[idxSpawn][3] + float(random(90) - 45);
        new skin = 102 + random(3);

        BandaActorId[slot][m] = CreateActor(skin, x, y, z, a);
        BandaVida[slot][m] = VIDA_BANDERO_PVE;
        BandaArma[slot][m] = armasDisponibles[random(sizeof(armasDisponibles))];
        BandaVivo[slot][m] = true;
        RecalcularPatrullaBandero(slot, m);
        SetActorHealth(BandaActorId[slot][m], VIDA_BANDERO_PVE);
        ActualizarArmaVisibleBandero(slot, m);
        AplicarAnimacionBandero(BandaActorId[slot][m], BandaArma[slot][m]);
    }
    return 1;
}

stock InicializarSistemaBandasPVE() {
    LimpiarBandasPVE();
    if(!BandasPVEActivas) return 1;
    for(new g = 0; g < MAX_BANDAS_PVE; g++) CrearGrupoBandaPVE(g);
    return 1;
}

stock RespawnBandasPVE() {
    if(!BandasPVEActivas) return 0;
    LimpiarBandasPVE();
    for(new g = 0; g < MAX_BANDAS_PVE; g++) CrearGrupoBandaPVE(g);
    SendClientMessageToAll(0xCC66FFFF, "[Bandas PVE] Las bandas fueron reiniciadas por administracion.");
    return 1;
}

stock EncontrarBanderoCercano(Float:x, Float:y, Float:z, &grupo, &miembro) {
    grupo = -1; miembro = -1;
    new Float:minDist = 2.2;
    for(new g = 0; g < MAX_BANDAS_PVE; g++) {
        if(!BandaGrupoActivo[g]) continue;
        for(new m = 0; m < BandaGrupoMiembros[g]; m++) {
            if(!BandaVivo[g][m] || BandaActorId[g][m] == INVALID_ACTOR_ID) continue;
            new Float:ax, Float:ay, Float:az;
            GetActorPos(BandaActorId[g][m], ax, ay, az);
            new Float:dist = GetDistanceBetweenPoints(x, y, z, ax, ay, az);
            if(dist < minDist) {
                minDist = dist;
                grupo = g;
                miembro = m;
            }
        }
    }
    return (grupo != -1);
}

public ProcesarBandasPVE() {
    if(!BandasPVEActivas) return 1;
    new now = GetTickCount();

    for(new g = 0; g < MAX_BANDAS_PVE; g++) {
        if(!BandaGrupoActivo[g]) continue;

        new vivos;
        for(new m = 0; m < BandaGrupoMiembros[g]; m++) if(BandaVivo[g][m]) vivos++;
        if(vivos == 0) {
            CrearGrupoBandaPVE(g);
            continue;
        }

        if(now - BandaUltimaAccionTick[g] >= BANDA_INACTIVA_MS) {
            CrearGrupoBandaPVE(g);
            continue;
        }

        new objetivo = -1;
        new Float:mejor = BANDA_RANGO_VISION;
        for(new i = 0; i < MAX_PLAYERS; i++) {
            if(!IsPlayerConnected(i) || !IsPlayerLoggedIn[i]) continue;
            if(GetPlayerInterior(i) != 0 || GetPlayerVirtualWorld(i) != 0 || PlayerInCasa[i] != -1) continue;
            new Float:px, Float:py, Float:pz;
            GetPlayerPos(i, px, py, pz);
            new Float:d = GetDistanceBetweenPoints(px, py, pz, BandaGrupoCentro[g][0], BandaGrupoCentro[g][1], BandaGrupoCentro[g][2]);
            if(d < mejor) {
                mejor = d;
                objetivo = i;
            }
        }

        BandaGrupoAtacandoA[g] = objetivo;
        for(new i = 0; i < MAX_PLAYERS; i++) {
            if(!IsPlayerConnected(i) || !IsPlayerLoggedIn[i]) continue;
            if(objetivo == -1) RemovePlayerMapIcon(i, 60 + g);
            else SetPlayerMapIcon(i, 60 + g, BandaGrupoCentro[g][0], BandaGrupoCentro[g][1], BandaGrupoCentro[g][2], 0, 0xFF0000FF, MAPICON_LOCAL);
        }

        if(objetivo != -1) BandaUltimaAccionTick[g] = now;

        new Float:px, Float:py, Float:pz;
        if(objetivo != -1) GetPlayerPos(objetivo, px, py, pz);

        for(new m = 0; m < BandaGrupoMiembros[g]; m++) {
            if(!BandaVivo[g][m] || BandaActorId[g][m] == INVALID_ACTOR_ID) continue;

            new Float:ax, Float:ay, Float:az;
            GetActorPos(BandaActorId[g][m], ax, ay, az);

            if(objetivo == -1) {
                if(BandaPatrullaRecalculoTick[g][m] == 0 || now - BandaPatrullaRecalculoTick[g][m] >= BANDA_RECALCULO_PATRULLA_MS) {
                    RecalcularPatrullaBandero(g, m);
                }

                new Float:patX = BandaPatrullaObjetivo[g][m][0];
                new Float:patY = BandaPatrullaObjetivo[g][m][1];
                new Float:patDist = GetDistanceBetweenPoints(ax, ay, az, patX, patY, az);
                if(patDist <= 0.60) {
                    RecalcularPatrullaBandero(g, m);
                    AplicarAnimacionBandero(BandaActorId[g][m], BandaArma[g][m], false, false);
                    continue;
                }

                MoverBanderoHaciaObjetivo(g, m, patX, patY, BANDA_DISTANCIA_CUERPO - 0.1);
                AplicarAnimacionBandero(BandaActorId[g][m], BandaArma[g][m], false, false);
                continue;
            }

            new Float:dist = GetDistanceBetweenPoints(ax, ay, az, px, py, pz);
            new arma = BandaArma[g][m];
            new bool:esMelee = (arma == 3 || arma == 4);

            if(esMelee) {
                if(dist > BANDA_DISTANCIA_CUERPO) {
                    MoverBanderoHaciaObjetivo(g, m, px, py, dist);
                    AplicarAnimacionBandero(BandaActorId[g][m], arma, false, true);
                    continue;
                }
            } else {
                if(dist > BANDA_DISTANCIA_ATAQUE) {
                    MoverBanderoHaciaObjetivo(g, m, px, py, dist);
                    AplicarAnimacionBandero(BandaActorId[g][m], arma, false, true);
                    continue;
                }
                SetActorFacingAngle(BandaActorId[g][m], atan2(py - ay, px - ax));
            }

            new Float:vida;
            GetPlayerHealth(objetivo, vida);
            if(vida <= 0.0) break;

            new Float:danio = BANDA_DANO_MIN + float(random(floatround((BANDA_DANO_MAX - BANDA_DANO_MIN) * 10.0) + 1)) / 10.0;
            if(!esMelee && dist > (BANDA_DISTANCIA_CUERPO + 2.0)) danio += 2.0;
            SetPlayerHealth(objetivo, vida - danio);
            AplicarAnimacionBandero(BandaActorId[g][m], arma, true, false);
            PlayerPlaySound(objetivo, 17802, px, py, pz);
        }

    }
    return 1;
}


stock EliminarSpawnBandaPorIndice(index) {
    if(index < 0 || index >= TotalBandaSpawns) return 0;
    for(new j = index; j < TotalBandaSpawns - 1; j++) {
        BandaSpawnPos[j][0] = BandaSpawnPos[j + 1][0];
        BandaSpawnPos[j][1] = BandaSpawnPos[j + 1][1];
        BandaSpawnPos[j][2] = BandaSpawnPos[j + 1][2];
        BandaSpawnPos[j][3] = BandaSpawnPos[j + 1][3];
    }
    TotalBandaSpawns--;
    return 1;
}

stock ShowAdminBandasSpawnBorrarList(playerid) {
    if(TotalBandaSpawns <= 0) return SendClientMessage(playerid, -1, "No hay spawns de banda para borrar.");

    new list[2048], line[128];
    list[0] = EOS;
    for(new i = 0; i < TotalBandaSpawns; i++) {
        format(line, sizeof(line), "ID %d | X: %.1f Y: %.1f Z: %.1f", i, BandaSpawnPos[i][0], BandaSpawnPos[i][1], BandaSpawnPos[i][2]);
        strcat(list, line);
        if(i < TotalBandaSpawns - 1) strcat(list, "\n");
    }
    return ShowPlayerDialog(playerid, DIALOG_ADMIN_BANDAS_SPAWN_BORRAR, DIALOG_STYLE_LIST, "Bandas - Selecciona punto a borrar", list, "Seleccionar punto", "Atras");
}

stock CargarBandasSpawns() {
    TotalBandaSpawns = 0;
    new File:h = fopen(PATH_BANDAS_SPAWNS, io_read);
    new line[128];
    if(h) {
        while(fread(h, line)) {
            LimpiarLinea(line);
            if(!line[0]) continue;
            if(TotalBandaSpawns >= MAX_BANDA_SPAWNS) break;
            new Float:x, Float:y, Float:z, Float:a;
            new idx = 0;
            x = floatstr(strtok(line, idx));
            y = floatstr(strtok(line, idx));
            z = floatstr(strtok(line, idx));
            a = floatstr(strtok(line, idx));
            BandaSpawnPos[TotalBandaSpawns][0] = x;
            BandaSpawnPos[TotalBandaSpawns][1] = y;
            BandaSpawnPos[TotalBandaSpawns][2] = z;
            BandaSpawnPos[TotalBandaSpawns][3] = a;
            TotalBandaSpawns++;
        }
        fclose(h);
    }
    if(TotalBandaSpawns == 0) {
        BandaSpawnPos[0][0] = 1958.40; BandaSpawnPos[0][1] = -1115.20; BandaSpawnPos[0][2] = 26.60; BandaSpawnPos[0][3] = 90.0;
        BandaSpawnPos[1][0] = 2215.70; BandaSpawnPos[1][1] = -1723.30; BandaSpawnPos[1][2] = 13.30; BandaSpawnPos[1][3] = 180.0;
        BandaSpawnPos[2][0] = 2060.30; BandaSpawnPos[2][1] = -1901.10; BandaSpawnPos[2][2] = 13.20; BandaSpawnPos[2][3] = 0.0;
        BandaSpawnPos[3][0] = 1688.40; BandaSpawnPos[3][1] = -2102.40; BandaSpawnPos[3][2] = 13.10; BandaSpawnPos[3][3] = 45.0;
        BandaSpawnPos[4][0] = 1510.50; BandaSpawnPos[4][1] = -1678.10; BandaSpawnPos[4][2] = 13.10; BandaSpawnPos[4][3] = 270.0;
        TotalBandaSpawns = 5;
        GuardarBandasSpawns();
    }
    return 1;
}

stock GuardarBandasSpawns() {
    new File:h = fopen(PATH_BANDAS_SPAWNS, io_write);
    if(!h) return 0;
    new line[128];
    for(new i = 0; i < TotalBandaSpawns; i++) {
        format(line, sizeof(line), "%f %f %f %f\n", BandaSpawnPos[i][0], BandaSpawnPos[i][1], BandaSpawnPos[i][2], BandaSpawnPos[i][3]);
        fwrite(h, line);
    }
    fclose(h);
    return 1;
}

stock EnviarEntornoAccion(playerid, const accion[]) {
    new string[196], name[MAX_PLAYER_NAME], Float:p[3];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerPos(playerid, p[0], p[1], p[2]);
    format(string, sizeof(string), "[ENTORNO] %s %s", name, accion);
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i) && IsPlayerInRangeOfPoint(i, RADIO_CHAT_LOCAL + 10.0, p[0], p[1], p[2])) SendClientMessage(i, 0x33CC33FF, string);
    }
    return 1;
}

stock LimpiarIconosBandasParaJugador(playerid) {
    for(new g = 0; g < MAX_BANDAS_PVE; g++) RemovePlayerMapIcon(playerid, 60 + g);
    return 1;
}

stock bool:EsArmaProhibida(weaponid) {
    return weaponid == 16 || weaponid == 17 || weaponid == 18 || weaponid == 35 || weaponid == 36 || weaponid == 37 || weaponid == 38 || weaponid == 39;
}

stock GetNivelPJ(playerid) {
    new mins = PlayerTiempoJugadoMin[playerid];
    new nivel = 1;
    new acumulado = 0;
    while(nivel < 1000) {
        new req = HORAS_POR_NIVEL_PJ * nivel * 60;
        if(mins < acumulado + req) break;
        acumulado += req;
        nivel++;
    }
    return nivel;
}

stock ActualizarNivelPJ(playerid) {
    SetPlayerScore(playerid, GetNivelPJ(playerid));
    return 1;
}

public ChequearLimitesMapa() {
    new Float:p[3], Float:h;
    for(new i=0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i) && IsPlayerLoggedIn[i]) {
        ActualizarLabelJugadorFaccion(i);
        if(GetPlayerInterior(i) != 0 || GetPlayerVirtualWorld(i) != 0 || PlayerInCasa[i] != -1) continue;
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
    GuardarMinas();
    GuardarHornos();
    GuardarCajasLoot();
    GuardarPrepiezaPoints();
    GuardarEditMap();
    GuardarVentaAutosConfig();
    GuardarVentaSkinsConfig();
    GuardarArmeriaConfig();
    GuardarTiendaVirtualConfig();
    GuardarFacciones();
    return 1;
}

public OnGameModeExit() {
    AutoGuardadoGlobal();
    LimpiarBandasPVE();
    return 1;
}

public OnPlayerWeaponShot(playerid, WEAPON:weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ) {
    #pragma unused hitid
    if(!BandasPVEActivas) return 1;
    if(!IsPlayerConnected(playerid) || !IsPlayerLoggedIn[playerid]) return 1;
    if(hittype != BULLET_HIT_TYPE_NONE && hittype != BULLET_HIT_TYPE_PLAYER && hittype != BULLET_HIT_TYPE_VEHICLE) return 1;

    new grupo, miembro;
    if(!EncontrarBanderoCercano(fX, fY, fZ, grupo, miembro)) return 1;

    new Float:damage;
    switch(_:weaponid) {
        case 34: damage = 95.0;
        case 33: damage = 72.0;
        case 31: damage = 44.0;
        case 30: damage = 40.0;
        case 29: damage = 34.0;
        case 25, 27: damage = 46.0;
        case 24: damage = 52.0;
        case 23: damage = 30.0;
        case 22: damage = 24.0;
        case 4, 8: damage = 18.0;
        case 3: damage = 20.0;
        default: damage = 14.0;
    }

    BandaVida[grupo][miembro] -= damage;
    BandaUltimaAccionTick[grupo] = GetTickCount();
    BandaGrupoAtacandoA[grupo] = playerid;
    PlayerPlaySound(playerid, 17802, fX, fY, fZ);

    if(BandaVida[grupo][miembro] > 0.0) {
        if(BandaActorId[grupo][miembro] != INVALID_ACTOR_ID) SetActorHealth(BandaActorId[grupo][miembro], BandaVida[grupo][miembro]);
        return 1;
    }

    BandaVivo[grupo][miembro] = false;
    BandaVida[grupo][miembro] = 0.0;
    if(BandaActorId[grupo][miembro] != INVALID_ACTOR_ID) {
        DestroyActor(BandaActorId[grupo][miembro]);
        BandaActorId[grupo][miembro] = INVALID_ACTOR_ID;
    }
    if(BandaArmaObjetoId[grupo][miembro] != INVALID_OBJECT_ID) {
        DestroyObject(BandaArmaObjetoId[grupo][miembro]);
        BandaArmaObjetoId[grupo][miembro] = INVALID_OBJECT_ID;
    }

    new roll = random(100);
    if(roll < 35) {
        new dinero = 100 + random(BANDA_DROP_DINERO_MAX - 99);
        GivePlayerMoney(playerid, dinero);
        new msg[96];
        format(msg, sizeof(msg), "[Bandas PVE] Eliminaste un bandero y encontro $%d.", dinero);
        SendClientMessage(playerid, 0x66FF66FF, msg);
    } else if(roll < 41) {
        new arma = BandaArma[grupo][miembro];
        new muni = 12 + random(40);
        GivePlayerWeapon(playerid, WEAPON:arma, muni);
        new armaNombre[32], msg[128];
        GetNombreArmaPVE(arma, armaNombre, sizeof(armaNombre));
        format(msg, sizeof(msg), "[Bandas PVE] Drop raro: recogiste %s con %d balas.", armaNombre, muni);
        SendClientMessage(playerid, 0xB388FFFF, msg);
    } else {
        SendClientMessage(playerid, 0xAAAAAAFF, "[Bandas PVE] Eliminaste un bandero, no solto loot.");
    }
    return 1;
}

public OcultarAnuncioJugador(playerid) {
    if(!IsPlayerConnected(playerid)) return 0;
    PlayerTextDrawHide(playerid, AnuncioTextDraw[playerid]);
    AnuncioTimerOcultar[playerid] = -1;
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
    if(SancionLabel[playerid] != Text3D:-1) {
        Delete3DTextLabel(SancionLabel[playerid]);
        SancionLabel[playerid] = Text3D:-1;
    }
    if(PlayerPrefixLabel[playerid] != Text3D:-1) { Delete3DTextLabel(PlayerPrefixLabel[playerid]); PlayerPrefixLabel[playerid] = Text3D:-1; }
    if(AnuncioTimerOcultar[playerid] != -1) { KillTimer(AnuncioTimerOcultar[playerid]); AnuncioTimerOcultar[playerid] = -1; }
    PlayerTextDrawDestroy(playerid, AnuncioTextDraw[playerid]);
    PlayerSancionado[playerid] = false;
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
        if(MaleteroOwner[v] != playerid) continue;
        if(VehOwner[v] == playerid) continue;
        DestroyVehicle(v);
        MaleteroOwner[v] = -1;
        MaleteroSlotsVeh[v] = 0;
        MaleteroHierbaVeh[v] = 0;
        MaleteroFloresVeh[v] = 0;
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

    if(PlayerInCasa[playerid] != -1) {
        new casa = PlayerInCasa[playerid];
        new expectedInterior;
        new Float:intX, Float:intY, Float:intZ;
        if(!GetCasaInteriorData(CasaData[casa][cInteriorSlot], expectedInterior, intX, intY, intZ)) {
            expectedInterior = 10;
            intX = CasaInteriorPos[0][0];
            intY = CasaInteriorPos[0][1];
            intZ = CasaInteriorPos[0][2];
        }

        if(newinteriorid != expectedInterior) {
            SetPlayerInterior(playerid, expectedInterior);
            SetPlayerVirtualWorld(playerid, casa + 1);
            SetPlayerPos(playerid, intX, intY, intZ);
            SetCameraBehindPlayer(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "No uses el marker amarillo. Usa /salir para salir de tu casa.");
            return 1;
        }
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
            ActualizarGasTextoVehiculo(playerid);
            if(newstate == PLAYER_STATE_DRIVER && TrabajandoBasurero[playerid] > 0 && BasureroTieneBolsa[playerid]) {
                if(vehid == BasureroVehiculo[playerid]) {
                    RemovePlayerFromVehicle(playerid);
                    SendClientMessage(playerid, 0xFF0000FF, "Debes presionar H para subir la bolsa antes de conducir la Rumpo.");
                    return 1;
                }
            }
            if(newstate == PLAYER_STATE_DRIVER && GasVehiculo[vehid] <= 0) {
                new engine, lights, alarm, doors, bonnet, boot, objective;
                GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
                if(engine != 0) SetVehicleParamsEx(vehid, 0, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleVelocity(vehid, 0.0, 0.0, 0.0);
                UltimoAvisoGasCeroTick[playerid] = GetTickCount();
                SendClientMessage(playerid, 0xFF0000FF, "Sin gasolina. Ve a una gasolinera y usa /llenar para llenar el tanque.");
            }
        }
    } else {
        UltimoVehiculoGasMostrado[playerid] = INVALID_VEHICLE_ID;
        PlayerTextDrawHide(playerid, TextoBarraGas[playerid]);
        PlayerTextDrawHide(playerid, BarraGasFondo[playerid]);
        PlayerTextDrawHide(playerid, BarraGas[playerid]);
    }
    return 1;
}

public OnVehicleDeath(vehicleid, killerid) {
    #pragma unused killerid
    if(vehicleid <= 0 || vehicleid >= MAX_VEHICLES) return 1;
    if(VehOwner[vehicleid] == -1) return 1;

    GetVehiclePos(vehicleid, VehPosData[vehicleid][0], VehPosData[vehicleid][1], VehPosData[vehicleid][2]);
    GetVehicleZAngle(vehicleid, VehPosData[vehicleid][3]);
    VehOculto[vehicleid] = true;
    VehLastUseTick[vehicleid] = GetTickCount();
    return 1;
}

public OnPlayerUpdate(playerid) {
    if(!IsPlayerConnected(playerid) || !IsPlayerLoggedIn[playerid]) return 1;
    if(AdminModoDios[playerid]) {
        SetPlayerHealth(playerid, 100.0);
        SetPlayerArmour(playerid, 100.0);
    }
    if(PlayerSancionado[playerid]) {
        new restante = SancionFinTick[playerid] - GetTickCount();
        if(restante <= 0) {
            RemoverSancionJugador(playerid);
            SendClientMessage(playerid, 0x66FF66FF, "Tu sancion ha terminado. Ya puedes moverte nuevamente.");
        } else {
            TogglePlayerControllable(playerid, false);
            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 100.0);
            DisableRemoteVehicleCollisions(playerid, true);
            SetPlayerPos(playerid, SancionPos[playerid][0], SancionPos[playerid][1], SancionPos[playerid][2]);
            new mins = restante / 60000;
            new secs = (restante / 1000) % 60;
            new conceptoNombre[16], labelText[128];
            GetConceptoSancionNombre(SancionConcepto[playerid], conceptoNombre, sizeof(conceptoNombre));
            format(labelText, sizeof(labelText), "[SANCIONADO]\nMotivo: %s\nTiempo: %02d:%02d", conceptoNombre, mins, secs);
            if(SancionLabel[playerid] != Text3D:-1) Update3DTextLabelText(SancionLabel[playerid], 0xFF3333FF, labelText);
            SetPlayerDrunkLevel(playerid, 0);
        }
    }
    if(!EsStaff(playerid) && GetTickCount() - UltimoControlArmaProhibidaTick[playerid] > 1000) {
        UltimoControlArmaProhibidaTick[playerid] = GetTickCount();
        new armaActual = GetPlayerWeapon(playerid);
        if(EsArmaProhibida(armaActual)) {
            ResetPlayerWeapons(playerid);
            SendClientMessage(playerid, 0xFF0000FF, "[ANTI-CHEAT] Arma pesada prohibida detectada. Has sido expulsado.");
            Kick(playerid);
            return 1;
        }
        for(new t_WEAPON_SLOT:slot = t_WEAPON_SLOT:0; _:slot < 13; slot++) {
            new t_WEAPON:wid;
            new ammo;
            GetPlayerWeaponData(playerid, slot, wid, ammo);
            if(ammo > 0 && EsArmaProhibida(wid)) {
                ResetPlayerWeapons(playerid);
                SendClientMessage(playerid, 0xFF0000FF, "[ANTI-CHEAT] Arma pesada prohibida detectada. Has sido expulsado.");
                Kick(playerid);
                return 1;
            }
        }
    }
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
        new vehid = GetPlayerVehicleID(playerid);
        if(vehid != INVALID_VEHICLE_ID) {
            if(!GasInitVehiculo[vehid]) { GasInitVehiculo[vehid] = true; GasVehiculo[vehid] = 70 + random(31); }
            if(UltimoVehiculoGasMostrado[playerid] != vehid) ActualizarGasTextoVehiculo(playerid);
            if(GasVehiculo[vehid] <= 0) {
                new engine, lights, alarm, doors, bonnet, boot, objective;
                GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
                if(engine != 0) SetVehicleParamsEx(vehid, 0, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleVelocity(vehid, 0.0, 0.0, 0.0);
                if(GetTickCount() - UltimoAvisoGasCeroTick[playerid] > 3000) {
                    UltimoAvisoGasCeroTick[playerid] = GetTickCount();
                    SendClientMessage(playerid, 0xFF0000FF, "Este vehiculo esta sin gasolina y no puede moverse.");
                }
            }
        }
    }
    return 1;
}


public OnPlayerDeath(playerid, killerid, WEAPON:reason) {
    #pragma unused killerid
    #pragma unused reason
    OmitirArmasEnProximoSpawn[playerid] = true;
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) {
        PlayerArmaComprada[playerid][w] = false;
        PlayerAmmoInventario[playerid][w] = 0;
    }
    ResetPlayerWeapons(playerid);
    SetSpawnInfo(playerid, 255, PlayerSkinGuardada[playerid], 2494.24, -1671.19, 13.33, 0.0, WEAPON_NONE, 0, WEAPON_NONE, 0, WEAPON_NONE, 0);
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

stock IsNearTiendaVirtual(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, PuntoPos[puntoTiendaVirtual][0], PuntoPos[puntoTiendaVirtual][1], PuntoPos[puntoTiendaVirtual][2])) return 1;
    return 0;
}

stock GetMembresiaNombre(tipo, dest[], len) {
    switch(tipo) {
        case MEMBRESIA_VIP: format(dest, len, "VIP");
        case MEMBRESIA_DIAMANTE: format(dest, len, "Diamante");
        default: format(dest, len, "Normal");
    }
    return 1;
}

stock GetMembresiaColor(tipo) {
    switch(tipo) {
        case MEMBRESIA_VIP: return 0xFFD700FF;
        case MEMBRESIA_DIAMANTE: return 0x1E90FFFF;
    }
    return 0xFFFFFFFF;
}

stock GetLimiteVehiculosJugador(playerid) {
    ExpirarMembresiaSiCorresponde(playerid);
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 10;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 3;
    return 1;
}

stock GetLimitePrendasJugador(playerid) {
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 10;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 6;
    return 5;
}

stock GetLimiteMaleteroJugador(playerid) {
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 15;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 7;
    return 5;
}

stock GetLimiteTrabajosJugador(playerid) {
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 4;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 2;
    return 1;
}

stock GetBonusTrabajoMembresia(playerid) {
    ExpirarMembresiaSiCorresponde(playerid);
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 500;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 100;
    return 0;
}

stock GetLimiteCasasJugador(playerid) {
    ExpirarMembresiaSiCorresponde(playerid);
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 10;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 3;
    return 1;
}

stock GetLimitePlantasJugador(playerid) {
    ExpirarMembresiaSiCorresponde(playerid);
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE) return 15;
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP) return 5;
    return 3;
}

stock ExpirarMembresiaSiCorresponde(playerid) {
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_NINGUNA) return 0;
    if(PlayerMembresiaExpiraTick[playerid] <= 0) return 0;
    if(GetTickCount() < PlayerMembresiaExpiraTick[playerid]) return 0;
    PlayerMembresiaTipo[playerid] = MEMBRESIA_NINGUNA;
    PlayerMembresiaExpiraTick[playerid] = 0;
    SendClientMessage(playerid, 0xFFAA00FF, "Tu membresia expiro. Volviste al estado de usuario normal.");
    GuardarCuenta(playerid);
    return 1;
}

stock TieneTrabajoActivo(playerid) {
    return (TrabajandoCamionero[playerid] > 0 || TrabajandoPizzero[playerid] > 0 || TrabajandoBasurero[playerid] > 0 || MineroTrabajando[playerid]);
}

stock ContarTrabajosActivos(playerid) {
    new c;
    if(TrabajandoCamionero[playerid] > 0) c++;
    if(TrabajandoPizzero[playerid] > 0) c++;
    if(TrabajandoBasurero[playerid] > 0) c++;
    if(MineroTrabajando[playerid]) c++;
    return c;
}

stock ShowTiendaVirtualMenu(playerid) {
    new body[256];
    format(body, sizeof(body), "Comprar membresia VIP ($%d + %d Diamante(s))\nComprar diamantes ($%d c/u)\nVer mis diamantes", PrecioMembresiaVIPDinero, PrecioMembresiaVIPDiamantes, PrecioDiamanteTienda);
    ShowPlayerDialog(playerid, DIALOG_TIENDA_VIRTUAL_MENU, DIALOG_STYLE_LIST, "Tienda Virtual Kame House", body, "Elegir", "Cerrar");
    return 1;
}

stock ActualizarBeneficiosMembresia(playerid) {
    ExpirarMembresiaSiCorresponde(playerid);
    return 1;
}

stock MostrarMenuAdminMembresias(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_ADMIN_MEMBRESIAS_MENU, DIALOG_STYLE_LIST, "Admin - Membresias", "Asignar VIP\nAsignar Diamante\nEliminar membresia", "Abrir", "Atras");
}

stock MostrarMenuAdminPreciosMembresia(playerid) {
    if(PlayerAdmin[playerid] < 1) return 0;
    new cuerpo[256];
    format(cuerpo, sizeof(cuerpo), "VIP - $%d + %d diamante(s)\nDiamante - $%d c/u", PrecioMembresiaVIPDinero, PrecioMembresiaVIPDiamantes, PrecioDiamanteTienda);
    return ShowPlayerDialog(playerid, DIALOG_ADMIN_PRECIOS_MEMBRESIA_MENU, DIALOG_STYLE_LIST, "Admin - Editar precios (Y)", cuerpo, "Editar", "Cerrar");
}

stock MostrarAnuncioJugador(playerid, const texto[]) {
    if(!IsPlayerConnected(playerid)) return 0;
    if(AnuncioTimerOcultar[playerid] != -1) {
        KillTimer(AnuncioTimerOcultar[playerid]);
        AnuncioTimerOcultar[playerid] = -1;
    }
    PlayerTextDrawSetString(playerid, AnuncioTextDraw[playerid], texto);
    PlayerTextDrawShow(playerid, AnuncioTextDraw[playerid]);
    AnuncioTimerOcultar[playerid] = SetTimerEx("OcultarAnuncioJugador", 10000, false, "d", playerid);
    return 1;
}

stock MostrarAnuncioGlobal(const emisor[], const texto[]) {
    new anuncio[196];
    format(anuncio, sizeof(anuncio), "~y~[ANUNCIO] ~w~%s~g~: ~w~%s", emisor, texto);
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i)) MostrarAnuncioJugador(i, anuncio);
    }
    return 1;
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

stock IsNearVentaSkins(playerid) {
    if(IsPlayerInRangeOfPoint(playerid, 3.0, VentaSkinsPos[0], VentaSkinsPos[1], VentaSkinsPos[2])) return 1;
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
        new vname[32];
        GetNombreVehiculoVanilla(VentaAutosData[i][vaModelo], vname, sizeof(vname));
        format(line, sizeof(line), "[ID %d] (%s) [Valor: $%d] | [Disponible]\n", VentaAutosData[i][vaModelo], vname, VentaAutosData[i][vaPrecio]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay autos disponibles en venta.");
    ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_BUY, DIALOG_STYLE_LIST, "Concesionario", body, "Comprar", "Cerrar");
    return 1;
}

stock ShowVentaAutosAdminMenu(playerid) {
    if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
    if(!IsNearVentaAutos(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el concesionario para editarlo.");
    ShowPlayerDialog(playerid, DIALOG_VENTA_AUTOS_ADMIN_MENU, DIALOG_STYLE_LIST, "Concesionario Admin", "Agregar/actualizar auto\nQuitar auto", "Seleccionar", "Cerrar");
    return 1;
}

stock ShowVentaAutosRemoveMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(!VentaAutosData[i][vaActiva]) continue;
        new vname2[32];
        GetNombreVehiculoVanilla(VentaAutosData[i][vaModelo], vname2, sizeof(vname2));
        format(line, sizeof(line), "[ID %d] (%s) [Valor: $%d] | %s\n", VentaAutosData[i][vaModelo], vname2, VentaAutosData[i][vaPrecio], VentaAutosData[i][vaStock] > 0 ? "[Disponible]" : "[No Disponible]");
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

stock ActualizarLabelVentaSkins() {
    if(VentaSkinsLabel != Text3D:-1) { Delete3DTextLabel(VentaSkinsLabel); VentaSkinsLabel = Text3D:-1; }
    if(VentaSkinsPickup != 0) { DestroyPickup(VentaSkinsPickup); VentaSkinsPickup = 0; }
    VentaSkinsPickup = CreatePickup(1275, 1, VentaSkinsPos[0], VentaSkinsPos[1], VentaSkinsPos[2], 0);
    new disponibles;
    for(new i = 0; i < MAX_SKINS_VENTA; i++) if(VentaSkinsData[i][vsActiva]) disponibles++;
    new texto[128];
    format(texto, sizeof(texto), "CP Venta de Skins\nSkins disponibles: %d\nUsa H para comprar", disponibles);
    VentaSkinsLabel = Create3DTextLabel(texto, 0xFF66CCFF, VentaSkinsPos[0], VentaSkinsPos[1], VentaSkinsPos[2] + 0.6, 18.0, 0);
    return 1;
}

stock GetVentaSkinByListIndex(listindex) {
    new current;
    for(new i = 0; i < MAX_SKINS_VENTA; i++) {
        if(!VentaSkinsData[i][vsActiva]) continue;
        if(current == listindex) return i;
        current++;
    }
    return -1;
}

stock GetVentaSkinByAnyListIndex(listindex) {
    return GetVentaSkinByListIndex(listindex);
}

stock ShowVentaSkinsBuyMenu(playerid) {
    new body[2048], line[64], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_SKINS_VENTA; i++) {
        if(!VentaSkinsData[i][vsActiva]) continue;
        format(line, sizeof(line), "Skin %d | Precio:$%d\n", VentaSkinsData[i][vsSkin], VentaSkinsData[i][vsPrecio]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay skins disponibles en venta.");
    return ShowPlayerDialog(playerid, DIALOG_VENTA_SKINS_BUY, DIALOG_STYLE_LIST, "Venta de Skins", body, "Comprar", "Cerrar");
}

stock ShowVentaSkinsAdminMenu(playerid) {
    if(!EsDueno(playerid)) return SendClientMessage(playerid, -1, "No eres Owner.");
    if(!IsNearVentaSkins(playerid)) return SendClientMessage(playerid, -1, "Debes estar en el CP de skins.");
    return ShowPlayerDialog(playerid, DIALOG_VENTA_SKINS_ADMIN_MENU, DIALOG_STYLE_LIST, "Venta de Skins Admin", "Agregar/actualizar skin\nQuitar skin", "Seleccionar", "Cerrar");
}

stock ShowVentaSkinsRemoveMenu(playerid) {
    new body[2048], line[64], count;
    body[0] = EOS;
    for(new i = 0; i < MAX_SKINS_VENTA; i++) {
        if(!VentaSkinsData[i][vsActiva]) continue;
        format(line, sizeof(line), "Skin %d | Precio:$%d\n", VentaSkinsData[i][vsSkin], VentaSkinsData[i][vsPrecio]);
        strcat(body, line);
        count++;
    }
    if(count == 0) return SendClientMessage(playerid, -1, "No hay skins para eliminar.");
    return ShowPlayerDialog(playerid, DIALOG_VENTA_SKINS_REMOVE_LIST, DIALOG_STYLE_LIST, "Quitar skin de venta", body, "Quitar", "Atras");
}

stock ShowAdminEditHint(playerid, const nombreSistema[]) {
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
        format(line, sizeof(line), "%s | Arma $%d | %s\n", nombreArma, ArmeriaItems[i][aiPrecioArma], ArmeriaItems[i][aiStockArma] > 0 ? "[Disponible]" : "[No Disponible]");
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
    ShowPlayerDialog(playerid, DIALOG_ADMIN_ARMAS_MENU, DIALOG_STYLE_LIST, "Admin Armas", "Agregar arma (ID + precio)\nEditar precio/disponibilidad", "Seleccionar", "Cerrar");
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
        new bonusMembresia = GetBonusTrabajoMembresia(playerid);
        if(bonusMembresia > 0) pago += bonusMembresia;
        GivePlayerMoney(playerid, pago);

        BasureroRecorridos[playerid]++;
        if(BasureroRecorridos[playerid] >= PROGRESO_BASURERO_POR_NIVEL) {
            BasureroRecorridos[playerid] = 0;
            if(BasureroNivel[playerid] < NIVEL_MAX_TRABAJO) BasureroNivel[playerid]++;
        }


        new msg[200];
        format(msg, sizeof(msg), "{66FF66}[Basurero]{FFFFFF} Pago base:$%d | Recoleccion:$%d | Nivel:$%d | Bonus membresia:$%d | Total:$%d", pagoBase, pagoRecolecta, pagoNivel, bonusMembresia, pago);
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
    ShowPlayerDialog(playerid, DIALOG_TELEFONO_MENU, DIALOG_STYLE_LIST, "Telefono celular", "Hora\nFecha\nEnviar mensaje ($100)\nCalculadora\nLlamar vehiculo ($5000)\nGPS\nRestaurar vehiculos ocultos\nLocalizar mis vehiculos\nCuenta", "Abrir", "Cerrar");
    return 1;
}

stock ShowTelefonoVehiculosMenu(playerid) {
    new body[1024], line[96], count;
    body[0] = EOS;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        new ident[96];
        FormatearVehiculoIdentificador(v, ident, sizeof(ident));
        format(line, sizeof(line), "%s\n", ident);
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
    if(restante == 0) format(label, sizeof(label), "%s lista para cosechar\nPresiona H cerca", tipo);
    else {
        new mins = (restante + 59999) / 60000;
        format(label, sizeof(label), "%s en cultivo\nTiempo restante: %d minuto(s)", tipo, mins);
    }
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


stock CosecharCultivoCercano(playerid) {
    new slot = GetCultivoCosechableCercano(playerid);
    if(slot == -1) return 0;

    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, false, false, false, false, 0, t_FORCE_SYNC:SYNC_ALL);
    new extra = random(3);
    new total = CultivoCantidadBase[playerid][slot] + extra;
    ExpirarMembresiaSiCorresponde(playerid);
    if(PlayerMembresiaTipo[playerid] == MEMBRESIA_DIAMANTE && random(100) < 30) total *= 4;
    else if(PlayerMembresiaTipo[playerid] == MEMBRESIA_VIP && random(100) < 30) total *= 2;
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
    format(ok, sizeof(ok), "Cosechaste %d %s y %d semilla(s). Plantas activas: %d/%d.", total, tipo, semillasExtra, PlantasColocadas[playerid], GetLimitePlantasJugador(playerid));
    SendClientMessage(playerid, 0x00FF00FF, ok);
    return 1;
}

stock GetEditMapSlotLibre() {
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) return i;
    }
    if(TotalEditMap < MAX_EDITMAP_OBJECTS) return TotalEditMap;
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
        case puntoVentaSkins: format(dest, len, "Tienda De Skins");
        case puntoMaletero: format(dest, len, "Reservado");
        case puntoPintura: format(dest, len, "Tuning Kame House");
        case puntoMinero: format(dest, len, "Trabajo minero");
        case puntoPrendas: format(dest, len, "Prendas Kame House");
        case puntoFacciones: format(dest, len, "Facciones Kame House");
        case puntoTiendaVirtual: format(dest, len, "Tienda Virtual Kame House");
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
        case puntoVentaSkins: {
            // Este punto usa su propio pickup/label (VentaSkinsPickup y VentaSkinsLabel).
        }
        case puntoMaletero: {
            // Punto reservado: no crear pickup ni label.
        }
        case puntoPintura: {
            PuntoPickup[punto] = CreatePickup(1210, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{00CCFF}Tuning Kame House\n{FFFFFF}Conduce aqui y usa {FFFF00}/tuning", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 14.0, 0);
        }
        case puntoMinero: {
            PuntoPickup[punto] = CreatePickup(1239, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{CCCCCC}Trabajo minero\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para iniciar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoPrendas: {
            PuntoPickup[punto] = CreatePickup(2704, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{00CCFF}Prendas Kame House\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para comprar", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 12.0, 0);
        }
        case puntoFacciones: {
            PuntoPickup[punto] = 0;
            PuntoLabel[punto] = Text3D:-1;
            if(FaccionCPPickup != 0) DestroyPickup(FaccionCPPickup);
            FaccionCPPickup = CreatePickup(1274, 23, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            if(FaccionCPLabel != Text3D:-1) Delete3DTextLabel(FaccionCPLabel);
            FaccionCPLabel = Create3DTextLabel("CP Facciones Kame House\nPresiona H", 0x9B59B6FF, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.8, 20.0, 0);
        }
        case puntoTiendaVirtual: {
            PuntoPickup[punto] = CreatePickup(1274, 1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2], 0);
            PuntoLabel[punto] = Create3DTextLabel("{66FFFF}Tienda Virtual Kame House\n{FFFFFF}Presiona {FFFF00}'H' {FFFFFF}para abrir", -1, PuntoPos[punto][0], PuntoPos[punto][1], PuntoPos[punto][2] + 0.5, 14.0, 0);
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
    format(texto, sizeof(texto), "{33CCFF}Chat y rol:{FFFFFF} /g /m /d para hablar, /duda para consultas.\n{66FF99}Personaje:{FFFFFF} /skills /pj /inventario /comer /consumir /telefono.\n{FFD166}Navegacion y trabajos:{FFFFFF} GPS en /telefono, /dejartrabajo /cancelartrabajo /tirarbasura /plantar.\n{FF99CC}Propiedades y vehiculos:{FFFFFF} /comprar /abrircasa /salir /maletero /llave /compartirllave /tuning.\n{AAAAAA}Economia:{FFFFFF} /saldo /bidon /usarbidon y operaciones del banco con la tecla H.\n{66FFFF}Membresias:{FFFFFF} revisa la seccion dedicada en /ayuda (Normal/VIP/Diamante).\n\n{AAAAAA}Nota:{FFFFFF} En /ayuda solo se muestran funciones utiles para jugadores.");
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
    if(IsPlayerInAnyVehicle(playerid)) {
        new actual = GetPlayerVehicleID(playerid);
        if(actual != INVALID_VEHICLE_ID && IsValidVehicle(actual) && PlayerTieneAccesoVehiculo(playerid, actual)) return actual;
    }

    new closest = INVALID_VEHICLE_ID;
    new Float:minDist = 6.0;
    new Float:px, Float:py, Float:pz;
    new world = GetPlayerVirtualWorld(playerid);
    new interior = GetPlayerInterior(playerid);
    GetPlayerPos(playerid, px, py, pz);

    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(!IsValidVehicle(v)) continue;
        if(!PlayerTieneAccesoVehiculo(playerid, v)) continue;
        if(GetVehicleVirtualWorld(v) != world) continue;
        if(GetVehicleInterior(v) != interior) continue;
        new Float:vx, Float:vy, Float:vz;
        GetVehiclePos(v, vx, vy, vz);
        new Float:dist = GetDistanceBetweenPoints(px, py, pz, vx, vy, vz);
        if(dist <= minDist) {
            minDist = dist;
            closest = v;
        }
    }
    return closest;
}

stock CuentaArmasMaletero(vehid) {
    new total;
    new limiteSlots = MaleteroSlotsVeh[vehid];
    if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
    for(new i = 0; i < limiteSlots; i++) {
        if(MaleteroArmaSlotIdVeh[vehid][i] <= 0) continue;
        if(MaleteroArmaSlotAmmoVeh[vehid][i] <= 0) continue;
        total++;
    }
    return total;
}

stock FormatearBarraEstado(const etiqueta[], valor, dest[], len) {
    if(valor < 0) valor = 0;
    if(valor > 100) valor = 100;

    new llenos = (valor + 9) / 10;
    if(llenos < 0) llenos = 0;
    if(llenos > 10) llenos = 10;

    new barra[11];
    for(new i = 0; i < 10; i++) barra[i] = (i < llenos) ? '|' : '.';
    barra[10] = EOS;

    format(dest, len, "%s: [%s]", etiqueta, barra);
    return 1;
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
        MaleteroSlotsVeh[v] = 5;
        MaleteroHierbaVeh[v] = 0;
        MaleteroFloresVeh[v] = 0;
        MaleteroSemillaHierbaVeh[v] = 0;
        MaleteroSemillaFlorVeh[v] = 0;
        for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[v][w] = 0;
        for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[v][ms] = 0; MaleteroArmaSlotAmmoVeh[v][ms] = 0; }
    }
    for(new i = 0; i < MAX_PLAYERS; i++) { VehSharedTo[i] = INVALID_VEHICLE_ID; VehSharedUntil[i] = 0; }
    return 1;
}

stock ShowMaleteroMaletero(playerid, vehid) {
    if(!PlayerTieneAccesoVehiculo(playerid, vehid)) return SendClientMessage(playerid, -1, "No tienes acceso a este vehiculo.");
    new info[128], body[768], line[72], usados;

    body[0] = EOS;
    new limiteSlots = MaleteroSlotsVeh[vehid];
    if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
    new limiteMembresiaMaletero = GetLimiteMaleteroJugador(playerid);
    if(limiteSlots > limiteMembresiaMaletero) limiteSlots = limiteMembresiaMaletero;
    for(new c = 0; c < limiteSlots; c++) {
        if(MaleteroArmaSlotIdVeh[vehid][c] > 0 && MaleteroArmaSlotAmmoVeh[vehid][c] > 0) usados++;
    }
    format(info, sizeof(info), "Armas guardadas: %d/%d slots usados", usados, limiteSlots);
    SendClientMessage(playerid, 0x99FFFFFF, info);
    for(new i = 0; i < limiteSlots; i++) {
        new w = MaleteroArmaSlotIdVeh[vehid][i];
        new ammo = MaleteroArmaSlotAmmoVeh[vehid][i];
        if(w <= 0 || w >= MAX_WEAPON_ID_GM || ammo <= 0) continue;
        new wn[32];
        GetWeaponNameGM(w, wn, sizeof(wn));
        format(line, sizeof(line), "Sacar %s (%d)\n", wn, ammo);
        strcat(body, line);
    }
    strcat(body, "Cerrar maletero");

    SetPVarInt(playerid, "MaleteroMaleteroVeh", vehid);
    ShowPlayerDialog(playerid, DIALOG_MALETERO_MENU, DIALOG_STYLE_LIST, "Maletero del vehiculo", body, "Elegir", "Cerrar");
    return 1;
}

stock ActualizarBarrasEstado(playerid) {
    new hambre = PlayerHambre[playerid];
    if(hambre < 0) hambre = 0;
    if(hambre > 100) hambre = 100;

    new gas = 100;
    if(IsPlayerInAnyVehicle(playerid)) {
        new veh = GetPlayerVehicleID(playerid);
        if(veh != INVALID_VEHICLE_ID) gas = GasVehiculo[veh];
    }
    if(gas < 0) gas = 0;
    if(gas > 100) gas = 100;

    new Float:anchoMax = 40.0;
    new Float:inicio = 286.0;
    PlayerTextDrawTextSize(playerid, BarraHambre[playerid], inicio + (anchoMax * float(hambre) / 100.0), 0.0);
    PlayerTextDrawTextSize(playerid, BarraGas[playerid], inicio + (anchoMax * float(gas) / 100.0), 0.0);
    return 1;
}

stock ActualizarGasTextoVehiculo(playerid) {
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) return 1;
    new veh = GetPlayerVehicleID(playerid);
    if(veh == INVALID_VEHICLE_ID) return 1;
    UltimoVehiculoGasMostrado[playerid] = veh;
    if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 70 + random(31); }
    ActualizarBarrasEstado(playerid);
    PlayerTextDrawShow(playerid, TextoBarraGas[playerid]);
    PlayerTextDrawShow(playerid, BarraGasFondo[playerid]);
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

    new veh = GasRefuelVeh[playerid];
    GasRefuelVeh[playerid] = INVALID_VEHICLE_ID;

    if(!IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) != PLAYER_STATE_DRIVER) {
        TogglePlayerControllable(playerid, true);
        return 1;
    }

    new vehActual = GetPlayerVehicleID(playerid);
    if(vehActual == INVALID_VEHICLE_ID || vehActual != veh) {
        TogglePlayerControllable(playerid, true);
        return 1;
    }

    if(!GasInitVehiculo[veh]) { GasInitVehiculo[veh] = true; GasVehiculo[veh] = 0; }
    new faltante = 100 - GasVehiculo[veh];
    if(faltante < 0) faltante = 0;
    new costo = faltante * GAS_PRECIO_POR_PUNTO;
    if(faltante > 0 && costo > 0) GivePlayerMoney(playerid, -costo);
    GasVehiculo[veh] = 100;
    GasRefuelCost[playerid] = 0;
    ActualizarGasTextoVehiculo(playerid);
    TogglePlayerControllable(playerid, true);

    new msg[128];
    format(msg, sizeof(msg), "Tanque de gasolina llenado: +%d litros por $%d.", faltante, costo);
    SendClientMessage(playerid, 0x00FF00FF, msg);
    return 1;
}

public CheckInactiveVehicles() {
    new now = GetTickCount();
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(!IsValidVehicle(v) || VehOculto[v]) continue;

        new bool:ocupado;
        for(new p = 0; p < MAX_PLAYERS; p++) {
            if(IsPlayerConnected(p) && IsPlayerInVehicle(p, v)) { ocupado = true; break; }
        }
        if(ocupado) {
            VehLastUseTick[v] = now;
            continue;
        }

        if(VehTempVanilla[v]) {
            if(now - VehLastUseTick[v] < VEHICULO_TEMP_SIN_USO_MS) continue;
            DestroyVehicle(v);
            VehTempVanilla[v] = false;
            VehModelData[v] = 0;
            VehColor1Data[v] = 0;
            VehColor2Data[v] = 0;
            GasInitVehiculo[v] = false;
            GasVehiculo[v] = 0;
            VehLastUseTick[v] = 0;
            VehOwner[v] = -1;
            VehLocked[v] = false;
            continue;
        }

        if(VehOwner[v] == -1) continue;
        if(now - VehLastUseTick[v] < 120000) continue;
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
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;
        new ident[96];
        FormatearVehiculoIdentificador(v, ident, sizeof(ident));
        format(line, sizeof(line), "%s | %s\n", ident, VehOculto[v] ? "Oculto" : "Activo");
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
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;
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

        if(nv == v) {
            VehOculto[v] = false;
            VehLastUseTick[v] = GetTickCount();
            if(GPSVehiculoSeleccionado[playerid] == v) GPSVehiculoSeleccionado[playerid] = v;
            restaurados++;
            continue;
        }

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
            for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[nv][ms] = MaleteroArmaSlotIdVeh[v][ms]; MaleteroArmaSlotAmmoVeh[nv][ms] = MaleteroArmaSlotAmmoVeh[v][ms]; }
            MaleteroOwner[v] = -1;
            MaleteroSlotsVeh[v] = 0;
            MaleteroHierbaVeh[v] = 0;
            MaleteroFloresVeh[v] = 0;
            MaleteroSemillaHierbaVeh[v] = 0;
            MaleteroSemillaFlorVeh[v] = 0;
            for(new w = 0; w < MAX_WEAPON_ID_GM; w++) MaleteroArmasVeh[v][w] = 0;
            for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[v][ms] = 0; MaleteroArmaSlotAmmoVeh[v][ms] = 0; }
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

    if(nv == veh) {
        VehOculto[veh] = false;
        VehLastUseTick[veh] = GetTickCount();
        GPSVehiculoSeleccionado[playerid] = veh;
        return true;
    }

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
        for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[nv][ms] = MaleteroArmaSlotIdVeh[veh][ms]; MaleteroArmaSlotAmmoVeh[nv][ms] = MaleteroArmaSlotAmmoVeh[veh][ms]; }
        ResetMaleteroVehiculo(veh);
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
    new line[768];
    strmid(line, primeraLinea, 0, sizeof(line), sizeof(line));
    LimpiarLinea(line);
    if(strcmp(line, CUENTA_SECCION_ARMAS, false) == 0) return CargarArmasJugadorDesdeCuenta(playerid, h);

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
        if(maleteroSlots < 1 || maleteroSlots > MAX_SLOTS_MALETERO) maleteroSlots = MAX_SLOTS_MALETERO;
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

        ResetMaleteroVehiculo(veh);

        if(isMaletero) {
            MaleteroOwner[veh] = playerid;
            MaleteroSlotsVeh[veh] = maleteroSlots;
            MaleteroHierbaVeh[veh] = maleteroHierba;
            MaleteroFloresVeh[veh] = maleteroFlores;
            MaleteroSemillaHierbaVeh[veh] = maleteroSemHierba;
            MaleteroSemillaFlorVeh[veh] = maleteroSemFlor;
        }

        new limiteCarga = maleteroSlots;
        if(limiteCarga < 1 || limiteCarga > MAX_SLOTS_MALETERO) limiteCarga = MAX_SLOTS_MALETERO;
        for(new ms = 0; ms < limiteCarga; ms++) {
            new tokId[16], tokAmmo[16];
            format(tokId, sizeof(tokId), "%s", strtok(line, idx));
            format(tokAmmo, sizeof(tokAmmo), "%s", strtok(line, idx));
            if(!tokId[0] || !tokAmmo[0]) break;
            new armaId = strval(tokId);
            new armaAmmo = strval(tokAmmo);
            if(armaId <= 0 || armaId >= MAX_WEAPON_ID_GM || armaAmmo <= 0) continue;
            if(!isMaletero) continue;
            MaleteroArmaSlotIdVeh[veh][ms] = armaId;
            MaleteroArmaSlotAmmoVeh[veh][ms] = armaAmmo;
            MaleteroArmasVeh[veh][armaId] += armaAmmo;
        }
    }

    if(fread(h, line)) {
        LimpiarLinea(line);
        if(strcmp(line, CUENTA_SECCION_ARMAS, false) == 0) CargarArmasJugadorDesdeCuenta(playerid, h);
    }
    return 1;
}

stock bool:EsLineaPrendaCuenta(const line[]) {
    if(strfind(line, ".") == -1) return false;

    new espacios;
    for(new i = 0; line[i] != EOS; i++) {
        if(line[i] == ' ') espacios++;
    }
    return espacios == 11 || espacios == 12 || espacios >= 13;
}

stock CargarPrendaJugadorDesdeLinea(playerid, idxPrenda, const line[]) {
    if(idxPrenda < 0 || idxPrenda >= MAX_PRENDAS) return 0;

    new idxp = 0;
    PlayerPrendaComprada[playerid][idxPrenda] = strval(strtok(line, idxp));
    PlayerPrendaActiva[playerid][idxPrenda] = strval(strtok(line, idxp));
    PlayerPrendaBone[playerid][idxPrenda] = strval(strtok(line, idxp));
    PlayerPrendaOffX[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaOffY[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaOffZ[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaRotX[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaRotY[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaRotZ[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaScaleX[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaScaleY[playerid][idxPrenda] = floatstr(strtok(line, idxp));
    PlayerPrendaScaleZ[playerid][idxPrenda] = floatstr(strtok(line, idxp));

    new model = strval(strtok(line, idxp));
    if(model <= 0) model = PrendasData[idxPrenda][prendaModelo];
    PlayerPrendaModelo[playerid][idxPrenda] = model;

    new nombreParseado[32];
    if(idxp < strlen(line)) strmid(nombreParseado, line, idxp, idxp + 32, 32);
    else format(nombreParseado, sizeof(nombreParseado), "");
    while(nombreParseado[0] == ' ' || nombreParseado[0] == '	') strdel(nombreParseado, 0, 1);
    LimpiarLinea(nombreParseado);
    if(strlen(nombreParseado) > 0) format(PlayerPrendaNombre[playerid][idxPrenda], 32, "%s", nombreParseado);
    else format(PlayerPrendaNombre[playerid][idxPrenda], 32, "%s", PrendasData[idxPrenda][prendaNombre]);
    return 1;
}

stock ReconciliarPrendasJugador(playerid) {
    for(new i = 0; i < MAX_PRENDAS; i++) {
        if(!PlayerPrendaComprada[playerid][i]) continue;

        if(PlayerPrendaModelo[playerid][i] <= 0) {
            PlayerPrendaModelo[playerid][i] = PrendasData[i][prendaModelo];
            continue;
        }

        if(PrendasData[i][prendaModelo] == PlayerPrendaModelo[playerid][i]) continue;

        for(new j = 0; j < MAX_PRENDAS; j++) {
            if(PlayerPrendaComprada[playerid][j]) continue;
            if(PrendasData[j][prendaModelo] != PlayerPrendaModelo[playerid][i]) continue;

            PlayerPrendaComprada[playerid][j] = PlayerPrendaComprada[playerid][i];
            PlayerPrendaActiva[playerid][j] = PlayerPrendaActiva[playerid][i];
            PlayerPrendaBone[playerid][j] = PlayerPrendaBone[playerid][i];
            PlayerPrendaOffX[playerid][j] = PlayerPrendaOffX[playerid][i];
            PlayerPrendaOffY[playerid][j] = PlayerPrendaOffY[playerid][i];
            PlayerPrendaOffZ[playerid][j] = PlayerPrendaOffZ[playerid][i];
            PlayerPrendaRotX[playerid][j] = PlayerPrendaRotX[playerid][i];
            PlayerPrendaRotY[playerid][j] = PlayerPrendaRotY[playerid][i];
            PlayerPrendaRotZ[playerid][j] = PlayerPrendaRotZ[playerid][i];
            PlayerPrendaScaleX[playerid][j] = PlayerPrendaScaleX[playerid][i];
            PlayerPrendaScaleY[playerid][j] = PlayerPrendaScaleY[playerid][i];
            PlayerPrendaScaleZ[playerid][j] = PlayerPrendaScaleZ[playerid][i];
            PlayerPrendaModelo[playerid][j] = PlayerPrendaModelo[playerid][i];
            format(PlayerPrendaNombre[playerid][j], 32, "%s", PlayerPrendaNombre[playerid][i]);

            PlayerPrendaComprada[playerid][i] = 0;
            PlayerPrendaActiva[playerid][i] = 0;
            PlayerPrendaBone[playerid][i] = 0;
            PlayerPrendaOffX[playerid][i] = 0.0;
            PlayerPrendaOffY[playerid][i] = 0.0;
            PlayerPrendaOffZ[playerid][i] = 0.0;
            PlayerPrendaRotX[playerid][i] = 0.0;
            PlayerPrendaRotY[playerid][i] = 0.0;
            PlayerPrendaRotZ[playerid][i] = 0.0;
            PlayerPrendaScaleX[playerid][i] = 0.0;
            PlayerPrendaScaleY[playerid][i] = 0.0;
            PlayerPrendaScaleZ[playerid][i] = 0.0;
            PlayerPrendaModelo[playerid][i] = 0;
            format(PlayerPrendaNombre[playerid][i], 32, "");
            break;
        }
    }
    return 1;
}

stock GuardarVehiculosJugadorEnCuenta(playerid, File:h) {
    new line[768];
    new cantidad;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;
        cantidad++;
    }
    if(cantidad > MAX_VEHICULOS_TOTALES_JUGADOR) cantidad = MAX_VEHICULOS_TOTALES_JUGADOR;
    format(line, sizeof(line), "\n%d", cantidad);
    fwrite(h, line);

    new guardados = 0;
    for(new v = 1; v < MAX_VEHICLES && guardados < cantidad; v++) {
        if(VehOwner[v] != playerid) continue;
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;

        new Float:x, Float:y, Float:z, Float:a;
        if(VehOculto[v]) {
            x = VehPosData[v][0];
            y = VehPosData[v][1];
            z = VehPosData[v][2];
            a = VehPosData[v][3];
        } else {
            GetVehiclePos(v, x, y, z);
            GetVehicleZAngle(v, a);
            VehPosData[v][0] = x; VehPosData[v][1] = y; VehPosData[v][2] = z; VehPosData[v][3] = a;
        }

        new bool:tieneMaletero = TieneDatosMaleteroVehiculo(v, playerid);

        format(line, sizeof(line), "\n%d %d %d %f %f %f %f %d %d %d %d %d %d %d %d",
            VehModelData[v], VehColor1Data[v], VehColor2Data[v], x, y, z, a,
            VehLocked[v] ? 1 : 0, GasVehiculo[v],
            tieneMaletero ? 1 : 0, MaleteroSlotsVeh[v], MaleteroHierbaVeh[v], MaleteroFloresVeh[v], MaleteroSemillaHierbaVeh[v], MaleteroSemillaFlorVeh[v]);

        new limiteSlots = MaleteroSlotsVeh[v];
        if(limiteSlots < 1 || limiteSlots > MAX_SLOTS_MALETERO) limiteSlots = MAX_SLOTS_MALETERO;
        for(new ms = 0; ms < limiteSlots; ms++) {
            new armaId = MaleteroArmaSlotIdVeh[v][ms];
            new armaAmmo = MaleteroArmaSlotAmmoVeh[v][ms];
            new slotData[24];
            format(slotData, sizeof(slotData), " %d %d", armaId, armaAmmo);
            strcat(line, slotData);
        }

        fwrite(h, line);
        guardados++;
    }
    return 1;
}

stock CargarArmasJugadorDesdeCuenta(playerid, File:h) {
    new line[256];
    if(!fread(h, line)) return 0;
    return CargarArmasJugadorDesdeLinea(playerid, h, line);
}

stock CargarArmasJugadorDesdeLinea(playerid, File:h, const primeraLinea[]) {
    new line[256];
    strmid(line, primeraLinea, 0, sizeof(line), sizeof(line));
    LimpiarLinea(line);

    new cantidad = strval(line);
    if(cantidad < 0) cantidad = 0;
    if(cantidad > MAX_WEAPON_ID_GM) cantidad = MAX_WEAPON_ID_GM;

    for(new i = 0; i < cantidad; i++) {
        if(!fread(h, line)) break;
        new idx = 0;
        new weaponid = strval(strtok(line, idx));
        new ammo = strval(strtok(line, idx));
        if(weaponid < 0 || weaponid >= MAX_WEAPON_ID_GM) continue;
        if(ammo < 0) ammo = 0;
        PlayerArmaComprada[playerid][weaponid] = ammo > 0;
        PlayerAmmoInventario[playerid][weaponid] = ammo;
    }
    return 1;
}

stock GuardarArmasJugadorEnCuenta(playerid, File:h) {
    new cantidad;
    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) {
        if(PlayerArmaComprada[playerid][w] && PlayerAmmoInventario[playerid][w] > 0) cantidad++;
    }

    new line[64];
    format(line, sizeof(line), "\n%s\n%d", CUENTA_SECCION_ARMAS, cantidad);
    fwrite(h, line);

    for(new w = 0; w < MAX_WEAPON_ID_GM; w++) {
        if(!PlayerArmaComprada[playerid][w] || PlayerAmmoInventario[playerid][w] <= 0) continue;
        format(line, sizeof(line), "\n%d %d", w, PlayerAmmoInventario[playerid][w]);
        fwrite(h, line);
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
        for(new ms = 0; ms < MAX_SLOTS_MALETERO; ms++) { MaleteroArmaSlotIdVeh[nv][ms] = MaleteroArmaSlotIdVeh[slot][ms]; MaleteroArmaSlotAmmoVeh[nv][ms] = MaleteroArmaSlotAmmoVeh[slot][ms]; }
        ResetMaleteroVehiculo(slot);
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
    MinaCooldownTick[MineroMinaIndex[playerid]] = GetTickCount() + COOLDOWN_MINA_MS;
    MineroMinaIndex[playerid] = -1;
    format(msg, sizeof(msg), "[Minero] Piedra:%d | Cobre:%d | Hierro:%d", piedra, cobre, hierro);
    SendClientMessage(playerid, 0x66FF66FF, msg);
    if(MineroTrabajando[playerid] && MineroGPSActivo[playerid]) {
        if(SetCheckpointMinaMasCercana(playerid)) SendClientMessage(playerid, 0x66CCFFFF, "[Minero] Mina completada. Te marcamos la siguiente mina disponible mas cercana.");
        else SendClientMessage(playerid, 0xFFAA00FF, "[Minero] No hay otra mina disponible por ahora. Espera regeneracion.");
    }
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
    ShowPlayerDialog(playerid, DIALOG_ADMIN_MENU, DIALOG_STYLE_LIST, "{F7D154}Panel Owner", "{58D68D}Ir a jugador (ID)\n{5DADE2}Mover puntos y CP\n{5DADE2}Crear puntos/sistemas\n{5DADE2}Comandos admin\n{F1948A}Sancionar\n{F1948A}Quitar sancion\n{F5B041}Dar dinero\n{F5B041}Dar minerales\n{F5B041}Dar vida/chaleco\n{AF7AC5}Cambiar skin\n{AF7AC5}Administrar prendas\n{AF7AC5}Editmap\n{85C1E9}Asignar Moderador\n{85C1E9}Eliminar Moderador\n{F4D03F}Modo Dios\n{58D68D}Facciones\n{66FFFF}Membresias", "Abrir", "Cerrar");
    return 1;
}

stock MostrarDialogoMod(playerid) {
    ShowPlayerDialog(playerid, DIALOG_MOD_MENU, DIALOG_STYLE_LIST, "{85C1E9}Panel Moderador", "{58D68D}Ir a jugador (ID)\n{58D68D}Traer jugador (ID)\n{F1948A}Sancionar\n{F1948A}Quitar sancion\n{5DADE2}Teleport a marca (/tp)\n{5DADE2}Fly\n{5DADE2}Reparar vehiculo (/rc)", "Abrir", "Cerrar");
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
        new idx = 0;
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
        new idx = 0;
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
        new idx = 0;
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
        format(line, sizeof(line), "%s - $%d (%s)", PrendasData[i][prendaNombre], PrendasData[i][prendaPrecio], PrendasData[i][prendaStock] > 0 ? "[Disponible]" : "[No Disponible]");
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
    new model = PlayerPrendaModelo[playerid][idx] > 0 ? PlayerPrendaModelo[playerid][idx] : PrendasData[idx][prendaModelo];
    SetPlayerAttachedObject(playerid, idx, model, bone, offX, offY, offZ, rotX, rotY, rotZ, scX, scY, scZ);
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



stock ObtenerNombrePrendaJugador(playerid, idx, dest[], len) {
    if(idx < 0 || idx >= MAX_PRENDAS) return format(dest, len, "Prenda");
    if(strlen(PlayerPrendaNombre[playerid][idx]) > 0) return format(dest, len, "%s", PlayerPrendaNombre[playerid][idx]);
    if(strlen(PrendasData[idx][prendaNombre]) > 0) return format(dest, len, "%s", PrendasData[idx][prendaNombre]);
    return format(dest, len, "Prenda #%d", idx);
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
        new nombrePrenda[32];
        ObtenerNombrePrendaJugador(playerid, i, nombrePrenda, sizeof(nombrePrenda));
        LimpiarLinea(nombrePrenda);
        format(line, sizeof(line), "%d) %s %s", i, nombrePrenda, PlayerPrendaActiva[playerid][i] ? "{66FF66}(Visible)" : "{FFAA00}(Oculta)");
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
        GuardarCuenta(playerid);
        SendClientMessage(playerid, 0x00FF00FF, "Posicion de prenda guardada.");
    }
    PrendaMoveIndex[playerid] = -1;
    return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, EDIT_RESPONSE:response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ) {
    #pragma unused playerobject

    new slot = EditMapEditandoSlot[playerid];
    if(slot < 0 || slot >= TotalEditMap || !EditMapData[slot][emActivo] || EditMapData[slot][emObj] != objectid) {
        slot = -1;
        for(new i = 0; i < TotalEditMap; i++) {
            if(EditMapData[i][emActivo] && EditMapData[i][emObj] == objectid) { slot = i; break; }
        }
        if(slot == -1) return 1;
    }

    if(response == EDIT_RESPONSE_FINAL) {
        EditMapData[slot][emX] = fX;
        EditMapData[slot][emY] = fY;
        EditMapData[slot][emZ] = fZ;
        EditMapData[slot][emRX] = fRotX;
        EditMapData[slot][emRY] = fRotY;
        EditMapData[slot][emRZ] = fRotZ;
        if(EditMapData[slot][emObj] != INVALID_OBJECT_ID) {
            SetObjectPos(EditMapData[slot][emObj], fX, fY, fZ);
            SetObjectRot(EditMapData[slot][emObj], fRotX, fRotY, fRotZ);
        }
        GuardarEditMap();
        SendClientMessage(playerid, 0x66FF66FF, "Objeto de editmap guardado en su ultima posicion.");
    } else if(response == EDIT_RESPONSE_CANCEL) {
        if(EditMapData[slot][emObj] != INVALID_OBJECT_ID) SetObjectPos(EditMapData[slot][emObj], EditMapData[slot][emX], EditMapData[slot][emY], EditMapData[slot][emZ]);
        if(EditMapData[slot][emObj] != INVALID_OBJECT_ID) SetObjectRot(EditMapData[slot][emObj], EditMapData[slot][emRX], EditMapData[slot][emRY], EditMapData[slot][emRZ]);
        SendClientMessage(playerid, 0xFFAA00FF, "Edicion cancelada.");
    }
    EditMapEditandoSlot[playerid] = -1;
    return 1;
}

stock ShowEditMapMenu(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_EDITMAP_MENU, DIALOG_STYLE_LIST, "EditMap Admin", "Agregar modelo\nEditar modelo\nEliminar modelo\nVer lista", "Seleccionar", "Cerrar");
}

stock GetEditMapSlotByListIndex(listindex) {
    new cur;
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) continue;
        if(cur == listindex) return i;
        cur++;
    }
    return -1;
}

stock ShowEditMapEditList(playerid) {
    static list[4096], line[96];
    new count;
    list[0] = EOS;
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) continue;
        format(line, sizeof(line), "Slot %d | %s | Model %d", i, EditMapData[i][emNombre], EditMapData[i][emModelo]);
        if(count > 0) strcat(list, "\n");
        strcat(list, line);
        count++;
    }
    if(!count) return SendClientMessage(playerid, -1, "No hay objetos en editmap.");
    return ShowPlayerDialog(playerid, DIALOG_EDITMAP_EDIT_LIST, DIALOG_STYLE_LIST, "EditMap - Editar", list, "Editar", "Atras");
}

stock ShowEditMapDeleteList(playerid) {
    static list[4096], line[96];
    new count;
    list[0] = EOS;
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) continue;
        format(line, sizeof(line), "Slot %d | %s | Model %d", i, EditMapData[i][emNombre], EditMapData[i][emModelo]);
        if(count > 0) strcat(list, "\n");
        strcat(list, line);
        count++;
    }
    if(!count) return SendClientMessage(playerid, -1, "No hay objetos para eliminar.");
    return ShowPlayerDialog(playerid, DIALOG_EDITMAP_DELETE_LIST, DIALOG_STYLE_LIST, "EditMap - Eliminar", list, "Eliminar", "Atras");
}

stock ShowEditMapViewList(playerid) {
    static list[4096], line[160];
    new count;
    list[0] = EOS;
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) continue;
        format(line, sizeof(line), "Slot %d | %s | Model %d | %.1f %.1f %.1f", i, EditMapData[i][emNombre], EditMapData[i][emModelo], EditMapData[i][emX], EditMapData[i][emY], EditMapData[i][emZ]);
        if(count > 0) strcat(list, "\n");
        strcat(list, line);
        count++;
    }
    if(!count) return SendClientMessage(playerid, -1, "No hay objetos cargados.");
    return ShowPlayerDialog(playerid, DIALOG_EDITMAP_LISTA, DIALOG_STYLE_LIST, "EditMap - Lista", list, "Opciones", "Atras");
}

stock GuardarEditMapEnRuta(const ruta[]) {
    new tmpPath[96];
    format(tmpPath, sizeof(tmpPath), "%s.tmp", ruta);

    new File:h = fopen(tmpPath, io_write);
    if(!h) return 0;

    new line[220];
    for(new i = 0; i < TotalEditMap; i++) {
        if(!EditMapData[i][emActivo]) continue;
        if(EditMapData[i][emObj] != INVALID_OBJECT_ID) {
            GetObjectPos(EditMapData[i][emObj], EditMapData[i][emX], EditMapData[i][emY], EditMapData[i][emZ]);
            GetObjectRot(EditMapData[i][emObj], EditMapData[i][emRX], EditMapData[i][emRY], EditMapData[i][emRZ]);
        }
        new nombre[32];
        format(nombre, sizeof(nombre), "%s", EditMapData[i][emNombre]);
        for(new c = 0; c < sizeof(nombre); c++) {
            if(nombre[c] == EOS) break;
            if(nombre[c] == ' ') nombre[c] = '_';
        }
        format(line, sizeof(line), "%d %f %f %f %f %f %f %s\n", EditMapData[i][emModelo], EditMapData[i][emX], EditMapData[i][emY], EditMapData[i][emZ], EditMapData[i][emRX], EditMapData[i][emRY], EditMapData[i][emRZ], nombre);
        fwrite(h, line);
    }
    fclose(h);

    fremove(ruta);
    if(frename(tmpPath, ruta)) return 1;
    return 0;
}

stock GuardarEditMap() {
    fcreatedir(DIR_DATA);
    new okMain = GuardarEditMapEnRuta(PATH_EDITMAP);
    new okLegacy = GuardarEditMapEnRuta(PATH_EDITMAP_LEGACY);
    return (okMain || okLegacy);
}

stock CargarEditMap() {
    new File:h = fopen(PATH_EDITMAP, io_read);
    if(!h) h = fopen(PATH_EDITMAP_LEGACY, io_read);
    if(!h) return 0;

    new line[220];
    TotalEditMap = 0;
    while(fread(h, line) && TotalEditMap < MAX_EDITMAP_OBJECTS) {
        new idx = 0;
        new modelid = strval(strtok(line, idx));
        if(modelid < 300 || modelid > 20000) continue;
        new Float:x = floatstr(strtok(line, idx));
        new Float:y = floatstr(strtok(line, idx));
        new Float:z = floatstr(strtok(line, idx));
        new Float:rx = floatstr(strtok(line, idx));
        new Float:ry = floatstr(strtok(line, idx));
        new Float:rz = floatstr(strtok(line, idx));
        new nombre[32];
        format(nombre, sizeof(nombre), "%s", strtok(line, idx));
        if(!nombre[0]) format(nombre, sizeof(nombre), "Objeto_%d", TotalEditMap);
        for(new c = 0; c < sizeof(nombre); c++) {
            if(nombre[c] == EOS) break;
            if(nombre[c] == '_') nombre[c] = ' ';
        }

        EditMapData[TotalEditMap][emActivo] = true;
        EditMapData[TotalEditMap][emModelo] = modelid;
        format(EditMapData[TotalEditMap][emNombre], 32, "%s", nombre);
        EditMapData[TotalEditMap][emX] = x;
        EditMapData[TotalEditMap][emY] = y;
        EditMapData[TotalEditMap][emZ] = z;
        EditMapData[TotalEditMap][emRX] = rx;
        EditMapData[TotalEditMap][emRY] = ry;
        EditMapData[TotalEditMap][emRZ] = rz;
        EditMapData[TotalEditMap][emObj] = CreateObject(modelid, x, y, z, rx, ry, rz);
        TotalEditMap++;
    }
    fclose(h);
    return 1;
}

stock GetConceptoSancionNombre(concepto, dest[], len) {
    if(concepto == 0) return format(dest, len, "PG");
    if(concepto == 1) return format(dest, len, "DM");
    if(concepto == 2) return format(dest, len, "MG");
    if(concepto == 3) return format(dest, len, "RK");
    if(concepto == 4) return format(dest, len, "CK");
    if(concepto == 5) return format(dest, len, "NRE");
    if(concepto == 6) return format(dest, len, "NVVPJ");
    if(concepto == 7) return format(dest, len, "ER");
    if(concepto == 8) return format(dest, len, "FR");
    return format(dest, len, "N/A");
}

stock AplicarSancionJugador(adminid, targetid, concepto, minutos) {
    if(!IsPlayerConnected(targetid) || minutos <= 0) return 0;

    PlayerSancionado[targetid] = true;
    SancionConcepto[targetid] = concepto;
    SancionFinTick[targetid] = GetTickCount() + (minutos * 60000);
    GetPlayerPos(targetid, SancionPos[targetid][0], SancionPos[targetid][1], SancionPos[targetid][2]);
    SancionPrevVW[targetid] = GetPlayerVirtualWorld(targetid);
    SancionPrevInterior[targetid] = GetPlayerInterior(targetid);
    TogglePlayerControllable(targetid, false);
    SetPlayerHealth(targetid, 100.0);
    SetPlayerArmour(targetid, 100.0);
    DisableRemoteVehicleCollisions(targetid, true);

    new conceptoNombre[16], labelText[128];
    GetConceptoSancionNombre(concepto, conceptoNombre, sizeof(conceptoNombre));
    format(labelText, sizeof(labelText), "[SANCIONADO]\nMotivo: %s\nTiempo: %02d:00", conceptoNombre, minutos);
    if(SancionLabel[targetid] != Text3D:-1) Delete3DTextLabel(SancionLabel[targetid]);
    SancionLabel[targetid] = Create3DTextLabel(labelText, 0xFF3333FF, SancionPos[targetid][0], SancionPos[targetid][1], SancionPos[targetid][2] + 1.2, 60.0, 0);
    Attach3DTextLabelToPlayer(SancionLabel[targetid], targetid, 0.0, 0.0, 1.0);

    new msg[160], admName[MAX_PLAYER_NAME], tarName[MAX_PLAYER_NAME];
    GetPlayerName(adminid, admName, sizeof(admName));
    GetPlayerName(targetid, tarName, sizeof(tarName));
    format(msg, sizeof(msg), "SERVER: %s sanciono a %s por %s durante %d minutos.", admName, tarName, conceptoNombre, minutos);
    SendClientMessageToAll(0xFF4444FF, msg);
    SendClientMessage(targetid, 0xFF4444FF, "Has sido sancionado. Permaneceras congelado hasta terminar tu tiempo.");
    return 1;
}

stock RemoverSancionJugador(targetid) {
    if(!IsPlayerConnected(targetid)) return 0;
    PlayerSancionado[targetid] = false;
    SancionFinTick[targetid] = 0;
    TogglePlayerControllable(targetid, true);
    DisableRemoteVehicleCollisions(targetid, false);
    SetPlayerVirtualWorld(targetid, SancionPrevVW[targetid]);
    SetPlayerInterior(targetid, SancionPrevInterior[targetid]);
    SetPlayerPos(targetid, SancionPos[targetid][0], SancionPos[targetid][1], SancionPos[targetid][2]);
    if(SancionLabel[targetid] != Text3D:-1) {
        Delete3DTextLabel(SancionLabel[targetid]);
        SancionLabel[targetid] = Text3D:-1;
    }
    return 1;
}

stock ShowReglasDialog(playerid) {
    new reglasTexto[1024];
    reglasTexto[0] = EOS;

    strcat(reglasTexto, "{F7D154}REGLAS DEL SERVIDOR\n\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{58D68D}PG{FFFFFF}: Acciones irreales. (10 min - 1 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{EC7063}DM{FFFFFF}: Matar sin rol. (1 h - 3 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{5DADE2}MG{FFFFFF}: Usar info OOC. (10 min - 30 min)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{AF7AC5}RK{FFFFFF}: Vengarse tras morir. (1 h - 2 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{F1948A}CK{FFFFFF}: Matar atropellando. (1 h - 3 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{7FB3D5}NRE{FFFFFF}: No rolear entorno. (1 h - 5 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{F8C471}NVVPJ{FFFFFF}: No valorar vida del personaje. (30 min - 1 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{AAB7B8}ER{FFFFFF}: Evadir rol. (1 h - 2 h)\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{73C6B6}FR{FFFFFF}: Forzar rol. (30 min - 10 h)\n\n", sizeof(reglasTexto));
    strcat(reglasTexto, "{AAAAAA}Mantener rol serio mejora la experiencia de todos.", sizeof(reglasTexto));

    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Kame House RP", reglasTexto, "Entendido", "Cerrar");
}

stock GuardarVentaAutosConfig() {
    new File:h = fopen(PATH_VENTA_AUTOS, io_write);
    if(!h) return 0;

    new line[96];
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        format(line, sizeof(line), "%d %d %d %d\n", VentaAutosData[i][vaActiva], VentaAutosData[i][vaModelo], VentaAutosData[i][vaPrecio], VentaAutosData[i][vaStock]);
        fwrite(h, line);
    }

    fclose(h);
    return 1;
}

stock CargarVentaAutosConfig() {
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        VentaAutosData[i][vaActiva] = false;
        VentaAutosData[i][vaModelo] = 0;
        VentaAutosData[i][vaPrecio] = 0;
        VentaAutosData[i][vaStock] = 0;
    }

    new File:h = fopen(PATH_VENTA_AUTOS, io_read), line[96];
    if(!h) {
        GuardarVentaAutosConfig();
        return 1;
    }

    new i = 0;
    while(fread(h, line) && i < MAX_AUTOS_VENTA) {
        new idx = 0;
        VentaAutosData[i][vaActiva] = strval(strtok(line, idx)) != 0;
        VentaAutosData[i][vaModelo] = strval(strtok(line, idx));
        VentaAutosData[i][vaPrecio] = strval(strtok(line, idx));
        VentaAutosData[i][vaStock] = strval(strtok(line, idx));
        i++;
    }

    fclose(h);
    return 1;
}


stock GuardarVentaSkinsConfig() {
    new File:h = fopen(PATH_VENTA_SKINS, io_write);
    if(!h) return 0;
    new line[96];
    format(line, sizeof(line), "POS %f %f %f\n", VentaSkinsPos[0], VentaSkinsPos[1], VentaSkinsPos[2]);
    fwrite(h, line);
    for(new i = 0; i < MAX_SKINS_VENTA; i++) {
        format(line, sizeof(line), "%d %d %d\n", VentaSkinsData[i][vsActiva], VentaSkinsData[i][vsSkin], VentaSkinsData[i][vsPrecio]);
        fwrite(h, line);
    }
    fclose(h);
    return 1;
}

stock CargarVentaSkinsConfig() {
    for(new i = 0; i < MAX_SKINS_VENTA; i++) {
        VentaSkinsData[i][vsActiva] = false;
        VentaSkinsData[i][vsSkin] = 0;
        VentaSkinsData[i][vsPrecio] = 0;
    }
    new File:h = fopen(PATH_VENTA_SKINS, io_read), line[96];
    if(!h) return GuardarVentaSkinsConfig();

    new i;
    if(fread(h, line)) {
        if(line[0] == 'P' && line[1] == 'O' && line[2] == 'S') {
            new idx = 3;
            VentaSkinsPos[0] = floatstr(strtok(line, idx));
            VentaSkinsPos[1] = floatstr(strtok(line, idx));
            VentaSkinsPos[2] = floatstr(strtok(line, idx));
        } else {
            new idx = 0;
            VentaSkinsData[i][vsActiva] = strval(strtok(line, idx)) != 0;
            VentaSkinsData[i][vsSkin] = strval(strtok(line, idx));
            VentaSkinsData[i][vsPrecio] = strval(strtok(line, idx));
            i++;
        }
    }
    while(fread(h, line) && i < MAX_SKINS_VENTA) {
        new idx = 0;
        VentaSkinsData[i][vsActiva] = strval(strtok(line, idx)) != 0;
        VentaSkinsData[i][vsSkin] = strval(strtok(line, idx));
        VentaSkinsData[i][vsPrecio] = strval(strtok(line, idx));
        i++;
    }
    fclose(h);
    return 1;
}

stock GuardarArmeriaConfig() {
    new File:h = fopen(PATH_ARMERIA, io_write);
    if(!h) return 0;
    new line[96];
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        format(line, sizeof(line), "%d %d %d %d %d %d %d %d\n", ArmeriaItems[i][aiActiva], ArmeriaItems[i][aiArma], ArmeriaItems[i][aiSlot], ArmeriaItems[i][aiPrecioArma], ArmeriaItems[i][aiPrecioMunicion], ArmeriaItems[i][aiMunicionPack], ArmeriaItems[i][aiStockArma], ArmeriaItems[i][aiStockMunicion]);
        fwrite(h, line);
    }
    fclose(h);
    return 1;
}

stock CargarArmeriaConfig() {
    for(new i = 0; i < MAX_ARMAS_TIENDA; i++) {
        ArmeriaItems[i][aiActiva] = false;
        ArmeriaItems[i][aiArma] = 0;
        ArmeriaItems[i][aiSlot] = i;
        ArmeriaItems[i][aiPrecioArma] = 0;
        ArmeriaItems[i][aiPrecioMunicion] = 6;
        ArmeriaItems[i][aiMunicionPack] = 1;
        ArmeriaItems[i][aiStockArma] = 0;
        ArmeriaItems[i][aiStockMunicion] = 9999;
    }
    new File:h = fopen(PATH_ARMERIA, io_read), line[128];
    if(!h) return GuardarArmeriaConfig();
    new i;
    while(fread(h, line) && i < MAX_ARMAS_TIENDA) {
        new idx = 0;
        ArmeriaItems[i][aiActiva] = strval(strtok(line, idx)) != 0;
        ArmeriaItems[i][aiArma] = strval(strtok(line, idx));
        ArmeriaItems[i][aiSlot] = strval(strtok(line, idx));
        ArmeriaItems[i][aiPrecioArma] = strval(strtok(line, idx));
        ArmeriaItems[i][aiPrecioMunicion] = strval(strtok(line, idx));
        ArmeriaItems[i][aiMunicionPack] = strval(strtok(line, idx));
        ArmeriaItems[i][aiStockArma] = strval(strtok(line, idx));
        ArmeriaItems[i][aiStockMunicion] = strval(strtok(line, idx));
        i++;
    }
    fclose(h);
    return 1;
}

stock CargarTiendaVirtualConfig() {
    PrecioMembresiaVIPDinero = PRECIO_MEMBRESIA_VIP;
    PrecioMembresiaVIPDiamantes = 1;
    PrecioDiamanteTienda = PRECIO_DIAMANTE_TIENDA;

    fcreatedir(DIR_SCRIPTFILES);
    fcreatedir(DIR_DATA);

    new File:h = fopen(PATH_TIENDA_VIRTUAL, io_read), line[96];
    if(!h) return GuardarTiendaVirtualConfig();

    while(fread(h, line)) {
        if(!line[0] || line[0] == '\n' || line[0] == '\r' || line[0] == '#') continue;

        if(strfind(line, "VIP_DINERO=", true) == 0) {
            new valor[16];
            strmid(valor, line, 11, strlen(line), sizeof(valor));
            new vipDinero = strval(valor);
            if(vipDinero > 0) PrecioMembresiaVIPDinero = vipDinero;
            continue;
        }

        if(strfind(line, "VIP_DIAMANTES=", true) == 0) {
            new valor[16];
            strmid(valor, line, 14, strlen(line), sizeof(valor));
            new vipDiamantes = strval(valor);
            if(vipDiamantes >= 0) PrecioMembresiaVIPDiamantes = vipDiamantes;
            continue;
        }

        if(strfind(line, "DIAMANTE_PRECIO=", true) == 0) {
            new valor[16];
            strmid(valor, line, 15, strlen(line), sizeof(valor));
            new precioDiamante = strval(valor);
            if(precioDiamante > 0) PrecioDiamanteTienda = precioDiamante;
            continue;
        }

        new idx = 0;
        new vipDineroLegacy = strval(strtok(line, idx));
        new vipDiamantesLegacy = strval(strtok(line, idx));
        new precioDiamanteLegacy = strval(strtok(line, idx));
        if(vipDineroLegacy > 0) PrecioMembresiaVIPDinero = vipDineroLegacy;
        if(vipDiamantesLegacy >= 0) PrecioMembresiaVIPDiamantes = vipDiamantesLegacy;
        if(precioDiamanteLegacy > 0) PrecioDiamanteTienda = precioDiamanteLegacy;
    }

    fclose(h);
    return 1;
}

stock GuardarTiendaVirtualConfig() {
    fcreatedir(DIR_SCRIPTFILES);
    fcreatedir(DIR_DATA);

    new File:h = fopen(PATH_TIENDA_VIRTUAL, io_write);
    if(!h) return 0;

    new line[96];
    format(line, sizeof(line), "VIP_DINERO=%d\n", PrecioMembresiaVIPDinero);
    fwrite(h, line);
    format(line, sizeof(line), "VIP_DIAMANTES=%d\n", PrecioMembresiaVIPDiamantes);
    fwrite(h, line);
    format(line, sizeof(line), "DIAMANTE_PRECIO=%d\n", PrecioDiamanteTienda);
    fwrite(h, line);

    fclose(h);
    return 1;
}

stock GetMinaDisponibleMasCercana(playerid, ignorar = -1) {
    new elegido = -1;
    new Float:px, Float:py, Float:pz;
    new Float:minDist = 999999.0;
    GetPlayerPos(playerid, px, py, pz);
    for(new i = 0; i < TotalMinas; i++) {
        if(!MinaData[i][minaActiva] || i == ignorar) continue;
        if(GetTickCount() < MinaCooldownTick[i]) continue;
        new Float:d = GetDistanceBetweenPoints(px, py, pz, MinaData[i][minaX], MinaData[i][minaY], MinaData[i][minaZ]);
        if(d < minDist) { minDist = d; elegido = i; }
    }
    return elegido;
}

stock SetCheckpointMinaMasCercana(playerid) {
    new mina = GetMinaDisponibleMasCercana(playerid);
    if(mina == -1) {
        DisablePlayerCheckpoint(playerid);
        return 0;
    }
    SetPlayerCheckpoint(playerid, MinaData[mina][minaX], MinaData[mina][minaY], MinaData[mina][minaZ], 4.5);
    return 1;
}

stock GetPrecioOriginalVehiculo(modelo) {
    for(new i = 0; i < MAX_AUTOS_VENTA; i++) {
        if(VentaAutosData[i][vaActiva] && VentaAutosData[i][vaModelo] == modelo && VentaAutosData[i][vaPrecio] > 0) return VentaAutosData[i][vaPrecio];
    }
    return 0;
}

stock MostrarMenuTuning(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_TUNING_MENU, DIALOG_STYLE_LIST, "Tuning Kame House", "Pintar vehiculo ($10000)\nVender auto como chatarra (70%)", "Seleccionar", "Cerrar");
}

stock MostrarListaVehiculosChatarra(playerid) {
    new list[512], line[96];
    list[0] = EOS;
    TuningVehCount[playerid] = 0;
    for(new v = 1; v < MAX_VEHICLES; v++) {
        if(VehOwner[v] != playerid) continue;
        if(VehModelData[v] < 400 || VehModelData[v] > 611) continue;
        if(TuningVehCount[playerid] >= MAX_AUTOS_NORMALES_JUGADOR) break;
        TuningVehLista[playerid][TuningVehCount[playerid]] = v;
        new precio = GetPrecioOriginalVehiculo(VehModelData[v]);
        new pago = (precio * 70) / 100;
        new ident[96];
        FormatearVehiculoIdentificador(v, ident, sizeof(ident), precio);
        format(line, sizeof(line), "%s - Chatarra: $%d", ident, pago);
        if(TuningVehCount[playerid] > 0) strcat(list, "\n");
        strcat(list, line);
        TuningVehCount[playerid]++;
    }
    if(TuningVehCount[playerid] == 0) return SendClientMessage(playerid, -1, "No tienes vehiculos propios para vender como chatarra.");
    return ShowPlayerDialog(playerid, DIALOG_CHATARRA_VEHICULO, DIALOG_STYLE_LIST, "Vender Auto Como Chatarra", list, "Vender", "Atras");
}

stock EliminarVehiculoJugador(veh) {
    if(veh <= 0 || veh >= MAX_VEHICLES) return 0;
    if(IsValidVehicle(veh)) DestroyVehicle(veh);
    ResetMaleteroVehiculo(veh);
    VehOwner[veh] = -1;
    VehLocked[veh] = false;
    VehOculto[veh] = false;
    VehLastUseTick[veh] = 0;
    VehModelData[veh] = 0;
    VehColor1Data[veh] = 0;
    VehColor2Data[veh] = 0;
    GasInitVehiculo[veh] = false;
    GasVehiculo[veh] = 0;
    return 1;
}

stock SetDefaultCJAnimations(playerid) {
    if(!IsPlayerConnected(playerid)) return 0;
    ClearAnimations(playerid, t_FORCE_SYNC:SYNC_ALL);
    return 1;
}

stock GetNombreVehiculoVanilla(modelid, nombre[], len) {
    switch(modelid) {
        case 400: format(nombre, len, "Landstalker");
        case 401: format(nombre, len, "Bravura");
        case 402: format(nombre, len, "Buffalo");
        case 404: format(nombre, len, "Perennial");
        case 405: format(nombre, len, "Sentinel");
        case 409: format(nombre, len, "Stretch");
        case 410: format(nombre, len, "Manana");
        case 411: format(nombre, len, "Infernus");
        case 412: format(nombre, len, "Voodoo");
        case 415: format(nombre, len, "Cheetah");
        case 416: format(nombre, len, "Ambulance");
        case 418: format(nombre, len, "Moonbeam");
        case 419: format(nombre, len, "Esperanto");
        case 420: format(nombre, len, "Taxi");
        case 421: format(nombre, len, "Washington");
        case 422: format(nombre, len, "Bobcat");
        case 423: format(nombre, len, "Mr. Whoopee");
        case 424: format(nombre, len, "BF Injection");
        case 426: format(nombre, len, "Premier");
        case 427: format(nombre, len, "Enforcer");
        case 429: format(nombre, len, "Banshee");
        case 430: format(nombre, len, "Predator");
        case 431: format(nombre, len, "Bus");
        case 432: format(nombre, len, "Rhino (Tanque)");
        case 433: format(nombre, len, "Barracks");
        case 434: format(nombre, len, "Hotknife");
        case 436: format(nombre, len, "Previon");
        case 438: format(nombre, len, "Cabbie");
        case 439: format(nombre, len, "Stallion");
        case 440: format(nombre, len, "Rumpo");
        case 441: format(nombre, len, "RC Bandit");
        case 442: format(nombre, len, "Romero");
        case 445: format(nombre, len, "Admiral");
        case 451: format(nombre, len, "Turismo");
        case 455: format(nombre, len, "Flatbed");
        case 456: format(nombre, len, "Yankee");
        case 457: format(nombre, len, "Caddy");
        case 458: format(nombre, len, "Solair");
        case 459: format(nombre, len, "Topfun Van");
        case 466: format(nombre, len, "Glendale");
        case 467: format(nombre, len, "Oceanic");
        case 468: format(nombre, len, "Sanchez");
        case 470: format(nombre, len, "Patriot");
        case 471: format(nombre, len, "Quad");
        case 474: format(nombre, len, "Hermes");
        case 475: format(nombre, len, "Sabre");
        case 477: format(nombre, len, "ZR-350");
        case 478: format(nombre, len, "Walton");
        case 479: format(nombre, len, "Regina");
        case 480: format(nombre, len, "Comet");
        case 481: format(nombre, len, "BMX");
        case 482: format(nombre, len, "Burrito");
        case 483: format(nombre, len, "Camper");
        case 485: format(nombre, len, "Baggage");
        case 486: format(nombre, len, "Dozer");
        case 489: format(nombre, len, "Rancher");
        case 490: format(nombre, len, "FBI Rancher");
        case 491: format(nombre, len, "Virgo");
        case 492: format(nombre, len, "Greenwood");
        case 494: format(nombre, len, "Hotring Racer");
        case 495: format(nombre, len, "Sandking");
        case 496: format(nombre, len, "Blista Compact");
        case 500: format(nombre, len, "Mesa");
        case 502: format(nombre, len, "Hotring Racer A");
        case 503: format(nombre, len, "Hotring Racer B");
        case 504: format(nombre, len, "Bloodring Banger");
        case 505: format(nombre, len, "Rancher Lure");
        case 506: format(nombre, len, "Super GT");
        case 507: format(nombre, len, "Elegant");
        case 516: format(nombre, len, "Nebula");
        case 517: format(nombre, len, "Majestic");
        case 518: format(nombre, len, "Buccaneer");
        case 526: format(nombre, len, "Fortune");
        case 527: format(nombre, len, "Cadrona");
        case 529: format(nombre, len, "Willard");
        case 533: format(nombre, len, "Feltzer");
        case 534: format(nombre, len, "Remington");
        case 535: format(nombre, len, "Slamvan");
        case 536: format(nombre, len, "Blade");
        case 540: format(nombre, len, "Vincent");
        case 541: format(nombre, len, "Bullet");
        case 542: format(nombre, len, "Clover");
        case 543: format(nombre, len, "Sadler");
        case 545: format(nombre, len, "Hustler");
        case 546: format(nombre, len, "Intruder");
        case 547: format(nombre, len, "Primo");
        case 549: format(nombre, len, "Tampa");
        case 550: format(nombre, len, "Sunrise");
        case 551: format(nombre, len, "Merit");
        case 554: format(nombre, len, "Yosemite");
        case 555: format(nombre, len, "Windsor");
        case 558: format(nombre, len, "Uranus");
        case 559: format(nombre, len, "Jester");
        case 560: format(nombre, len, "Sultan");
        case 561: format(nombre, len, "Stratum");
        case 562: format(nombre, len, "Elegy");
        case 565: format(nombre, len, "Flash");
        case 566: format(nombre, len, "Tahoma");
        case 567: format(nombre, len, "Savanna");
        case 568: format(nombre, len, "Bandito");
        case 575: format(nombre, len, "Broadway");
        case 576: format(nombre, len, "Tornado");
        case 579: format(nombre, len, "Huntley");
        case 580: format(nombre, len, "Stafford");
        case 585: format(nombre, len, "Emperor");
        case 587: format(nombre, len, "Euros");
        case 589: format(nombre, len, "Club");
        case 596: format(nombre, len, "Police LS");
        case 597: format(nombre, len, "Police SF");
        case 598: format(nombre, len, "Police LV");
        case 599: format(nombre, len, "Police Ranger");
        case 600: format(nombre, len, "Picador");
        case 602: format(nombre, len, "Alpha");
        case 603: format(nombre, len, "Phoenix");
        case 604: format(nombre, len, "Glendale Damaged");
        case 605: format(nombre, len, "Sadler Damaged");
        default: format(nombre, len, "Modelo %d", modelid);
    }
    return 1;
}

stock FormatearVehiculoIdentificador(vehid, dest[], len, valor = 0) {
    if(vehid <= 0 || vehid >= MAX_VEHICLES || VehModelData[vehid] < 400 || VehModelData[vehid] > 611) {
        format(dest, len, "Vehiculo desconocido%s", valor > 0 ? " [Valor: $0]" : "");
        return 1;
    }
    new nombre[32], extra[32];
    GetNombreVehiculoVanilla(VehModelData[vehid], nombre, sizeof(nombre));
    if(valor > 0) format(extra, sizeof(extra), " [Valor: $%d]", valor);
    else extra[0] = EOS;
    format(dest, len, "%s%s", nombre, extra);
    return 1;
}


stock FormatearDineroCorto(monto, dest[], len) {
    if(monto >= 1000000) return format(dest, len, "%dM", monto / 1000000);
    if(monto >= 1000) return format(dest, len, "%dk", monto / 1000);
    return format(dest, len, "%d", monto);
}

stock SanearTextoLabel(const origen[], destino[], len) {
    new j = 0;
    for(new i = 0; origen[i] != EOS && j < len - 1; i++) {
        new c = origen[i];
        if((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == ' ' || c == '_' || c == '-') {
            destino[j++] = c;
        }
    }
    destino[j] = EOS;
    if(j == 0) format(destino, len, "Sin faccion");
    return 1;
}

stock ConvertirColorAHexRGB(color, dest[], len) {
    if(len < 7) {
        if(len > 0) dest[0] = EOS;
        return 0;
    }

    static const HexChars[] = "0123456789ABCDEF";
    new rgb = (color >>> 8) & 0xFFFFFF;

    dest[0] = HexChars[(rgb >> 20) & 0xF];
    dest[1] = HexChars[(rgb >> 16) & 0xF];
    dest[2] = HexChars[(rgb >> 12) & 0xF];
    dest[3] = HexChars[(rgb >> 8) & 0xF];
    dest[4] = HexChars[(rgb >> 4) & 0xF];
    dest[5] = HexChars[rgb & 0xF];
    dest[6] = EOS;
    return 1;
}

stock BuscarFaccionLibre() { for(new i=0;i<MAX_FACCIONES;i++) if(!FaccionData[i][facActiva]) return i; return -1; }

stock bool:AgregarMiembroFaccion(fid, playerid, rango) {
    if(fid < 0 || fid >= MAX_FACCIONES || !FaccionData[fid][facActiva]) return false;
    new count = 0;
    for(new i=0;i<MAX_MIEMBROS_FACCION;i++) if(FaccionData[fid][facMiembros][i] != -1) count++;
    if(count >= MAX_MIEMBROS_FACCION) return false;
    for(new i=0;i<MAX_MIEMBROS_FACCION;i++) {
        if(FaccionData[fid][facMiembros][i] != -1) continue;
        FaccionData[fid][facMiembros][i] = playerid;
        FaccionData[fid][facRangos][i] = rango;
        GuardarNombreJugadorEnFaccion(playerid, fid, i);
        PlayerFaccionId[playerid] = fid;
        PlayerFaccionRango[playerid] = rango;
        ActualizarLabelJugadorFaccion(playerid, true);
        return true;
    }
    return false;
}

stock RemoverMiembroFaccion(fid, playerid) {
    if(fid < 0 || fid >= MAX_FACCIONES) return 0;
    for(new i=0;i<MAX_MIEMBROS_FACCION;i++) {
        if(FaccionData[fid][facMiembros][i] != playerid) continue;
        FaccionData[fid][facMiembros][i] = -1;
        FaccionData[fid][facRangos][i] = 0;
        FaccionMiembroNombre[fid][i][0] = EOS;
    }
    PlayerFaccionId[playerid] = -1;
    PlayerFaccionRango[playerid] = 0;
    ActualizarLabelJugadorFaccion(playerid, true);
    return 1;
}

stock ActualizarMiembrosFaccion(fid) {
    if(fid < 0 || fid >= MAX_FACCIONES) return 0;
    for(new i=0;i<MAX_MIEMBROS_FACCION;i++) {
        new pid = FaccionData[fid][facMiembros][i];
        if(pid == -1 || !IsPlayerConnected(pid)) continue;
        PlayerFaccionId[pid] = fid;
        PlayerFaccionRango[pid] = FaccionData[fid][facRangos][i];
        ActualizarLabelJugadorFaccion(pid, true);
    }
    return 1;
}

stock EliminarFaccion(fid) {
    if(fid < 0 || fid >= MAX_FACCIONES) return 0;
    new ownerid = FaccionData[fid][facOwner];
    for(new i=0;i<MAX_MIEMBROS_FACCION;i++) {
        new pid = FaccionData[fid][facMiembros][i];
        if(pid != -1) {
            PlayerFaccionId[pid] = -1;
            PlayerFaccionRango[pid] = 0;
            if(IsPlayerConnected(pid)) ActualizarLabelJugadorFaccion(pid, true);
        }
        FaccionData[fid][facMiembros][i] = -1;
        FaccionData[fid][facRangos][i] = 0;
        FaccionMiembroNombre[fid][i][0] = EOS;
    }
    if(ownerid != -1) {
        PlayerFaccionId[ownerid] = -1;
        PlayerFaccionRango[ownerid] = 0;
        if(IsPlayerConnected(ownerid)) ActualizarLabelJugadorFaccion(ownerid, true);
    }
    FaccionData[fid][facActiva] = false;
    FaccionData[fid][facOwner] = -1;
    FaccionData[fid][facNombre][0] = EOS;
    FaccionData[fid][facColor] = 0;
    FaccionOwnerNombre[fid][0] = EOS;
    return 1;
}

stock MostrarMenuFaccionesCP(playerid) {
    return ShowPlayerDialog(playerid, DIALOG_FACCION_MENU, DIALOG_STYLE_LIST, "Facciones Kame House", "Crear Faccion\nComprar Color Para La Faccion", "Abrir", "Cerrar");
}

stock MostrarPanelFaccionOwner(playerid) {
    new fid = PlayerFaccionId[playerid];
    if(fid == -1) return SendClientMessage(playerid, -1, "No perteneces a ninguna faccion.");
    return ShowPlayerDialog(playerid, DIALOG_FACCION_OWNER_MENU, DIALOG_STYLE_LIST, "Panel Faccion", "Informacion\nAnadir miembro\nEditar rango\nEliminar miembro", "Abrir", "Cerrar");
}

stock ActualizarLabelJugadorFaccion(playerid, bool:forzar = false) {
    if(!IsPlayerConnected(playerid)) return 0;

    if(!forzar && PlayerPrefixLabel[playerid] != Text3D:-1 && (GetTickCount() - UltimaActualizacionLabelFaccionTick[playerid]) < 20000) return 1;
    UltimaActualizacionLabelFaccionTick[playerid] = GetTickCount();

    if(PlayerPrefixLabel[playerid] != Text3D:-1) { Delete3DTextLabel(PlayerPrefixLabel[playerid]); PlayerPrefixLabel[playerid] = Text3D:-1; }

    new texto[256], faccionNombre[24], faccionNombreLimpio[24], dineroCorto[16], membresiaNombre[24], membresiaHex[8];
    faccionNombre[0] = EOS;

    if(PlayerFaccionId[playerid] != -1) format(faccionNombre, sizeof(faccionNombre), "%s", FaccionData[PlayerFaccionId[playerid]][facNombre]);
    else format(faccionNombre, sizeof(faccionNombre), "Sin faccion");

    SanearTextoLabel(faccionNombre, faccionNombreLimpio, sizeof(faccionNombreLimpio));
    FormatearDineroCorto(GetPlayerMoney(playerid), dineroCorto, sizeof(dineroCorto));
    GetMembresiaNombre(PlayerMembresiaTipo[playerid], membresiaNombre, sizeof(membresiaNombre));
    ConvertirColorAHexRGB(GetMembresiaColor(PlayerMembresiaTipo[playerid]), membresiaHex, sizeof(membresiaHex));

    if(PlayerFaccionId[playerid] == -1) {
        if(EsDueno(playerid)) format(texto, sizeof(texto), "{FFFFFF}- {%s}%s {FFFFFF}- {FFFFFF}Nivel %d {FFFFFF}- {00FF00}Dinero $%s {FFFFFF}- Owner -", membresiaHex, membresiaNombre, GetNivelPJ(playerid), dineroCorto);
        else format(texto, sizeof(texto), "{FFFFFF}- {%s}%s {FFFFFF}- {FFFFFF}Nivel %d {FFFFFF}- {00FF00}Dinero $%s {FFFFFF}-", membresiaHex, membresiaNombre, GetNivelPJ(playerid), dineroCorto);
    } else {
        new colorHex[8];
        ConvertirColorAHexRGB(FaccionData[PlayerFaccionId[playerid]][facColor], colorHex, sizeof(colorHex));
        if(EsDueno(playerid)) format(texto, sizeof(texto), "{FFFFFF}- {%s}Faccion %s {FFFFFF}- {%s}%s {FFFFFF}- {FFFFFF}Nivel %d {FFFFFF}- {00FF00}Dinero $%s {FFFFFF}- Owner -", colorHex, faccionNombreLimpio, membresiaHex, membresiaNombre, GetNivelPJ(playerid), dineroCorto);
        else format(texto, sizeof(texto), "{FFFFFF}- {%s}Faccion %s {FFFFFF}- {%s}%s {FFFFFF}- {FFFFFF}Nivel %d {FFFFFF}- {00FF00}Dinero $%s {FFFFFF}-", colorHex, faccionNombreLimpio, membresiaHex, membresiaNombre, GetNivelPJ(playerid), dineroCorto);
    }

    PlayerPrefixLabel[playerid] = Create3DTextLabel(texto, 0xFFFFFFFF, 0.0, 0.0, 0.0, 30.0, 0);
    Attach3DTextLabelToPlayer(PlayerPrefixLabel[playerid], playerid, 0.0, 0.0, 0.46);
    return 1;
}

stock GuardarFacciones() {
    new paths[2][64] = {PATH_FACCIONES, PATH_FACCIONES_BAK};
    for(new pidx = 0; pidx < 2; pidx++) {
        new File:h = fopen(paths[pidx], io_write);
        if(!h) {
            fcreatedir(DIR_DATA);
            h = fopen(paths[pidx], io_write);
        }
        if(!h) continue;

        new line[1024], part[96];
        for(new f=0; f<MAX_FACCIONES; f++) {
            if(!FaccionData[f][facActiva]) continue;
            format(line, sizeof(line), "%d|%s|%d|%d|%s", f, FaccionData[f][facNombre], FaccionData[f][facOwner], FaccionData[f][facColor], FaccionOwnerNombre[f]);
            for(new m=0;m<MAX_MIEMBROS_FACCION;m++) {
                format(part, sizeof(part), "|%d|%d|%s", FaccionData[f][facMiembros][m], FaccionData[f][facRangos][m], FaccionMiembroNombre[f][m]);
                strcat(line, part);
            }
            strcat(line, "\n");
            fwrite(h, line);
        }
        fclose(h);
    }
    return 1;
}

stock CargarFaccionesDesdeArchivo(const path[]) {
    new File:h = fopen(path, io_read), line[1024], cargadas = 0;
    if(!h) return -1;

    while(fread(h, line)) {
        LimpiarLinea(line);
        if(!line[0]) continue;

        new idx = 0, fid = strval(strtok_sep(line, idx, '|' ));
        if(fid < 0 || fid >= MAX_FACCIONES) continue;

        FaccionData[fid][facActiva] = true;
        format(FaccionData[fid][facNombre], 17, "%s", strtok_sep(line, idx, '|' ));
        FaccionData[fid][facOwner] = strval(strtok_sep(line, idx, '|' ));
        FaccionData[fid][facColor] = strval(strtok_sep(line, idx, '|' ));
        format(FaccionOwnerNombre[fid], MAX_PLAYER_NAME, "%s", strtok_sep(line, idx, '|' ));

        for(new m=0;m<MAX_MIEMBROS_FACCION;m++) {
            FaccionData[fid][facMiembros][m] = strval(strtok_sep(line, idx, '|' ));
            FaccionData[fid][facRangos][m] = strval(strtok_sep(line, idx, '|' ));
            format(FaccionMiembroNombre[fid][m], MAX_PLAYER_NAME, "%s", strtok_sep(line, idx, '|' ));
        }

        if(!FaccionOwnerNombre[fid][0] && FaccionData[fid][facOwner] != -1) {
            format(FaccionOwnerNombre[fid], MAX_PLAYER_NAME, "ID_%d", FaccionData[fid][facOwner]);
        }
        for(new m=0;m<MAX_MIEMBROS_FACCION;m++) {
            if(FaccionData[fid][facMiembros][m] != -1 && !FaccionMiembroNombre[fid][m][0]) {
                format(FaccionMiembroNombre[fid][m], MAX_PLAYER_NAME, "ID_%d", FaccionData[fid][facMiembros][m]);
            }
        }
        cargadas++;
    }
    fclose(h);
    return cargadas;
}

stock CargarFacciones() {
    for(new f=0; f<MAX_FACCIONES; f++) {
        FaccionData[f][facActiva] = false;
        FaccionData[f][facNombre][0] = EOS;
        FaccionData[f][facOwner] = -1;
        FaccionData[f][facColor] = 0x95A5A6FF;
        FaccionOwnerNombre[f][0] = EOS;
        for(new m=0;m<MAX_MIEMBROS_FACCION;m++) {
            FaccionData[f][facMiembros][m] = -1;
            FaccionData[f][facRangos][m] = 0;
            FaccionMiembroNombre[f][m][0] = EOS;
        }
    }

    new cargadas = CargarFaccionesDesdeArchivo(PATH_FACCIONES);
    if(cargadas < 0) cargadas = CargarFaccionesDesdeArchivo(PATH_FACCIONES_BAK);

    if(cargadas < 0) {
        GuardarFacciones();
        return 1;
    }

    if(cargadas == 0) {
        new cargadasBak = CargarFaccionesDesdeArchivo(PATH_FACCIONES_BAK);
        if(cargadasBak > 0) GuardarFacciones();
    }
    return 1;
}

stock GuardarNombreJugadorEnFaccion(playerid, fid, miembroSlot = -1) {
    if(fid < 0 || fid >= MAX_FACCIONES || !IsPlayerConnected(playerid)) return 0;
    new nombre[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nombre, sizeof(nombre));

    if(FaccionData[fid][facOwner] == playerid) format(FaccionOwnerNombre[fid], MAX_PLAYER_NAME, "%s", nombre);

    if(miembroSlot >= 0 && miembroSlot < MAX_MIEMBROS_FACCION) {
        format(FaccionMiembroNombre[fid][miembroSlot], MAX_PLAYER_NAME, "%s", nombre);
        return 1;
    }

    for(new i=0; i<MAX_MIEMBROS_FACCION; i++) {
        if(FaccionData[fid][facMiembros][i] != playerid) continue;
        format(FaccionMiembroNombre[fid][i], MAX_PLAYER_NAME, "%s", nombre);
        break;
    }
    return 1;
}

stock InicializarSistemaFacciones() {
    CargarFacciones();
    if(FaccionCPPickup != 0) DestroyPickup(FaccionCPPickup);
    FaccionCPPickup = CreatePickup(1274, 23, PuntoPos[puntoFacciones][0], PuntoPos[puntoFacciones][1], PuntoPos[puntoFacciones][2], 0);
    if(FaccionCPLabel != Text3D:-1) Delete3DTextLabel(FaccionCPLabel);
    FaccionCPLabel = Create3DTextLabel("CP Facciones Kame House\nPresiona H", 0x9B59B6FF, PuntoPos[puntoFacciones][0], PuntoPos[puntoFacciones][1], PuntoPos[puntoFacciones][2] + 0.8, 20.0, 0);
    return 1;
}
