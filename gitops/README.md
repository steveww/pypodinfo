# Getting Started With Flux

The script in this directory provide the steps to set up Flux.

All the script in this directory except `bootstrap.sh` output YAML on stdout. Redirect this to a file
and copy it into the management repository created by `bootstrap.sh`. Commit and Push the changes.

## Bootstrap

Running `bootstrap.sh` will install Flux and set it up to watch a GitHub repository.

## Add GitHub Respository

The GitRepository requires SSH credentails because the image update automation will want to
push changes into the repository. Create a key pair.

```shell
$ ssh-keygen -t rsa -N '' -f identity
$ ssh-keyscan github.com > known_hosts
$ kubectl -n flux-system create secret generic ssh-credentials \
    --from-file=identity \
    --from-file=identity.pub \
    --from-file=known_hosts
```

Running `add-repo.sh` will create an instance GitRepository CRD.

## Create a Kustomization

To deploy an application run `kustomization-<environment>.sh`. This creates an instance of Flux Kustomization which
references the GitRepository created in the previous step. The Kustomization will scan the given
directory within the GitRepository for Kubernetes manifests.

# Automatic Synchronisation of Container Images

Once the application is deployed, next the synchronisation of container images can be set up.

## Create Image Repository

Running `image-repo.sh` creates an instance of ImageRepository, this scans the given Docker image
repository for new image tags.

## Create Image Policy

Running `image-policy-<environment>.sh` creates an instance of ImagePolicy, this filters image tags. Only matching tags
will trigger an update; defined in the next step.

## Create Image Update Automation

Running `image-auto-<environment>.sh` creates an instance of ImageUpdateAutomation, this takes the new tag
from the ImagePolicy and updates the source in GitHub. This can be done directly or via a Pull Request.

## Linking to Deployment Manifest

The Kubernetes Deployment manifests reference ImagePolicy.

```yaml
image: docker.io/steveww/pypodinfo:1.0.1 # {"$imagepolicy": "flux-system:pypodinfo-prod"}
image: docker.io/steveww/pypodinfo:Build-51 # {"$imagepolicy": "flux-system:pypodinfo-staging"}
```

# TO DO
