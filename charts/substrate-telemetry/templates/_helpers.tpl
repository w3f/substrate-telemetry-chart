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
{{ .Release.Name }}-tls
{{- end }}

{{/* Returns the frontend service name */}}
{{- define "substrate-telemetry.frontendSvcName" -}}
{{ .Release.Name }}-frontend
{{- end }}

{{/* Returns the backend service name */}}
{{- define "substrate-telemetry.backendSvcName" -}}
{{ .Release.Name }}-backend
{{- end }}

{{/* Returns the frontend app name */}}
{{- define "substrate-telemetry.frontendAppName" -}}
{{ .Release.Name }}-frontend
{{- end }}

{{/* Returns the backend app name */}}
{{- define "substrate-telemetry.backendAppName" -}}
{{ .Release.Name }}-backend
{{- end }}

{{/* Returns the generic exporter name */}}
{{- define "substrate-telemetry.exporterName" -}}
{{ .Release.Name }}-exporter
{{- end }}
