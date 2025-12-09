# organigramm_indian_army.py – Indian Army Organigramm Generator
import mysql.connector
from mysql.connector import Error
from graphviz import Digraph
import pathlib

config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Philso09',
    'database': 'indian_military_database'   # <- hier den echten Namen deiner DB einsetzen!
}

# ==================== DATENBANK ====================
def connect_db():
    try:
        conn = mysql.connector.connect(**config, charset='utf8mb4')
        if conn.is_connected():
            print("✅ Erfolgreich mit MySQL verbunden!")
            return conn
    except Error as e:
        print(f"❌ Fehler bei der Verbindung: {e}")
    return None

def fetch_hierarchy(conn):
    cursor = conn.cursor(dictionary=True)
    query = """
    WITH RECURSIVE hierarchy AS (
        SELECT id, name, typ, ebene, uebergeordnete_einheit_id
        FROM einheiten WHERE uebergeordnete_einheit_id IS NULL
        UNION ALL
        SELECT e.id, e.name, e.typ, e.ebene, e.uebergeordnete_einheit_id
        FROM einheiten e
        INNER JOIN hierarchy h ON e.uebergeordnete_einheit_id = h.id
    )
    SELECT id, name, typ, ebene, uebergeordnete_einheit_id
    FROM hierarchy
    ORDER BY ebene, name;
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    return rows

# ==================== GRAPHVIZ ORGCHART ====================
def generate_chart(rows):
    dot = Digraph(comment="Indian Army", format="png")
    dot.attr(rankdir='TB', fontsize='12', fontname='Arial')

    # Farben für Ebenen (angelehnt an indische Flagge)
    level_colors = {
        1: "#FF9933",  # Saffron
        2: "#FFFFFF",  # Weiß
        3: "#138808",  # Grün
        4: "#000080"   # Navy Blue
    }

    # Knoten + Kanten
    for row in rows:
        node_id = str(row['id'])
        label = f"{row['name']}\n({row['typ']})"
        dot.node(node_id, label,
                 shape="box", style="rounded,filled",
                 fillcolor=level_colors.get(row['ebene'], "#87CEEB"))
        if row['uebergeordnete_einheit_id']:
            dot.edge(str(row['uebergeordnete_einheit_id']), node_id)

    # Dateien speichern
    output_dir = pathlib.Path(__file__).parent
    dot.render(output_dir / "indian_military_chart", format="png", cleanup=True)
    dot.render(output_dir / "indian_military_chart", format="svg", cleanup=True)

    print("✅ Organigramm erstellt: indian_military_chart.png und indian_military_chart.svg")

# ==================== MAIN ====================
def main():
    conn = connect_db()
    if not conn:
        return

    rows = fetch_hierarchy(conn)
    conn.close()

    if not rows:
        print("⚠️ Keine Daten gefunden.")
        return

    print(f"{len(rows)} Einheiten geladen – generiere PNG + SVG...")
    generate_chart(rows)

if __name__ == "__main__":
    main()
