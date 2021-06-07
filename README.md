## Zabbix Latest Data fix from BGmot

### Why?
To address https://support.zabbix.com/browse/ZBX-19413
Today with 5.4 we have only long list of items, even cannot filter out effectively by proposed replacement application tags as we don't know which tags are present. You must scroll down through all items and find necessary tag, than copy-paste it to filter out.

Files in this repository fix the problem to some extent.

### Changes
Find all the changes in zabbix-latest-data.diff.

### Installation
On the server where your Zabbix WebUI installed execute following.
```
mkdir /tmp/zabbix-latest-data && cd /tmp/zabbix-latest-data
curl -L -o zabbix-latest-data.zip https://github.com/BGmot/zabbix-latest-data/archive/refs/tags/5.4.0.zip
unzip zabbix-latest-data.zip && cd zabbix-latest-data-5.4.0
# Modify ZABBIX_INSTALL_PATH in zabbix-latest-data.sh if needed.
sudo bash latest-data-patch.sh
```
The scripts creates .bak files for all the files it replaces.
