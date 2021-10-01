#!/bin/bash -l

find . -type d -not -path '**/\.*' -path "./${DOC_DIR_PATTERN}" |
    while read doc_dir; do
        echo "==> Verify markdown files into ${doc_dir}"
        pushd ${doc_dir}
        grep -R -l 'Space:' *.md | xargs -n1 -I{} mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug --dry-run -f {} > /dev/null 
        popd
    done
