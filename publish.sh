#/bin/bash -l
set -eo pipefail

echo "==> Upload markdown files ${DOC_DIR}"
find $(pwd)/${DOC_DIR} -type f -name '*.md' -not -name 'README.md' | while read file; do 
    echo "Upload ${file}"; 
    mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug -f "${file}" > /dev/null 
done
