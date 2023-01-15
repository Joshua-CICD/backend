from flask import Flask, send_from_directory
import os

app = Flask(__name__, static_folder='../frontend/build')

# Create a health check endpoint
@app.route('/health')
def health():
    return 'OK'

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path != "" and os.path.exists("../frontend/build/" + path):
        return send_from_directory('../frontend/build', path)
    else:
        return send_from_directory('../frontend/build', 'index.html')

if __name__ == '__main__':
    app.run(debug=True, use_reloader=True)
