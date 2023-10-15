FROM python:3.9

MAINTAINER Gerd Jaehrling  <mail@gerd-jaehrling.de>

USER root
WORKDIR /root

# copy the dependencies file to the working directory
COPY ./requirements.txt .

SHELL [ "/bin/bash", "-c" ]

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install \
        wget \
        curl \
        git \
        make \
        sudo \
	python3-dev \
	libblas-dev \ 
	liblapack-dev \
	gfortran \
	build-essential \
        bash-completion && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*

RUN pip install --upgrade --no-cache-dir pip setuptools wheel # && \
    pip install --no-cache-dir jupyter 

# install requirements:
RUN pip install -r requirements.txt

# Enable tab completion by uncommenting it from /etc/bash.bashrc
# The relevant lines are those below the phrase "enable bash completion in interactive shells"
RUN export SED_RANGE="$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+1)),$(($(sed -n '\|enable bash completion in interactive shells|=' /etc/bash.bashrc)+7))" && \
    sed -i -e "${SED_RANGE}"' s/^#//' /etc/bash.bashrc && \
    unset SED_RANGE

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV HOME /root

# Have Jupyter notebooks launch without additional command line options
RUN jupyter notebook --generate-config && \
    sed -i -e "/allow_root/ a c.NotebookApp.allow_root = True" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/custom_display_url/ a c.NotebookApp.custom_display_url = \'http://localhost:8888\'" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/c.NotebookApp.ip/ a c.NotebookApp.ip = '0.0.0.0'" ${HOME}/.jupyter/jupyter_notebook_config.py && \
    sed -i -e "/open_browser/ a c.NotebookApp.open_browser = False" ${HOME}/.jupyter/jupyter_notebook_config.py

WORKDIR /opt/notebooks
USER root
ENV PATH /root/.local/bin:$PATH

# original command to only run a shell:
#CMD [ "/bin/bash" ]

EXPOSE 8888

RUN python3 -m ipykernel.kernelspec

# Run the notebook
CMD ["/bin/bash", "-c", "jupyter notebook --notebook-dir=/opt/notebooks --ip 0.0.0.0 --no-browser --allow-root"]
