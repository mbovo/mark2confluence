#!/bin/bash -l
set -eo pipefail

echo "==> Verify markdown files"
for file in $(find . -type f -name '*.md'); do 
    echo "Compiling ${file}"; 
    mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} -f ${file} --compile-only; 
done
