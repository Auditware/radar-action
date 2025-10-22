# radar GitHub Action
The GitHub action to add [radar](https://github.com/auditware/radar) into your workflow.

For more information check the main repository: https://github.com/auditware/radar

## Usage

`.github/workflows/radar.yml`

```yaml
name: radar Static Analysis
on: [push]
jobs:
  analyze:
    runs-on: ubuntu-latest
    permissions:
      security-events: write
      actions: read
      contents: read
      
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          submodules: 'recursive'
      
      - name: Run radar
        id: radar
        uses: auditware/radar-action@main
        with:
          path: "."
          ignore: "low"
  
      - name: Upload SARIF file
        uses: github/codeql-action/upload-sarif@v3
        with:
          sarif_file: output.sarif
```

## Inputs

| Input                 | Description                                 | Required | Default | 
|-----------------------|---------------------------------------------|----------|---------|
| `path`                | Path of the folder to be scanned.           | `true`   | `.`     |
| `ignore`              | Severities to be ignored (e.g. low,medium)  | `false`  |         |


Experimental, use at your own risk. for support reach out to the Audit Wizard [Discord](https://discord.gg/8PTTMd96p4).
