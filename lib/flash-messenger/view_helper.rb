module FlashMessenger
  module ViewHelper
    include FlashMessenger::Helper

    def show_flash
      flash.map do |type, message|
        push_flash(message, :type => type)
      end
      javascript_tag "flash.show(#{flash_messenger.to_json});" unless flash_messenger.empty?
    end
  end
end
