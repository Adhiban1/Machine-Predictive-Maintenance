@echo off

echo "Git Cloning..."
git clone --depth 1 https://github.com/Adhiban1/feynn-labs.git

echo.
echo "cd feynn-labs/project1..."
cd feynn-labs\project1

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
python modules/train.py

echo.
echo "Testing the model..."
python modules/test.py

echo.
echo "Opening Flask App..."
python app.py

echo.
echo "Deactivating virtual environment..."
deactivate
