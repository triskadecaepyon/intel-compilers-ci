#! /bin/sh

installer=parallel_studio_xe_2019_update2_composer_edition_online
cfg=intel-compilers-cfg-linux
wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15092/$installer.tgz
tar zxf $installer.tgz
if [ -z "${ACTIVATION_SERIAL_NUMBER}" ]; then
    echo Set ACTIVATION_SERIAL_NUMBER to the serial number for your license
else
    sed -e "s/ACTIVATION_SERIAL_NUMBER_VALUE/$ACTIVATION_SERIAL_NUMBER/" < $cfg.tpl > $cfg.cfg
    $installer/install.sh --silent $cfg.cfg
fi  
