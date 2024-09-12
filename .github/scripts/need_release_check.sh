#!/bin/bash
pr_title=$(cat $GITHUB_EVENT_PATH | jq -r '.pull_request.title')
echo "PR Title: $pr_title"

# 转换为小写
pr_title_lower=$(echo "$pr_title" | tr '[:upper:]' '[:lower:]')
echo "PR Title (Lowercase): $pr_title_lower"

# 判断是否以 'release-' 开头
if [[ $pr_title_lower == release-* ]]; then
echo "Title starts with 'release-' (case-insensitive)"
echo "need_release=true"
else
echo "Title does not start with 'release-' (case-insensitive)"
echo ":need_release=false"
fi