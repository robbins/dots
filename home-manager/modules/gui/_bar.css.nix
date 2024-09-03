{ fontSize, workspaceMargin, windowHorizontalPadding, modulePadding, leftEdgePadding, rightEdgePadding, extraConfig }:
''
  * {
      border: none;
      border-radius: 0;
      font-family: "PragmataPro Mono Liga Regular", "Symbols Nerd Font", "Material Symbols Rounded";
      font-size: ${fontSize};
      color: rgba(255, 255, 255, 1);
      padding: 0;
      margin: 0;
      min-height: 0px;
  
      /* Fade out highlight */
      transition-property: background-color;
      transition-duration: .3s;
  }
  
  *:hover {
      /* Remove default hover effect */
      box-shadow: inherit;
      text-shadow: inherit;
      /* Background highlight */
      background: rgba(255,255,255,0.1);
      /* Rounded corners */
      border-radius: 6px;
      /* Fade in highlight */
      transition-property: background-color;
      transition-duration: .3s;
      padding: 0px 20px;
  
  }
  
  tooltip label {
    color: white;
  }
  
  tooltip {
      border-radius: 6px;
      background: rgba(27, 27, 27, 1);
  }
  
  window#waybar {
      background: rgba(0, 0, 0, 1);
  }
  
  #custom-logo {
          margin-left: ${leftEdgePadding};
          padding: 0px 10px;
  }
  
  #window {
      padding: 0px ${windowHorizontalPadding};
      font-weight: 600;
  }

  /* Hide hyprland/window module when no windows open */
  window#waybar.empty #window {
      font-size: 0;
      margin: 0;
      padding: 0;
      border: none;
      background: none;
  }
  
  #workspaces button {
      background: rgba(0,0,0,0);
      border: none;
      padding-left: 4px;
      padding-right: 4px;
      margin-bottom: ${workspaceMargin};
      margin-top: ${workspaceMargin};
      margin-left: 4px;
  }
  
  #workspaces button.active {
      padding-left: 4px;
      padding-right: 4px;
      border-radius: 6px;
      background: rgba(67,67,67,0.2);
  }
  
  #workspaces button:hover {
      border-color: transparent;
      border-radius: 6px;
      padding-left: 4px;
      padding-right: 4px;
      background: rgba(255,255,255,0.1);
      /* background: rgba(67,67,67,0.2); Dark highlight */
      box-shadow: inherit;
      text-shadow: inherit;
  }
  
  #workspaces:hover {
          background: transparent;
          padding: 0px;
  }
  
  #network {
      padding: 0px ${modulePadding};
  }
  
  #network:hover {
  }
  
  #custom-search {
      padding: 0px ${modulePadding};
  }
  
  #clock {
          margin-right: ${modulePadding};
          padding: 0px ${rightEdgePadding};
  }

  ${extraConfig}
''
