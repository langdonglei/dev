[mysqld]
skip-host-cache
skip-name-resolve
#bind-address=0.0.0.0
#max_connect_errors=10
#character-set-server=utf8
#default-storage-engine=INNODB
#default_authentication_plugin=mysql_native_password
[mysql]
mysql -uroot --execute "update mysql.user set host = '%' where user = 'root';"
mysql -uroot --execute "alter user root identified with mysql_native_password by 'root';"
mysql -uroot --execute "flush privileges;"
修改远程登录
update mysql.user set host = '%' where user = 'root';flush privileges;
用户操作
select user, host, plugin, authentication_string from user
CREATE USER 'xxx'@'%' IDENTIFIED WITH mysql_native_password BY 'xxx';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxx';
权限操作
show grants for 'xxh'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'xxh'@'%'；
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON *.* TO 'xxh'@'%';

postgresql 密码是空 需要手动初始化 postgresql-setup --init

postgresql-setup --init
echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/data/pg_hba.conf
systemctl start postgresql
su postgres -c "psql -c \"alter user postgres with password 'postgres'\";"

xdebug web调试 使用笔记
1 xdebug配置文件
    开启 enabel=1|mode=debug
    并
    discover_client_host=true 来着不拒模式(本机 vs 实体机|虚拟机)  或者 指定了client_client=xxx(本机 vs 实体机|虚拟机) (docker容器必须client_client=host.docker.internal)

2 PHPSTORM配置解释器 本机解释器不用映射目录 远程解释器需要手动映射目录 docker会自动映射目录(自动映射的目录与servers映射无关)
3 PHPSTORM配置servers 远程和docker必须映射目录
4 点开监听小按钮 然后请求带着XDEUBG_SEESION不管值是啥 GET或者cookies都行 
