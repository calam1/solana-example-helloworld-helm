---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "scorecard.fullname" . }}
  labels:
    {{- include "scorecard.labels" . | nindent 4 }}
  {{- with .Values.service.annotations }}
  annotations:
    {{- range $key, $value := . }}
    {{ $key }}: |
    {{- tpl $value $ | nindent 6 }}
    {{- end }}
  {{- end }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "scorecard.selectorLabels" . | nindent 4 }}
