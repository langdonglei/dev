# 准备工作
## 安装扩展并配置
xdebug.log = /var/log/xdebug // 可选 但有用  
xdebug.mode = debug // 必选 启用开关 v2是 enabel = 1  
xdebug.discover_client_host = true          // 三选一 任意ip都可以连接  
xdebug.client_client = 192.168.50.222       // 三选一 指定ip才允许连接  
xdebug.client_client = host.docker.internal // 三选一 环境部署在docker  


# 监听触发 主动脚本

## 主动脚本
### PHP Web Page 不需要配置解释器 只要配置servers(远程和docker必须映射好 **本地项目根目录** 和 **远程项目根目录** ) 然后就可以打断线点虫子了
### PHP HTTP Request 同上
### php Script 不需要配置servers 只需要配置解释器
#### 配置运行项 选好启动脚本 一定要选择默认解释器
#### 配置默认解释器 本机解释器不用映射目录 远程解释器需要手动映射目录 docker会自动映射(自动映射与servers映射无关)

## 监听触发
### request
```
无需设置interpreter 无需设置deployment 无需设置server(当监听捕获到xdeubg请求时会自动创建server--nginx必须设置server_name否则phpstorm无法处理)
只需打开监听,然后从任意客户端传递一个调试信号:比如?XDEBUG_SESSION_START等
```
