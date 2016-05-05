require "request_store"

module FlashMessenger
  module Helper
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

    def flash_messenger
      RequestStore.store[:flash_messenger] ||= []
    end

    def push_flash(message, options, method = nil)
      options = options.nil? ? options : options.clone
      if method.nil?
        if options.nil?
          job = [message]
        else
          job = [message, options]
        end
      else
        job = [message, options, method]
      end
      flash_messenger << job
    end
  end
end
