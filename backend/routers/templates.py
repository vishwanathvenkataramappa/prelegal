from fastapi import APIRouter, HTTPException

from models.template import Template
from services.database import read_db

router = APIRouter(prefix="/api/templates", tags=["templates"])


@router.get("/", response_model=list[Template])
def list_templates():
    db = read_db()
    return db["templates"]


@router.get("/{template_id}", response_model=Template)
def get_template(template_id: str):
    db = read_db()
    for template in db["templates"]:
        if template["id"] == template_id:
            return template
    raise HTTPException(status_code=404, detail="Template not found")
