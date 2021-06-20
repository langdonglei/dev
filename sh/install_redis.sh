dnf install -y @redis:5

sed -i 's|bind 127.0.0.1|bind 0.0.0.0|g' /etc/redis.conf
sed -i 's|protected-mode yes|protected-mode no|g' /etc/redis.conf
sed -i 's|# requirepass foobared|requirepass foobared|g' /etc/redis.conf

systemctl enable redis
