#/bin/bash -l
set -eo pipefail

echo "==> Upload markdown files"
for file in $(find . -type f -name '*.md'); do 
    echo "Sync ${file}"; 
    mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} -f ${file} 
done
