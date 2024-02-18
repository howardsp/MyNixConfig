{
  description = "NIX - Java development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      javaVersion = 8; # Change this value to update the whole stack
      system = "x86_64-linux";

      overlays = [
        (final: prev: rec {
          jdk = prev."jdk${toString javaVersion}";
          gradle = prev.gradle.override { java = jdk; };
          maven = prev.maven.override { inherit jdk; };
        })
      ];

      pkgs = import nixpkgs { inherit overlays system; };

    in
    {              
        devShells.${system}.default = pkgs.mkShell {          
          packages = with pkgs; 
            [ 
                jdk
                gradle
                maven
            ];
        };     
    };
}