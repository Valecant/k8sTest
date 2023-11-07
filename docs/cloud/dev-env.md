Dev env
-------
> Picks and shovels.

At the moment, we're using some basic tools to develop and manage
the Cylcomed cluster. Names & versions below.

* git `2.40.1`
* kubectl `1.27.1`
* kubectl-directpv `4.0.6`
* kubectl-minio `5.0.6`
* istioctl `1.18.0`
* argocd `2.7.6`
* kustomize `5.0.3`
* kubernetes-helm `3.11.3`
* qemu `8.0.0`

Please, like please, install the exact versions and if you do have
some of those tools already, make sure to always get a shell where
the right version of the tool is available—typically you'll need to
massage the `PATH` env var.

Alternatively, use our Nix shell. This is a sort of virtual shell
env on steroids which has in it all the tools you need with the
right versions. Plus, it doesn't pollute your box with libs that
could break your existing programs—everything gets installed in an
isolated Nix store dir and made available only in the Nix shell.

First off, you should install Nix and enable the Flakes extension

```bash
$ sh <(curl -L https://nixos.org/nix/install) --daemon
$ mkdir -p ~/.config/nix
$ echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

Now you can get into our Nix shell and have some fun with our tools.
Just get into the `nix` dir of the `Cylcomed-IaC` repo and start a
Nix shell.

```bash
$ cd Cylcomed-IaC/nix
$ nix shell
$ argocd version --client --short
argocd: v2.5.6
```
