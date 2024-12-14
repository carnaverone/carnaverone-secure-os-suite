![Image de couverture](./images/imagecover.png)
---------------------------------------------------------------------------------
README.md
---------------------------------------------------------------------------------
Full documentation and usage guide / Documentation complète et guide d'utilisation
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
# 📘 **CARNAVERONE SECURE OS SUITE**
---------------------------------------------------------------------------------
Welcome to the Carnaverone Secure OS Suite, a powerful collection of automation scripts designed to configure, secure, and optimize your development environment across multiple operating systems. This suite provides enhanced security, automation, and ease of use for both developers and IT professionals.
This suite offers a seamless setup experience for development, security, and automation on the most popular operating systems.
---------------------------------------------------------------------------------
Bienvenue dans la Carnaverone Secure OS Suite, une puissante collection de scripts d'automatisation conçue pour configurer, sécuriser et optimiser votre environnement de développement sur plusieurs systèmes d'exploitation. Cette suite offre une sécurité renforcée, une automatisation et une facilité d'utilisation pour les développeurs et les professionnels de l'informatique.
Cette suite offre une expérience de configuration transparente pour le développement, la sécurité et l'automatisation sur les systèmes d'exploitation les plus populaires.
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
🛡️ Supported Operating Systems / Systèmes d'exploitation pris en charge

This repository contains **8 complete setup and configuration scripts** 
- **Ubuntu**  
- **Arch Linux**  
- **Pop!_OS**  
- **Debian**  
- **Fedora**  
- **CentOS/Rocky/AlmaLinux**  
- **macOS**  
- **Windows (via WSL)**  



------------------------------------------------------------------------------
------------------------------------------------------------------------------
These scripts automatically install and configure a **fully secure development environment** with:  
- **Text-to-Speech (TTS) Tools**  
- **Flask TTS API**  
- **Virtualization (QEMU, VirtualBox)**  
- **Docker & Docker Compose**  
- **Advanced Security Setup (UFW, Fail2Ban, Root Lockout)**  

---

## 🖼️ **Preview of Setup Scripts**  
![Scripts Overview](./images/script-overview.png)

---

## 📂 **REPOSITORY CONTENT**  
| **File**                          | **Description**                          |
|-----------------------------------|------------------------------------------|
| **`setup_full_ubuntu.sh`**         | Full setup script for **Ubuntu**         |
| **`setup_full_arch.sh`**           | Full setup script for **Arch Linux**     |
| **`setup_full_popos.sh`**          | Full setup script for **Pop!_OS**        |
| **`setup_full_debian.sh`**         | Full setup script for **Debian**         |
| **`setup_full_fedora.sh`**         | Full setup script for **Fedora**         |
| **`setup_full_centos.sh`**         | Full setup script for **CentOS/Rocky/AlmaLinux** |
| **`setup_full_macos.sh`**          | Full setup script for **macOS**          |
| **`setup_full_windows_wsl.sh`**    | Full setup script for **Windows (via WSL)** |
| **`README.md`**                    | Full documentation and usage guide      |

---

## 📋 **EXECUTION INSTRUCTIONS**  

### 🚀 **STEP 1: GRANT EXECUTION PERMISSIONS**  
Run the following command to make the scripts executable:  
```bash
chmod +x setup_full_ubuntu.sh setup_full_arch.sh setup_full_popos.sh setup_full_debian.sh setup_full_fedora.sh setup_full_centos.sh setup_full_macos.sh setup_full_windows_wsl.sh
```

---

### 🚀 **STEP 2: EXECUTE THE SCRIPT FOR YOUR OS**  
Run the appropriate script depending on your operating system:  

**🔷 FOR UBUNTU:**  
```bash
./setup_full_ubuntu.sh
```

**🔷 FOR ARCH LINUX:**  
```bash
./setup_full_arch.sh
```

**🔷 FOR POP!_OS:**  
```bash
./setup_full_popos.sh
```

**🔷 FOR DEBIAN:**  
```bash
./setup_full_debian.sh
```

**🔷 FOR FEDORA:**  
```bash
./setup_full_fedora.sh
```

**🔷 FOR CENTOS/ROCKY/ALMALINUX:**  
```bash
./setup_full_centos.sh
```

**🔷 FOR MACOS:**  
```bash
./setup_full_macos.sh
```

**🔷 FOR WINDOWS (via WSL):**  
```bash
./setup_full_windows_wsl.sh
```

---

### 🚀 **STEP 3: VERIFY THE LOG FILE**  
After the script completes, review the log file to verify the success of the installation:  
```bash
cat /mnt/data/testuser/setup_log.txt
```

---

## 🖼️ **Script Execution Example**  
![Script Execution](./images/script-execution.png)

---

## 🚀 **SCRIPT FEATURES**  

| **Feature**               | **Description**                            |
|--------------------------|---------------------------------------------|
| 📁 **Environment Setup**   | TTS, security, Docker, Flask, virtualization |
| 📜 **Log File**            | Detailed log of every action in the setup  |
| ✅ **Automatic Tests**     | Check directories, permissions, and file status |
| 🔐 **Advanced Security**   | UFW, Fail2Ban, root lockout, AppArmor      |
| 📡 **Flask TTS API**       | API to generate audio files via HTTP       |

---

## 📡 **FLASK TTS API USAGE**  

The Flask TTS server allows **audio file generation** from a simple HTTP POST request.  
The **Flask server is a systemd or launchctl service** that runs automatically.  

---

### 🧑‍💻 **API USAGE EXAMPLE**  
**Endpoint**: `http://localhost:5000/tts`  
**Method**: `POST`  
**Request Body (JSON)**:  
```json
{
    "text": "Hello, I am a voice generated by TTS"
}
```

**Example cURL Command**:  
```bash
curl -X POST http://localhost:5000/tts     -H "Content-Type: application/json"     -d '{"text":"Hello, I am a voice generated by TTS"}' --output output.wav
```

---

## 🖼️ **TTS API Overview**  
![TTS API Overview](./images/tts-api-example.png)

---

## 🧪 **TESTS AND VERIFICATIONS**  
- ✅ **Log file verification**  
- ✅ **File and directory permission checks**  
- ✅ **Service status checks**  
- ✅ **TTS API endpoint testing**  

---

## 📂 **FILE STRUCTURE**  

```
📦 /carnaverone-secure-os-suite
├── /images/                    # Images used in the README
│   ├── script-overview.png     # Overview of scripts
│   ├── script-execution.png    # Example of script execution
│   └── tts-api-example.png     # Flask TTS API example
├── setup_full_ubuntu.sh        # Full setup script for Ubuntu
├── setup_full_arch.sh          # Full setup script for Arch Linux
├── setup_full_popos.sh         # Full setup script for Pop!_OS
├── setup_full_debian.sh        # Full setup script for Debian
├── setup_full_fedora.sh        # Full setup script for Fedora
├── setup_full_centos.sh        # Full setup script for CentOS/Rocky/AlmaLinux
├── setup_full_macos.sh         # Full setup script for macOS
├── setup_full_windows_wsl.sh   # Full setup script for Windows (via WSL)
└── README.md                   # This README file
```

---

## 📋 **TROUBLESHOOTING**  

| **Problem**               | **Solution**                              |
|--------------------------|--------------------------------------------|
| **Service not running**    | Restart the service: `sudo systemctl restart tts-server` |
| **API not responding**     | Check the logs: `cat /mnt/data/testuser/setup_log.txt` |
| **File permissions error** | Fix permissions: `chmod 644 /mnt/data/testuser/setup_log.txt` |
| **Port 5000 already used** | Kill the process: `sudo fuser -k 5000/tcp` |
| **Docker issues**          | Restart Docker: `sudo systemctl restart docker` |

---

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
⚙️ What Does This Suite Install? / Qu'installe cette suite ?

The Carnaverone Secure OS Suite provides a robust set of essential tools and services for a secure development environment, including:

🛠️ Development Tools / Outils de développement

Docker & Docker Compose — Containerization platform and orchestration.

Virtualization (QEMU, VirtualBox) — Tools for running virtual machines.

🔐 Security Tools / Outils de sécurité

UFW (Uncomplicated Firewall) — Easy-to-use firewall configuration.

Fail2Ban — Intrusion prevention system to block IPs after failed login attempts.

Root Lockout — Enhanced root account security to prevent unauthorized access.

🖥️ System Services / Services système

Flask TTS API — Custom API to generate Text-to-Speech (TTS) audio files.

Systemd Services — Manages and runs system services for automation.

🧰 Utility Tools / Outils utilitaires

Package Updates — Automatic updates of system packages.

Log Files — Detailed logs of script execution for debugging.

La Carnaverone Secure OS Suite fournit un ensemble robuste d'outils et de services essentiels pour un environnement de développement sécurisé, notamment :

🛠️ Outils de développement

Docker & Docker Compose — Plateforme de conteneurisation et orchestration.

Virtualisation (QEMU, VirtualBox) — Outils pour exécuter des machines virtuelles.

🔐 Outils de sécurité

UFW (Uncomplicated Firewall) — Configuration de pare-feu simple d'utilisation.

Fail2Ban — Système de prévention des intrusions pour bloquer les IP après des tentatives de connexion échouées.

Verrouillage du compte root — Sécurité renforcée du compte root pour éviter les accès non autorisés.

🖥️ Services système

API Flask TTS — API personnalisée pour générer des fichiers audio de synthèse vocale (TTS).

Services systemd — Gère et exécute des services système pour l'automatisation.

🧰 Outils utilitaires

Mises à jour des paquets — Mises à jour automatiques des paquets système.

Fichiers de journalisation — Journaux détaillés de l'exécution des scripts pour le débogage.

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

---
## 📋 **CONTRIBUTIONS**  
Contributions are welcome!  
- **Create an issue** to report bugs.  
- **Submit a pull request** to add new features.  

---
---------------------------------------------------------------------------------
## 📧 **CONTACT**  
**Developer**: Carnaverone Studio  
**Email**: carnaverone@gmail.com  

---
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

