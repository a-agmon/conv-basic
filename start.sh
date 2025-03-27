#!/bin/bash

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start up
sleep 5

# Pull a small model to have it ready
ollama pull tinyllama &

# Start Jupyter Notebook
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' 
