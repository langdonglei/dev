# postgresql 密码是空 需要手动初始化 postgresql-setup --init

# 初始化
postgresql-setup --init

# 设置远程登陆
echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/data/pg_hba.conf

# 修改密码
su postgres -c "psql -c \"alter user postgres with password 'postgres'\";"
