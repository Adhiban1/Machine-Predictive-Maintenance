echo "Git Cloning..."
git clone --depth 1 https://github.com/Adhiban1/feynn-labs.git

echo ""
echo "cd feynn-labs/project1..."
cd feynn-labs/project1

echo ""
echo "Making run.sh as executable"
chmod +x ./run/run.sh

echo ""
echo "Creating python virtual environment..."
python3 -m venv .venv

echo ""
echo "Activating virtual environment..."
source .venv/bin/activate

echo ""
echo "Upgrading pip..."
pip install --upgrade pip

echo ""
echo "Installing requirements..."
pip install -r requirements.txt

echo ""
echo "Traing the model..."
python3 modules/train.py

echo ""
echo "Testing the model..."
python3 modules/test.py

echo ""
echo "Opening Flask App..."
python3 app.py

echo ""
echo "Deactivating virtual environment..."
deactivate