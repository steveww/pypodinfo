import logging
import os
import socket

from flask import Flask
from flask import Response
from flask import request
from flask import render_template
from flask import jsonify

import prometheus_client
from prometheus_client import Counter, Histogram

app = Flask(__name__)
app.logger.setLevel(logging.INFO)

# Set up Prometheus
PromMetrics = {}
PromMetrics['HIT_COUNTER'] = Counter('hit_count', 'Running count of request')

# Global variables
g_ping = 0

# Error handler
@app.errorhandler(Exception)
def exception_handler(err):
    app.logger.exception(str(err))
    return str(err), 500

@app.route('/health', methods=['GET'])
def health():
    return 'OK'

@app.route('/metrics', methods=['GET'])
def metrics():
    res = []
    for m in PromMetrics.values():
        res.append(prometheus_client.generate_latest(m))
    
    return Response(res, mimetype='text/plain')

@app.route('/ping', methods=['GET', 'PUT'])
def ping():
    global g_ping
    
    if request.method == 'PUT':
        g_ping += 1

    return jsonify({'ping': g_ping})


@app.route('/', methods=['GET'])
def index():
    version = os.environ.get('VERSION', 'unknown')
    host = socket.gethostname()

    return render_template('index.html', version=version, host=host)
