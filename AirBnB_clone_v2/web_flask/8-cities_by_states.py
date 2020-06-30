#!/usr/bin/python3
""" Query to db with jinja and Flask """
from flask import Flask, render_template
from models import storage
app = Flask(__name__)


@app.route('/cities_by_states', strict_slashes=False)
def cities_and_states():
    """ list all states in a sql DB """
    My_States = storage.all('State').items()
    My_Cities = storage.all('City').items()
    States = {}
    City = {}
    for key, val in My_States:
        States[val.to_dict()['id']] = val.to_dict()['name']
    for k, v in My_Cities:
        tmp = {}
        tmp['state_id'] = v.state_id
        tmp['id'] = v.id
        City[v.to_dict()['name']] = tmp
    return render_template('8-cities_by_states.html', state=States, city=City)


@app.teardown_appcontext
def close_session(close):
    """ Close the session """
    storage.close()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
