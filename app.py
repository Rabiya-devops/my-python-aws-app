# app.py
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    # Example: Print a custom message and the container hostname
    return f"<h1>Hello from a Docker Container!</h1><p>Container ID: {os.uname()[1]}</p>"

if __name__ == '__main__':
    # Use 0.0.0.0 to listen on all public IPs
    # The default port for Flask is 5000, which we will use.
    app.run(host='0.0.0.0', port=5000)