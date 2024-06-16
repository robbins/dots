{ fontSize, workspaceMargin }:
''
  * {
      border: none;
      border-radius: 0;
      font-family: "SF Pro Display", "Symbols Nerd Font";
      font-size: ${fontSize};
      color: rgba(0, 0, 0, 1);
      font-weight: 400;
      padding: 0;
      margin: 0;
  
      /* Try to imitate macOS font dilation */
      text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
  
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
      background: rgba(255, 255, 255, 0.35);
  }
  
  #custom-logo {
          margin-left: 20px;
          padding: 0px 10px;
          font-size: 23px;
  }
  
  #custom-logo:hover {
          padding: 0px 10px;
  }
  
  #window {
      padding: 0px 20px;
  }
  
  #window:hover {
  }
  
  #workspaces {
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
      padding: 0px 15px;
  }
  
  #network:hover {
  }
  
  #custom-search {
      padding: 0px 15px;
  }
  
  #custom-search:hover {
      padding: 0px 15px;
  }
  
  #clock {
          margin-right: 15px;
          padding: 0px 15px;
  }
  
  #clock:hover {
      padding: 0px 15px;
  }
''
