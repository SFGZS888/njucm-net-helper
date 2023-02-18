#!/bin/sh
sed -i 's/user/'"$USERNAME"'/g; s/pwd/'"$PASSWORD"'/g' /etc/crontabs/root
crond -f
