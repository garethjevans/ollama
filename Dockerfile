FROM ollama/ollama:0.6.1

# Pre-Install llama2
RUN nohup bash -c "ollama serve &" && sleep 5 && ollama pull llama3.2:1b && ollama pull all-minilm

