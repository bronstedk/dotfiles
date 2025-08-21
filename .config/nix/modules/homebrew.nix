{...}: {
  homebrew = {
    enable = true;
    brews = ["mas"];
    casks = [
      "vivaldi"
      "logi-options+"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };
}
