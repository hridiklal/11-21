from flask import Flask, jsonify
import platform
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({
        'message': 'Hello from Docker Matrix Build!',
        'architecture': platform.machine(),
        'python_version': platform.python_version(),
        'registry': 'Docker Hub (AMD64)' if platform.machine() == 'x86_64' else 'GHCR (ARM64)'
    })

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
