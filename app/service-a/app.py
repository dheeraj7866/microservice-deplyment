from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Welcome to Service A - Flask App new content added"})

@app.route("/status")
def status():
    return jsonify({"status": "Service A is running!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
