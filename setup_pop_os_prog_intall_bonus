#!/bin/bash

# ==========================
# 🚀 MISE À JOUR DU SYSTÈME
# ==========================
echo "🔄 Mise à jour des paquets..."
sudo apt update && sudo apt upgrade -y

# ==========================
# 🚀 INSTALLATION DES DRIVERS NVIDIA
# ==========================
echo "🚀 Installation des drivers NVIDIA CUDA et cuDNN..."
sudo apt install -y nvidia-driver-535 nvidia-cuda-toolkit nvidia-cuda-dev nvidia-modprobe
sudo apt install -y nvidia-cuda-toolkit nvidia-cudnn8 nvidia-cudnn8-dev

# ==========================
# 🔥 OUTILS GRAPHIQUES ET MULTIMÉDIA
# ==========================
echo "🎉 Installation des outils graphiques (GIMP, Blender, etc.)..."
sudo apt install -y gimp darktable inkscape krita blender xnviewmp font-manager svgcleaner 

# ==========================
# 🎥 MONTAGE VIDÉO ET STREAMING
# ==========================
echo "🎥 Installation des outils de montage vidéo (OBS, Handbrake, etc.)..."
sudo apt install -y obs-studio kdenlive handbrake simplescreenrecorder ffmpeg yt-dlp youtube-dl 

# ==========================
# 🎶 PRODUCTION AUDIO (DAW)
# ==========================
echo "🎶 Installation des DAW (Ardour, LMMS, etc.)..."
sudo apt install -y ardour lmms carla qjackctl pulseaudio pipewire 

# ==========================
# 🐍 INSTALLATION DE PYTHON, CONDA, IA LOCALE
# ==========================
echo "🐍 Installation de Python 3.10, Conda, Pip, Pyenv..."
sudo apt install -y python3.10 python3.10-venv python3.10-dev python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev
curl https://pyenv.run | bash

# Installer Miniconda
echo "📦 Installation de Miniconda..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
source ~/.bashrc

# ==========================
# 🛠️ OUTILS DE DÉVELOPPEMENT ET CYBERSÉCURITÉ
# ==========================
echo "🛠️ Installation des outils de développement (Git, Docker, etc.)..."
sudo apt install -y git git-lfs gh curl wget neofetch htop tmux exa bat ncdu 

# Installer Docker et Docker Compose
echo "🐋 Installation de Docker et Docker Compose..."
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

# Installer Node.js et npm
echo "📦 Installation de Node.js (version LTS) et npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Installer Visual Studio Code
echo "🛠️ Installation de Visual Studio Code et extensions..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install -y code

# Installer extensions de Visual Studio Code
echo "📦 Installation des extensions de Visual Studio Code..."
code --install-extension ms-python.python
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension ms-azuretools.vscode-docker

# ==========================
# 🔐 CRYPTO-MONNAIE, PORTEFEUILLE ET SÉCURITÉ
# ==========================
echo "🔐 Installation des outils de sécurité, gestion des mots de passe, wallets crypto..."
sudo apt install -y keepassxc
wget -qO - https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"
sudo apt update && sudo apt install -y brave-browser
sudo snap install metamask
sudo snap install bitwarden

# ==========================
# 📡 STOCKAGE CLOUD ET COMMUNICATION
# ==========================
echo "📡 Installation des outils cloud et de communication..."
sudo snap install mega-cmd
sudo snap install discord
sudo snap install telegram-desktop
sudo apt install -y thunderbird 

# ==========================
# 🚀 INSTALLATION D'OUTILS OSINT ET CYBERSÉCURITÉ
# ==========================
echo "🕵️ Installation des outils OSINT et cybersécurité..."
sudo apt install -y tor proxychains4 whois dnsutils
pip3 install shodan
sudo apt install -y recon-ng

# ==========================
# 🤖 INSTALLATION D'OUTILS D'IA EN LOCAL
# ==========================
echo "🧠 Installation des outils d'intelligence artificielle (Stable Diffusion, Whisper, etc.)..."
pip3 install torch torchvision torchaudio transformers openai 

# Installation de LocalAI (alternative locale à OpenAI)
echo "📦 Installation de LocalAI..."
sudo docker pull go-skynet/local-ai
sudo docker run -d -p 8080:8080 --name local-ai go-skynet/local-ai

# ==========================
# 📓 INSTALLATION D'OBSIDIAN ET AUTRES
# ==========================
echo "📚 Installation d'Obsidian, Telegram et Discord..."
sudo snap install obsidian

# ==========================
# 🎉 CONFIGURATION DES SERVICES
# ==========================
echo "⚙️ Configuration des services et raccourcis par défaut..."

# Activer Docker au démarrage
sudo systemctl enable docker
sudo systemctl start docker

# Configure Pipewire au lieu de PulseAudio
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse

# Ajouter Miniconda au PATH
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc

# ==========================
# 🚀 TOUT EST PRÊT !
# ==========================
echo "✅ Installation terminée ! Redémarrez votre machine pour appliquer toutes les modifications."
