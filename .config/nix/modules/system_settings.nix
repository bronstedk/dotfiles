{pkgs, ...}: {
  system.defaults = {
    dock.autohide = true;
    dock.persistent-apps = [
      "${pkgs.jetbrains.idea-ultimate}/Applications/IntelliJ IDEA.app"
      "${pkgs.wezterm}/Applications/Wezterm.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
  };
}
