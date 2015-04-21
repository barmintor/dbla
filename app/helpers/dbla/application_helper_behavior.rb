module Dbla
  module ApplicationHelperBehavior
    def dbla_external_link(options, text='')
      url = options[:value]
      link_to(url, 'class' => 'dbla-view-object') do
        content_tag(:span, text, 'class'=> 'glyphicon glyphicon-new-window')
      end
    end
  end
end