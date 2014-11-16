#!/usr/bin/python
# -*- coding: utf-8 -*-

from bepasty.app import create_app

application = create_app()

if __name__ == '__main__':
    application.run(debug=True)
