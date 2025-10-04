# microservice-basic

![Version: 2.5.3](https://img.shields.io/badge/Version-2.5.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.5.3](https://img.shields.io/badge/AppVersion-2.5.3-informational?style=flat-square)

Helm chart for `microservice-basic`. Details included in `README.md`.

## How to install this chart

Installing a chart with default values:

```console
helm install ./microservice-basic
```

Installing a chart with a named release.

```console
helm install my-release ./microservice-basic
```

Installing a chart with set values:

```console
helm install my-release ./microservice-basic --set values_key1=value1 --set values_key2=value2
```

Installing a chart with custom values:

```console
helm install my-release ./microservice-basic -f values.yaml
```

## Requirements

Kubernetes: `>=1.27.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://raw.githubusercontent.com/futureversecom/.-helm-charts/main/ | external-secrets | 1.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"echo \"Hello, World!\"\nsleep infinity"` |  |
| autoscaling.enabled | bool | `false` |  |
| command[0] | string | `"/bin/sh"` |  |
| command[1] | string | `"-c"` |  |
| config.create | bool | `false` |  |
| cronJob.enabled | bool | `false` |  |
| deployment.annotations | object | `{}` |  |
| deployment.enabled | bool | `true` |  |
| env | object | `{}` |  |
| envFromConfigMaps | list | `[]` |  |
| envFromSecrets | list | `[]` |  |
| external-secrets.enabled | bool | `false` |  |
| extraConfigmapMounts | list | `[]` |  |
| extraSecretMounts | list | `[]` |  |
| fullnameOverride | string | `nil` |  |
| global.imagePullPolicy | string | `"IfNotPresent"` |  |
| global.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"alpine"` |  |
| image.tag | string | `"latest"` |  |
| ingress.enabled | bool | `false` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleDown.policies[0].periodSeconds | int | `60` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleDown.policies[0].type | string | `"Percent"` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleDown.policies[0].value | int | `10` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleDown.restoreToOriginalReplicaCount | bool | `true` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleDown.stabilizationWindowSeconds | int | `0` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleUp.policies[0].periodSeconds | int | `30` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleUp.policies[0].type | string | `"Percent"` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleUp.policies[0].value | int | `25` |  |
| keda.advanced.horizontalPodAutoscalerConfig.behavior.scaleUp.stabilizationWindowSeconds | int | `0` |  |
| keda.annotations | object | `{}` |  |
| keda.cooldownPeriod | int | `30` |  |
| keda.enabled | bool | `false` |  |
| keda.maxReplicaCount | int | `10` |  |
| keda.minReplicaCount | int | `1` |  |
| keda.pollingInterval | int | `30` |  |
| keda.scaleTargetRef.apiVersion | string | `"apps/v1"` |  |
| keda.scaleTargetRef.kind | string | `"Deployment"` |  |
| keda.triggers | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| metrics.enabled | bool | `false` |  |
| nameOverride | string | `nil` |  |
| networkPolicy.enabled | bool | `false` |  |
| nodeSelector | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.type | string | `"pvc"` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| rbac.create | bool | `false` |  |
| rbac.extraRoleRules | list | `[]` |  |
| rbac.namespaced | bool | `false` |  |
| rbac.pspEnabled | bool | `false` |  |
| readinessProbe | object | `{}` |  |
| replicas | int | `3` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.enabled | bool | `false` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceMonitor | object | `{}` |  |
| startupProbe | object | `{}` |  |
| statefulset.annotations | object | `{}` |  |
| tolerations | object | `{}` |  |
| topologySpreadConstraints | object | `{}` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| fred.lai | <fred.lai@futureverse.com> | <https://github.com/realfredlai> |
