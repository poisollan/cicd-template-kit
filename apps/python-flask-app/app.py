from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "CI/CD Template Kit - Python Flask app is running"

@app.route("/health")
def health():
    return jsonify({
        "status": "ok",
        "app": "python-flask-app"
    }), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
