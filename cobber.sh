cobbler distro remove --name centos-6

	KSMETA=""
	KSMETA="${KSMETA} org='1'"
	KSMETA="${KSMETA} media_path='/ks/dist/org/1/centos-6'"

cobbler distro add --name centos-6 \
	--initrd /var/satellite/rhn/kickstart/1/centos-6/images/pxeboot/initrd.img \
	--kernel /var/satellite/rhn/kickstart/1/centos-6/images/pxeboot/vmlinuz \
	--redhat-management-server $(hostname) \
	--redhat-management-key 1-centos6-x86_64 \
	--ksmeta="${KSMETA}" \
	--arch x86_64

cobbler profile remove --name centos-6
cobbler profile add --name centos-6 \
	--distro centos-6 \
	--kickstart /var/lib/cobbler/kickstarts/centos-6.ks 
	
	
