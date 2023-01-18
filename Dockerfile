FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install --requirement requirements.txt

COPY . .

RUN python setup.py build
RUN python setup.py install

ENTRYPOINT ["python", "manga_ocr/run.py"]
