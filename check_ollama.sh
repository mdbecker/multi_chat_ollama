#!/bin/bash
# check_ollama.sh

echo "Checking for existing Ollama server..."
if curl -s http://localhost:11434/api/version &>/dev/null; then
    echo "✅ Ollama server already running on port 11434"
    
    # Get available models
    MODELS_JSON=$(curl -s http://localhost:11434/api/tags)
    MODELS_COUNT=$(echo "$MODELS_JSON" | grep -o "\"model\"" | wc -l)
    
    echo "Found $MODELS_COUNT available models on your Ollama server."
    
    # Display some recommended models if they exist
    echo "Checking for commonly used models..."
    
    RECOMMENDED_MODELS=("llama3" "llama3.1" "gemma" "mistral" "mixtral" "phi3")
    
    for MODEL in "${RECOMMENDED_MODELS[@]}"; do
        if echo "$MODELS_JSON" | grep -q "\"name\":\"$MODEL\""; then
            echo "✅ $MODEL is available"
        else
            echo "ℹ️ $MODEL not found. You can install it with: ollama pull $MODEL"
        fi
    done
    
    echo ""
    echo "Ready to use multi_chat_ollama!"
    echo "1. Start a local web server with: python3 -m http.server 8000"
    echo "2. Open http://localhost:8000/index.html in your browser"
else
    echo "❌ No Ollama server detected on port 11434."
    echo "Please start Ollama with 'ollama serve' before running this script."
    exit 1
fi