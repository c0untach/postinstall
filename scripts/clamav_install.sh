# configure clamav
sed -i -e "s/^NotifyClamd/#NotifyClamd/g" /etc/clamav/freshclam.conf

# enable clamav-daemon
systemctl is-enabled clamav-daemon && systemctl status clamav-daemon

#stop clamav-freshclam service
systemctl stop clamav-freshclam

# update clamav database
freshclam

#re-start clamav-freshclam service
systemctl start clamav-freshclam

# check status
systemctl status clamav-freshclam
