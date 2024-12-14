#!/bin/bash

# ========================
# 🔥 Configuration des variables
# ========================
USER_HOME="/mnt/data/testuser"
TTS_DIR="$USER_HOME/tts_outputs"
LOG_FILE="$USER_HOME/setup_log.txt"

# Créez le répertoire avant de créer le fichier de log
mkdir -p $USER_HOME

# ========================
# 🔥 Fonction de gestion des erreurs
# ========================
error_handler() {
    echo "❌ Une erreur est survenue à la commande '$BASH_COMMAND'. Consultez le fichier de log pour plus de détails : $LOG_FILE"
    exit 1
}

# Activer le gestionnaire d'erreurs
trap 'error_handler' ERR

# Ajouter une option pour que le script s'arrête sur erreur
set -e

# ========================
# 🔥 Début du script
# ========================
echo "🏗️ Démarrage de l'installation et de la configuration..." | tee -a $LOG_FILE 2>&1

# ========================
# 🔥 Installation des outils de base
# ========================
echo "📦 Installation des outils de base (build-essential, curl, wget, etc.)" | tee -a $LOG_FILE 2>&1
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl wget git vim nano unzip zip htop neofetch net-tools software-properties-common

# ========================
# 🔥 Installation des outils TTS
# ========================
echo "🎙️ Installation des outils de TTS (Coqui, Mozilla, MaryTTS, eSpeak, Festival, Flite)" | tee -a $LOG_FILE 2>&1
pip3 install tts TTS
sudo apt install -y espeak festival flite

# Installation de MaryTTS
echo "📡 Installation de MaryTTS" | tee -a $LOG_FILE 2>&1
sudo apt install -y default-jdk
git clone https://github.com/marytts/marytts.git
cd marytts
./gradlew installDist
cd ..

# ========================
# 🔥 Installation de Docker et Docker Compose
# ========================
echo "🐋 Installation de Docker et Docker Compose" | tee -a $LOG_FILE 2>&1
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

# ========================
# 🔥 Installation de VirtualBox et QEMU
# ========================
echo "📦 Installation de VirtualBox et QEMU" | tee -a $LOG_FILE 2>&1
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtualbox virt-manager

# ========================
# 🔥 Installation des outils de sécurité
# ========================
echo "🔐 Installation des outils de sécurité (Fail2Ban, UFW, AppArmor, etc.)" | tee -a $LOG_FILE 2>&1
sudo apt install -y ufw fail2ban apparmor auditd rkhunter chkrootkit lynis

# Configuration des règles de sécurité
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo passwd -l root

# ========================
# 🔥 Configuration du serveur Flask TTS
# ========================
echo "🚀 Configuration du serveur Flask TTS" | tee -a $LOG_FILE 2>&1
pip3 install Flask
mkdir -p $TTS_DIR

# Créer le serveur Flask
cat << 'EOF' > $USER_HOME/tts_server.py
from flask import Flask, request, send_file
import os

app = Flask(__name__)
OUTPUT_DIR = '/home/' + os.getenv('USER') + '/tts_outputs/'

@app.route('/tts', methods=['POST'])
def tts():
    text = request.json.get('text')
    if not text:
        return {'error': 'Le texte est requis'}, 400
    
    output_path = os.path.join(OUTPUT_DIR, 'output.wav')
    os.system(f'tts --text "{text}" --out_path {output_path}')
    return send_file(output_path, mimetype='audio/wav')

if __name__ == '__main__':
    app.run(port=5000, debug=True)
EOF

# Création du service systemd pour le serveur Flask
sudo bash -c 'cat << EOF > /etc/systemd/system/tts-server.service
[Unit]
Description=Serveur Flask TTS
After=network.target

[Service]
User=$USER
WorkingDirectory=$USER_HOME
ExecStart=/usr/bin/python3.10 $USER_HOME/tts_server.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF'

sudo systemctl enable tts-server
sudo systemctl start tts-server

# ========================
# 🔥 Vérifications finales
# ========================
echo "📋 Vérifications finales" | tee -a $LOG_FILE 2>&1

if [ -f "$LOG_FILE" ]; then
    echo "✅ Fichier de log $LOG_FILE trouvé." | tee -a $LOG_FILE 2>&1
else
    echo "❌ Le fichier de log $LOG_FILE est manquant !" | tee -a $LOG_FILE 2>&1
    exit 1
fi

if [ -d "$TTS_DIR" ]; then
    echo "✅ Le répertoire $TTS_DIR existe." | tee -a $LOG_FILE 2>&1
else
    echo "❌ Le répertoire $TTS_DIR n'existe pas, création en cours..." | tee -a $LOG_FILE 2>&1
    mkdir -p $TTS_DIR
    echo "✅ Répertoire $TTS_DIR créé avec succès." | tee -a $LOG_FILE 2>&1
fi

# Vérification des permissions
echo "📋 Vérification des permissions sur le fichier de log..." | tee -a $LOG_FILE 2>&1
if [ -r "$LOG_FILE" ] && [ -w "$LOG_FILE" ]; then
    echo "✅ Les permissions de lecture/écriture sont correctes sur $LOG_FILE." | tee -a $LOG_FILE 2>&1
else
    chmod 644 $LOG_FILE
    echo "✅ Permissions corrigées sur $LOG_FILE." | tee -a $LOG_FILE 2>&1
fi

# ========================
# 🔥 Fin du script
# ========================
echo "✅ Installation et tests terminés ! Aucune erreur détectée." | tee -a $LOG_FILE 2>&1
exit 0
