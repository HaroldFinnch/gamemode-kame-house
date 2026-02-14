#!/usr/bin/env python3
import argparse
from pathlib import Path
import mysql.connector

DEFAULTS = {
    'money': 500, 'admin_level': 0, 'camionero_nivel': 0, 'camionero_viajes': 0,
    'pizzero_nivel': 0, 'pizzero_entregas': 0, 'bank_money': 0,
    'semilla_hierba': 0, 'semilla_flor': 0, 'hierba': 0, 'flor': 0,
    'tiempo_jugado_min': 0, 'skin': 229, 'pos_x': 2494.24, 'pos_y': -1671.19, 'pos_z': 13.33,
    'version': 4, 'madera': 0, 'piedra': 0, 'cobre': 0, 'hierro_mineral': 0, 'polvora': 0,
    'prepieza': 0, 'carbon': 0, 'tiene_mazo': 0, 'mazo_durabilidad': 0,
    'armero_nivel': 1, 'armero_exp': 0, 'basurero_nivel': 0, 'basurero_recorridos': 0,
    'bidon_gasolina': 0, 'tiene_telefono': 0,
}
ORDER = [
    'password', 'money', 'admin_level', 'camionero_nivel', 'camionero_viajes',
    'pizzero_nivel', 'pizzero_entregas', 'bank_money', 'semilla_hierba', 'semilla_flor',
    'hierba', 'flor', 'tiempo_jugado_min', 'skin', 'pos_x', 'pos_y', 'pos_z', 'version',
    'madera', 'piedra', 'cobre', 'hierro_mineral', 'polvora', 'prepieza', 'carbon',
    'tiene_mazo', 'mazo_durabilidad', 'armero_nivel', 'armero_exp', 'basurero_nivel',
    'basurero_recorridos', 'bidon_gasolina', 'tiene_telefono'
]


def parse_user(path: Path):
    lines = [ln.strip() for ln in path.read_text(encoding='utf-8', errors='ignore').splitlines() if ln.strip()]
    if len(lines) < 4:
        return None
    vals = DEFAULTS.copy()
    vals['password'] = lines[0][:16]
    mapping = ORDER[1:]
    for idx, key in enumerate(mapping, start=1):
        if idx >= len(lines):
            break
        raw = lines[idx]
        try:
            vals[key] = float(raw) if key.startswith('pos_') else int(float(raw))
        except ValueError:
            pass
    return vals


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--users-dir', default='usuarios')
    ap.add_argument('--host', default='127.0.0.1')
    ap.add_argument('--port', type=int, default=3306)
    ap.add_argument('--user', required=True)
    ap.add_argument('--password', required=True)
    ap.add_argument('--database', default='kame_house')
    args = ap.parse_args()

    conn = mysql.connector.connect(
        host=args.host, port=args.port, user=args.user,
        password=args.password, database=args.database
    )
    cur = conn.cursor()

    files = sorted(Path(args.users_dir).glob('*.ini'))
    inserted = 0
    for f in files:
        data = parse_user(f)
        if not data:
            continue
        username = f.stem[:24]
        cols = ['username'] + ORDER
        placeholders = ','.join(['%s'] * len(cols))
        updates = ','.join([f"{c}=VALUES({c})" for c in ORDER])
        q = f"INSERT INTO players ({','.join(cols)}) VALUES ({placeholders}) ON DUPLICATE KEY UPDATE {updates}"
        values = [username] + [data[k] for k in ORDER]
        cur.execute(q, values)
        inserted += 1

    conn.commit()
    cur.close()
    conn.close()
    print(f"Migración completada. Usuarios procesados: {inserted}")


if __name__ == '__main__':
    main()
