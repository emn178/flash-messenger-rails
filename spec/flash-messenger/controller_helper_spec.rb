require 'spec_helper'

describe FlashMessenger::ControllerHelper do
  include FlashMessenger::ControllerHelper

  describe "#flash_message" do
    subject { flash_messenger }
    let(:message) { 'message' }

    context "when options is nil" do
      before { flash_message(message) }
      it { should eq [["message"]] }
    end

    context "when options is not nil" do
      before { flash_message(message, {:type => :error}) }
      it { should eq [["message", {:type=>:error}]] }
    end
  end

  describe "#flash_notice" do
    subject { flash_messenger }
    let(:message) { 'message' }

    context "when options is nil" do
      before { flash_notice(message) }
      it { should eq [["message", nil, "notice"]] }
    end

    context "when options is not nil" do
      before { flash_notice(message, {:type => :error}) }
      it { should eq [["message", {:type=>:error}, "notice"]] }
    end
  end

  describe "#flash_alert" do
    subject { flash_messenger }
    let(:message) { 'message' }

    context "when options is nil" do
      before { flash_alert(message) }
      it { should eq [["message", nil, "alert"]] }
    end

    context "when options is not nil" do
      before { flash_alert(message, {:type => :error}) }
      it { should eq [["message", {:type=>:error}, "alert"]] }
    end
  end

  describe "#flash_error" do
    subject { flash_messenger }
    let(:message) { 'message' }

    context "when options is nil" do
      before { flash_error(message) }
      it { should eq [["message", nil, "error"]] }
    end

    context "when options is not nil" do
      before { flash_error(message, {:type => :error}) }
      it { should eq [["message", {:type=>:error}, "error"]] }
    end
  end

  describe "#flash_model_error" do
    subject { flash_messenger }
    let(:article) { Article.new}

    context "when input errors" do
      before { 
        article.invalid?
        flash_model_error(article.errors) 
      }
      it { should eq [[{:title=>"can't be blank"}, nil, "modelError"]] }
    end

    context "when input model" do
      before { 
        article.invalid?
        flash_model_error(article) 
      }
      it { should eq [[{:title=>"can't be blank"}, nil, "modelError"]] }
    end
  end
end
