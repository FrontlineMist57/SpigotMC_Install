# SpigotMC_Install
Spigot minecraft server build script

Prerequistes:
  You must be a sudo user, ie. in the sudoers group, or the root user to install run this script.
  Running as root is NOT recommended!

Installation:
  If your server system: Amazon Linux/CentOS/Fedora
  Excecute the commands below from your servers console

sudo yum -y install git
git clone https://github.com/Rapitharian/SpigotMC_Install.git
mv $HOME/SpigotMC_Install/installmc.sh $HOME
chmod +x *.sh
./installmc.sh
