module FlashMessenger
  module Helper
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
