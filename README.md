# multi_chat_ollama

A lightweight, self-contained web application for creating conversations between multiple Ollama language models. This single-page HTML application provides an interactive chat interface with real-time streaming responses.

![Multi Chat Ollama Demo](demo.gif)

## Features

- **Simple Web Interface**: Clean, intuitive chat UI with minimal dependencies
- **Real-time Streaming**: See agent responses appear character by character
- **Multiple Ollama Models**: Configure agents to use any models available on your Ollama server
- **Configurable Agents**: Set custom names, models, and system prompts for each agent
- **Automated Turn-Taking**: Agents respond to each other in sequence with user-defined limits
- **Save Conversations**: Export the entire chat history as JSON
- **Self-contained**: Single HTML file contains the entire application
- **Local Processing**: All LLM processing happens on your machine

## Requirements

- Ollama installed and running locally on port 11434
- A modern web browser (Chrome, Firefox, Safari, Edge)
- At least one model downloaded via Ollama (e.g., `ollama pull llama3`)
- Python 3.x (for running a simple HTTP server)

## Installation

1. Clone this repository or download the files:
   ```bash
   git clone https://github.com/yourusername/multi_chat_ollama.git
   cd multi_chat_ollama
   ```

2. Make the server startup script executable:
   ```bash
   chmod +x check_ollama.sh
   ```

## Project Files

- `index.html`: The self-contained web application
- `check_ollama.sh`: Script to verify Ollama is running and check model availability
- `README.md`: This documentation file

## Usage

### Starting Ollama

1. Ensure Ollama is running on your system:
   ```bash
   ollama serve
   ```

2. Check if your models are available:
   ```bash
   ./check_ollama.sh
   ```

   This script will:
   - Verify that the Ollama server is running
   - Check if the models specified in the configuration are available
   - Display helpful information about your setup

### Running the Web Application

Due to browser security policies (CORS), you need to serve the HTML file through a local web server:

1. Start a simple Python HTTP server:
   ```bash
   python3 -m http.server 8000
   ```

2. Open your browser and navigate to:
   ```
   http://localhost:8000/index.html
   ```

### Using the Web Interface

1. The application will automatically connect to your Ollama server and load available models.

2. Configure your agents:
   - Set custom names for each agent
   - Select models from the dropdown menus
   - Customize system prompts

3. Configure conversation settings:
   - Set an initial prompt
   - Adjust the maximum AI exchanges before user input is required
   - Set maximum tokens per response

4. Start the conversation:
   - Click the "Start Conversation" button to begin with the configured initial prompt, or
   - Type a message in the input box and press Enter

5. Watch the conversation unfold as agents take turns responding to each other.

6. Save the conversation:
   - Click the "Save Chat" button to download the conversation history as a JSON file

## How It Works

1. The application connects directly to the Ollama API running on your machine
2. Each agent maintains its own conversation history for context
3. Messages are streamed in real-time with inline typing indicators
4. Turn-taking is managed automatically with limits on consecutive AI exchanges
5. All language processing happens locally on your machine

## Customizing

You can customize the experience by:

- Creating unique personalities through system prompts
- Using different Ollama models for each agent
- Adjusting conversation parameters (temperature, max tokens)
- Modifying the "Max AI Exchanges" setting to control conversation flow

## Troubleshooting

- **CORS Errors**: Make sure you're accessing the file through the Python HTTP server, not directly as a file
- **Connection Errors**: Ensure Ollama is running (`ollama serve`)
- **Slow Responses**: Try using smaller models or reducing the max tokens per response
- **Empty Responses**: Verify models are correctly installed with `ollama list`
- **Debug Issues**: Enable the debug console by checking "Show Debug Console" to see detailed logs

## Extending

This project can be extended in several ways:

- Add more agent participants
- Implement user authentication for multi-user support
- Add themes and customization options to the UI
- Enable voice input/output for a more interactive experience

## License

This project is released under the MIT License. Feel free to modify and distribute as needed.

---

Built with ❤️ for the Ollama community.
