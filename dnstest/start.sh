#!/bin/bash                                                                                                                                                                                    

# 定义域名文件和DNS服务器
DOMAIN_FILE="domains.txt"
DNS_SERVER="223.5.5.5"  


total_time=0
count=0


while IFS= read -r domain
do
    query_time=$(dig @$DNS_SERVER +noall +stats "$domain" | grep 'Query time' | awk '{print $4}')
    
    total_time=$((total_time + query_time))
    
    count=$((count + 1))
    
    echo "Domain: $domain, Query time: ${query_time}ms"
done < "$DOMAIN_FILE"

if [ "$count" -ne 0 ]; then
    avg_time=$((total_time / count))
    echo "Average Query time using DNS server $DNS_SERVER: ${avg_time}ms"
else
    echo "No domains to query."
fi
