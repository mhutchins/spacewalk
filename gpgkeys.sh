KEY_DIR="/var/www/html/pub/RPM-KEYS"

mkdir -p $KEY_DIR

SPACECMD="spacecmd -q -y --"

for chan in $($SPACECMD softwarechannel_list)
do
	echo "Chan: $chan"
	URL_LIST="$URL_LIST $($SPACECMD softwarechannel_details $chan | grep 'GPG URL:' | awk '{print $3}' )"
done

echo "Collecting GPG keys:"
for url in $(for url in $URL_LIST ; do echo $url ; done | sort | uniq )
do
	echo "	$url"
	wget -q -P $KEY_DIR $url
done


