# Add private key to cache on demand. 
ssh-add -l >/dev/null || ssh-add
