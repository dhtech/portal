From debian:stretch
MAINTAINER Sebastian Svensson "ss@tinbox.nu"

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3-dev build-essentials


COPY ./app /app
WORKDIR /app
RUN pip3 install -r requirements.txt


EXPOSE 5001
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
ENTRYPOINT ["python"]
CMD ["app.py"]

