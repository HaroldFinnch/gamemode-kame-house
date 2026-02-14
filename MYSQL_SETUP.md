# Migración de Kame House a MySQL (sin usar scriptfiles para cuentas/rutas)

Esta guía deja **cuentas de jugador y rutas de trabajos** en MySQL desde cero, sin migrar datos viejos de `scriptfiles`.

## 1) Configurar conexión en la gamemode
Edita `gamemode.pwn` y cambia estos `#define`:

```pawn
#define MYSQL_HOST          "15.204.150.91"
#define MYSQL_USER          "TU_USUARIO"
#define MYSQL_PASS          "TU_PASSWORD"
#define MYSQL_DB            "s70935_kamehouse"
#define MYSQL_PORT          3306
```

> Importante: usa exactamente los datos del panel MySQL. Si tu host permite `localhost`, puedes probar con `127.0.0.1` o la IP remota según el proveedor.

## 2) Crear base y tablas (phpMyAdmin)
En phpMyAdmin entra a la base `s70935_kamehouse`, abre pestaña **SQL** y ejecuta este script:

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
```

## 3) Borrar datos viejos (jugadores y rutas)
Si quieres empezar limpio:

```sql
TRUNCATE TABLE cuentas;
TRUNCATE TABLE rutas_trabajo;
```

Con esto borras cuentas/rutas viejas de MySQL.

## 4) Subir e iniciar servidor
1. Compila la gamemode.
2. Reinicia servidor.
3. Verifica en consola que salga el mensaje de MySQL conectado.
4. Entra al server y registra una cuenta nueva.

## 5) Cargar rutas nuevas
Como no se migran `rutas_*.txt`, crea rutas nuevas con admin:

- `/crearparada` → agrega ruta camionero en MySQL.
- `/crearparadapizza` → agrega ruta pizzero en MySQL.
- `/crearparadabasura` → agrega ruta basurero en MySQL.

## Notas
- Este cambio deja **cuentas/rutas** en MySQL.
- El resto de configuraciones de mapa (casas, minas, hornos, etc.) siguen en archivos `.txt` como antes.
