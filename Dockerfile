# Use the LinuxServer Webtop base
FROM lscr.io/linuxserver/webtop:latest

# Map the internal config to your persistent /data path
# This replaces the -v /workspaces/my-desktop-data:/config from your script
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC
ENV KASMVNC_IP=0.0.0.0

# Expose the web interface port
EXPOSE 3000

# Critical: Point the app's config directory to your persistent volume path
# Webtop looks for its settings in /config by default; this symlinks it to /data
RUN mkdir -p /data && \
    rm -rf /config && \
    ln -s /data /config

# Define /data as the volume for the platform to recognize
VOLUME /data

# The base image's init system handles the rest