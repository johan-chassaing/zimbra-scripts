#!/bin/bash
##########################################
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
#    Print account quota 
#    mailboxsize and last login time
#
#
##########################################

##########################################
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
##########################################


##########################################
#
#               Variables
#
##########################################

SERVER=localhost


##########################################
#
#               Main
#
##########################################

echo "account quota size lastlogin"

# show all account quota size and last connection
zmprov gqu ${SERVER} | while read line
do
  account=`echo $line | cut -f1 -d " "`
  quota=`echo $line | cut -f2 -d " "`
  size=`echo $line | cut -f3 -d " "`

  #get account last connection
  lastLogonTime=$(zmprov --server ${SERVER} ga $account | grep -i zimbraLastLogonTimestamp | awk '{print $2}' )
  if [ "$lastLogonTime" = "" ]; then
    lastLogonStatus="0"
  else
    lastLogonStatus=${lastLogonTime:0:8}
  fi

  echo "$account $quota $size $lastLogonStatus"
done
  
