# nginx debug
index off;
autoindex on;
rewrite_log on;
default_type text/html;
return 200 'default_server';

# nginx header
location / {
  # always 只是指定了在所有状态码都要添加此头 但是 如果子模块（也包括if模块）中有新添加的header 则会被子模块丢弃 如果没有新添加 子模块则会继承
  add_header 'test' 'asdf' always;
}

if ($request_method = 'OPTIONS') {
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
add_header 'Access-Control-Max-Age' 1728000;
add_header 'Content-Type' 'text/plain; charset=utf-8';
add_header 'Content-Length' 0;
return 200;
}
if ($request_method = 'GET') {
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
}
if ($request_method = 'POST') {
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
}

# nginx log
if ($time_iso8601 ~ '(\d{4}-\d{2}-\d{2})'){
  set $date $1;
}
access_log /var/log/nginx/access_$date.log main;

# nginx timeout
    fastcgi_connect_timeout 300;
    fastcgi_send_timeout    300;
    fastcgi_read_timeout    300;

# nginx body    
client_max_body_size 100M;



