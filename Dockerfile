FROM python:3.9-slim-buster

WORKDIR /emotions

RUN apt-get update && apt-get install -y git && \
git clone https://github.com/benkimz/Emotion-Detection-Model.git ./    

RUN git clone git clone https://huggingface.co/benkimz/emotions-model

RUN pip3 install --upgrade pip 

RUN pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install "tensorflow-text==2.11.*"

RUN pip3 install tf-models-official==2.11.0