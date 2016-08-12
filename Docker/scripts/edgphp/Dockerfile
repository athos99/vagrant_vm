### Run docker command :
## docker pull centos
## sudo docker build --rm .
### docker run -d -p 83:80 --name <iddudocker>
### docker run -d -p 83:80 --name edgphp edgphp

### sudo docker ps -a
### sudo docker ps -a | grep edgphp
### sudo docker rm <iddudocker>
### sudo docker build -t edgphp  --rm .
### sudo docker run -it --rm -p 83:80 --name edgphp edgphp ou sudo docker run -d -p 83:80 --name edgphp edgphp
FROM centos:latest
#FROM rhel7:latest
#ENV http_proxy=http://@proxygeadm.etat-ge.ch:3128
RUN echo -e "[centos]\nname=centos\nbaseurl=http://mirror.centos.org/centos/7/os/x86_64/\nmirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=centosplus\nenabled=1\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7" | tee /etc/yum.repos.d/centos.repo
RUN yum clean all
RUN yum update -y
#RUN yum -y install httpd
#RUN yum -y install httpd-tools.x86_64
#RUN yum -y install telnet
RUN yum -y install php.x86_64
RUN yum -y install php-bcmath.x86_64
RUN yum -y install php-cli.x86_64
RUN yum -y install php-mbstring.x86_64
RUN yum -y install php-fpm.x86_64
RUN yum -y install php-intl.x86_64
RUN yum -y install php-gd.x86_64

##############Configuration apache######
#####/etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule access_compat_module modules\/mod_access_compat.so/#LoadModule access_compat_module modules\/mod_access_compat.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule actions_module modules\/mod_actions.so/#LoadModule actions_module modules\/mod_actions.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule auth_basic_module modules\/mod_auth_basic.so/#LoadModule auth_basic_module modules\/mod_auth_basic.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule auth_digest_module modules\/mod_auth_digest.so/#LoadModule auth_digest_module modules\/mod_auth_digest.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_anon_module modules\/mod_authn_anon.so/#LoadModule authn_anon_module modules\/mod_authn_anon.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_core_module modules\/mod_authn_core.so/#LoadModule authn_core_module modules\/mod_authn_core.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_dbd_module modules\/mod_authn_dbd.so/#LoadModule authn_dbd_module modules\/mod_authn_dbd.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_dbm_module modules\/mod_authn_dbm.so/#LoadModule authn_dbm_module modules\/mod_authn_dbm.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_socache_module modules\/mod_authn_socache.so/#LoadModule authn_socache_module modules\/mod_authn_socache.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authn_file_module modules\/mod_authn_file.so/#LoadModule authn_file_module modules\/mod_authn_file.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authz_dbd_module modules\/mod_authz_dbd.so/#LoadModule authz_dbd_module modules\/mod_authz_dbd.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authz_dbm_module modules\/mod_authz_dbm.so/#LoadModule authz_dbm_module modules\/mod_authz_dbm.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authz_groupfile_module modules\/mod_authz_groupfile.so/#LoadModule authz_groupfile_module modules\/mod_authz_groupfile.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule authz_owner_module modules\/mod_authz_owner.so/#LoadModule authz_owner_module modules\/mod_authz_owner.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule cache_module modules\/mod_cache.so/#LoadModule cache_module modules\/mod_cache.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule cache_disk_module modules\/mod_cache_disk.so/#LoadModule cache_disk_module modules\/mod_cache_disk.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule data_module modules\/mod_data.so/#LoadModule data_module modules\/mod_data.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule dbd_module modules\/mod_dbd.so/#LoadModule dbd_module modules\/mod_dbd.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule dumpio_module modules\/mod_dumpio.so/#LoadModule dumpio_module modules\/mod_dumpio.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule echo_module modules\/mod_echo.so/#LoadModule echo_module modules\/mod_echo.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule env_module modules\/mod_env.so/#LoadModule env_module modules\/mod_env.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule ext_filter_module modules\/mod_ext_filter.so/#LoadModule ext_filter_module modules\/mod_ext_filter.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule filter_module modules\/mod_filter.so/#LoadModule filter_module modules\/mod_filter.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule info_module modules\/mod_info.so/#LoadModule info_module modules\/mod_info.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule logio_module modules\/mod_logio.so/#LoadModule logio_module modules\/mod_logio.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule mime_magic_module modules\/mod_mime_magic.so/#LoadModule mime_magic_module modules\/mod_mime_magic.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule remoteip_module modules\/mod_remoteip.so/#LoadModule remoteip_module modules\/mod_remoteip.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule slotmem_plain_module modules\/mod_slotmem_plain.so/#LoadModule slotmem_plain_module modules\/mod_slotmem_plain.so/g" /etc/httpd/conf.modules.d/00-base.conf
#RUN sed -i -e "s/^LoadModule slotmem_shm_module modules\/mod_slotmem_shm.so/#LoadModule slotmem_shm_module modules\/mod_slotmem_shm.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule socache_dbm_module modules\/mod_socache_dbm.so/#LoadModule socache_dbm_module modules\/mod_socache_dbm.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule socache_memcache_module modules\/mod_socache_memcache.so/#LoadModule socache_memcache_module modules\/mod_socache_memcache.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/#LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule substitute_module modules\/mod_substitute.so/#LoadModule substitute_module modules\/mod_substitute.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule suexec_module modules\/mod_suexec.so/#LoadModule suexec_module modules\/mod_suexec.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule unique_id_module modules\/mod_unique_id.so/#LoadModule unique_id_module modules\/mod_unique_id.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule buffer_module modules\/mod_buffer.so/#LoadModule buffer_module modules\/mod_buffer.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule watchdog_module modules\/mod_watchdog.so/#LoadModule watchdog_module modules\/mod_watchdog.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule heartbeat_module modules\/mod_heartbeat.so/#LoadModule heartbeat_module modules\/mod_heartbeat.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule heartmonitor_module modules\/mod_heartmonitor.so/#LoadModule heartmonitor_module modules\/mod_heartmonitor.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule usertrack_module modules\/mod_usertrack.so/#LoadModule usertrack_module modules\/mod_usertrack.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule dialup_module modules\/mod_dialup.so/#LoadModule dialup_module modules\/mod_dialup.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule charset_lite_module modules\/mod_charset_lite.so/#LoadModule charset_lite_module modules\/mod_charset_lite.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule log_debug_module modules\/mod_log_debug.so/#LoadModule log_debug_module modules\/mod_log_debug.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule ratelimit_module modules\/mod_ratelimit.so/#LoadModule ratelimit_module modules\/mod_ratelimit.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule reflector_module modules\/mod_reflector.so/#LoadModule reflector_module modules\/mod_reflector.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule request_module modules\/mod_request.so/#LoadModule request_module modules\/mod_request.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule sed_module modules\/mod_sed.so/#LoadModule sed_module modules\/mod_sed.so/g" /etc/httpd/conf.modules.d/00-base.conf
RUN sed -i -e "s/^LoadModule speling_module modules\/mod_speling.so/#LoadModule speling_module modules\/mod_speling.so/g" /etc/httpd/conf.modules.d/00-base.conf
####/etc/httpd/conf.modules.d/00-dav.conf
RUN sed -i -e "s/^LoadModule dav_module modules\/mod_dav.so/#LoadModule dav_module modules\/mod_dav.so/g" /etc/httpd/conf.modules.d/00-dav.conf
RUN sed -i -e "s/^LoadModule dav_fs_module modules\/mod_dav_fs.so/#LoadModule dav_fs_module modules\/mod_dav_fs.so/g" /etc/httpd/conf.modules.d/00-dav.conf
RUN sed -i -e "s/^LoadModule dav_lock_module modules\/mod_dav_lock.so/#LoadModule dav_lock_module modules\/mod_dav_lock.so/g" /etc/httpd/conf.modules.d/00-dav.conf
####/etc/httpd/conf.modules.d/00-lua.conf
RUN sed -i -e "s/^LoadModule lua_module modules\/mod_lua.so/#LoadModule lua_module modules\/mod_lua.so/g" /etc/httpd/conf.modules.d/00-lua.conf
####/etc/httpd/conf.modules.d/00-mpm.conf
#### TODO : on laisse pour le moment prefork active ou activable
####/etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule lbmethod_bybusyness_module modules\/mod_lbmethod_bybusyness.so/#LoadModule lbmethod_bybusyness_module modules\/mod_lbmethod_bybusyness.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule lbmethod_byrequests_module modules\/mod_lbmethod_byrequests.so/#LoadModule lbmethod_byrequests_module modules\/mod_lbmethod_byrequests.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule lbmethod_bytraffic_module modules\/mod_lbmethod_bytraffic.so/#LoadModule lbmethod_bytraffic_module modules\/mod_lbmethod_bytraffic.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule lbmethod_heartbeat_module modules\/mod_lbmethod_heartbeat.so/#LoadModule lbmethod_heartbeat_module modules\/mod_lbmethod_heartbeat.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_ajp_module modules\/mod_proxy_ajp.so/#LoadModule proxy_ajp_module modules\/mod_proxy_ajp.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_balancer_module modules\/mod_proxy_balancer.so/#LoadModule proxy_balancer_module modules\/mod_proxy_balancer.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_connect_module modules\/mod_proxy_connect.so/#LoadModule proxy_connect_module modules\/mod_proxy_connect.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_express_module modules\/mod_proxy_express.so/#LoadModule proxy_express_module modules\/mod_proxy_express.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_fdpass_module modules\/mod_proxy_fdpass.so/#LoadModule proxy_fdpass_module modules\/mod_proxy_fdpass.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_ftp_module modules\/mod_proxy_ftp.so/#LoadModule proxy_ftp_module modules\/mod_proxy_ftp.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_http_module modules\/mod_proxy_http.so/#LoadModule proxy_http_module modules\/mod_proxy_http.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
RUN sed -i -e "s/^LoadModule proxy_scgi_module modules\/mod_proxy_scgi.so/#LoadModule proxy_scgi_module modules\/mod_proxy_scgi.so/g" /etc/httpd/conf.modules.d/00-proxy.conf
####/etc/httpd/conf.modules.d/00-ssl.conf
#### INFO : SSL  non present dans la version RHSCL - LoadModule ssl_module modules/mod_ssl.so
####/etc/httpd/conf.modules.d/conf.modules.d/00-systemd.conf
# FOR RHEL STD
#RUN sed -i -e "s/^LoadModule systemd_module modules\/mod_systemd.so/#LoadModule systemd_module modules\/mod_systemd.so/g" /etc/httpd/conf.modules.d/00-systemd.conf
####/etc/httpd/conf.modules.d/01-cgi.conf
RUN sed -i -e "s/^   LoadModule cgid_module modules\/mod_cgid.so/#LoadModule cgid_module modules\/mod_cgid.so/g" /etc/httpd/conf.modules.d/01-cgi.conf
RUN sed -i -e "s/^   LoadModule cgi_module modules\/mod_cgi.so/#LoadModule cgi_module modules\/mod_cgi.so/g" /etc/httpd/conf.modules.d/01-cgi.conf
############### Remise a plat de la configuration apache #############################
RUN mv /etc/httpd/conf.d/userdir.conf /etc/httpd/conf.d/userdir.orig
RUN mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.orig
RUN touch /etc/httpd/conf.d/userdir.conf
RUN touch /etc/httpd/conf.d/welcome.conf
RUN sed -i -e "s/^    Options Indexes FollowSymLinks/    Options -Indexes -FollowSymLinks/g" /etc/httpd/conf/httpd.conf
RUN sed -i -e "s/^    Require all granted/#    Require all granted/g" /etc/httpd/conf/httpd.conf
RUN echo -e 'ServerSignature Off' | tee -a /etc/httpd/conf/httpd.conf
RUN echo -e 'ServerTokens Prod' | tee -a /etc/httpd/conf/httpd.conf
############### Remise Ã lat conf PHPFPM ##################################################
RUN mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.orig
RUN touch /etc/php-fpm.d/www.conf
RUN mv /etc/httpd/conf.d/php.conf /etc/httpd/conf.d/php.orig
RUN touch /etc/httpd/conf.d/php.conf

################# Creation user et espace #################################################
RUN groupadd -g 30000 intcti
RUN useradd -u 30000 -s /bin/false -d /home/intcti -m -g intcti intcti
ENV x=01
ENV y=00
ENV z=02
ENV envi="dev"
ENV rec="rec"
ENV dev="dev"
ENV prd="prod"
RUN mkdir /srv/www/
#for x in $(seq -w ${y} +1 ${z})
RUN groupadd -g 200${x} site00${x}
ENV x=01
RUN useradd -u 200${x} -s /bin/bash -d /srv/www/00${x}_site -m -g site00${x} -G adm site00${x}
#RUN echo "${site}${site}" | passwd --stdin $site
RUN usermod -a -G site00${x} intcti
#RUN echo "intcti         ALL = NOPASSWD:         /bin/chown intcti /srv/www/*" > /etc/sudoers.d/drupal
RUN usermod -a -G  site00${x} apache
RUN usermod -a -G  site00${x} site0001
RUN mkdir -p /srv/www/00${x}_site/{htdocs,media,config}
RUN chmod 770 /srv/www/00${x}_site/{htdocs,media,config}
RUN chmod 770 /srv/www/00${x}_site
RUN touch /srv/www/00${x}_site/htdocs/index.php
RUN echo -e "${server}-vh${x}\n<?php\nphpinfo();\n?>\n" | tee /srv/www/00${x}_site/htdocs/index.php
RUN touch /srv/www/00${x}_site/config/config.new | echo -e "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"no\" ?>\n<!DOCTYPE InstancesDIAG SYSTEM \"test.dtd\">\n<softwarecomponents>\n<softwarecomponent>\n    <editeur_produit>php.net</editeur_produit>\n    <version_produit>5.4</version_produit>\n    <logiciel_produit>php applications</logiciel_produit>\n    <version_composant>7.x</version_composant>\n    <nom_composant>APPLICATION PHP</nom_composant>\n    <type_composant>PHP module</type_composant>\n    <env>${envi}</env>\n    <instance>${envi}1</instance>\n    <nom>proto.induscms003.9999</nom>\n    <domaine>proto</domaine>\n    <databases>\n       <database type=\"mysql\" login=\"todo\" db=\"drupal_todo\" pwd=\"todo\" server=\"capri.ceti.etat-ge.ch\"/> <!-- recupere-->\n    </databases>\n    <urls>\n       <url_provided>http://${server}-vh${x}.ceti.etat-ge.ch/uri;https://${envi}.ceti.etat-ge.ch/uri;https://cmsadmin.${envi}.ceti.etat-ge.ch/uri</url_provided>\n        <url_used>\n            <url>http://www.todo.org</url>\n       </url_used>\n    </urls>\n    <proxies>\n        <proxy></proxy>\n    </proxies>\n    <reverseproxies>\n        <reverseproxy>${envi}.ceti.etat-ge.ch</reverseproxy>\n    </reverseproxies>\n </softwarecomponent>\n  <softwarecomponent>\n  </softwarecomponent>\n</softwarecomponents>\n" | tee /srv/www/00${x}_site/config/config.new
RUN chmod 440 /srv/www/00${x}_site/config/config.new
RUN chown -R site00${x}:site00${x} /srv/www/00${x}_site

#################  creation VH ###############################################################
RUN touch /etc/httpd/conf.d/00${x}_site.conf
RUN echo -e "\nServerName http://popeye.ceti.etat-ge.ch\n<VirtualHost *:80>\nServerName http://popeye.ceti.etat-ge.ch\n#ServerAlias ${server}-vh${x}.ceti.etat-ge.ch\nUseCanonicalName On\nUseCanonicalPhysicalPort Off\n\nDocumentRoot /srv/www/00${x}_site/htdocs\nErrorLog /var/log/httpd/00${x}_site.error.log\nCustomLog /var/log/httpd/00${x}_site.access.log combined\nDirectoryIndex index.html index.php\n\nOptions -Indexes\nProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:90${x}/srv/www/00${x}_site/htdocs/$1\n\n<Directory /srv/www/00${x}_site/htdocs>\nOptions FollowSymLinks\nRequire all granted\nAllowOverride All\n</Directory>\n\n</VirtualHost>\n" | tee /etc/httpd/conf.d/00${x}_site.conf
############## PHP -FPM ######################################################################
#################  creation php-fpm ###########################################################
RUN touch /etc/php-fpm.d/00${x}_site.orig
RUN echo -e "\n[00${x}site]\nuser = site00${x}\ngroup = site00${x}\nlisten = 127.0.0.1:90${x}\nlisten.allowed_clients = 127.0.0.1\npm = dynamic\npm.max_children = 50\npm.start_servers = 5\npm.min_spare_servers = 5\npm.max_spare_servers = 35\nslowlog = /var/opt/rh/rh-php56/log/php-fpm/www-site00${x}-slow.log\nphp_admin_value[error_log] = /var/opt/rh/rh-php56/log/php-fpm/www-site00${x}-error.log\nphp_admin_flag[log_errors] = on\nphp_value[session.save_handler] = files\nphp_value[session.save_path]    = /var/lib/php/session\n#php_value[soap.wsdl_cache_dir]  = /var/lib/php/wsdlcache\nphp_value[memory_limit] = 256M\nphp_admin_value[upload_max_filesize] = 40M\nphp_admin_value[post_max_size] = 40M\nphp_value[max_execution_time] = 60\nphp_admin_value[expose_php] = off\nphp_admin_value[allow_url_fopen] = off\nphp_admin_value[apc.rfc1867] = 1\nphp_admin_value[open_basedir] = '/srv/www/00${x}_site/:/tmp/:/srv/www/applications/'\nphp_admin_value[date.timezone] = 'Europe/Zurich'\n"| tee /etc/php-fpm.d/00${x}_site.orig
RUN chmod 777 /var/lib/php/session/
RUN mv /etc/php-fpm.d/00${x}_site.orig /etc/php-fpm.d/00${x}_site.conf
############## RUN PHP FPM #################################################################
#RUN /sbin/php-fpm -D && sbin/httpd -k start
#RUN /sbin/httpd -DFOREGROUND && /sbin/php-fpm -DFOREGROUND
RUN echo -e "#!/bin/bash\n/sbin/php-fpm -D\nexec /usr/sbin/apachectl -DFOREGROUND\n" | tee /run.sh
RUN chmod +x /run.sh
EXPOSE 80
CMD ["/run.sh"]



