# -*- encoding: utf-8 -*-

class WikiParser
  def to_list(text)
    if text =~ /^\s+\*.(.+)/
      return "<ul><li>#{$1}</li></ul>"
    end
    text
  end

  def to_header(text)
    if text =~ /^=\s*(.+)/ && $1 =~ /(.+)\s*=$/ 
      return "<h1>#{$1}</h1>"
    end
    text
  end
end
