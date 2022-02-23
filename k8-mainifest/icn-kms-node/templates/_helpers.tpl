  {{/* vim: set filetype=mustache: */}}
  {{/*
     Expand the name of the chart.
  */}}
  {{- define "icn-kms-node.name" -}}
    {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
  {{- end -}}

  {{/*
     Create a default fully qualified app name.
     We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
     If release name contains chart name it will be used as a full name.
    */}}
  {{- define "icn-kms-node.fullname" -}}
    {{- if .Values.fullnameOverride -}}
      {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
      {{- $name := default .Chart.Name .Values.nameOverride -}}
      {{- if contains $name .Release.Name -}}
        {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
      {{- else -}}
        {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/*
     Create chart name and version as used by the chart label.
    */}}
  {{- define "icn-kms-node.chart" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
  {{- end -}}

  {{/*
     Shorthand for component names
  */}}
  {{- define "icn-kms-node.application.name" -}}
    {{- include "icn-kms-node.fullname" . -}}-application
  {{- end -}}
  {{- define "icn-kms-node.nginx.name" -}}
    {{- include "icn-kms-node.fullname" . -}}-nginx
  {{- end -}}
  {{- define "icn-kms-node.nginx-env.name" -}}
    {{- include "icn-kms-node.fullname" . -}}-nginx-env
  {{- end -}}
  {{- define "icn-kms-node.prometheus-exporter.name" -}}
    {{- include "icn-kms-node.fullname" . -}}-prometheus-exporter
  {{- end -}}
  {{- define "icn-kms-node.redis.name" -}}
    {{- include "icn-kms-node.fullname" . -}}-redis
  {{- end -}}

  {{/*
     Ingress class name
  */}}
  {{- define "icn-kms-node.ingressclass.name" -}}
    {{- if .Values.ingress.public -}} 
      {{- if hasPrefix "dr-test-" .Values.ingress.tlsSecretName -}}
        dr-test-ingress-public
      {{- else -}}
        ingress-public
      {{- end -}}
    {{- else -}}
      {{- if hasPrefix "dr-test-" .Values.ingress.tlsSecretName -}}
        dr-test-ingress-private
      {{- else -}}
        ingress-private
      {{- end -}}
    {{- end -}}
  {{- end -}}