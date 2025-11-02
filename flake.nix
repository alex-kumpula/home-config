{
  description = "Your new nix config";

  inputs = {
    #Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Dank Material Shell
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Affinity suite for NixOS
    affinity-nix.url = "github:mrshmllow/affinity-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    dankMaterialShell,
    niri,
    affinity-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    mySpecialArgs = {
      inherit inputs outputs;
      # To use packages from nixpkgs-unstable,
      # we configure some parameters for it first
      #pkgs-stable = import nixpkgs-stable {
      # Refer to the `system` parameter from
      # the outer scope recursively
      #  inherit inputs;
      #  system = "x86_64-linux";
      #  config.allowUnfree = true;
      #};

      #pkgs-last-stable = import nixpkgs-last-stable {
      # Refer to the `system` parameter from
      # the outer scope recursively
      #  inherit inputs;
      #  system = "x86_64-linux";
      #  config.allowUnfree = true;
      #};

      pkgs-unstable = import nixpkgs-unstable {
        # Refer to the `system` parameter from
        # the outer scope recursively
        inherit inputs;
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      #pkgs-pinned = import nixpkgs-pinned {
      #  inherit inputs;
      #  system = "x86_64-linux";
      #  config.allowUnfree = true;
      #};
    };

  in {
    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    Home
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules;

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # FIXME - DONE replace with your username@hostname
      "alex" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = mySpecialArgs;
        modules = [
          # > Our main home-manager configuration file <
          ./homes/alex/home.nix
        ];
      };
    };
  };
}
