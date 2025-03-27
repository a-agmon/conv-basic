FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    wget \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /workspace

# Install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Create a startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose ports for Jupyter and Ollama
EXPOSE 8888 11434

# Start Jupyter and Ollama
CMD ["/start.sh"] 
