{% comment %} Expand the name of the chart. {% endcomment %}
{{- define "microservice-basic.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{% comment %} Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name. {% endcomment %}
{{- define "microservice-basic.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{% comment %} Create chart name and version as used by the chart label. {% endcomment %}
{{- define "microservice-basic.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{% comment %} Create the name of the service account {% endcomment %}
{{- define "microservice-basic.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "microservice-basic.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "microservice-basic.serviceAccountNameTest" -}}
{{- if .Values.serviceAccount.create }}
{{- default (print (include "microservice-basic.fullname" .) "-test") .Values.serviceAccount.nameTest }}
{{- else }}
{{- default "default" .Values.serviceAccount.nameTest }}
{{- end }}
{{- end }}


{% comment %} Allow the release namespace to be overridden for multi-namespace deployments in combined charts {% endcomment %}
{{- define "microservice-basic.namespace" -}}
{{- if .Values.namespaceOverride }}
{{- .Values.namespaceOverride }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}


{% comment %} Common labels {% endcomment %}
{{- define "microservice-basic.labels" -}}
helm.sh/chart: {{ include "microservice-basic.chart" . }}
{{ include "microservice-basic.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ mustRegexReplaceAllLiteral "@sha.*" .Values.image.tag "" | default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.extraLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}


{% comment %} Selector labels {% endcomment %}
{{- define "microservice-basic.selectorLabels" -}}
app.kubernetes.io/name: {{ include "microservice-basic.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{% comment %} Common labels {% endcomment %}
{{- define "microservice-basic.imageRenderer.labels" -}}
helm.sh/chart: {{ include "microservice-basic.chart" . }}
{{ include "microservice-basic.imageRenderer.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ mustRegexReplaceAllLiteral "@sha.*" .Values.image.tag "" | default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{% comment %} Return the appropriate apiVersion for rbac. {% endcomment %}
{{- define "microservice-basic.rbac.apiVersion" -}}
{{- if $.Capabilities.APIVersions.Has "rbac.authorization.k8s.io/v1" }}
{{- print "rbac.authorization.k8s.io/v1" }}
{{- else }}
{{- print "rbac.authorization.k8s.io/v1beta1" }}
{{- end }}
{{- end }}


{% comment %} Return the appropriate apiVersion for ingress. {% endcomment %}
{{- define "microservice-basic.ingress.apiVersion" -}}
{{- if and ($.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) }}
{{- print "networking.k8s.io/v1" }}
{{- else if $.Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" }}
{{- print "networking.k8s.io/v1beta1" }}
{{- else }}
{{- print "extensions/v1beta1" }}
{{- end }}
{{- end }}


{% comment %} Return the appropriate apiVersion for Horizontal Pod Autoscaler. {% endcomment %}
{{- define "microservice-basic.hpa.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "autoscaling/v2" }}  
{{- print "autoscaling/v2" }}  
{{- else }}  
{{- print "autoscaling/v2beta2" }}  
{{- end }} 
{{- end }}


{% comment %} Return the appropriate apiVersion for podDisruptionBudget. {% endcomment %}
{{- define "microservice-basic.podDisruptionBudget.apiVersion" -}}
{{- if $.Values.podDisruptionBudget.apiVersion }}
{{- print $.Values.podDisruptionBudget.apiVersion }}
{{- else if $.Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget" }}
{{- print "policy/v1" }}
{{- else }}
{{- print "policy/v1beta1" }}
{{- end }}
{{- end }}

{% comment %} Return the appropriate apiVersion for cronJob. {% endcomment %}
{{- define "microservice-basic.cronJob.apiVersion" -}}
{{- if $.Values.cronJob.apiVersion }}
{{- print $.Values.cronJob.apiVersion }}
{{- else if $.Capabilities.APIVersions.Has "batch/v1" }}
{{- print "batch/v1" }}
{{- else }}
{{- print "batch/v1beta1" }}
{{- end }}
{{- end }}


{% comment %} Return if ingress is stable. {% endcomment %}
{{- define "microservice-basic.ingress.isStable" -}}
{{- eq (include "microservice-basic.ingress.apiVersion" .) "networking.k8s.io/v1" }}
{{- end }}

{{- define "microservice-basic.ingress.supportsIngressClassName" -}}
{{- or (eq (include "microservice-basic.ingress.isStable" .) "true") (and (eq (include "microservice-basic.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) }}
{{- end }}


{% comment %} Return if ingress supports pathType. {% endcomment %}
{{- define "microservice-basic.ingress.supportsPathType" -}}
{{- or (eq (include "microservice-basic.ingress.isStable" .) "true") (and (eq (include "microservice-basic.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) }}
{{- end }}

{% comment %} Formats imagePullSecrets. Input is (dict "root" . "imagePullSecrets" .{specific imagePullSecrets}) {% endcomment %}
{{- define "microservice-basic.imagePullSecrets" -}}
{{- $root := .root }}
{{- range (concat .root.Values.global.imagePullSecrets .imagePullSecrets) }}
{{- if eq (typeOf .) "map[string]interface {}" }}
- {{ toYaml (dict "name" (tpl .name $root)) | trim }}
{{- else }}
- name: {{ tpl . $root }}
{{- end }}
{{- end }}
{{- end }}