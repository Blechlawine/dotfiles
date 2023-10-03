FROM ubuntu:focal

RUN apt update
RUN apt install -y curl software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install -y ansible
# RUN apt install sudo

# RUN useradd -ms /bin/bash blechlawine
# RUN usermod -aG sudo blechlawine
# USER blechlawine

WORKDIR /home/blechlawine/dotfiles

CMD ["/bin/bash"]