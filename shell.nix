# Local build environment for the al-folio site.
# `nix-shell` then `bundle install` && `bundle exec jekyll serve`.
#
# CI (.github/workflows/deploy.yml) uses Ruby 3.3 via ruby/setup-ruby; this
# matches it. Upstream al-folio pins 3.2.2, but ruby_3_2 was dropped from
# nixpkgs, so both sides are aligned to 3.3 here.
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
    imagemagick # jekyll-imagemagick: responsive WebP
    nodejs_22 # purgecss + fetch_publications.js
  ];

  # Keep gems inside the repo, out of git.
  BUNDLE_PATH = "vendor/bundle";
  BUNDLE_BUILD__NOKOGIRI = "--use-system-libraries";
}
