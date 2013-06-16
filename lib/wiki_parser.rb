# -*- encoding: utf-8 -*-

class WikiParser
  def to_list(text)
    if text =~ /^\s+\*.(.+)/
      return "<ul><li>#{$1}</li></ul>"
    end
    text
  end

  def to_header(text)
    6.downto(1) do |i|
      if text =~ /^#{'=' * i}\s*/ && text =~ /\s*#{'=' * i}$/
        return text.gsub(/^#{'=' * i}\s*/, "<h#{i}>").gsub(/\s*#{'=' * i}$/, "</h#{i}>")
      end
    end

    text
  end
end
