{ config, pkgs, ... }:

let
tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin
{
  pluginName = "tmux-super-fingers";
  version = "unstable-2023-01-06";
  src = pkgs.fetchFromGitHub {
    owner = "artemave";
    repo = "tmux_super_fingers";
    rev = "2c12044984124e74e21a5a87d00f844083e4bdf7";
    sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
  };
};
in
{
  nixpkgs.config.allowUnfree = true;
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "lg";
  home.homeDirectory = "/home/lg";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
    fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # warp-terminal
    firefox
    postman
    chromium
    go-task
    btop
    wl-clipboard
    clipboard-jh
    tldr
    kitty
      stow
      fzf
      bat
      eza
      cargo
      jq
      gnomeExtensions.pano
      gimp
      monaspace
      neovim
      erlang_26
      elixir_1_16
      ripgrep
      smug
      inotify-tools
      thefuck
      zoxide
      # nushell
      # zsh
      starship

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
      (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
      ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. If you don't want to manage your shell through Home
# Manager then you have to manually source 'hm-session-vars.sh' located at
# either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/lucaguglielmi/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bash.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ~/.asdf/asdf.fish;
      # mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
    '';

    plugins = [
    { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
    { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    { name = "z"; src = pkgs.fishPlugins.z.src; }
    { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
    [
    {
      plugin = tmux-super-fingers;
      extraConfig = "set -g @super-fingers-key f";
    }
    tmuxPlugins.better-mouse-mode
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      # tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      # Start windows and panes index at 1, not 0.
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g base-index 1
      setw -g pane-base-index 1

      set-window-option -g mode-keys vi
      '';
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
