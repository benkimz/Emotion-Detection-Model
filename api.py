import os
import json
import numpy as np

import tensorflow as tf
import tensorflow_text as text

from flask import Flask, jsonify, request

app = Flask(__name__)

MODEL_NAME = "emotions-model"

def load_emotions():
  with open("emotions.json", mode="r") as fp:
    data = json.load(fp)
  return data

emotions = load_emotions() 

model = tf.keras.models.load_model(MODEL_NAME, compile=False)

@app.route('/emotions', methods=['GET'])
def view_all_emotions():
    return jsonify(emotions)

@app.route('/inference', methods=['POST'])
def inference_endpoint():
    prompt = request.json["prompt"]

    logits = model.predict([prompt])

    scores = dict(zip(emotions.keys(), logits[0]))

    return jsonify(dict(sorted(scores.items(), key=lambda x: x[1], reverse=True)))


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8875)))
