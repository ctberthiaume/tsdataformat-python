#!/usr/bin/env bash -e
# Run this from within a conda environment seeded with just pip and conda
# conda create -n pydev pip conda

# Then install other python dev packages with pip
# conda activate pydev
# (pydev) pip install keyring twine detox pytest

# Test
#detox

# Don't forget to update _version.py

# Build for PyPI
[ -d build ] && rm -rf build
[ -d dist ] && rm -rf dist
[ -d src/tsdataformat.egg-info ] && rm -rf src/tsdataformat.egg-info
python setup.py sdist bdist_wheel

# Assume version is 0.3.0 for examples below
# Then tag commit, push, tag as 0.3.0 in github, matching source version
# Finally to upload to pypi

# Update pip, setuptools, wheel, twine, keyring
# install -U pip setuptools wheel twine keyring

# Assume this is your ~/.pypirc
#[distutils]
#index-servers=
#    pypi
#    testpypi
#
#[pypi]
#username = < pypi.org username >
#
#[testpypi]
#repository: https://test.pypi.org/legacy/
#username = < test.pypi.org username >

# Store pypi password
# keyring set https://test.pypi.org/legacy/ < test.pypi.org username >
# keyring set https://upload.pypi.org/legacy/ < pypi.org username >

# Test against test PyPI repo
# twine upload -r testpypi dist/tsdataformat-0.3.0*

# Create a virtualenv and test install from test.pypi.org
# virtualenv pypi-test
# pypi-test/bin/pip install -r requirements.txt
# pypi-test/bin/pip install -i https://testpypi.python.org/pypi tsdataformat
# pypi-test/bin/tsdataformat2csv --version

# Then upload to the real PyPI
# twine upload dist/tsdataformat-0.3.0*
