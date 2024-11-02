
### 🚸 Usage

In this directory import all files managed by home manager.
Make sure that specific code with multiple files is in a new directory.

### 📌 New Host

To add new host source in flake,
please add this snippet to it with your host names assigned.

```patch
--- a/default.nix
+++ b/default.nix
@@ -29,4 +29,5 @@
   };
 in {
   nixos = mkSystem "nixos";
+  host1 = mkSystem "host2";
 }
```

> [!NOTE]
> Make sure that you are in the _hosts_ directory
> before running those commands.

Afterwards to generate hardware configuration for your host run:

```bash
$ nixos-generate-config --show-hardware-config > host2.nix
```

And to switch to your host:

```bash
$ nixos-rebuild switch --use-remote-sudo --flake ".#host1"
```

Make sure to replace _host1_ and _host2_ with correct names,
or even the same ones.

