#! /bin/sh -x


install() {
    url=$1
    installer=$2
    serial_number=$3
    
    wget -q $url/$installer.dmg
    #hdiutil attach $installer.dmg
    #/Volumes/$installer/install.sh -sn $serial_number -eula -it 1
}

f_url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15081/
f_installer=m_fcompxe_online_2019.2.040
c_url=http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15080/
c_installer=m_ccompxe_online_2019.2.040
serial_number=${IC_PSXE_SN}

install($f_url, $f_installer, $serial_number)
install($c_url, $c_installer, $serial_number)

