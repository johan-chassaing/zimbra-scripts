# zimbra-scripts
Scripts for zimbra

## mailbox_size.sh
Script to print all mailboxes with: name quota size and last login time

### Manual
Edit and configure the server:

 	SERVER=localhost
 

## delete_domains.sh
Script to delete one or severals domains, starting by accounts, calendar ressources and finaly distribution list.

### Manual
Edit and configure the domains list:

 	#One domain
 	DOMAINS=( domain1 )
 	#Severals domain:
 	DOMAINS=( domain1 domain2 )


Get help

	# delete_domains.sh -h

Dry run mode

	# delete_domains.sh

Delete mode

	# delete_domains.sh -d
