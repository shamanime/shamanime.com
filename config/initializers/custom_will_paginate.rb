class PaginationListLinkRenderer < WillPaginate::LinkRenderer
  def to_html
    links = @options[:page_links] ? windowed_links : []
    # previous/next buttons
    links.unshift page_link_or_span(@collection.previous_page, 'disabled prev', @options[:previous_label])
    links.push page_link_or_span(@collection.next_page, 'disabled next', @options[:next_label])
  
    html = links.join(@options[:separator])
    html = html.html_safe if html.respond_to? :html_safe
    @options[:container] ? @template.content_tag(:ul, html, html_attributes) : html
  end
  
  def gap_marker
    @gap_marker ||= begin
      gap_text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
      %(<li class="gap">#{gap_text}</li>)
    end
  end
  
  protected
  # Collects link items for visible page numbers.
  def windowed_links
    prev = nil

    visible_page_numbers.inject [] do |links, n|
      # detect gaps:
      links << gap_marker if prev and n > prev + 1
      links << page_link_or_span(n, 'active')
      prev = n
      links
    end
  end
  
  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    text = text.html_safe if text.respond_to? :html_safe

    if page and page != current_page
      classnames = span_class && span_class.index(' ') && span_class.split(' ', 2).last
      page_link page, text, :rel => rel_value(page), :class => classnames
    else
      page_disabled page, text, :class => span_class
    end
  end

  def page_link(page, text, attributes = {})
    @template.content_tag :li, attributes do
      @template.link_to text, url_for(page), attributes
    end
  end
  
  def page_disabled(page, text, attributes = {})
    @template.content_tag :li, attributes do
      @template.link_to text,'#', attributes
    end
  end
end
WillPaginate::ViewHelpers.pagination_options[:renderer] = 'PaginationListLinkRenderer'