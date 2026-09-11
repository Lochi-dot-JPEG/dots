#!/bin/sh

YTLINKS="host.youtube.com
mx.youtube.com
admin.youtube.com
devel.youtube.com
stats.youtube.com
http.youtube.com
mx0.youtube.com
administration.youtube.com
development.youtube.com
svn.youtube.com
id.youtube.com
mx1.youtube.com
ads.youtube.com
devsql.youtube.com
syslog.youtube.com
adserver.youtube.com
images.youtube.com
mysql.youtube.com
devtest.youtube.com
info.youtube.com
news.youtube.com
alerts.youtube.com
dhcp.youtube.com
test1.youtube.com
internal.youtube.com
noc.youtube.com
alpha.youtube.com
direct.youtube.com
test2.youtube.com
internet.youtube.com
ns.youtube.com
ap.youtube.com
dmz.youtube.com
testing.youtube.com
intra.youtube.com
ns0.youtube.com
apache.youtube.com
dns.youtube.com
upload.youtube.com
intranet.youtube.com
ns1.youtube.com
app.youtube.com
dns0.youtube.com
vm.youtube.com
ipv6.youtube.com
ns2.youtube.com
apps.youtube.com
dns1.youtube.com
vnc.youtube.com
lab.youtube.com
ns3.youtube.com
appserver.youtube.com
dns2.youtube.com
ldap.youtube.com
aptest.youtube.com
download.youtube.com
vpn.youtube.com
linux.youtube.com
ops.youtube.com
auth.youtube.com
en.youtube.com
web.youtube.com
local.youtube.com
oracle.youtube.com
backup.youtube.com
erp.youtube.com
web2test.youtube.com
log.youtube.com
owa.youtube.com
beta.youtube.com
eshop.youtube.com
whois.youtube.com
pbx.youtube.com
blog.youtube.com
exchange.youtube.com
www.youtube.com
s3.youtube.com
f5.youtube.com
secure.youtube.com
chat.youtube.com
fileserver.youtube.com
www2.youtube.com
server.youtube.com
citrix.youtube.com
firewall.youtube.com
xml.youtube.com
main.youtube.com
shop.youtube.com
cms.youtube.com
forum.youtube.com
manage.youtube.com
sip.youtube.com
corp.youtube.com
mgmt.youtube.com
crs.youtube.com
mirror.youtube.com
sql.youtube.com
cvs.youtube.com
git.youtube.com
mobile.youtube.com
squid.youtube.com
database.youtube.com
gw.youtube.com
help.youtube.com
monitor.youtube.com
ssh.youtube.com
db.youtube.com
mssql.youtube.com
ssl.youtube.com
demo.youtube.com
helpdesk.youtube.com
mta.youtube.com
dev.youtube.com
home.youtube.com"

SLACKLINKS="slack.com
slackb.com
app.slack.com
slack-edge.com
slack-imgs.com
slackdns.com"

REDDITLINKS="i.redditmedia.com
www.reddithelp.com
g.redditmedia.com
a.thumbs.redditmedia.com
redditgifts.com
i.redd.it
old.reddit.com
new.reddit.com
reddit.com
gateway.reddit.com
oauth.reddit.com
sendbird.reddit.com
v.redd.it
b.thumbs.redditmedia.com
events.reddit.com
stats.redditmedia.com
www.redditstatic.com
www.reddit.com
pixel.redditmedia.com
www.redditmedia.com
about.reddit.com
out.reddit.com
events.redditmedia.com
e.reddit.com
s.redditmedia.com
gql.reddit.com
alb.reddit.com
sendbirdproxy-06490ff42851cbcc5.chat.redditmedia.com
sendbirdproxy-003d8d1fb8653f6f8.chat.redditmedia.com
sendbirdproxy-04ea6c3f71aac3e3f.chat.redditmedia.com"

ALL="$YTLINKS
$REDDITLINKS
$SLACKLINKS"

declare -A options=(
[Reddit]=$REDDITLINKS
[Youtube]=$YTLINKS
[Slack]=$SLACKLINKS
)

declare -A times=(
[02 min]=120
[05 min]=300
[10 min]=600
[20 min]=1200
[20s]=20
)

COMMANDS="unblock
blockall"

if [[ $1 == "" ]]; then
		COMMAND=$(echo "$COMMANDS" | sk)
		if [[ $(echo $?) != 0 ]]; then
				exit
		fi
else
		COMMAND=$1
fi

if [[ $COMMAND == "blockall" ]]; then
		for i in $ALL; do
				echo $i
				hostess add $i 0.0.0.0
		done
		exit
fi

KEYS=""
for key in "${!options[@]}"; do 
		KEYS+="${key}\n"
done

TIME_KEYS=""
for key in "${!times[@]}"; do 
		TIME_KEYS+="${key}\n"
done

OUTCHOICE=$(echo -e $KEYS | head -c -1 | sort | sk -p "site")
if [[ $(echo $?) != 0 ]]; then
		exit
fi
OUT=${options[$OUTCHOICE]}
TIMECHOICE=$(echo -e $TIME_KEYS | head -c -1 | sort | sk -p "time ")
if [[ $(echo $?) != 0 ]]; then
		exit
fi
TIME=${times[$TIMECHOICE]}

echo "$OUT"
echo "$TIME"

for entry in $OUT; do
		hostess rm $entry 0.0.0.0
done

sleep $TIME

for entry in $OUT; do
		hostess add $entry 0.0.0.0
done

