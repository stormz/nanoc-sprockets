# encoding: utf-8

require "sprockets"
require "sprockets-helpers"

module Nanoc::DataSources
  class SprocketsDataSource < Nanoc::DataSource
    identifier :sprockets
    LOOSE_ASSETS = lambda do |filename, path|
      path =~ /assets/ && !%w(.js .css).include?(File.extname(filename))
    end

    def up
      @config = {
        path: 'assets',
        compile: [],
        assets_additionnal_paths: []
      }.merge(@config)
    end

    def items
      assets = environment.each_logical_path(*compiled_assets).to_a

      assets.map do |bundle|
        asset = environment.find_asset(bundle)
        is_binary = !!(asset.pathname && !@site.config[:text_extensions].include?(File.extname(asset.pathname)[1..-1]))

        content_of_filename = is_binary ? asset.pathname : asset.to_s
        attributes = {filename: bundle, binary: is_binary, mtime: asset.mtime}
        Nanoc::Item.new(content_of_filename, attributes, bundle, attributes)
      end
    end

    protected
    def environment
      @environment ||= create_environment
    end

    def create_environment
      env = ::Sprockets::Environment.new

      %w(javascripts images stylesheets fonts).each do |asset|
        env.append_path File.join(config[:path], asset)
      end
      config[:assets_additionnal_paths].each do |path|
        env.append_path path
      end
      env.js_compressor  = config[:js_compressor].to_sym
      env.css_compressor = config[:css_compressor].to_sym

      # Configure Sprockets::Helpers
      Sprockets::Helpers.configure do |c|
        c.environment = env
        c.prefix      = config[:items_root]
        c.asset_host  = config[:asset_host] if config[:asset_host]
        c.digest      = config[:digest]     if config[:digest]
      end
      env
    end

    def compiled_assets
      config[:compile] + [LOOSE_ASSETS]
    end
  end
end
include Sprockets::Helpers
