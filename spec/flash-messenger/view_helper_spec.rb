require 'spec_helper'

describe FlashMessenger::ViewHelper do
  include FlashMessenger::ViewHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::JavaScriptHelper

  describe "#show_flash" do
    let(:message) { 'message' }

    context "when message is empty" do
      subject { show_flash }
      it { should eq nil }
    end

    context "when message from flash" do
      before { flash[:error] = message }
      subject { show_flash }
      it { should eq "<script>\n//<![CDATA[\nflash.show([[\"message\",{\"type\":\"error\"}]]);\n//]]>\n</script>" }
    end

    context "when message from function" do
      before { flash_notice(message) }
      subject { show_flash }
      it { should eq "<script>\n//<![CDATA[\nflash.show([[\"message\",null,\"notice\"]]);\n//]]>\n</script>" }
    end

    context "when message from both" do
      before { 
        flash[:error] = message
        flash_notice(message) 
      }
      subject { show_flash }
      it { should eq  "<script>\n//<![CDATA[\nflash.show([[\"message\",null,\"notice\"],[\"message\",{\"type\":\"error\"}]]);\n//]]>\n</script>" }
    end
  end

  def flash
    RequestStore.store[:flash] ||= {}
  end
end
