
#!/bin/bash

# Script: setup_full_macos.sh
# Purpose: Automate the installation of a secure development environment on macOS.

echo "Starting setup for macOS..."

# Check for Homebrew and install if not found
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install base tools
echo "Installing base tools..."
brew install wget git vim nano unzip zip htop neofetch

# Install development tools
echo "Installing development tools..."
brew install python3
brew install openjdk@11
brew install gradle

# Set JAVA_HOME for OpenJDK
echo "Setting JAVA_HOME for OpenJDK..."
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 11)' >> ~/.zshrc

# Install Docker
echo "Installing Docker..."
brew install --cask docker
open -a Docker
echo "Wait for Docker Desktop to be ready before continuing."

# Install UFW (optional for macOS)
echo "Installing UFW..."
brew install ufw

# Install Fail2Ban (optional for macOS)
echo "Installing Fail2Ban..."
brew install fail2ban

# Install Flask and set up TTS API
echo "Installing Flask and setting up TTS API..."
pip3 install flask TTS
mkdir -p ~/tts_server
cat <<EOL > ~/tts_server/tts_server.py
from flask import Flask, request, jsonify
from TTS.api import TTS
app = Flask(__name__)
tts = TTS("tts_models/en/ljspeech/tacotron2-DCA")
@app.route('/tts', methods=['POST'])
def generate_audio():
    data = request.json
    text = data.get("text", "")
    tts.tts_to_file(text=text, file_path="output.wav")
    return jsonify({"message": "Audio generated", "file": "output.wav"})
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOL
cd ~/tts_server
echo "Creating launchctl service for TTS server..."
cat <<EOL > ~/Library/LaunchAgents/com.carnaverone.tts-server.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.carnaverone.tts-server</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/python3</string>
        <string>/Users/$USER/tts_server/tts_server.py</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>/Users/$USER/tts_server</string>
</dict>
</plist>
EOL
launchctl load ~/Library/LaunchAgents/com.carnaverone.tts-server.plist

# Final checks
echo "Setup completed! Verifying installation..."
docker --version && python3 --version && brew --version

echo "All done! Please restart your terminal to apply changes."
