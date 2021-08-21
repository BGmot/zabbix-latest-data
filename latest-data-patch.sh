#!/bin/bash

set -x
set -u
set -o

ZABBIX_INSTALL_PATH=/usr/share/zabbix

VERSION=5.4.3
ZABBIX_INSTALLED_VERSION=`grep ZABBIX_VERSION ${ZABBIX_INSTALL_PATH}/include/defines.inc.php | cut -d\' -f 4`

if [ "$VERSION" != "$ZABBIX_INSTALLED_VERSION" ]
then
  echo "Need Zabbix version ${VERSION} to be able to patch, found ${ZABBIX_INSTALLED_VERSION}"
  exit -1
fi

echo 'Patching WebUI files...'
cp ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatest.php ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatest.php-`date +%s`.bak
cp CControllerLatest.php ${ZABBIX_INSTALL_PATH}/app/controllers
cp ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatestView.php ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatestView.php-`date +%s`.bak
cp CControllerLatestView.php ${ZABBIX_INSTALL_PATH}/app/controllers
cp ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatestViewRefresh.php ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerLatestViewRefresh.php-`date +%s`.bak
cp CControllerLatestViewRefresh.php ${ZABBIX_INSTALL_PATH}/app/controllers
cp ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerProfileUpdate.php ${ZABBIX_INSTALL_PATH}/app/controllers/CControllerProfileUpdate.php-`date +%s`.bak
cp CControllerProfileUpdate.php ${ZABBIX_INSTALL_PATH}/app/controllers
cp ${ZABBIX_INSTALL_PATH}/app/partials/monitoring.latest.view.html.php ${ZABBIX_INSTALL_PATH}/app/partials/monitoring.latest.view.html.php-`date +%s`.bak
cp monitoring.latest.view.html.php ${ZABBIX_INSTALL_PATH}/app/partials/
cp ${ZABBIX_INSTALL_PATH}/app/views/js/monitoring.latest.view.js.php ${ZABBIX_INSTALL_PATH}/app/views/js/monitoring.latest.view.js.php-`date +%s`.bak
cp monitoring.latest.view.js.php ${ZABBIX_INSTALL_PATH}/app/views/js/
cp ${ZABBIX_INSTALL_PATH}/app/views/monitoring.latest.view.php ${ZABBIX_INSTALL_PATH}/app/views/monitoring.latest.view.php-`date +%s`.bak
cp monitoring.latest.view.php ${ZABBIX_INSTALL_PATH}/app/views/
cp ${ZABBIX_INSTALL_PATH}/include/classes/user/CProfile.php ${ZABBIX_INSTALL_PATH}/include/classes/user/CProfile.php-`date +%s`.bak
cp CProfile.php ${ZABBIX_INSTALL_PATH}/include/classes/user/
cp ${ZABBIX_INSTALL_PATH}/js/main.js ${ZABBIX_INSTALL_PATH}/js/main.js-`date +%s`.bak
cp main.js ${ZABBIX_INSTALL_PATH}/js/

echo 'Done! Reload your browser to see changes.'
