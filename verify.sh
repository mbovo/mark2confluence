#!/bin/bash -l

echo "==> Verify markdown files into ${DOC_DIR}"
pushd ${DOC_DIR}
grep -R -l 'Space:' *.md | xargs -n1 -I{} mark -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug --compile-only -f {} > /dev/null
popd
