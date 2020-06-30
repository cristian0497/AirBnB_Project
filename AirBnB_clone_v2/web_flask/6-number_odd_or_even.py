#!/usr/bin/python3
""" Flask Server App """
from flask import Flask, render_template
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
    """ Define if n is an INT"""
    return "{} is a number".format(n)


@app.route('/number_template/<int:n>', strict_slashes=False)
def number_template(n):
    """ Redirect a file html with n value """
    return render_template('5-number.html', n=n)


@app.route('/number_odd_or_even/<int:n>', strict_slashes=False)
def odd_or_even(n):
    """ n is odd or even, and print in html file """
    string = "Number: {} is {}".format(n, 'even' if n % 2 == 0 else 'odd')
    return render_template('6-number_odd_or_even.html', msj=string)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
