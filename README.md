# MkDocs Docker Environment

This project provides a flexible and lightweight Docker environment for serving MkDocs sites, with support for installing custom dependencies at runtime.

## Features

-   **Lightweight**: Based on the `python:3.12-alpine` image.
-   **Flexible**: Installs Python dependencies from `requirements.txt` when the container starts.
-   **Live Reload**: Served with `mkdocs serve` for instant previews of your changes.

## How to Use

### 1. Project Structure

For the environment to work correctly, your project should follow this structure:

```
.
├── Dockerfile
├── entrypoint.sh
└── docs/
    ├── index.md
    ├── mkdocs.yml          # MkDocs configuration file
    └── requirements.txt    # (Optional) Python dependencies for plugins, themes, etc.
```

**Key Points:**
-   The `docs` directory will be mounted into the container. It must contain your `mkdocs.yml` file and your Markdown documents.
-   If you need any MkDocs plugins, themes, or other Python packages, list them in the `docs/requirements.txt` file. The container will automatically install them on startup.

### 2. Build the Image

First, ensure you have [Docker](https://www.docker.com/get-started) installed. Then, run the following command in your project's root directory to build the image:

```bash
docker build -t my-mkdocs-image .
```

You can replace `my-mkdocs-image` with any name you prefer.

### 3. Run the Container

Use this command to start the container:

```bash
docker run --rm -p 8000:8000 -v ./docs:/docs my-mkdocs-image
```

**Command Explained:**

-   `--rm`: Automatically removes the container when it stops, keeping your system clean.
-   `-p 8000:8000`: Maps port 8000 on your local machine to port 8000 in the container.
-   `-v ./docs:/docs`: Mounts your local `docs` directory into the container. This is crucial for live reloading of your content and for installing dependencies from `requirements.txt`.
-   `my-mkdocs-image`: The name you gave the image during the build step.

### 4. Access Your Site

Open your web browser and navigate to `http://localhost:8000` to see your MkDocs site live. Any changes you make to your local files will be reflected instantly.
