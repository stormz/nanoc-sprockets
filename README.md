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

### Usage

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

### License

(c) 2014 Stormz

[sprockets]: https://github.com/sstephenson/sprockets
[nanoc]: http://nanoc.ws/
