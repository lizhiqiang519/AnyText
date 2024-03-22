# 使用带有CUDA的PyTorch官方镜像作为基础镜像
# 选择与您的cudatoolkit版本相匹配的镜像
FROM pytorch/pytorch:1.12.1-cuda11.6-cudnn8-runtime

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器内的/app目录
COPY . /app

# 使用environment.yml安装依赖
RUN conda env create -f environment.yml

# 激活环境。注意，Conda环境不会在Docker CMD命令中自动激活。
SHELL ["conda", "run", "-n", "anytext", "/bin/bash", "-c"]

# 暴露端口（如果您的应用需要网络访问）
EXPOSE 5000

# 运行您的应用
CMD ["conda", "run", "-n", "anytext", "python", "demo.py"]
