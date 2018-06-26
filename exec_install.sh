#!/bin/sh

exec_env="$ENV"
eccube_install="$ECCUBE_INSTALL"
if [ $eccube_install = "0" ]; then
  exec_env=""
fi

case "$exec_env" in
"production" )
  echo "$exec_env"
  php eccube_install.php pgsql none --skip-createdb --skip-initdb -V
  sed -i -e "s|${PWD}|/app|" ${PWD}/app/config/eccube/path.yml
;;
"staging" )
  echo "$exec_env"
  php eccube_install.php pgsql none --skip-createdb --skip-initdb -V
  sed -i -e "s|${PWD}|/app|" ${PWD}/app/config/eccube/path.yml
;;
"dev" )
  echo "$exec_env"
  php eccube_install.php pgsql none --skip-createdb -V
  sed -i -e "s|${PWD}|/app|" ${PWD}/app/config/eccube/path.yml
;;
"" )
  echo "(blank)"
  php eccube_install.php pgsql none --skip-createdb -V
  sed -i -e "s|${PWD}|/app|" ${PWD}/app/config/eccube/path.yml
;;
esac
