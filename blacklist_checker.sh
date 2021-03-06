#!/bin/bash
###################################
#  Corect method to check :
#
# ./blacklist_checker.sh IP address 
##################################  
RED='\033[0;31m'


BLISTS="

b.barracudacentral.org 
bb.barracudacentral.org
bl.deadbeef.com
bl.mailspike.net
bl.score.senderscore.com
bl.spamcannibal.org
bl.spamcop.net
bl.spameatingmonkey.net
blackholes.five-ten-sg.com
blacklist.woody.ch
bogons.cymru.com
cbl.abuseat.org
cdl.anti-spam.org.cn
combined.abuse.ch
combined.rbl.msrbl.net
db.wpbl.info
dnsbl-1.uceprotect.net
dnsbl-2.uceprotect.net
dnsbl-3.uceprotect.net
dnsbl.inps.de
dnsbl.sorbs.net
drone.abuse.ch
duinv.aupads.org
dul.dnsbl.sorbs.net
dul.ru
dyna.spamrats.com
dynip.rothen.com
http.dnsbl.sorbs.net
images.rbl.msrbl.net
ips.backscatterer.org
ix.dnsbl.manitu.net
korea.services.net
misc.dnsbl.sorbs.net
noptr.spamrats.com
ohps.dnsbl.net.au
omrs.dnsbl.net.au
orvedb.aupads.org
osps.dnsbl.net.au
osrs.dnsbl.net.au
owfs.dnsbl.net.au
owps.dnsbl.net.au
pbl.spamhaus.org
phishing.rbl.msrbl.net
probes.dnsbl.net.au
proxy.bl.gweep.ca
proxy.block.transip.nl
psbl.surriel.com
rbl.interserver.net
rdts.dnsbl.net.au
relays.bl.gweep.ca
relays.bl.kundenserver.de
relays.nether.net
residential.block.transip.nl
ricn.dnsbl.net.au
rmst.dnsbl.net.au
sbl.spamhaus.org
smtp.dnsbl.sorbs.net
socks.dnsbl.sorbs.net
spam.dnsbl.sorbs.net
spam.rbl.msrbl.net
spam.spamrats.com
spamlist.or.kr
spamrbl.imp.ch
t3direct.dnsbl.net.au
tor.dnsbl.sectoor.de
torserver.tor.dnsbl.sectoor.de
ubl.lashback.com
ubl.unsubscore.com
virbl.bit.nl
virus.rbl.msrbl.net
web.dnsbl.sorbs.net
wormrbl.imp.ch
xbl.spamhaus.org
zen.spamhaus.org
zombie.dnsbl.sorbs.net
"



reverse=$(echo $1 |
sed -ne "s~^\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)$~\4.\3.\2.\1~p")

for BL in ${BLISTS} ; do

printf "%-60s" " ${reverse}.${BL}."

listed="$(dig +short -t a ${reverse}.${BL}.)"

  if [[ $listed ]]; then
    
    if [[ $listed == *"timed out"* ]]; then

       echo "[timed out]" 

   else

      echo -e "${RED} [blacklisted] (${listed}) \e[0m" 

   fi
 else 

    echo "[not listed]"
 fi

done
   





