#!/bin/bash
###############################################
#
#  Author:
#    Johan Chassaing
#
#  License:
#    GPL
#
#  Dependencies:
#    zimbra
#
#  Info: 
#    Zimbra export user information as csv
#
#    account;status;firstname;lastname;aliases
#
#
###############################################

###############################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by# the Free Software Foundation, either version 3 of the License, or
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>. 
#
###############################################


DOMAINS=( domain1 domain2 domain3 )

# parse domains
for domain in ${DOMAINS[@]} ; do

    for a in `cat /tmp/mngaccounts.txt`; do

        accountinfo=$(zmprov ga $a)
        lastname=$(echo "$accountinfo" | grep "sn:" | awk -F": " '{print $2}' )
        fistname=$(echo "$accountinfo" | grep "givenName:" | awk  -F": " '{print $2}' )
        zimbrastatus=$(echo "$accountinfo" | grep "zimbraAccountStatus:" | awk -F": " '{print $2}')
        zimbraMailAlias=$(echo "$accountinfo" | grep "zimbraMailAlias:" | awk -F": " '{print $2}')
        currentalias=""
    
        for alias in `echo "$zimbraMailAlias"`; do
            currentalias="$currentalias;$alias"
        done

        echo "$a;$zimbrastatus;$fistname;$lastname;$currentalias"

    done

done    
