@echo off

echo "Git Cloning..."
git clone --depth 1 https://github.com/Adhiban1/Machine-Predictive-Maintenance.git

echo.
echo "cd feynn-labs/project1..."
cd Machine-Predictive-Maintenance

echo.
echo "Creating python virtual environment..."
python -m venv .venv

echo.
echo "Activating virtual environment..."
call .venv\Scripts\activate

echo.
echo "Upgrading pip..."
python.exe -m pip install --upgrade pip

echo.
echo "Installing requirements..."
pip install -r requirements.txt

echo.
echo "Training the model..."
python myapp/modules/train.py

echo.
echo "Testing the model..."
python myapp/modules/test.py

echo.
echo "Opening Django App..."
python manage.py runserver 5000

echo.
echo "Deactivating virtual environment..."
deactivate
