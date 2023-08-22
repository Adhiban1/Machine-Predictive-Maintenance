FROM python:slim-bullseye
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY models/ ./models/
COPY templates/ ./templates/
COPY uploaded/ ./uploaded/
COPY modules/model.py ./modules/model.py
COPY static/ ./static/
COPY app.py .

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
EXPOSE 5000