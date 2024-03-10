{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs-slim
    yarn
    deno
    rust-bin.stable.latest.default
  ];
}
