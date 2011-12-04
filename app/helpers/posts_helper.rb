module PostsHelper 
  def wrap(content)
    content = sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
	raw(truncate(content, :length => 500, :separator => ' ', :omission => ' &raquo;'))
  end

  private

    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
end
