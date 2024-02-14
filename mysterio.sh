#!/bin/bash
function CEKIP () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IPVPS=$(curl -sS https://raw.githubusercontent.com/Telorswich/penamas/master/penak | grep $MYIP | awk '{print $4}')
if [[ $MYIP == $IPVPS ]]; then
domain
Genjerr2
else
  key2
  domain
  Genjerr2
fi
}
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
rm -rf /etc/RafanSC
mkdir -p /etc/RafanSC
mkdir -p /etc/RafanSC/theme
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│              MASUKKAN NAMA KAMU          │${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $name =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan Nama Kamu Disini tanpa spasi : " -e name
done
rm -rf /etc/profil
echo "$name" > /etc/profil
echo ""
clear
author=$(cat /etc/profil)
echo ""
echo ""

function key2(){
clear
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│ \033[1;37mPlease select a your Choice              ${tyblue}│${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│  [ 1 ]  \033[1;37mTRIAL 1 HARI      ${NC}"
echo -e "${tyblue}│  "                                        
echo -e "${tyblue}│  [ 2 ]  \033[1;37mMEMBER SUDAH BELI     ${NC}"
echo -e "${tyblue}│     "                                     
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
until [[ $key =~ ^[12]+$ ]]; do 
read -p "   Please select numbers 1 atau 2 : " key
done
if [[ $key == "1" ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/api
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/email
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "1 days" +"%Y-%m-%d")
mkdir /root/Telorswich
cd /root/Telorswich
wget https://raw.githubusercontent.com/Telorswich/penamas/master/penak >/dev/null 2>&1
echo "### $author $hhari $MYIP @trial" >> penak
sleep 1
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add penak 
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/penamas >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/penamas >/dev/null 2>&1
sleep 1
rm -rf /root/Telorswich
rm -rf /etc/github
clear
fi
if [[ $key == "2" ]]; then
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│              MASUKKAN LICENSE KEY        │${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
read -rp "Masukan Key Kamu Disini (Ctrl + C Exit) : " -e kode

if [ -z $kode ]; then
echo -e "KODE SALAH SILAHKAN MASUKKAN ULANG KODENYA"
key2
fi
LIST=$(curl -sS https://raw.githubusercontent.com/Telorswich/license/master/key | grep $kode | awk '{print $2}')
Key=$(curl -sS https://raw.githubusercontent.com/Telorswich/license/master/key | grep $kode | awk '{print $3}')
KEY2=$(curl -sS https://raw.githubusercontent.com/Telorswich/license/master/key | grep $kode | awk '{print $4}')
ADMIN=$(curl -sS https://raw.githubusercontent.com/Telorswich/license/master/key | grep $kode | awk '{print $5}')
TOTALIP=$(curl -sS https://raw.githubusercontent.com/Telorswich/license/master/key | grep $kode | awk '{print $6}')
cd
if [[ $kode == "PENAMAS" ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/api
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/email
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "30 days" +"%Y-%m-%d")
mkdir /root/Telorswich
cd /root/Telorswich
wget https://raw.githubusercontent.com/Telorswich/license/master/key >/dev/null 2>&1

echo "### $author $hhari $MYIP @Rafanstr18" >> penak

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add penak 
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/penamas >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/penamas >/dev/null 2>&1
sleep 0.5
rm penak
elif [[ $kode == "PENAMASVVIP" ]]; then
MYIP2=$(curl -sS ipv4.icanhazip.com)
author2=$(cat /etc/profil)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/api
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/email
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari2=$(date -d "999 days" +"%Y-%m-%d")
mkdir /root/Telorswich
cd /root/Telorswich
wget https://raw.githubusercontent.com/Telorswich/penamas/master/penak >/dev/null 2>&1

sed -i "/# VIP/a ### ${author2} ${hhari2} ${MYIP2} ON 999 VIP" /root/RafanSC/penak

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add penak 
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/penamas >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/penamas >/dev/null 2>&1
sleep 0.5
rm penak
elif [[ $kode == "PENAMASDMIN" ]]; then
MYIP3=$(curl -sS ipv4.icanhazip.com)
author3=$(cat /etc/profil)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/api
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/email
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari3=$(date -d "999 days" +"%Y-%m-%d")
mkdir /root/Telorswich
cd /root/Telorswich
wget https://raw.githubusercontent.com/Telorswich/penamas/master/penak >/dev/null 2>&1

sed -i "/# RESELLER/a ### ${author3} ${hhari3} ${MYIP3} ON 999" /root/RafanSC/penak

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add penak 
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/penamas >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/penamas >/dev/null 2>&1
sleep 0.5
rm penak
elif [[ $kode == $Key ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/api
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/email
curl -s https://pastebin.com/raw/iXbLmUfh > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "$KEY2 days" +"%Y-%m-%d")
mkdir /root/Telorswich
cd /root/Telorswich
wget https://raw.githubusercontent.com/Telorswich/penamas/master/penak >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i "/# RESELLER/a ### ${author} ${hhari} ${MYIP} ${ADMIN} ${TOTALIP}" /root/RafanSC/penak
else
echo "### $author $hhari $MYIP @$LIST" >> penak
fi

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add penak 
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/penamas >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/penamas >/dev/null 2>&1
sleep 0.5
rm penak
wget https://raw.githubusercontent.com/Telorswich/license/master/key >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i "/^### $LIST $Key $KEY2 $ADMIN $TOTALIP/d" /root/RafanSC/key
else
sed -i "/^### $LIST $Key $KEY2/d" /root/RafanSC/key
fi
sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add key
git commit -m register >/dev/null 2>&1
git branch -M master >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/master/license >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/master/license >/dev/null 2>&1
rm -rf /root/Telorswich
rm -rf /etc/github
clear
else
echo -e "KODE SALAH SILAHKAN MASUKKAN ULANG KODENYA"
sleep 1
key2
fi
fi
}
function domain(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mUpdate Domain.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}
res1() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/bismillahirahmanirohim.sh && chmod +x bismillahirahmanirohim.sh && ./bismillahirahmanirohim.sh
clear
}
res2() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/bismillahirahmanirohim1.sh && chmod +x bismillahirahmanirohim1.sh && ./bismillahirahmanirohim1.sh
clear
}
clear
cd
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│ \033[1;37mPlease select a your Choice to Set Domain${tyblue}│${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│  [ 1 ]  \033[1;37mDomain kamu sendiri       ${NC}"
echo -e "${tyblue}│  "                                        
echo -e "${tyblue}│  [ 2 ]  \033[1;37mDomain Yang Punya Script     ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
until [[ $domain =~ ^[132]+$ ]]; do 
read -p "   Please select numbers 1 atau 2 : " domain
done
if [[ $domain == "1" ]]; then
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│              \033[1;37mTERIMA KASIH                ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│                \033[1;37mDARI SAYA                 ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Masukan domain kamu Disini : " -e dnss
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dnss" > /root/domain
echo "$dnss" > /root/scdomain
echo "$dnss" > /etc/xray/scdomain
echo "$dnss" > /etc/v2ray/scdomain
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
echo ""
clear
fi
if [[ $domain == "2" ]]; then
clear
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│ \033[1;37mPlease select a your Choice to Set Domain${tyblue}│${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│  [ 1 ]  \033[1;37mDomain xxx.vps-ku.my.id         ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
until [[ $domain2 =~ ^[1-5]+$ ]]; do 
read -p "   Please select numbers 1 : " domain2
done
fi
if [[ $domain2 == "1" ]]; then
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│  \033[1;37mContoh subdomain xxx.vps-ku.my.id        ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│    \033[1;37mxxx jadi subdomain kamu               ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn1
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn1" > /root/subdomainx
cd
sleep 1
fun_bar 'res1'
clear
rm /root/subdomainx
elif [[ $domain2 == "2" ]]; then
clear
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│  \033[1;37mDomain xxx.net-cyber.my.id            ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│    \033[1;37mxxx jadi domain kamu               ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn2
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn2" > /root/subdomainx
cd
sleep 1
fun_bar 'res2'
clear
fi
if [[ $domain == "3" ]]; then
clear
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│              \033[1;37mTERIMA KASIH                ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│                \033[1;37mDARI SAYA                 ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $dns1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Masukan domain kamu Disini : " -e dns1
done
echo ""
echo "$dns1" > /etc/xray/domain
echo "$dns1" > /etc/v2ray/domain
echo "IP=$dns1" > /var/lib/ipvps.conf
clear
echo ""
echo -e  "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e  "${tyblue}│              \033[1;37mTERIMA KASIH                ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}│                \033[1;37mDARI SAYA                 ${tyblue}│${NC}" | lolcat
echo -e  "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
echo " "
until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan Domain SlowDNS kamu Disini : " -e dns2
done
echo $dns2 >/etc/xray/dns
fi
}
cat <<EOF>> /etc/RafanSC/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/RafanSC/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/RafanSC/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/RafanSC/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/RafanSC/theme/magenta
BG : \E[40;1;95m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/RafanSC/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/RafanSC/theme/color.conf
red
EOF
function RafanSC2(){
cd
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
clear
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/tools.sh &> /dev/null
chmod +x tools.sh 
bash tools.sh
clear
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
}
function RafanSC3(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mSedang Menginstal File \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mSedang Menginstal File \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}


res2() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
} 

res3() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
}

res4() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
}

res5() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
}

res6() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
}

res7() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/menu/update.sh && chmod +x update.sh && ./update.sh
clear
}

res8() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/slowdns/installsl.sh && chmod +x installsl.sh && ./installsl.sh
clear
}

res9() {
wget https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/install/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
clear
}

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│      PROCESS INSTALLED SSH & OPENVPN     │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res2'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│           PROCESS INSTALLED XRAY         │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res3'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│       PROCESS INSTALLED WEBSOCKET SSH    │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res4'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│       PROCESS INSTALLED BACKUP MENU      │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res5'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│           PROCESS INSTALLED OHP          │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res6'


echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│           DOWNLOAD EXTRA MENU            │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res7'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│           DOWNLOAD SYSTEM                │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res8'

echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│           DOWNLOAD UDP COSTUM            │${NC}" | lolcat
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}" | lolcat
fun_bar 'res9'
}

function iinfo(){
TIMES="10"
CHATID="-1001796404259"
KEY="6269531379:AAHXp-4nxp2b0nK4vVePV5G0iiUNxxLFxBg"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain | awk -F. '{ print $1".xxx.xxx.xxx" }')
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
MYIP=$(curl -sS ipv4.icanhazip.com | awk -F. '{ print $1"."$2".xxx.xxx" }')
IZIN=$(curl -sS https://raw.githubusercontent.com/RafanSC/penamas/master/penak | grep $MYIP | awk '{print $3}' )
d1=$(date -d "$IZIN" +%s)
d2=$(date -d "$today" +%s)
EXP=$(( (d1 - d2) / 86400 ))

TEXT="
<code>◇━━━━━━━━━━━━━━━━━━━◇</code>
<code> 🕊AUTOSCRIPT PREMIUM🕊</code>
<code>◇━━━━━━━━━━━━━━━━━━━◇</code>
<code>NAME : </code><code>${author}</code>
<code>TIME : </code><code>${TIME} WIB</code>
<code>DOMAIN : </code><code>${domain}</code>
<code>IP : </code><code>${MYIP}</code>
<code>ISP : </code><code>${ISP} $CITY</code>
<code>OS LINUX : </code><code>${MODEL2}</code>
<code>RAM : </code><code>${RAMMS} MB</code>
<code>EXP SCRIPT : </code><code>$EXP Days</code>
<code>◇━━━━━━━━━━━━━━━━━━━◇</code>
<i>Automatic Notification From Installer Client...</i>
"'&reply_markup={"inline_keyboard":[[{"text":"🛂ᴏʀᴅᴇʀ","url":"https://t.me/RafanSTR18"},{"text":"🎲GRUP","url":"https://t.me/vpnmix_1"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
}

CEKIP
RafanSC3
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/RafanSC/asmaulchusna/master/versi  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
cd
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=8d40b538d9162e >> /etc/xray/city
curl -s ipinfo.io/org?token=8d40b538d9162e  | cut -d " " -f 2-10 >> /etc/xray/isp
rm /root/setup.sh >/dev/null 2>&1
rm /root/slhost.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/set-br.sh >/dev/null 2>&1
rm /root/ohp.sh >/dev/null 2>&1
rm /root/update.sh >/dev/null 2>&1
rm /root/slowdns.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 3
echo  ""
cd
iinfo
rm -rf *
echo -e "${tyblue}┌────────────────────────────────────────────┐${NC}" | lolcat
echo -e "${tyblue}│  Install SCRIPT SELESAI..                  │${NC}" | lolcat
echo -e "${tyblue}└────────────────────────────────────────────┘${NC}" | lolcat
echo  ""
sleep 1
echo -e "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi