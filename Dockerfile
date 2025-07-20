# 1. Use a smaller Alpine base image
FROM python:3.12-alpine

# 2. Install core dependencies during the build phase
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir mkdocs

# 3. Create a dedicated directory for the entrypoint script
RUN mkdir /app

# 4. Copy the entrypoint script to the /app directory
COPY entrypoint.sh /app/

# 5. Set the working directory for mkdocs
WORKDIR /docs

# 6. Expose the port mkdocs will run on
EXPOSE 8000

# 7. Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/app/entrypoint.sh"]
