#!/bin/sh
sed -i 's/user/'"$USERNAME"'/g; s/pwd/'"$PASSWORD"'/g; s/service/'"$SERVICE"'/g' /etc/crontabs/root     
crond -f
