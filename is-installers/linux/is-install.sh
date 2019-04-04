#! /bin/sh

url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15092
installer=parallel_studio_xe_2019_update2_composer_edition_online
ext=tgz
license_dir=/opt/intel/licenses

wget -q $url/$installer.$ext
tar zxf $installer.$ext
mkdir -p $license_dir
[ -z "${IS_LICENSE_DATA_LINUX}" ] && echo $0: Error, set IS_LICENSE_DATA_LINUX and try again && exit
printenv IS_LICENSE_DATA_LINUX | openssl base64 -d -A > $license_dir/license.lic
$installer/install.sh --silent is-installers/linux/silent.cfg
