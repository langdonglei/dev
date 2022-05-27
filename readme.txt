

# mysql      密码是空 需要手动修改远程登录 update mysql.user set host = '%' where user = 'root';flush privileges;
# postgresql 密码是空 需要手动初始化 postgresql-setup --init


# todo
# mysql -uroot --execute "update mysql.user set host = '%' where user = 'root';"
# mysql -uroot --execute "alter user root identified with mysql_native_password by 'root';"
# mysql -uroot --execute "flush privileges;"

# todo
# postgresql-setup --init
# echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
# echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/data/pg_hba.conf
# systemctl start postgresql
# su postgres -c "psql -c \"alter user postgres with password 'postgres'\";"



# 用户操作
# select user, host, plugin, authentication_string from user
# CREATE USER 'xxx'@'%' IDENTIFIED WITH mysql_native_password BY 'xxx';
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxx';

# 权限操作
# show grants for 'xxh'@'%';
# GRANT ALL PRIVILEGES ON *.* TO 'xxh'@'%'；
# GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON *.* TO 'xxh'@'%';


xdebug
只要服务端配置开启 enabel=1|mode=debug
并
discover_client_host=true 来着不拒模式(本机 vs 实体机|虚拟机)  或者 指定了client_client=xxx(本机 vs 实体机|虚拟机) (docker容器必须client_client=host.docker.internal)
这两个条件满足的情况下 只要请求cookies或GET里带着 XDEUBG_SEESION 不管值是啥 都能激活


还需要配置好带有xdebug的解释器 本机解释器 不用映射目录   远程解释器需要手动映射目录  docker会自动映射目录



