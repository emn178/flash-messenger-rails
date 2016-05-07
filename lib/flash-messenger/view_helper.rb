require "flash-messenger/helper"

module FlashMessenger
  module ViewHelper
    include FlashMessenger::Helper

    def show_flash(*types)
      types = FlashMessenger::DefaultTypes if types.empty?
      types.each do |type|
        push_flash(flash[type], :type => type) unless flash[type].nil?
      end
      javascript_tag "flash.show(#{flash_messenger.to_json});" unless flash_messenger.empty?
    end
  end
end
