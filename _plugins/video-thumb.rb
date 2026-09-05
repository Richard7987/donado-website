module Jekyll
  module VideoThumb
    def youtube_id(url)
      return nil if url.nil? || url.empty?

      match = url.match(%r{(?:youtu\.be/|youtube\.com/(?:watch\?v=|embed/|shorts/))([\w-]{6,})})
      match && match[1]
    end
  end
end

Liquid::Template.register_filter(Jekyll::VideoThumb)
