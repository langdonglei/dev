# 修改远程登录
update mysql.user set host = '%' where user = 'root';flush privileges;

# 用户操作
select user, host, plugin, authentication_string from user
CREATE USER 'xxx'@'%' IDENTIFIED WITH mysql_native_password BY 'xxx';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'xxx';

# 权限操作
show grants for 'xxh'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'xxh'@'%'；
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON *.* TO 'xxh'@'%';

# 执行命令
mysql -uroot --execute "update mysql.user set host = '%' where user = 'root';"
mysql -uroot --execute "alter user root identified with mysql_native_password by 'root';"
mysql -uroot --execute "flush privileges;"