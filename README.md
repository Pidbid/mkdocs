# MkDocs Docker 环境

本项目包含一个 `Dockerfile`，用于创建一个轻量级的 MkDocs 环境，方便本地开发和预览。

## 特点

-   基于 `python:3.12-alpine`，确保镜像体积尽可能小。
-   内置 `mkdocs serve` 命令，支持实时重新加载。
-   配置为可从容器外部访问。

## 如何使用

### 1. 前提条件

-   确保你已经安装了 [Docker](https://www.docker.com/get-started)。
-   在项目根目录下创建一个 `docs` 文件夹，并放入你的 Markdown 文档。
-   在项目根目录下创建一个 `mkdocs.yml` 配置文件。

### 2. 构建镜像

在项目的根目录（`Dockerfile` 所在的目录）下运行以下命令来构建 Docker 镜像：

```bash
docker build -t my-mkdocs-image .
```

你可以将 `my-mkdocs-image` 替换为你喜欢的任何名称。

### 3. 运行容器

使用以下命令来启动容器：

```bash
docker run -p 8000:8000 -v ./docs:/docs my-mkdocs-image
```

**命令解释:**

-   `-p 8000:8000`: 将你本机的 8000 端口映射到容器的 8000 端口。
-   `-v ./docs:/docs`: 将本地的 `docs` 目录挂载到容器中，实现文档内容的实时更新。
-   `my-mkdocs-image`: 你在构建步骤中为镜像设置的名称。

### 4. 访问网站

现在，你可以在浏览器中打开 `http://localhost:8000` 来实时预览你的 MkDocs 网站。
