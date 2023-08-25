FROM python:slim-bullseye
WORKDIR /app

COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY models models
COPY templates templates
COPY uploaded uploaded
COPY static static
COPY Machine_Predictive_Maintenance Machine_Predictive_Maintenance
COPY myapp myapp
COPY db.sqlite3 .
COPY manage.py .

CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
EXPOSE 5000