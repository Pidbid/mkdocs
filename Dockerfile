# 1. 使用更小的 Alpine 基础镜像
FROM python:3.12-alpine

# 2. 设置工作目录
WORKDIR /docs

# 3. 高效地安装 mkdocs
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir mkdocs

# 4. 声明容器将要监听的端口
EXPOSE 8000

# 5. 优化启动命令
CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]
