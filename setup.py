#!/usr/bin/env python

from SimpleHTTPAuthServer import __version__, __prog__
from distutils.core import setup

setup(name=__prog__,
      version=__version__,
      description='Simple Auth Server SSL',
      author='Michael Li',
      author_email='@tianhuil',
      url='https://github.com/tianhuil/SimpleHTTPAuthServer/',
      packages=[__prog__],
     )
