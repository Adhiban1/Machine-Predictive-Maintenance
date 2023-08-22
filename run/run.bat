cd ..
call .venv\Scripts\activate
gunicorn app:app --bind localhost:5000