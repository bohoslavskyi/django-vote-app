FROM python:3.11.2-alpine3.17
LABEL maintainer="bohoslavskyi"

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./src /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp \
ENV PATH="/py/bin:$PATH"

RUN adduser \
        --disabled-password \
        --no-create-home \
        django-user
USER django-user
