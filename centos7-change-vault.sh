#!/bin/bash

NEW_REPO_URL="https://mirror.moack.co.kr/.resource/CentOS-Base-7-Vault.repo"
ORIGINAL_REPO_PATH="/etc/yum.repos.d/CentOS-Base.repo"

if [ "$(id -u)" != "0" ]; then
   echo "此脚本必须以root用户身份运行" 1>&2
   exit 1
fi

echo "正在备份原有的 CentOS-Base.repo 文件..."
cp $ORIGINAL_REPO_PATH "${ORIGINAL_REPO_PATH}.bak"

echo "正在下载新的 CentOS-Base-7-Vault.repo 文件..."
curl -o $ORIGINAL_REPO_PATH $NEW_REPO_URL

echo "清除yum缓存并重新生成..."
yum clean all
yum makecache
echo "已成功替换为 CentOS Vault 仓库源。"

