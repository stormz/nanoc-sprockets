# Nanoc sprockets

Use [sprockets][] as a datasource for [nanoc][].

Features:

* Load your assets as nanoc's items
* Sprockets helpers *(javascript|image|stylesheet|font)_path* included
* Load and compile only the assets you want
* Configurable paths

## Install

Add *nanoc-sprockets* to you Gemfile.

     gem 'nanoc-sprockets'

## Config

In default.rb, require nanoc-sprockets:

    require 'nanoc-sprockets'

Add a new entry in your *nanoc.yaml*.

```yaml
data_sources:
  -
    type: sprockets
    items_root: /assets
    compile:
      - application.css
      - application.js
    path: assets
    css_compressor: scss
    js_compressor: uglifier
```

* items_root: the default prefix for you assets identifier
* compile: an array of js and css files to load as nanoc's items. Any other files are loaded automatically
* path: the path to the assets
* css_compressor: See [sprockets minifying assets][sprockets-minify-assets]
* js_compressor: See [sprockets minifying assets][sprockets-minify-assets]
* assets_additionnal_paths: an array of paths to be added to sprockets. Can be vendor/assets/javascript for example
* digest: The assets path will have a digest. You should toggle it to false during development.
* assets_host: Link to assets from a dedicated server.

Add specific rules for assets in *Rules*:

```ruby
compile '/assets/*/' do
end
route '/assets/*/' do
  Sprockets::Helpers.asset_path(item[:filename])
end
```

If you plan to use sass, you should probably install the *[sprockets-sass][]* gem. Also install the *[uglifier][]* gem to minify javascript.

## Usage

### Helpers

To link to any assets, use the helpers providers by [sprockets-helpers][].

* image_path
* font_path
* stylesheet_path
* javascript_path
* asset_path

### Enable digest

By default, digest of assets is not enabled. It means that js/css/images files are not concatened and the filename is preversed. Useful for development.

To enable digest, add to *lib/default.rb*:

```ruby
Sprockets::Helpers.configure do |c|
  c.digest = true
end

```

## License

(c) 2014 Stormz

MIT

[sprockets]: https://github.com/sstephenson/sprockets-minify-assets
[nanoc]: http://nanoc.ws/
[sprockets-minify-assets]: https://github.com/sstephenson/sprockets#minifying-assets
[sprockets-sass]: https://github.com/petebrowne/sprockets-sass/
[sprockets-helpers]: https://github.com/petebrowne/sprockets-helpers
[uglifier]: https://github.com/lautis/uglifier
