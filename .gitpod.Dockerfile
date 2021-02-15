FROM gitpod/workspace-full:latest

USER gitpod
RUN python3 -m pip install --upgrade pip
RUN pip3 install Flask==1.0.2
