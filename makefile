# https://memo.onl.jp/?fDKeLaR1pA

update:
	nix flake update
	nix profile upgrade dotfiles

install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	nix profile install