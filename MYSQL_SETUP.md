# Migración de Kame House a MySQL

## 1) Crear base y tabla
1. Ejecuta:
   ```bash
   mysql -u root -p < mysql_schema.sql
   ```

## 2) Instalar dependencia para el migrador (Python)
```bash
python3 -m pip install mysql-connector-python
```

## 3) Migrar usuarios actuales (`usuarios/*.ini`)
```bash
python3 tools/migrate_users_to_mysql.py \
  --user root \
  --password TU_PASSWORD \
  --host 127.0.0.1 \
  --port 3306 \
  --database kame_house \
  --users-dir usuarios
```

## 4) Verificar datos migrados
```sql
SELECT id, username, money, bank_money, admin_level FROM players LIMIT 20;
```

## 5) Recomendación de integración en gamemode
- Mantén un backup de `usuarios/`.
- Migra primero en staging.
- Integra en Pawn por etapas:
  1. Login/registro en MySQL.
  2. Guardado de cuenta en MySQL.
  3. Desactivar escritura en archivos `.ini`.

> En este cambio ya se incluye el esquema y migrador para pasar datos actuales a MySQL.
