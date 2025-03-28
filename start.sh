#!/bin/bash

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start up
sleep 6

# Pull a small model to have it ready
ollama pull gemma3:1b &

# Start Jupyter Notebook
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' 