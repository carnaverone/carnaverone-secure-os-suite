# 🛠️ **Contributing to Carnaverone Secure OS Suite**

Thank you for considering contributing to **Carnaverone Secure OS Suite**! We welcome all contributions, whether they are bug fixes, feature enhancements, documentation improvements, or new features.

## 🚀 **How to Contribute**

1. **Fork this repository**: Click the “Fork” button at the top of this page.
2. **Create a new branch**: 
   ```bash
   git checkout -b feature/my-new-feature

---

## 🔥 **3. GitHub Branch Protection**
Pour contrôler les **contributions via pull requests**, il est recommandé de **protéger la branche principale (`main`)**.

Voici comment configurer **la protection des branches sur GitHub**.

---

### 📘 **Étapes pour configurer la protection de la branche `main`**

1️⃣ **Allez sur GitHub** et ouvrez votre **dépôt**.  
2️⃣ Allez dans **Settings** → **Branches**.  
3️⃣ Dans la section **Branch Protection Rules**, cliquez sur **Add rule**.  
4️⃣ **Nom de la branche :** `main`  
5️⃣ **Options de protection** à cocher :
   - ✅ **Require pull request reviews before merging** (Requiert une révision avant la fusion)  
   - ✅ **Require status checks to pass before merging** (Requiert la validation des tests)  
   - ✅ **Require conversation resolution before merging** (Requiert la résolution des discussions avant la fusion)  
   - ✅ **Restrict who can push to matching branches** (Restreindre les personnes autorisées à pousser)  

6️⃣ Cliquez sur **Create** pour enregistrer la règle.  

---

## 📋 **4. Fichier README.md**
Le fichier **README.md** doit inclure une section sur la **licence et les contributions**. Voici comment la présenter.

---

```markdown
---

## 📋 **License**

This project is licensed under the **GNU General Public License v3.0**.  
You are free to copy, distribute, and modify the software under the terms of the license.  
See the [LICENSE](./LICENSE) file for full license details.

---

## 🤝 **Contributing**

We welcome contributions from everyone! Here's how you can contribute:

1. **Fork this repository** and create a new branch.
2. **Make your changes** and **run tests**.
3. **Submit a pull request** for review.

For more details, see the [CONTRIBUTING.md](./CONTRIBUTING.md) file.

---

# 🛠️ **Contribuer à la Carnaverone Secure OS Suite**

Merci de considérer une contribution à la **Carnaverone Secure OS Suite** ! Nous accueillons toutes les contributions, qu'il s'agisse de corrections de bogues, d'améliorations de fonctionnalités, de mises à jour de la documentation ou de nouvelles fonctionnalités.

---

## 🚀 **Comment contribuer ?**

1️⃣ **Forkez ce dépôt** : Cliquez sur le bouton **“Fork”** en haut de cette page.  
2️⃣ **Créez une nouvelle branche** : 
   ```bash
   git checkout -b feature/ma-nouvelle-fonctionnalite


---

## 🔐 **Branch Protection and Contribution Rules** / **Règles de Protection des Branches et Contributions**

To ensure the stability and quality of the project, we have implemented strict branch protection rules for the `main` branch. These rules are designed to prevent unauthorized changes, ensure code quality, and enforce collaborative workflows.

Pour garantir la stabilité et la qualité du projet, nous avons mis en place des règles strictes de protection pour la branche `main`. Ces règles visent à empêcher les modifications non autorisées, assurer la qualité du code et renforcer les workflows collaboratifs.

---

### 🛠️ **Rules Applied** / **Règles Appliquées**

1. **No direct commits / Pas de commits directs :**  
   All changes must go through a Pull Request (PR).  
   Toutes les modifications doivent passer par une Pull Request (PR).

2. **Code reviews required / Revue de code requise :**  
   At least one reviewer must approve the PR before merging.  
   Au moins un relecteur doit approuver la PR avant la fusion.

3. **Status checks required / Tests automatisés requis :**  
   All automated tests must pass before merging.  
   Tous les tests doivent réussir avant la fusion.

4. **Force pushes disabled / Pushs forcés désactivés :**  
   Force pushes are blocked to preserve the branch history.  
   Les pushs forcés sont bloqués pour préserver l'historique de la branche.

5. **Branch deletion restricted / Suppression de la branche restreinte :**  
   The `main` branch cannot be deleted.  
   La branche `main` ne peut pas être supprimée.

6. **Signed commits required / Commits signés requis :**  
   All commits must be verified with a GPG signature (if enabled).  
   Tous les commits doivent être vérifiés avec une signature GPG (si activée).

---

### 🤝 **How to Contribute / Comment Contribuer**

We welcome contributions from everyone! Here’s how you can contribute:  
Nous acceptons les contributions de tous ! Voici comment contribuer :

1. **Fork this repository / Forkez ce dépôt :**  
   Create your own copy by clicking the "Fork" button.  
   Créez votre propre copie en cliquant sur le bouton "Fork".

2. **Create a new branch / Créez une nouvelle branche :**  
   ```bash
   git checkout -b feature/my-new-feature

git checkout -b feature/ma-nouvelle-fonctionnalité

    Make your changes and test them locally / Apportez vos modifications et testez-les localement.

    Push your changes / Poussez vos modifications :

git push origin feature/my-new-feature

    git push origin feature/ma-nouvelle-fonctionnalité

    Submit a Pull Request (PR) / Soumettez une Pull Request (PR) :
    Go to the Pull Requests tab and open a new PR.
    Accédez à l'onglet Pull Requests et ouvrez une nouvelle PR.
