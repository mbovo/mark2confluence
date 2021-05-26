# action-helm-tools

GitHub Action for converting markdown files to confluence pages

This Action uses [mark](https://github.com/kovetskiy/mark) to accomplish this task

## Inputs

### Required

`action` - `[compile, dry-run, publish]`

- `compile` - Compile markdown to html only
- `dry-run` - Execute dry-run, compile markdown an d verify confluence r/o 
- `publish` - Use the given confluence account and push the generated pages

## Required Environment variables

```yaml
BASE_URL: https://your.confluence.url # Confluence base url of your instance
CONFLUENCE_USERNAME: ${{ secrets.CONFLUENCE_USERNAME }} # CONFLUENCE_USERNAME (Confluence username) must be set in GitHub Repo secrets
CONFLUENCE_PASSWORD: ${{ secrets.CONFLUENCE_PASSWORD }} # CONFLUENCE_PASSWORD (Confluence api key) must be set in GitHub Repo secrets
```

## Example workflow


```yaml
name: Docs Test and Publish

on: pull_request

jobs:
  helm-suite:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    # - name: myOtherJob1
    #   run:

    - name: Test Docs generation
      uses: draios/infra-ghaction-mark2confluence@main
      with:
        action: "dry-run"
      env:
        BASE_URL: https://your.confluence.url 
        CONFLUENCE_USERNAME: ${{ secrets.CONFLUENCE_USERNAME }}  
        CONFLUENCE_PASSWORD: ${{ secrets.CONFLUENCE_PASSWORD }} 

    - name: Publish Docs
      uses: draios/infra-ghaction-mark2confluence@main
      with:
        action: "publish"
      env:
        BASE_URL: https://your.confluence.url 
        CONFLUENCE_USERNAME: ${{ secrets.CONFLUENCE_USERNAME }}  
        CONFLUENCE_PASSWORD: ${{ secrets.CONFLUENCE_PASSWORD }} 
```

