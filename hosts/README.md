
### 🚸 Usage

In this directory import all files managed by home manager.
Make sure that specific code with multiple files is in a new directory.

### 📌 New Host

To add new host source in flake,
please add this snippet to it with your host names assigned.

```patch
--- a/flake.nix
+++ b/flake.nix
@@ -51,5 +51,6 @@
     };
   in {
     nixosConfigurations.nixos = mkSystem "nixos";
+    nixosConfigurations.host1 = mkSystem "host2";
   };
 }
```

Afterwards to generate hardware configuration for your host run:

```bash
$ nixos-generate-config --show-hardware-config > hosts/host2.nix
```

And to switch to your host:

```bash
$ nixos-rebuild switch --use-remote-sudo --flake ".#host1"
```

Make sure to replace _host1_ and _host2_ with correct names,
or even the same ones.

