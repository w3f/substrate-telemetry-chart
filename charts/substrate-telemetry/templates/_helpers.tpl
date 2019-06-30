{{/* Returns the backend domain */}}
{{- define "substrate-telemetry.backendDomain" -}}
telemetry-backend.{{ .Values.domain }}
{{- end }}

{{/* Returns the frontend domain */}}
{{- define "substrate-telemetry.frontendDomain" -}}
telemetry.{{ .Values.domain }}
{{- end }}

{{/* Returns the TLS secret name to be used in certs and ingress */}}
{{- define "substrate-telemetry.tlsSecretName" -}}
substrate-telemetry-tls
{{- end }}

{{/* Returns the frontend service name */}}
{{- define "substrate-telemetry.frontendSvcName" -}}
substrate-telemetry-frontend
{{- end }}

{{/* Returns the backend service name */}}
{{- define "substrate-telemetry.backendSvcName" -}}
substrate-telemetry-backend
{{- end }}

{{/* Returns the frontend app name */}}
{{- define "substrate-telemetry.frontendAppName" -}}
substrate-telemetry-frontend
{{- end }}

{{/* Returns the backend app name */}}
{{- define "substrate-telemetry.backendAppName" -}}
substrate-telemetry-backend
{{- end }}

{{/* Returns the exporter container name */}}
{{- define "substrate-telemetry.exporterName" -}}
substrate-telemetry-exporter
{{- end }}
