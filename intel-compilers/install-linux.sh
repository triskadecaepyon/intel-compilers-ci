#! /bin/sh

echo $IC_LICENSE_TYPE
if [ "${IC_LICENSE_TYPE}" = SS ]; then
    url=http://registrationcenter-download.intel.com/akdlm/irc_nas/emb/15167
    installer=system_studio_2019_update_2_ultimate_edition
    ext=tar.gz
    mkdir -p /opt/intel/bin
    ln -s /opt/intel/system_studio_2019/bin/iccvars.sh /opt/intel/bin
    if [ -z "${IC_SS_SN}" ]; then
	echo Set IC_SS_SN to the serial number for your license
	exit 1
    fi
    serial_number=$IC_SS_SN
else
    if [ "${IC_LICENSE_TYPE}" = PSXE ]; then
	url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15093
	installer=parallel_studio_xe_2019_update2_composer_edition_for_cpp_online
    elif [ "${IC_LICENSE_TYPE}" = PSXE_FORTRAN ]; then
	url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15092
	installer=parallel_studio_xe_2019_update2_composer_edition_online
    else
	echo Set IC_LICENSE_TYPE to one of SS, PSXE, PSXE_FORTRAN
	exit 1
    fi
    if [ -z "${IC_PSXE_SN}" ]; then
	echo Set IC_PSXE_SN to the serial number for your license
	exit 1
    fi
    serial_number=$IC_PSXE_SN
    ext=tgz
fi

wget -q $url/$installer.$ext
tar zxf $installer.$ext
sed -e "s/IC_SERIAL_NUMBER/$serial_number/" < intel-compilers/$installer.tpl > $installer.cfg
$installer/install.sh --silent $installer.cfg
