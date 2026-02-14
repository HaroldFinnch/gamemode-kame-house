# Migración de Kame House a MySQL (todo persistente en DB)

## 0) Importante para tu panel (sin Python)
No necesitas **Python** para esto. Todo se hace con:
- **Qawno/Pawno** para compilar `gamemode.pwn` y generar `gamemode.amx`.
- **phpMyAdmin** (o el gestor MySQL de tu hosting) para crear tablas.

Si en tu panel no existe nada de Python, no pasa nada: **no se usa** en esta guía.

Esta guía deja **cuentas + configuraciones del mapa** en MySQL: casas, puntos movibles, minas, hornos, cajas, prepiezas, prendas, editmap, venta de autos y rutas.

## 1) Configurar conexión en la gamemode
Edita `gamemode.pwn` y configura:

```pawn
#define MYSQL_HOST          "15.204.150.91"
#define MYSQL_USER          "TU_USUARIO"
#define MYSQL_PASS          "TU_PASSWORD"
#define MYSQL_DB            "s70935_kamehouse"
#define MYSQL_PORT          3306
```

## 2) Crear base y tablas (phpMyAdmin)
En phpMyAdmin, selecciona tu DB y ejecuta este SQL completo:

```sql
CREATE TABLE IF NOT EXISTS cuentas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(24) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    dinero INT NOT NULL DEFAULT 500,
    admin INT NOT NULL DEFAULT 0,
    camionero_nivel INT NOT NULL DEFAULT 0,
    camionero_viajes INT NOT NULL DEFAULT 0,
    pizzero_nivel INT NOT NULL DEFAULT 0,
    pizzero_entregas INT NOT NULL DEFAULT 0,
    basurero_nivel INT NOT NULL DEFAULT 0,
    basurero_recorridos INT NOT NULL DEFAULT 0,
    banco INT NOT NULL DEFAULT 0,
    hambre INT NOT NULL DEFAULT 100,
    tiempo_jugado INT NOT NULL DEFAULT 0,
    skin INT NOT NULL DEFAULT 229,
    spawn_x FLOAT NOT NULL DEFAULT 2494.24,
    spawn_y FLOAT NOT NULL DEFAULT -1671.19,
    spawn_z FLOAT NOT NULL DEFAULT 13.33,
    semilla_hierba INT NOT NULL DEFAULT 0,
    semilla_flor INT NOT NULL DEFAULT 0,
    inv_hierba INT NOT NULL DEFAULT 0,
    inv_flor INT NOT NULL DEFAULT 0,
    inv_madera INT NOT NULL DEFAULT 0,
    inv_piedra INT NOT NULL DEFAULT 0,
    inv_cobre INT NOT NULL DEFAULT 0,
    inv_hierro INT NOT NULL DEFAULT 0,
    inv_polvora INT NOT NULL DEFAULT 0,
    inv_prepieza INT NOT NULL DEFAULT 0,
    inv_carbon INT NOT NULL DEFAULT 0,
    tiene_mazo TINYINT(1) NOT NULL DEFAULT 0,
    mazo_durabilidad INT NOT NULL DEFAULT 0,
    armero_nivel INT NOT NULL DEFAULT 1,
    armero_exp INT NOT NULL DEFAULT 0,
    bidon_gasolina INT NOT NULL DEFAULT 0,
    tiene_telefono TINYINT(1) NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS rutas_trabajo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('camionero','pizzero','basurero') NOT NULL,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    INDEX idx_tipo (tipo)
);

CREATE TABLE IF NOT EXISTS casas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    interior_slot INT NOT NULL DEFAULT 1,
    precio INT NOT NULL DEFAULT 0,
    owner VARCHAR(24) NOT NULL DEFAULT 'None',
    friends VARCHAR(128) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS puntos_movibles (
    slot_id INT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS minas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS hornos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS cajas_loot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS prepiezas_puntos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS prendas_config (
    slot_id INT PRIMARY KEY,
    activa TINYINT(1) NOT NULL DEFAULT 0,
    modelo INT NOT NULL DEFAULT 0,
    precio INT NOT NULL DEFAULT 0,
    stock INT NOT NULL DEFAULT 0,
    bone INT NOT NULL DEFAULT 2,
    off_x FLOAT NOT NULL DEFAULT 0,
    off_y FLOAT NOT NULL DEFAULT 0,
    off_z FLOAT NOT NULL DEFAULT 0,
    rot_x FLOAT NOT NULL DEFAULT 0,
    rot_y FLOAT NOT NULL DEFAULT 0,
    rot_z FLOAT NOT NULL DEFAULT 0,
    scale_x FLOAT NOT NULL DEFAULT 1,
    scale_y FLOAT NOT NULL DEFAULT 1,
    scale_z FLOAT NOT NULL DEFAULT 1,
    nombre VARCHAR(32) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS editmap (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo INT NOT NULL,
    x FLOAT NOT NULL,
    y FLOAT NOT NULL,
    z FLOAT NOT NULL,
    rx FLOAT NOT NULL,
    ry FLOAT NOT NULL,
    rz FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS venta_autos_config (
    slot_id INT PRIMARY KEY,
    activa TINYINT(1) NOT NULL DEFAULT 0,
    modelo INT NOT NULL DEFAULT 0,
    precio INT NOT NULL DEFAULT 0,
    stock INT NOT NULL DEFAULT 0
);
```

## 3) (Opcional) limpiar todo y reiniciar datos
Si quieres iniciar totalmente limpio:

```sql
TRUNCATE TABLE cuentas;
TRUNCATE TABLE rutas_trabajo;
TRUNCATE TABLE casas;
TRUNCATE TABLE puntos_movibles;
TRUNCATE TABLE minas;
TRUNCATE TABLE hornos;
TRUNCATE TABLE cajas_loot;
TRUNCATE TABLE prepiezas_puntos;
TRUNCATE TABLE prendas_config;
TRUNCATE TABLE editmap;
TRUNCATE TABLE venta_autos_config;
```

## 4) Compilar en Qawno/Pawno (generar AMX sin errores)
1. Asegúrate de tener estos archivos en `gamemodes/`:
   - `gamemode.pwn`
   - `a_mysql.inc`
2. Abre `gamemode.pwn` en Qawno/Pawno y guarda (`Ctrl+S`) para compilar.
3. Debe generarse `gamemode.amx` en la misma carpeta de `gamemode.pwn`.

Si no genera `.amx`, revisa:
- Que no falte `a_mysql.inc`.
- Que no estés compilando otro archivo distinto.
- Que tengas permisos de escritura en la carpeta `gamemodes/`.

## 5) Subir y arrancar servidor
1. Sube **ambos** archivos: `gamemode.pwn` y `gamemode.amx`.
2. En `server.cfg`, apunta `gamemode0` al nombre correcto de tu AMX.
3. Reinicia servidor.
4. Verifica en consola: `"[MYSQL] Conexion establecida correctamente."`
5. Entra al server y valida que crea/carga datos normalmente.

## Nota de operación
- Con esta versión, las configuraciones principales del mapa ya se guardan/cargan por MySQL.
- Si vienes de `.txt`, hay que recrear o migrar esos datos a la DB (puedo pasarte script de migración desde txt si quieres).
