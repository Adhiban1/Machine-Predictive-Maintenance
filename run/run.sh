cd ..
source .venv/bin/activate
gunicorn app:app --bind localhost:5000