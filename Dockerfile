FROM python:3.9-slim-buster

COPY . /emotions

WORKDIR /emotions

RUN pip3 install --upgrade pip 

RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install "tensorflow-text==2.11.*"

RUN pip3 install tf-models-official==2.11.0