# 使用 PyTorch 官方镜像: pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

# 设置非交互模式, 避免安装过程中的时区交互
ENV DEBIAN_FRONTEND=noninteractive

# 安装 wget、bzip2 等基础工具
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        bzip2

# 下载并安装 Miniconda(可根据需求替换为其他版本或Anaconda)
ENV CONDA_DIR=/opt/conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh

# 将 conda 路径加入环境变量
ENV PATH="$CONDA_DIR/bin:$PATH"

# 保持容器在前台执行, 防止启动后立即退出
CMD ["tail", "-f", "/dev/null"]
