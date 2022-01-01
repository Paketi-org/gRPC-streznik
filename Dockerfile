FROM python:3.8-slim-buster

RUN pip3 install pipenv

ENV PROJECT_DIR /usr/src/flaskbookapi

WORKDIR ${PROJECT_DIR}

COPY Pipfile .
COPY Pipfile.lock .
COPY . .

RUN pipenv install --deploy --ignore-pipfile

EXPOSE 50051

CMD ["pipenv", "run", "python", "grpc_server.py"]
