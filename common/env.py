#!/usr/bin/env python
import os
import sys

class System():
    def type():
        return os.name
    def linesep():
        return os.linesep()
    def env():
        return os.getenv()
