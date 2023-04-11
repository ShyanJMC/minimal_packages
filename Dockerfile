FROM archlinux:latest

RUN pacman -Syyuuq base-devel micro bash sudo --noconfirm --needed

ADD makepkg.conf /etc/makepkg.conf

RUN sed -i "s/ParallelDownloads = 2/ParallelDownloads = 20/g" /etc/pacman.conf

RUN useradd -r -u 1000 -d /home/buildarch -m -s /usr/bin/bash buildarch 
RUN echo "buildarch ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers


CMD ["/usr/bin/bash"]
