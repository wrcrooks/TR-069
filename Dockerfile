FROM python:3.11-alpine

EXPOSE 8443

ENV NODE=LOCAL-BUILD

WORKDIR /app

RUN apk update && apk add wget

RUN cd /app && wget "https://raw.githubusercontent.com/xddxdd/freedomfi-cbrs-enable-webui/refs/heads/master/tr069.py"

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

CMD ["python3", "tr069.py"]
