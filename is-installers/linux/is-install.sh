#! /bin/sh

product_year=2019
update_number=3
irc_id=15272
url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/${irc_id}
installer=parallel_studio_xe_${product_year}_update${update_number}_composer_edition_online
ext=tgz
license_dir=/opt/intel/licenses

wget -q $url/$installer.$ext
[ $? != 0 ] && echo $0: Error, download of $url/$installer.$ext failed && exit 1
tar zxf $installer.$ext
mkdir -p $license_dir
[ -z "${IS_LICENSE_DATA_LINUX}" ] && echo $0: Error, set IS_LICENSE_DATA_LINUX and try again && exit 1
printenv IS_LICENSE_DATA_LINUX | openssl base64 -d -A > $license_dir/license.lic
$installer/install.sh --silent is-installers/linux/silent.cfg
