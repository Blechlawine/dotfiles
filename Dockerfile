FROM ubuntu:focal

RUN apt update
RUN apt install -y curl software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install -y ansible

RUN useradd -ms /bin/bash blechlawine
USER blechlawine

WORKDIR /home/blechlawine

CMD ["/bin/bash"]