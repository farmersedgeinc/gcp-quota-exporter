FROM python:3.7-alpine

WORKDIR /usr/src/app
RUN adduser -D -u 25000 -g app -h /usr/src/app app && \
    chown app:app /usr/src/app

EXPOSE 8000

COPY clock.py ./

USER app
CMD [ "python", "./clock.py" ]
