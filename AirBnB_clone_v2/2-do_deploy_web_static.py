#!/usr/bin/python3
""" All web_static folder into a .tgz file """
from datetime import datetime
from fabric.api import *
import os.path
env.hosts = ['35.237.97.231', '18.234.148.75']
env.user = 'ubuntu'


def do_pack():
    """ Nethod invoqued with fabric arg. """
    date = datetime.now()
    str_date = date.strftime('%Y%m%d%H%M%S')
    str_date = 'versions/web_static_' + str_date + '.tgz'
    local("mkdir -p versions")
    local("tar -c -z -v -f {} web_static".format(str_date))
    return str_date


def do_deploy(archive_path):
    """ Deploy aplication to the server """
    if os.path.exists(archive_path):
        print("path-> {}".format(archive_path))
        put(archive_path, '/tmp/')
        file_name = archive_path.split('/')[1]
        folder_name = file_name.split('.')[0]
        print("File_name: {}\nFolder_name: {}".format(file_name, folder_name))
        run("mkdir -p /data/web_static/releases/{}/".format(folder_name))
        path = "/data/web_static/releases/{}/".format(folder_name)
        run("tar -xzf /tmp/{} -C {}".format(file_name, path))
        run("rm /tmp/{}".format(file_name))
        run("mv {}/web_static/* {}".format(path, path))
        run("rm -rf {}/web_static".format(path))
        run("rm -rf /data/web_static/current")
        run("ln -s {} /data/web_static/current".format(path))
        return True
    else:
        return False
