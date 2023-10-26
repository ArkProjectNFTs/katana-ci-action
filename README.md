# Katana CI action

This action starts a Katana instance using the provided Katana CI server URL.
Please refer to [katana-ci](https://github.com/ArkProjectNFTs/katana-ci) to setup a server.

## Inputs

* `api-url`
  **Required** The URL of the Katana CI server to use.
* `api-key`
  **Required** The API-KEY to authenticate the request to start the Katana instance.
* `cmd`
  **Required** The command to execute on the katana CI server. Can be `start` or `stop` for now.
* `name`
  **Optional** The name of the running katana instance if already known.

## Outputs

* `katana-name`
  The name of the Katana instance that has been started.
* `katana-rpc`
  The RPC URL for to target the Katana that has been started.

## Example usage
```yaml
    - name: Startup Katana CI instance
      id: katanaci
      uses: ArkProjectNFTs/katana-ci-action@v1
      with:
        api-url: ${{ secrets.KATANA_CI_URL }}
        api-key: ${{ secrets.KATANA_CI_KEY }}
        cmd: 'start'
```
