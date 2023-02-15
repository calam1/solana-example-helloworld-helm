{{- if .Values.gateway.enabled }}
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: {{ include "scorecard.fullname" . }}
  labels:
    {{- include "scorecard.labels" . | nindent 4 }}
spec:
  hosts:
    - {{ .Values.fqdn }}
  gateways:
    - {{ include "scorecard.fullname" . }}
  http:
  - route:
    - destination:
        port:
          number: 80
        host: {{ include "scorecard.fullname" . }}
{{- end }}