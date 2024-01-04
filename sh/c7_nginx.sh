set -ex
cat > /etc/yum.repos.d/nginx.repo << 'EOF'
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF

yum install -y nginx

cp /conf/default.conf                  /etc/nginx/conf.d/default.conf
sed -i 's|root /www|root /www/public|' /etc/nginx/conf.d/default.conf
sed -i 's|user  nginx|user  root|'     /etc/nginx/nginx.conf

