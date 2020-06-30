#!/usr/bin/python3
""" Flask Server App """
from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello():
    """ Return String for the path /"""
    return 'Hello HBNB!'


@app.route('/hbnb', strict_slashes=False)
def hello_HBNB():
    """ Return String for the path /hbnb"""
    return 'HBNB'


@app.route('/c/<txt>', strict_slashes=False)
def hello_C(txt):
    """ Return String for the path /c<text>"""
    ret = 'C {}'.format(txt.replace('_', ' '))
    return ret


@app.route('/python/', strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def hello_Python(text='is_cool'):
    """ Return String for the path /Python<text> """
    ret = 'Python {}'.format(text.replace('_', ' '))
    return ret


@app.route('/number/<int:n>', strict_slashes=False)
def is_int(n):
    return "{} is a number".format(n)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
