
### 🚸 Usage

In this directory import all files managed by home manager.
Make sure that specific code with multiple files is in a new directory.

### 📒 Resources

- [Home manager manual](https://nix-community.github.io/home-manager/index.xhtml)
- [Home manager options](https://nix-community.github.io/home-manager/options.xhtml)

### 🧼 Custom Modules

To import custom modules such as stylix please go to _../flake.nix_.
Here's a snippet of a custom module implementation:

```patch
--- a/flake.nix
+++ b/flake.nix
@@ -44,6 +44,7 @@

             # Home manager module imports go here.
             inputs.stylix.homeManagerModules.stylix
+            inputs.custom.homeManagerModules.custom
             inputs.nixvim.homeManagerModules.nixvim
           ];
         }
```

