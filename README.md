## ✅ `README.md`

```markdown
# Python Quiz Game (No JavaScript)

This project is a Python-powered web-based quiz game that runs without JavaScript. It uses **FastAPI** for the backend, **Jinja2** for templating HTML, and **JSON** to store quiz data. The frontend is built purely with **HTML** and **CSS**, and all game logic runs on the server via Python.

---

## 🚀 Features

- ✅ Pure Python backend with FastAPI
- ✅ Clean, dynamic HTML rendered via Jinja2
- ✅ CSS-only UI design (no JavaScript)
- ✅ JSON-based question storage
- ✅ Easy to extend with more questions or categories
- ✅ Lightweight and beginner-friendly

---

## 📁 Project Structure

```

.quiz_game/
├── main.py               # FastAPI server entry point
├── questions.json        # Quiz question storage (JSON format)
├── templates/
│   ├── index.html        # Home page
│   ├── question.html     # Quiz page template
│   └── result.html       # Final result page
├── static/
│   └── style.css         # Game styling
├── requirements.txt      # Python dependencies
├── Makefile              # Build & run automation
└── README.md             # Project documentation

````

---

## 🧰 Requirements

- Python 3.8+
- Make (for UNIX-like systems) or manually execute the `Makefile` steps on Windows

---

## 🔧 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Elliot-Nzei/trivia-combat-game
cd quizgame
````

### 2. Run the App

Using Make (recommended for Linux/macOS):

```bash
make
```

Or run manually:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
uvicorn main:app --reload
```

Visit [http://localhost:8000](http://localhost:8000) in your browser to play the game.

---

## 📦 Add Your Own Questions

Edit `quiz_data.json` to include your own custom questions:

```json
[
  {
    "question": "What is the capital of France?",
    "options": ["Paris", "Berlin", "Rome", "Madrid"],
    "answer": "Paris"
  },
  ...
]
```

---

## 🧼 Clean Up

To remove the virtual environment and clean the project:

```bash
make clean
```

---

## 🙌 Contributing

Feel free to fork the repository and submit pull requests. Ideas for improvements include:

* Score tracking
* User sessions
* Category selection
* Admin panel for question input

---

## 📜 License

This project is open-source and freely available for educational and commercial use.

---

## 🧠 Author

Developed by Elliot — Researcher, Programmer, and Full-Stack Developer.
