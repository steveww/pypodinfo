import logging

from flask import Flask
from flask import Response

import prometheus_client
from prometheus_client import Counter, Histogram

app = Flask(__name__)
app.logger.setLevel(logging.INFO)

# Set up Prometheus
PromMetrics = {}
PromMetrics['HIT_COUNTER'] = Counter('hit_count', 'Running count of request')

# Error handler
@app.errorhandler(Exception)
def exception_handler(err):
    app.logger.error(str(err))
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

@app.route('/', methods=['GET'])
def index():
    return 'Hello World'
