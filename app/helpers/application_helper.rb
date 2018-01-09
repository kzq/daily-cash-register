# frozen_string_literal: true

module ApplicationHelper
  def add_icon(class_name)
    content_tag(:i, "", class: class_name)
  end
end
