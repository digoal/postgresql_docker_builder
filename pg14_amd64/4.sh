#!/bin/bash  
set -vx  
  
echo "* soft    nofile  1024000" >> /etc/security/limits.conf  
echo "* hard    nofile  1024000" >> /etc/security/limits.conf  
echo "* soft    nproc   unlimited" >> /etc/security/limits.conf  
echo "* hard    nproc   unlimited" >> /etc/security/limits.conf  
echo "* soft    core    unlimited" >> /etc/security/limits.conf  
echo "* hard    core    unlimited" >> /etc/security/limits.conf  
echo "* soft    memlock unlimited" >> /etc/security/limits.conf  
echo "* hard    memlock unlimited" >> /etc/security/limits.conf  
