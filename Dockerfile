FROM python:3
RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt

FROM python:3

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/


RUN python manage.py collectstatic --noinput
RUN python manage.py migrate

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.wsgi:web"]
