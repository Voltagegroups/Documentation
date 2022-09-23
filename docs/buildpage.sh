apt-get update
apt-get install --no-install-recommends -y \
      python3-sphinx \
      graphviz \
      imagemagick \
      make
apt-get autoremove
apt-get clean
rm -rf /var/lib/apt/lists/*
chmod 777 /var/lib/apt/lists/*

pwd ls -lah
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)

##############
# BUILD DOCS #
##############

# Python Sphinx, configured with source/conf.py
# See https://www.sphinx-doc.org/
make clean
make html