#!/usr/bin/python3
""" Flask Server App """
from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello():
    """ Return String for the path /"""
    return 'Hello HBNB!'


@app.route('/hbnb')
def hello_2():
    """ Return String for the path /hbnb"""
    return 'HBNB'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
    app.url_map.strict_slashes = False
