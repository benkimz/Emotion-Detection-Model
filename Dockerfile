FROM tensorflow/serving:2.8.4

ARG MODEL_NAME=emotions-model

ARG MODEL_PATH=/models/model/1/

COPY ${MODEL_NAME} ${MODEL_PATH}

EXPOSE 8500

CMD tensorflow_model_server --port=8500 --rest_api_port=8501 \
  --model_name=${MODEL_NAME} --model_base_path=${MODEL_PATH} \
  --tensorflow_session_parallelism=1
