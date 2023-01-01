# Skaffold

* Use `skaffold init` to bootstrap your Skaffold config.
* Use `skaffold dev` to automatically build and deploy your application when your code changes.
* Use `skaffold build` and `skaffold test` to tag, push, and test your container images.
* Use `skaffold render` and `skaffold apply` to generate and deploy Kubernetes manifests as part of a GitOps workflow.


Install

```bash
brew install java
brew install skaffold --generate-manifests
```

Init

```bash
skaffold init
```

Start developing the app

```bash
skaffold dev
```

Profiles

```bash

```

Build

```bash
export STATE=$(git rev-list -1 HEAD --abbrev-commit)
skaffold build --file-output build-$STATE.json
```