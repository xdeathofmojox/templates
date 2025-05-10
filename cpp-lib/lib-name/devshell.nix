{
  pkgs ? import <nixpkgs> { },
  cmake,
  clang-tools,
}:

pkgs.mkShell {

  nativeBuildInputs = [
    cmake
    clang-tools
  ];

  packages = with pkgs; [
    clang-tidy-check
    clang-tidy-fix
    clang-format-check
    clang-format-fix
    cpp-check
    fish
  ];

  shellHook = ''
    echo "🧪🐟 Entering Nix dev shell with custom Fish prompt"

    # Create an isolated temporary fish config
    export NIX_FISH_CONFIG_DIR=$(mktemp -d)
    mkdir -p "$NIX_FISH_CONFIG_DIR/fish/functions"

    # Add custom prompt
    cat > "$NIX_FISH_CONFIG_DIR/fish/functions/fish_prompt.fish" <<'EOF'
    function fish_prompt
      set prev_status $status

      # Show that we're in a nix shell
      echo -n "🧪 (nix) "

      # Show exit status of the last command
      if test $prev_status -eq 0
        set_color green
        echo -n "✅ "
      else
        set_color red
        echo -n "❌ [$prev_status] "
      end

      set_color green
      echo -n (prompt_pwd)
      set_color normal
      echo -n "> "
    end
    EOF

    # Tell Fish to use our custom config
    export XDG_CONFIG_HOME="$NIX_FISH_CONFIG_DIR"

    # Launch fish interactively
    export SHELL=${pkgs.fish}/bin/fish
    exec $SHELL
  '';
}
