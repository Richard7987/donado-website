# Local build environment. Ruby 3.3 matches ruby/setup-ruby in deploy.yml.
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby_3_3
    bundler
    gcc
    gnumake
    pkg-config
    libyaml
    zlib
    imagemagick
    nodejs_22
  ];

  BUNDLE_PATH = "vendor/bundle";
  BUNDLE_BUILD__NOKOGIRI = "--use-system-libraries";
}
