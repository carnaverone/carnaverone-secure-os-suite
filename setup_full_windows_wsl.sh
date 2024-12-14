
#!/bin/bash

# Script: setup_full_windows_wsl.sh
# Purpose: Automate the installation of a secure development environment on Windows WSL (Ubuntu/Debian).

echo "Starting setup for Windows WSL..."

# Update and upgrade the system
sudo apt-get update -y && sudo apt-get upgrade -y

# Install base tools
echo "Installing base tools..."
sudo apt-get install -y curl wget git vim nano unzip zip htop neofetch net-tools build-essential

# Install development tools
echo "Installing development tools..."
sudo apt-get install -y python3 python3-pip openjdk-11-jdk gradle

# Install Docker (for WSL2 only)
echo "Installing Docker..."
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Install and configure UFW
echo "Installing and configuring UFW..."
sudo apt-get install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# Install Fail2Ban
echo "Installing Fail2Ban..."
sudo apt-get install -y fail2ban
sudo systemctl enable fail2ban

# Install Flask and set up TTS API
echo "Installing Flask and setting up TTS API..."
sudo pip3 install flask TTS
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
echo "Creating systemd service for TTS server..."
cat <<EOL | sudo tee /etc/systemd/system/tts-server.service
[Unit]
Description=Flask TTS Server
After=network.target
[Service]
User=$USER
WorkingDirectory=/home/$USER/tts_server
ExecStart=/usr/bin/python3 /home/$USER/tts_server/tts_server.py
Restart=always
[Install]
WantedBy=multi-user.target
EOL
sudo systemctl enable tts-server
sudo systemctl start tts-server

# Final checks
echo "Setup completed! Verifying installation..."
docker --version && python3 --version && ufw status && sudo systemctl status tts-server

echo "All done! Please restart WSL to apply changes."
