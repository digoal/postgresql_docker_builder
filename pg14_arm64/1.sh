#!/bin/bash  
set -vx  
  
cd /tmp  
sed -i "s@http://\(deb\|security\).debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list  
apt-get update  
apt-get reinstall -y apt-transport-https ca-certificates  
sed -i "s@http://mirrors.aliyun.com@https://mirrors.aliyun.com@g" /etc/apt/sources.list  
apt-get update  
apt-get install -y lsb-release wget vim man  
  
# RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list  
echo "deb https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list  
apt-get install -y gnupg2  
  
# RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -  
wget --quiet -O - https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ACCC4CF8.asc | apt-key add -  
apt-get update  
apt-get install -y locales  
localedef -i en_US -f UTF-8 en_US.UTF-8  
  
apt-get install -y curl libicu-dev icu-devtools libbison-dev libfl-dev git libreadline-dev libedit-dev g++ make cmake man-db dnsutils clang libssl-dev default-jdk strace gdb libsqlite3-dev lsof blktrace  
apt-get install -y unixodbc unixodbc-dev bash-completion m4 python3-distutils python glibc-source zlib1g-dev pkg-config default-jre openjdk-17-jdk openjdk-17-jdk-headless  
apt-get install -y postgresql-14 postgresql-client-14 postgresql-server-dev-14 postgresql-doc-14  
apt-get install -y postgresql-14-dirtyread postgresql-14-extra-window-functions postgresql-14-first-last-agg postgresql-14-hll postgresql-14-hypopg  
apt-get install -y postgresql-14-ip4r postgresql-14-mysql-fdw postgresql-14-jsquery postgresql-14-ogr-fdw postgresql-14-oracle-fdw postgresql-14-pgmemcache  
apt-get install -y postgresql-14-pljava postgresql-14-pllua postgresql-14-plpgsql-check postgresql-14-plproxy postgresql-14-prefix postgresql-14-rational  
apt-get install -y postgresql-14-rdkit postgresql-14-orafce postgresql-14-pg-qualstats postgresql-14-pg-stat-kcache  
apt-get install -y postgresql-14-pg-wait-sampling postgresql-14-pgfincore postgresql-14-pgaudit postgresql-14-pgpool2 postgresql-14-pgrouting postgresql-14-pgrouting-doc  
apt-get install -y postgresql-14-pgrouting-scripts postgresql-14-pgsphere postgresql-14-pgvector postgresql-14-pldebugger postgresql-14-pointcloud postgresql-14-plr  
apt-get install -y postgresql-14-postgis-3 postgresql-14-postgis-3-scripts postgresql-14-powa powa-collector postgresql-14-q3c postgresql-14-repack  
apt-get install -y postgresql-14-rum postgresql-14-show-plans postgresql-14-similarity postgresql-14-tablelog postgresql-14-tdigest postgresql-14-wal2json  
apt-get install -y postgresql-14-tds-fdw postgresql-14-plprofiler postgresql-14-cron  
apt-get install -y pgagroal pgpool2 pgbouncer pgxnclient pgagent postgresql-plpython3-14 postgresql-14-icu-ext libpq-dev pgreplay pgbackrest pgbackrest-doc elephant-shed-pgbackrest 
  
echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/timescaledb.list  
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | gpg --dearmor -o /etc/apt/trusted.gpg.d/timescaledb.gpg  
apt-get update  
apt-get install -y timescaledb-2-postgresql-14 timescaledb-toolkit-postgresql-14 timescaledb-2-loader-postgresql-14  
  
wget https://packages.groonga.org/debian/groonga-apt-source-latest-bullseye.deb  
apt-get install -y -V ./groonga-apt-source-latest-bullseye.deb  
apt-get update  
apt-get install -y postgresql-14-pgdg-pgroonga

apt-get install -y postgresql-14-credcheck postgresql-14-decoderbufs postgresql-14-mimeo postgresql-14-pgmp postgresql-14-preprepare postgresql-14-prioritize postgresql-14-squeeze postgresql-14-toastinfo postgresql-14-unit pgbadger pg-auto-failover-cli postgresql-14-auto-failover net-tools apt-utils ora2pg pgloader postgresql-14-partman

# 包安装方式暂不支持ARM架构
# https://dev.mysql.com/downloads/repo/apt/
# cd /tmp
# wget -T 36000 -t 0 --waitretry=5 https://repo.mysql.com//mysql-apt-config_0.8.28-1_all.deb
# dpkg -i mysql-apt-config_0.8.28-1_all.deb
# apt-get update
# apt-get install -y mysql-server
