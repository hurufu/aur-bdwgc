# Docker image that tests if the package builds in a minimal archlinux environemnt

FROM archlinux

# Preparation
RUN pacman -Syu --needed --noconfirm base-devel

# Configuration
ARG BOT=buildbot
ARG PROJECT=libbdwgc

# Creating new user
RUN useradd --base-dir=/ -m --comment="Build Bot,$HOSTNAME,,," "$BOT"
RUN echo "$BOT ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$BOT"

# Actual build
WORKDIR /$BOT
USER $BOT
COPY --chown="$BOT" * ./
RUN yes | makepkg -sric
RUN pacman -Ql "$PROJECT"
RUN pacman -Qi "$PROJECT"
