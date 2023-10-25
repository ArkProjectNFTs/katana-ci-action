# Katana CI action

This action starts a Katana instance using the provided Katana CI server URL.

## Inputs

## `api-url`

**Required** The URL of the Katana CI server to use.

## `api-key`

**Required** The API-KEY to authenticate the request to start the Katana instance.

## `cmd`

**Required** The command to execute on the katana CI server. Can be 'start' or 'stop' for now.

## `name`

**Optional** The name of the running katana instance if already known.

## Outputs

## `katana-name`

The name of the Katana instance that has been started. This name then be used to build the URL of the targetted instance.

## Example usage

uses: actions/katana-ci-action@v1
with:
  api-url: ${{ env.KATANA_CI_URL }}
  api-key: ${{ env.KATANA_CI_KEY }}
