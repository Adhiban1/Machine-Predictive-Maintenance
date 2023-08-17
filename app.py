from flask import Flask, send_file, request, render_template
import pandas as pd
from modules.model import is_failure, failure_type

app = Flask(__name__)

@app.route('/', methods=['POST', 'GET'])
def home():
    if request.method == 'POST':
        f = request.files['file']
        f.save('uploaded/input.csv')

        df = pd.read_csv('uploaded/input.csv')

        df['is_failure'] = is_failure(df)
        df['failure_type'] = failure_type(df)

        df = df[df['is_failure'] == 1]

        df.to_csv('uploaded/output.csv', index=False)

        return send_file('uploaded/output.csv', as_attachment=True)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)