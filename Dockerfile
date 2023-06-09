FROM python:latest

WORKDIR /emotions

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/benkimz/Emotion-Detection-Model.git ./    

RUN git clone https://huggingface.co/benkimz/emotions-model

RUN pip3 install --upgrade pip 

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install "tensorflow-text==2.12.0"

EXPOSE 8875

ENTRYPOINT [ "python", "api.py" ]
