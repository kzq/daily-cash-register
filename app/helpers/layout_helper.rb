module LayoutHelper
  def copyright_notice_year_range(start_year)
  # In case the input was not a number (nil.to_i will return a 0)
  start_year = start_year.to_i

  # Get the current year from the system
  current_year = Time.new.year

  # When the current year is more recent than the start year, return a string
  # of a range (e.g., 2010 - 2012). Alternatively, as long as the start year
  # is reasonable, return it as a string. Otherwise, return the current year
  # from the system.
  if current_year > start_year && start_year > 2000
    "#{start_year} - #{current_year}"
  elsif start_year > 2000
    "#{start_year}"
  else
    "#{current_year}"
  end
  end

  def add_menu_item_to_sidebar(options={})
    options[:link].blank? ? add_menu_item_to_sidebar_without_link(options) : add_menu_item_to_sidebar_with_link(options)
  end

  def add_menu_item_to_sidebar_without_link(options)
    content_tag(:span, options[:item], class: "menu-title", 'data-i18n': options[:data_i18n] )
  end

  def add_menu_item_to_sidebar_with_link(options)
    link_to options[:item], options[:link], class: "menu-title", 'data-i18n': options[:data_i18n]
  end

  # Display menu title for navbar
  # It displays only parent item with optional
  # icon and tag
  def display_menu_title(item:, link: '#', icon: 'icon-home3', tag: nil)
    render 'layouts/menu_title', item: item, link: link, icon: icon, badge: tag
  end
end