module FlashMessenger
  module ControllerHelper
    include FlashMessenger::Helper

    def flash_message(message, options = nil)
      push_flash(message, options)
    end

    def flash_notice(message, options = nil)
      push_flash(message, options, 'notice')
    end

    def flash_alert(message, options = nil)
      push_flash(message, options, 'alert')
    end

    def flash_error(message, options = nil)
      push_flash(message, options, 'error')
    end

    def flash_model_error(errors, options = nil)
      errors = errors.errors if errors.is_a? ActiveRecord::Base
      push_flash(errors.as_json, options, 'modelError')
    end
  end
end
