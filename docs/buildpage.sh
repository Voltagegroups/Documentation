apt-get update
apt-get -y install make

##############
# BUILD DOCS #
##############

# Python Sphinx, configured with source/conf.py
# See https://www.sphinx-doc.org/
make clean
make html