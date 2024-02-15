{pkgs, ...}:
pkgs.writeShellApplication {
  name = "rofi-drun";
  runtimeInputs = with pkgs; [rofi-wayland];
  text = ''
    dir="$HOME/.config/rofi/launchers/type-1"
    theme='style-1'

    rofi \
    -show drun \
    -theme "''${dir}"/"''${theme}".rasi
  '';
}
