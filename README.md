[![CircleCI](https://circleci.com/gh/w3f/substrate-telemetry-chart.svg?style=svg)](https://circleci.com/gh/w3f/substrate-telemetry-chart)

# substrate-telemetry-chart

Helm chart to deploy [substrate-telemetry](https://github.com/paritytech/substrate-telemetry), compatible with Helm 3.To install:

```shell
$ helm repo add w3f https://w3f.github.io/helm-charts/
$ helm repo update
$ helm repo install w3f/substrate-telemetry
```

## What are we doing here?

We use the upstream [parity/substrate-telemetry-(frontend|backend)](https://github.com/paritytech/substrate-telemetry) docker containers and run an additional [substrate-telemetry-exporter](https://github.com/w3f/substrate-telemetry-exporter) on top.
