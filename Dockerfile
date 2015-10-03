# this image has basic dockerized ubuntu + luigi and open port for luigi (8082)
FROM akursar/luigid:latest

MAINTAINER Kevin Hill <kevin@pebble.com>

# update and get scipy stack
RUN apt-get update && apt-get install -y \
    python-numpy python-scipy ipython python-pandas python-nose

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# clean up cruft
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*