FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y nginx zip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract the 2048 game from GitHub
RUN curl -L -o /tmp/master.zip https://github.com/mani20048/2048-game/archive/refs/heads/master.zip && \
    unzip /tmp/master.zip -d /tmp && \
    mv /tmp/2048-game-master/* /var/www/html/ && \
    rm -rf /tmp/master.zip /tmp/2048-game-master

# Expose HTTP port
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
