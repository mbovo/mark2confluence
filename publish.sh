#/bin/bash -l
set -eo pipefail

echo "==> Upload markdown files into ${DOC_DIR}"
pushd ${DOC_DIR}
grep -R -l 'Space:' *.md | xargs -n1 -I{} mark -k -p ${CONFLUENCE_PASSWORD} -u ${CONFLUENCE_USERNAME} -b ${BASE_URL} --debug -f {} > /dev/null 
popd