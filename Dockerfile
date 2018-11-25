FROM debian:testing-slim
LABEL maintaner="Sebastian Svensson <ss@tinbox.nu>"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y; \
		DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3-dev build-essential


COPY ./app /app
WORKDIR /app
RUN pip3 install -r requirements.txt


EXPOSE 5001
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["python3", "app.py"]

