#!/bin/bash -l

echo "==> Compile markdown files"
find $(pwd) -type f -name '*.md' -not -name 'README.md' | while read file; do 
    echo "Compile ${file}"; 
    mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug --compile-only -f "${file}" > /dev/null 
done
