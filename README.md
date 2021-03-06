# SpigotMC_Install
Spigot minecraft server build script

<b><u>Prerequistes:</u></b><br>
  You must be a sudo user, ie. in the sudoers group, or the root user to install run this script.<br>
  Running as root is NOT recommended!<br>
  It is recommended you create a new user minecraft for the installation.  Instructions below under "New User Setup."

<b><u>Installation:</u></b><br>
  If your server system: Amazon Linux/CentOS/Fedora<br>
  Excecute the commands below from your servers console<br>
  First, install git on the server. <br>
<pre>
sudo yum -y install git
</pre>
<br>
  Second clone this project and run the install script<br>
<pre>
git clone https://github.com/Frontesque/SpigotMC_Install.git
mv $HOME/SpigotMC_Install/installmc.sh $HOME
chmod +x *.sh
./installmc.sh 2>&1 | tee -a SpigotMC_Install.log
</pre>

<b><u>Cleanup:</u></b><br>
Remove the installation script installmc.sh<br>
If you don't need the installation log, remove that as well.<br>
<pre>
rm installmc.sh
rm SpigotMC_Install.log
</pre>

<b><u>New User Setup:</u></b><br>
Create a minecraft user.<br>
set the password for the minecraft user<br>
Make the minecraft user a sudoer (run admin commands with elevated permissions)
<pre>
sudo useradd minecraft
sudo passwd minecraft
sudo usermod -aG wheel minecraft
</pre>
Log out and log back into the server as the user minecraft.<br>
