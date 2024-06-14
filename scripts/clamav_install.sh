# configure clamav
sed -i -e "s/^NotifyClamd/#NotifyClamd/g" /etc/clamav/freshclam.conf

#stop clamav-freshclam service
systemctl stop clamav-freshclam

# update clamav database
freshclam

#re-start clamav-freshclam service
systemctl start clamav-freshclam
