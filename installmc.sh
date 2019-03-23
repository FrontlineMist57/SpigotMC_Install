#! /bin/sh
RED='\033[0;31m'
NC='\033[0m' # No Color
read -e -p "What version of openjava would you like to install? [1.8.0]: " Java1
Java1=${Java1:-1.8.0}
read -e -p "What version of spigot would you like to install? [1.13.2]: " Spigot1
Spigot1=${Spigot1:-1.13.2}
sudo yum -y install update
sudo yum -y install java-$Java1-openjdk wget
mkdir spigotmc
cd spigotmc
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
wget https://cdn.getbukkit.org/spigot/spigot-$Spigot1.jar
mv spigot-1.13.2.jar spigot.jar
/bin/cat <<EOM >/$HOME/startmc.sh
#!/bin/sh
cd $HOME/spigotmc
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -DIReallyKnowWhatIAmDoingISwear -jar $HOME/spigotmc/spigot.jar
EOM
chmod +x /$HOME/startmc.sh
chmod +x *.jar 
$HOME/startmc.sh
sed -i 's/false.*/true/' $HOME/spigotmc/eula.txt
cd ..
sudo firewall-cmd --permanent --zone=public --add-port=25565/tcp
sudo systemctl restart firewalld
rm $HOME/spigotmc/server.properties
/bin/cat <<EOM >/$HOME/spigotmc/server.properties
#Minecraft server properties
#(File Modification Datestamp)
generator-settings=
op-permission-level=4
allow-nether=true
enforce-whitelist=false
level-name=world
enable-query=false
allow-flight=false
prevent-proxy-connections=false
server-port=25565
max-world-size=29999984
level-type=DEFAULT
enable-rcon=false
level-seed=geekspeak
force-gamemode=true
server-ip=
network-compression-threshold=256
max-build-height=256
spawn-npcs=true
white-list=false
spawn-animals=true
hardcore=false
snooper-enabled=true
resource-pack-sha1=
online-mode=true
resource-pack=
pvp=true
difficulty=1
enable-command-block=true
gamemode=0
player-idle-timeout=0
max-players=20
max-tick-time=60000
spawn-monsters=true
view-distance=10
generate-structures=true
motd=Setup by GeekSpeak.IT
EOM
mv $HOME/SpigotMC_Install/server-icon.png $HOME/spigotmc/
rm -rf $HOME/SpigotMC_Install
echo -e \n
echo 'To start your minecraft server type $RED"./startmc.sh"$NC and hit enter.'