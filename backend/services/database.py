import json
from pathlib import Path

DB_PATH = Path(__file__).parent.parent / "data" / "db.json"


def read_db() -> dict:
    with open(DB_PATH) as f:
        return json.load(f)


def write_db(data: dict) -> None:
    with open(DB_PATH, "w") as f:
        json.dump(data, f, indent=2)
