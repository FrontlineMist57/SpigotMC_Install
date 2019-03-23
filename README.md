# SpigotMC_Install
Spigot minecraft server build script

<b><u>Prerequistes:</u></b><br>
  You must be a sudo user, ie. in the sudoers group, or the root user to install run this script.<br>
  Running as root is NOT recommended!<br>

<b><u>Installation:</u></b><br>
  If your server system: Amazon Linux/CentOS/Fedora<br>
  Excecute the commands below from your servers console<br>

<pre>
sudo yum -y install git
git clone https://github.com/Rapitharian/SpigotMC_Install.git
mv $HOME/SpigotMC_Install/installmc.sh $HOME
chmod +x *.sh
./installmc.sh 2>&1 | tee -a SpigotMC_Install.log
</pre>
