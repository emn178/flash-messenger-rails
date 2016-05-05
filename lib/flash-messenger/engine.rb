if defined?(::Rails::Engine)
  module FlashMessenger
    class Engine < ::Rails::Engine
      initializer "flash-messenger-rails" do
        ActiveSupport.on_load(:action_view) do
          include FlashMessenger::ViewHelper
        end
        ActiveSupport.on_load(:action_controller) do
          include FlashMessenger::Helper
        end
      end
    end
  end
end
