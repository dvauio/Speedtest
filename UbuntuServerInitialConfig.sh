# One line run
# sudo curl https://raw.githubusercontent.com/dvauio/Speedtest/main/UbuntuServerInitialConfig.sh -o /opt/UbuntuServerInitialConfig.sh && chmod +x /opt/UbuntuServerInitialConfig.sh |bash /opt/UbuntuServerInitialConfig.sh

# Make folder for Script
sudo mkdir -m 777 /opt/speedtest

# Move to Bin Folder
sudo cd /opt/speedtest

# Update OS
sudo apt install software-properties-common -y
sudo apt update && sudo apt upgrrade -y

# Apt over HTTPS
sudo apt install apt-transport-https gnupg1 dirmngr -y

#install Python3
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3 -y

# Install & Enable Fail2ban
sudo apt install fail2ban -y
sudo systemctl status fail2ban
sudo cp /etc/fail2ban/jail.{conf,local}

#Install Speedtest CLI
curl -L https://packagecloud.io/ookla/speedtest-cli/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/speedtestcli-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/speedtestcli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/debian/ $(lsb_release -cs) main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
sudo apt update
sudo apt install speedtest -y
speedtest
