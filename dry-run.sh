#!/bin/bash -l

echo "==> Verify markdown files into ${DOC_DIR}"
find $(pwd)/${DOC_DIR} -type f -name '*.md' -not -name 'README.md' | while read file; do 
    echo "Verify ${file}"; 
    mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug --dry-run -f "${file}" > /dev/null 
done
