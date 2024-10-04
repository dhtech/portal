FROM python:3.11-slim-bullseye

# Set the maintainer label
LABEL maintainer="Sebastian Svensson <ss@tinbox.nu>"

# Install necessary build dependencies and clean up to reduce image size
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential dumb-init && \
    rm -rf /var/lib/apt/lists/*


# Set the working directory for the application
WORKDIR /app

# Copy the application files to the container
COPY ./app /app

# Install the Python dependencies in a virtual environment
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r requirements.txt

# Make sure the venv binaries are available for future commands
ENV PATH="/opt/venv/bin:$PATH"

# Expose the port the app will run on
EXPOSE 5001

# Use dumb-init as the entry point to handle signals properly
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Run the application
CMD ["python", "app.py"]