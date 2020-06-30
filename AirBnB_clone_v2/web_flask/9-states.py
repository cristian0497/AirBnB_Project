#!/usr/bin/python3
""" Query to db with states and state id """
from flask import Flask, render_template
from models import storage
app = Flask(__name__)


@app.route('/states', strict_slashes=False)
def states():
    """list the states """
    val = 'State'
    dic = {}
    States = storage.all('State').items()
    for key, va in States:
        dic[va.to_dict()['name']] = va.to_dict()['id']
    return render_template('9-states.html', query=dic, name=val)


@app.route('/states/<id>', strict_slashes=False)
def state_id(id):
    """ list the state id """
    dic = {}
    City = storage.all('City').items()
    State = storage.all('State').items()
    name = "No"
    for k, v in State:
        if (id == v.to_dict()['id']):
            name = v.to_dict()['name']
    for key, val in City:
        if (val.to_dict()['state_id'] == id):
            dic[val.to_dict()['name']] = val.to_dict()['id']

    return render_template('9-states.html', query=dic, name=name)


@app.teardown_appcontext
def close_session(close):
    """ Close  the session """
    storage.close()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
