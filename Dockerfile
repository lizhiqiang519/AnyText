# 使用官方Conda镜像作为基础镜像
FROM continuumio/miniconda3:latest

# 设置工作目录
WORKDIR /app

# 将GitHub仓库克隆到工作目录下
COPY . /app

# 复制环境文件到工作目录
COPY environment.yaml /app/environment.yaml

# 使用conda安装依赖
RUN conda env create -f environment.yaml

# 激活Conda环境
SHELL ["conda", "run", "-n", "anytext", "--"]

# 暴露端口，以便外部可以访问容器中运行的服务
EXPOSE 8000

# 在容器启动时运行demo.py
# 这里假设demo.py位于/app目录下，并且它是一个可执行脚本
CMD ["python", "demo.py"]
