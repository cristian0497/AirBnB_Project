#!/usr/bin/python3
""" Flask with Python, and Jinja """
from flask import Flask, render_template
from models import storage
app = Flask(__name__)


@app.route('/states_list', strict_slashes=False)
def list_of_states():
    """ List all states in a Sql DB """
    dic = []
    my_list = storage.all('State').items()
    for key, val in my_list:
        dic.append(val)
    return render_template('7-states_list.html', list_=dic)


@app.teardown_appcontext
def close_session(close):
    """ Close the session """
    storage.close()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
