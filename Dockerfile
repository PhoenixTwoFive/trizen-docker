FROM archlinux/base
RUN pacman -Syu --noconfirm
RUN pacman -S base-devel git sudo python --needed --noconfirm
RUN useradd builduser -m
RUN passwd -d builduser
RUN printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers
COPY makepkg.conf /etc/makepkg.conf
USER builduser
WORKDIR /tmp/
RUN git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm