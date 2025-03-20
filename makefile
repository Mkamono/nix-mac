# https://memo.onl.jp/?fDKeLaR1pA

REPO = nix-mac

update:
	nix flake update
	nix profile upgrade ${REPO}
	# nix run nix-darwin -- switch --flake .#default
	nix run nixpkgs#home-manager -- switch --flake .#homeConfig --impure

install:
	git config --global user.name Mkamono
	git config --global user.email chengyaye31+github@gmail.com
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	# nix profile install
