apt-get update
apt-get install --no-install-recommends -y \
      python3-sphinx \
      graphviz \
      imagemagick \
      make

##############
# BUILD DOCS #
##############

# Python Sphinx, configured with source/conf.py
# See https://www.sphinx-doc.org/
make clean
make html