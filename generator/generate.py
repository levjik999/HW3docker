import csv
import random
import os
import sys

NUM_ROWS = 60

COLUMNS = ["name", "price", "weight_kg", "category"]

def generate_row():
    return {
        "name": random.choice(["Диван", "Кресло", "Шкаф", "Стол", "Стул", "Кровать", "Тумба", "Комод"]),
        "price": random.randint(3000, 80000),
        "weight_kg": round(random.uniform(2.5, 120.0), 2),
        "category": random.choice(["Гостиная", "Спальня", "Кухня"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)