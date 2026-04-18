FROM lscr.io/linuxserver/webtop:latest

# Basic Config
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC

# SECURITY: Change 'mypassword' to something else. 
# Platforms often ban 'open' desktops with no password.
ENV PASSWORD=mypassword

# RESOURCE SAVING: Prevents the desktop from crashing on low-RAM free tiers
ENV CHROMIUM_FLAGS="--disable-dev-shm-usage --no-sandbox"
ENV KASMVNC_IP=0.0.0.0

# Port for Back4app to find
EXPOSE 3000
