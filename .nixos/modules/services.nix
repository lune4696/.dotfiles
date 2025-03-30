{ ... }: {
  services = {

    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
         governor = "performance";
         turbo = "auto";
      };
      charger = {
         governor = "performance";
         turbo = "auto";
      };
    };

    libinput = {
      enable = true;
    };

    printing.enable = true;

    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="028e", MODE="0660, TAG+="uaccess""
    '';

    xremap = {
      withWlroots = true;
      # withHypr = true; # At now, Hyprland use wlroots, but in future, it aims to become free from wlroots, so I left this option for future.
      userName = "Lune";
      serviceMode = "system";
      config = {
        modmap = [
          {
            name = "Caps2Ctrl";
            remap = {
              CapsLock = "Ctrl_L";
            };
          }
        ];
      };
    }; 

    xserver = {
      desktopManager.runXdgAutostartIfNone = true;
      xkb.layout = "us";
      videoDrivers = [ "amdgpu" ];
    };
  };
}
