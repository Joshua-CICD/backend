from flask import Flask, send_from_directory
import os

app = Flask(__name__)

# Create a health check endpoint
@app.route('/api/health')
def health():
    return 'OK'

if __name__ == '__main__':
    app.run(debug=True, use_reloader=True)
