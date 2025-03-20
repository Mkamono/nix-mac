# https://memo.onl.jp/?fDKeLaR1pA

REPO = nix-mac

update:
	nix flake update
	nix profile upgrade ${REPO}
	nix run nixpkgs#home-manager -- switch --flake .#homeConfig --impure

install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	exec $$SHELL -l
	nix profile install
