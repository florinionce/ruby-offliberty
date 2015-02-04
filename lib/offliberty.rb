require "offliberty/version"
require "offliberty/helpers/connection"
require "mechanize"

module Offliberty
  class Off
    def initialize song_url
      @page = Offliberty::Helpers::Connection.new(song_url)
    end

    def download
      file.save(filename)
    end

    private

    def fetch_page
      @page.form.submit
    end

    def song_url
      fetch_page.links.fetch(0).href
    end

    def file
      @file ||= @page.agent.get(song_url)
    end

    def filename
      file.filename.gsub("_-_from_YouTube", "").gsub("_", " ")
    end
  end
end
