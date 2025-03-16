sudo apt-get install -y wget gpg
# Télécharger et enregistrer la clé de Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg > /dev/null

# Ajouter le dépôt de Visual Studio Code
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Mettre à jour les paquets et installer VS Code
sudo apt update
sudo apt install -y code