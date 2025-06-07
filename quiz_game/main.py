from fastapi import FastAPI, Request, Form
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import json

app = FastAPI()

# Mount static files (CSS)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Template engine
templates = Jinja2Templates(directory="templates")

# Load quiz questions from JSON
with open("questions.json", "r") as file:
    questions = json.load(file)


# Homepage – Intro Page
@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


# Display First Question
@app.post("/start", response_class=HTMLResponse)
async def start_quiz(request: Request):
    return templates.TemplateResponse("question.html", {
        "request": request,
        "question": questions[0],
        "q_index": 0,
        "score": 0
    })


# Handle Quiz Submission
@app.post("/question", response_class=HTMLResponse)
async def next_question(
    request: Request,
    q_index: int = Form(...),
    score: int = Form(...),
    answer: str = Form(...)
):
    correct_answer = questions[q_index]["answer"]
    if answer == correct_answer:
        score += 1

    q_index += 1
    if q_index < len(questions):
        return templates.TemplateResponse("question.html", {
            "request": request,
            "question": questions[q_index],
            "q_index": q_index,
            "score": score
        })
    else:
        return templates.TemplateResponse("result.html", {
            "request": request,
            "score": score,
            "total": len(questions)
        })
