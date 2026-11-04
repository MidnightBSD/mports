# Deploying Magus Web App

There are two configuration options: CGI or fast cgi

        <Directory "/home/mbsd/magus">
                Require all granted
                Allow from all
                AllowOverride All
        </Directory>

## CGI

inside apache virtual host config:
```
   Alias /magus/elements/ "/home/mbsd/magus/elements/"
   ScriptAlias /magus/auth/ "/home/mbsd/magus/auth/"
   ScriptAlias /magus "/home/mbsd/magus/index.cgi"
```

## Fast CGI swith spawn_fcgi plus mod_proxy_fcgi

inside apache virtual host config:

```
ProxyPass /magus/auth !
ProxyPassMatch ^/magus/(.*)$ fcgi://127.0.0.1:9001/home/mbsd/magus/index.cgi/$1
        <Location "/magus">
         ProxyFCGISetEnvIf "true" TRUE
        SetEnvIf Request_URI "^/magus(/.*)$" PATH_INFO=$1
        </Location>
```

Also need this in /etc/rc.conf

```
spawn_fcgi_enable="YES"
spawn_fcgi_app="/home/mbsd/magus/index.cgi"
spawn_fcgi_bindport="9001"
spawn_fcgi_children="10"
```
