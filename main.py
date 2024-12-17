from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, i'm Hadir Nasri and this is my static API!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
