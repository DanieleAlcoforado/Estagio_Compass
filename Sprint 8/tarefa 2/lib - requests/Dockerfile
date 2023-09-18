# Use a imagem Amazon Linux 2 como base
FROM amazonlinux:2.0.20200602.0

# Atualize o sistema e instale os pacotes necessários
RUN yum update -y && \
    yum install -y python3-pip zip && \
    yum -y clean all

# Atualize o pip para a versão mais recente
RUN python3 -m pip install --upgrade pip
