#/usr/bin/env python
import sys
import os
import shutil

# This file is for common operation to file system.


class FileSystem():
    # make a path be absolute path.
    def abs(path):
        return os.path.abspath(path)
    # get file name from a path string.
    def name(path):
        return os.path.basename(path)
    # get file extension from a path string, it may mistake directory name, caller will notice.
    def ext(path):
        return os.path.splitext()
    # get a directory a file hosts in.
    def path(file_name):
        return os.path.dirname(file_name)
    # create a path, create if upper is not exists.
    def mkdir(path):
        try:
            os.makedirs(path)
        except:
            print('create file %s failed' %path)
    # tell caller if a path is a file or not.
    def is_file(path):
        return os.path.isfile(path) && not os.path.isdir(path)
    def exists(path):
        return os.path.exists(path)
    def is_abs(path):
        return os.path.isabs(path)
    # get the upper one directory for a path.
    def pardir(path):
        try:
            return os.path.abspath(os.path.join(os.path.dirname(path),os.path.pardir))
        except:
            print('can not locate upper directory for %s' %path)

    def move(src, dest):
        shutil.move(src, dest)

    def copy(src, dest):
        try:
            if os.path.isfile(src):
                shutil.copy(src, dest)
            else:
                shutil.copytree(src, dest)
        except Error:
            print('copy failed')
        except IOError:
            print('copy failed')

    def rename(src, dest):
        os.rename(src, dest)

    def remove(path):
        if os.path.isfile(path):
            os.remove(path)
        else:
            shutils.rmtree(path)

    def to_dir(path):
        try:
            os.chddir(path)
        except:
            print('can not change to dir %s' %path)

    def python_run_path():
        return os.getcwd()

    def root_script_path():
        return sys.path[0]

    def path(cur_file):
        #return os.path.split(os.path.realpath(__file__))[0]
        return os.path.split(os.path.realpath(cur_file))[0]
    def stat(file):
        return os.stat(file)

    def read(file_name, codec=None):
        import codecs
        try:
            with codecs.open(file_name, codec) as f:
            content = f.read()
        except IOError:
            print('can not read file %s.' %file_name)
            return None

    def write(file_name, data, mode='', codec=None):
        import codecs
        if not data or not file_name:
            return False
        try:
            with codecs.open(file_name, 'w' + mode, codec) as f:
                f.write(data)
                f.flush()
        except IOError:
            print('can not read file %s.' %file_name)
            return False
        return True

