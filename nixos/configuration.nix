# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # NixOS backups aren't cleaned from grub with the garabage collector.
  boot.loader.grub.configurationLimit = 10;

  # Use latest linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable all hardware.
  hardware.enableAllFirmware = true;

  networking.hostName = "ammar-laptop"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,de,ara";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ammar = {
    isNormalUser = true;
    description = "ammar";
    extraGroups = [ "networkmanager" "wheel" "video"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Control brightness
  programs.light.enable = true;

  # Automate garbage collection:
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  ### Graphics & NVIDIA ###
   # Enable OpenGL
  hardware.graphics = {
    enable = true;
    # Hardware acceleration drivers.
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
    ];
  };

	#  ## Nvidia stuff: ##
	#  # Load nvidia driver for Xorg and Wayland
	#  services.xserver.videoDrivers = ["nvidia"];
	#
	#  hardware.nvidia = {
	#    # Modesetting is required.
	#    modesetting.enable = true;
	#
	#    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
	#    # Enable this if you have graphical corruption issues or application crashes after waking
	#    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
	#    # of just the bare essentials.
	#    powerManagement.enable = false;
	#
	#    # Fine-grained power management. Turns off GPU when not in use.
	#    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
	#    powerManagement.finegrained = false;
	#
	#    # Use the NVidia open source kernel module (not to be confused with the
	#    # independent third-party "nouveau" open source driver).
	#    # Support is limited to the Turing and later architectures. Full list of 
	#    # supported GPUs is at: 
	#    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
	#    # Only available from driver 515.43.04+
	#    # Currently alpha-quality/buggy, so false is currently the recommended setting.
	#    open = false;
	#
	#    # Enable the Nvidia settings menu,
	# # accessible via `nvidia-settings`.
	#    nvidiaSettings = true;
	#
	#    # Optionally, you may need to select the appropriate driver version for your specific GPU.
	#    package = config.boot.kernelPackages.nvidiaPackages.stable;
	#  };
	#
	#  hardware.nvidia.prime = {
	#    # Make sure to use the correct Bus ID values for your system!
	#    intelBusId = "PCI:0:2:0";
	#    nvidiaBusId = "PCI:1:0:0";
	#
	#    # Set the mode to sync
	#    # sync.enable = true;
	#
	#    # Offload mode will activate nvidia explicitly only.
	#    offload = {
	#      enable = true;
	#      enableOffloadCmd = true;
	#    };
	#  };

  #####################################################

  # Signal to electron apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  programs.firefox.enable = true;
  programs.git.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Start ssh agent on start.
  # programs.ssh.startAgent = true;

  # gnupg has support to persist the password in the password manager.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 2592000;
      max-cache-ttl = 2592000;
    };
  };

  # Firmware updates. We need to run `fwupdmgr update` to get them.
  services.fwupd.enable = true;

  # This solves script files starting with `#!/usr/bin/bash`
  services.envfs.enable = true;

  ## Sway ##
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.greetd = {
    enable = true;
    # settings = rec {
    # Autologin
    # initial_session = {
    #     command = "${pkgs.sway}/bin/sway";
    #     user = "simon";
    #   };
    #   default_session = initial_session;
    # }; 
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd sway";
        user = "greeter";
      };
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;
  security.polkit.enable = true;
  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

  ## Gnome needed services & tools:
  programs.dconf.enable = true;

  ##########################
  ## Thunar ##
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  ## Qmk
  hardware.keyboard.qmk.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ## Sway ##
    grim # Takes screenschots of the windows
    slurp # Define regions to be used grim to take specific screenshots
    wl-clipboard
    mako
    kanshi
    xdg-user-dirs
    networkmanagerapplet
    waybar
    adwaita-icon-theme
    gnome-themes-extra
    hicolor-icon-theme
    glib  # Enable gsettings.
    nwg-look  # Gtk-3 control
    pavucontrol # Audio input GUI
    feh  # Image preview
    autotiling
    wlsunset # Dark light
    playerctl # Control 
    wofi 
    #######
    gcc
    clang
    python39
    rustup
    lua-language-server
    stylua
    shfmt
    nodePackages.cspell
    qmk
    #######
    vim 
    neovim  
    wget
    fish
    fzf
    yazi
    helix
    tmux
    fzf
    fd
    fastfetch
    bat
    dust
    eza
    ripgrep
    htop
    btop
    tealdeer
    zoxide
    p7zip
    lazygit
    gitui
    delta
    bottom
    jq
    poppler_utils  # Pdf utilities
    ghostscript  # Pdf compress
    ################
    foot
    alacritty
    kitty
    ghostty
    wezterm
    google-chrome
    gimp
    obsidian
    zathura
    xournalpp
  ];

  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = [ "NerdFontsSymbolsOnly" "FiraCode" ];})
    noto-fonts
    liberation_ttf
    fira
    fira-code
    fira-code-symbols
    ubuntu-sans
    dejavu_fonts
    roboto
    font-awesome
  ];

  # TODO: Check if we need to keep this.
  # This should improve the performance according to nix wiki.
  security.pam.loginLimits = [
    { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
