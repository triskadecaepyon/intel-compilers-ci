#! /bin/sh -x

if [ "${IS_LICENSE_TYPE}" = ISS ]; then
    url=http://registrationcenter-download.intel.com/akdlm/irc_nas/emb/15167
    installer=system_studio_2019_update_2_ultimate_edition
    ext=tar.gz
    mkdir -p /opt/intel/bin
    ln -s /opt/intel/system_studio_2019/bin/iccvars.sh /opt/intel/bin
    if [ -z "${IS_ISS_SERIAL_NUMBER}" ]; then
	echo Set IS_ISS_SERIAL_NUMBER to the serial number for your license
	exit 1
    fi
    serial_number=$IS_ISS_SERIAL_NUMBER
else
    if [ "${IS_LICENSE_TYPE}" = PSXE ]; then
	url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15093
	installer=parallel_studio_xe_2019_update2_composer_edition_for_cpp_online
    elif [ "${IS_LICENSE_TYPE}" = PSXE_FORTRAN ]; then
	url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15092
	installer=parallel_studio_xe_2019_update2_composer_edition_online
    else
	echo Set IS_LICENSE_TYPE to one of ISS, PSXE, PSXE_FORTRAN
	exit 1
    fi
    if [ -z "${IS_PSXE_SERIAL_NUMBER}" ]; then
	echo Set IS_PSXE_SERIAL_NUMBER to the serial number for your license
	exit 1
    fi
    serial_number=$IS_PSXE_SERIAL_NUMBER
    ext=tgz
fi

wget $url/$installer.$ext
tar zxf $installer.$ext
sed -e "s/IS_SERIAL_NUMBER/$serial_number/" < intel-compilers/$installer.tpl > $installer.cfg
$installer/install.sh --silent $installer.cfg
