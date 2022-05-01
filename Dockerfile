FROM jrei/systemd-ubuntu


# INSTALL PYTHON
RUN apt-get update -q -y
RUN apt-get install -q -y python3.8 python3-distutils curl libpq-dev build-essential python3.8-dev
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.8 /usr/bin/python3
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py
RUN pip3.8 install --upgrade pip
RUN pip3.8 install -q -r requirements.txt

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
ENV PYTHONPATH "${PYTHONPATH}:."
