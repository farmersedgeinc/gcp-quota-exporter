FROM python:3.7-alpine

WORKDIR /usr/src/app
RUN adduser -D -u 25000 -g app -h /usr/src/app app && \
    chown app:app /usr/src/app

RUN apk add tzdata

EXPOSE 8000

RUN pip install --no-cache-dir pipenv
COPY Pipfile* ./
RUN pipenv install --system --deploy

COPY . .
# COPY clock.py ./

USER app
# CMD [ "python", "./clock.py" ]
# CMD [ "python", "-u", "./clock.py" ]
CMD [ "python", "-u", "./exporter.py" ]
