#!/bin/bash  
set -vx  
  
export ROOT_HOME=/root  
echo "#  add by digoal" >>$ROOT_HOME/.bashrc  
echo "alias rm='rm -i'" >>$ROOT_HOME/.bashrc  
echo "alias cp='cp -i'" >>$ROOT_HOME/.bashrc  
echo "alias ll='ls -larth'" >>$ROOT_HOME/.bashrc  
echo "alias mv='mv -i'" >>$ROOT_HOME/.bashrc  
echo "export PGHOME=/usr/lib/postgresql/14" >>$ROOT_HOME/.bashrc  
echo "export PATH=\$PGHOME/bin:\$PATH" >>$ROOT_HOME/.bashrc  
echo "export LD_LIBRARY_PATH=\$PGHOME/lib:/usr/local/lib:/usr/lib/aarch64-linux-gnu:\$LD_LIBRARY_PATH" >>$ROOT_HOME/.bashrc  
echo "export PGDATA=/var/lib/postgresql/14/pgdata" >>$ROOT_HOME/.bashrc  
echo "export PGUSER=postgres" >>$ROOT_HOME/.bashrc  
echo "export PGHOST=\$PGDATA" >>$ROOT_HOME/.bashrc  
echo "export PGPORT=1921" >>$ROOT_HOME/.bashrc  
echo "export PGDATABASE=postgres" >>$ROOT_HOME/.bashrc  
echo "export LC_ALL=en_US.UTF-8" >>$ROOT_HOME/.bashrc  
. $ROOT_HOME/.bashrc  
  
export PG_HOME=/var/lib/postgresql  
echo "#  add by digoal" >>$PG_HOME/.bash_profile  
echo "alias rm='rm -i'" >>$PG_HOME/.bash_profile  
echo "alias cp='cp -i'" >>$PG_HOME/.bash_profile  
echo "alias ll='ls -larth'" >>$PG_HOME/.bash_profile  
echo "alias mv='mv -i'" >>$PG_HOME/.bash_profile  
echo "export PGHOME=/usr/lib/postgresql/14" >>$PG_HOME/.bash_profile  
echo "export PATH=\$PGHOME/bin:\$PATH" >>$PG_HOME/.bash_profile  
echo "export LD_LIBRARY_PATH=\$PGHOME/lib:/usr/local/lib:/usr/lib/aarch64-linux-gnu:\$LD_LIBRARY_PATH" >>$PG_HOME/.bash_profile  
echo "export PGDATA=/var/lib/postgresql/14/pgdata" >>$PG_HOME/.bash_profile  
echo "export PGUSER=postgres" >>$PG_HOME/.bash_profile  
echo "export PGHOST=\$PGDATA" >>$PG_HOME/.bash_profile  
echo "export PGPORT=1921" >>$PG_HOME/.bash_profile  
echo "export PGDATABASE=postgres" >>$PG_HOME/.bash_profile  
echo "export LC_ALL=en_US.UTF-8" >>$PG_HOME/.bash_profile  
  
echo ". ~/.bash_profile" > $PG_HOME/.profile  
chown postgres:postgres $PG_HOME/.bash_profile  
chown postgres:postgres $PG_HOME/.profile  
