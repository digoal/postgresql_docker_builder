#!/bin/bash  
set -vx  
  
export PG_HOME=/var/lib/postgresql  
. $PG_HOME/.bash_profile  
initdb -D $PGDATA -U postgres -E UTF8 --lc-collate=C --lc-ctype=en_US.UTF8  
  
cd $PGDATA  
echo "host all all 0.0.0.0/0 scram-sha-256" >> ./pg_hba.conf  
  
echo "listen_addresses = '0.0.0.0'" >> ./postgresql.auto.conf		  
echo "port = 1921" >> ./postgresql.auto.conf				  
echo "max_connections = 2000" >> ./postgresql.auto.conf			  
echo "unix_socket_directories = '., /var/run/postgresql'" >> ./postgresql.auto.conf	  
echo "shared_buffers = 128MB" >> ./postgresql.auto.conf			  
echo "dynamic_shared_memory_type = posix" >> ./postgresql.auto.conf	  
echo "vacuum_cost_delay = 0" >> ./postgresql.auto.conf			  
echo "bgwriter_delay = 20ms" >> ./postgresql.auto.conf			  
echo "bgwriter_lru_maxpages = 500" >> ./postgresql.auto.conf		  
echo "bgwriter_lru_multiplier = 5.0" >> ./postgresql.auto.conf		  
echo "max_parallel_workers_per_gather = 0" >> ./postgresql.auto.conf	  
echo "synchronous_commit = off" >> ./postgresql.auto.conf		  
echo "wal_compression = on" >> ./postgresql.auto.conf		  
echo "wal_writer_delay = 10ms" >> ./postgresql.auto.conf		  
echo "max_wal_size = 1GB " >> ./postgresql.auto.conf  
echo "min_wal_size = 80MB " >> ./postgresql.auto.conf  
echo "random_page_cost = 1.1" >> ./postgresql.auto.conf			  
echo "log_destination = 'csvlog'" >> ./postgresql.auto.conf		  
echo "logging_collector = on" >> ./postgresql.auto.conf		  
echo "log_truncate_on_rotation = on" >> ./postgresql.auto.conf		  
echo "log_timezone = 'Etc/UTC' " >> ./postgresql.auto.conf  
echo "autovacuum = on" >> ./postgresql.auto.conf			  
echo "autovacuum_vacuum_cost_delay = 0ms" >> ./postgresql.auto.conf	  
echo "vacuum_freeze_table_age = 750000000 " >> ./postgresql.auto.conf  
echo "vacuum_multixact_freeze_table_age = 750000000 " >> ./postgresql.auto.conf  
echo "datestyle = 'iso, mdy' " >> ./postgresql.auto.conf  
echo "timezone = 'Etc/UTC' " >> ./postgresql.auto.conf  
echo "lc_messages = 'en_US.UTF-8'" >> ./postgresql.auto.conf			  
echo "lc_monetary = 'en_US.UTF-8'" >> ./postgresql.auto.conf			  
echo "lc_numeric = 'en_US.UTF-8'" >> ./postgresql.auto.conf			  
echo "lc_time = 'en_US.UTF-8'" >> ./postgresql.auto.conf				  
echo "default_text_search_config = 'pg_catalog.english'" >> ./postgresql.auto.conf  
