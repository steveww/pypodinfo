# PyPodinfo
A simple application written in Python

Just a simple Flask application to show some basic information.

# GitOps
A complete set of example configurations using [Flux](https://fluxcd.io/) and
[Flagger](https://flagger.app/) for fully automatic Trusted Delivery.
Get started [here](/gitops).

# Trusted Delivery
Trusted Delivery uses Policy as Code to validate manifests at critical points in the software
delivery lifecycle:

* Commit - via GitHub Action
* Build - via CircleCI Docker
* Deploy - via Kubernetes admission controller
* Runtime - via an agent running inside Kubernetes

# Environments

## Staging
When a change is made to the application, a CircleCI pipeline is triggered via a GitHub Action.
An Action is used rather than the usual webhook for greater control over the triggering; the
webhook is a bit trigger happy. CircleCI pushes a new image to Docker Hub, Flux detects this new
image and updates the deployment manifest and pushes the change to GitHub. Flux reconciliation
then picks up the changed manifest and applies it to Kubernetes. Fully automated CI/CD.

## Production
When a Git Tag is pushed, the CircleCI and Flux manifest update is the same as for staging except a Pull Request is created. For production rather than use the normal Kubernetes rolling update, progressive delivery via
a canary release is performed. This is handled via [Flagger](https://flagger.app/) and NGINX Ingress.

# Observability
[Prometheus](https://prometheus.io/) is used for metric data and
Grafana [Loki](https://grafana.com/oss/loki) / Promtail is used for log collection and indexing, with
Grafana used for data visualisation. GitOps is used to deploy all the Observability components including additional
PodMonitors and Grafana dashboards.
