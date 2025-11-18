#!/usr/bin/env python3
"""
Schönes Organigramm der indischen Militärstruktur mit Graphviz
Erzeugt SVG und PNG.
"""

from graphviz import Digraph
import pathlib

BASE = pathlib.Path(__file__).parent

# === Datenstruktur ===
nodes = {
    301: {'name':'Integrated Defence Headquarters','parent':None},
    302: {'name':'Chief of Defence Staff (CDS)','parent':301},
    303: {'name':'Department of Military Affairs','parent':302},
    304: {'name':'Defence Intelligence Agency','parent':302},
    305: {'name':'Indian Army','parent':301},
    306: {'name':'Northern Command – Udhampur','parent':305},
    307: {'name':'Eastern Command – Kolkata','parent':305},
    308: {'name':'Southern Command – Pune','parent':305},
    309: {'name':'Western Command – Chandigarh','parent':305},
    310: {'name':'Indian Navy','parent':301},
    311: {'name':'Western Naval Command – Mumbai','parent':310},
    312: {'name':'Eastern Naval Command – Visakhapatnam','parent':310},
    313: {'name':'Southern Naval Command – Kochi','parent':310},
    314: {'name':'Indian Air Force','parent':301},
    315: {'name':'Western Air Command – Delhi','parent':314},
    316: {'name':'Eastern Air Command – Shillong','parent':314},
    317: {'name':'Southern Air Command – Trivandrum','parent':314},
    318: {'name':'Andaman & Nicobar Command – Port Blair','parent':301},
    319: {'name':'Strategic Forces Command – Delhi','parent':301},
    320: {'name':'Cyber Command – Delhi','parent':301}
}

# === Graphviz Digraph erstellen ===
dot = Digraph(comment='Indian Military Structure')
dot.attr(rankdir='TB')  # Top-Bottom Layout
dot.attr('node', shape='box', style='filled,rounded', color='black', fontname='Arial', fontsize='12')

# Farben je Level
level_colors = {1:'#fff7e6', 2:'#dce6f1', 3:'#f2f2f2'}

# Knoten hinzufügen
for nid, n in nodes.items():
    parent = n['parent']
    if parent is None:
        level = 1
    elif nodes[parent]['parent'] is None:
        level = 2
    else:
        level = 3
    dot.node(str(nid), n['name'], fillcolor=level_colors[level])

# Kanten hinzufügen
for nid, n in nodes.items():
    if n['parent']:
        dot.edge(str(n['parent']), str(nid))

# === Dateien speichern ===
svg_path = BASE / 'org_chart_graphviz.svg'
png_path = BASE / 'org_chart_graphviz.png'

# SVG erstellen
dot.format = 'svg'
dot.render(svg_path.stem, directory=BASE, cleanup=True)

# PNG erstellen
dot.format = 'png'
dot.render(png_path.stem, directory=BASE, cleanup=True)

print("Organigramm erstellt!")
print(f"SVG: {svg_path}")
print(f"PNG: {png_path}")
