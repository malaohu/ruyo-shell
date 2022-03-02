#!/bin/sh

# 数据库账号信息
DB_USER="root"
DB_PWD="oneinstack"
DB_HOST="127.0.0.1"
DB_PORT="3306"

# MYSQL所在目录
MYSQL_DIR="/usr/local/mysql"
# 备份文件存放目录
BAK_DIR="/data/backup/mysql"
# 时间格式化，如 20200902
DATE=`date +%Y%m%d`
# 备份脚本保存的天数
DEL_DAY=7

# 要备份的数据库，空格分隔
DATABASES=("manna", "manna_apps", "manna_auth", "manna_history", "manna_juno", "manna_juno_times", "manna_maint", "manna_patrol", "manna_stream")

# 创建日期目录
mkdir $BAK_DIR/$DATE

echo "-------------------$(date +%F_%T) start ---------------"  >>${BAK_DIR}/db_backup.log
for database in "${DATABASES[@]}"
do
    # 执行备份命令
    $MYSQL_DIR/bin/mysqldump --opt -u$DB_USER -p$DB_PWD -h$DB_HOST -P$DB_PORT ${database} > $BAK_DIR/$DATE/${database}.sql
done

echo "--- backup file created: $BAK_DIR/db_backup_$DATE.tar.gz"  >>${BAK_DIR}/db_backup.log

# 将备份好的sql脚本压缩到db_backup_yyyyMMdd.tar.gz
tar -czf $BAK_DIR/db_backup_$DATE.tar.gz $BAK_DIR/$DATE

# 压缩后，删除压缩前的备份文件和目录
rm -f $BAK_DIR/$DATE/*
rmdir $BAK_DIR/$DATE

# 至此备份操作已完成，下面的脚本命令用于清理之前备份的旧文件，以释放磁盘空间

# 遍历备份目录下的压缩文件
LIST=$(ls ${BAK_DIR}/db_backup_*)
# 获取7天前的时间，用于作比较，早于该时间的文件将删除
SECONDS=$(date -d  "$(date  +%F) -${DEL_DAY} days" +%s)

for index in ${LIST}
do
    # 对文件名进行格式化，取命名末尾的时间，格式如 20200902
    timeString=$(echo ${index} | egrep -o "?[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]")
    if [ -n "$timeString" ]
    then
        indexDate=${timeString//./-}
        indexSecond=$( date -d ${indexDate} +%s )
        # 与当天的时间做对比，把早于7天的备份文件删除
        if [ $(( $SECONDS- $indexSecond )) -gt 0 ]
        then
            rm -f $index
            echo "---- deleted old backup file : $index " >>${BAK_DIR}/db_backup.log
        fi
    fi
done

echo "-------------------$(date +%F_%T) end ---------------"  >>${BAK_DIR}/db_backup.log
