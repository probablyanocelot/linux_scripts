#!/bin/sh

ls -a1 *.py | xargs -I {} wc -l {}