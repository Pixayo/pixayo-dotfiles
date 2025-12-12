{...}: {
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      user = {
        name = "Pixayo";
        email = "kaio.rodrigo729@gmail.com";
      };
    };
  };
}
