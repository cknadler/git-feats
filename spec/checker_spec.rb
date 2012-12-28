require File.expand_path('../spec_helper', __FILE__)
require 'git-feats'

PRIVATE_METHODS = [:upload_feats]

def stub_config_exists(exists)
  GitFeats::Config.stub(:exists?) { exists } 
end

describe GitFeats::Checker do
  let(:klass) { GitFeats::Checker }
  subject     { klass }

  PRIVATE_METHODS.each do |private_method|
    its(:private_methods) { should include(private_method) }
  end

  describe ".check" do
    let(:meth)  { :check }
    subject     { klass.method(meth) }
    its(:arity) { should eq(1) }
  end

  describe ".upload_feats" do
    let(:meth)  { :upload_feats }
    subject     { klass.method(meth) }
    its(:arity) { should eq(0) }

    context "when GitFeats::Config exists" do
      let(:upload_string) { "API upload feats report string" }
      before { stub_config_exists(true) }
      it "should call GitFeats::API.upload_feats" do
        GitFeats::API.should_receive(:upload_feats).and_return(upload_string)
        expect(klass.send(meth)).to eq(upload_string)
      end
    end
    
    context "when GitFeats::Config does NOT exist" do
      before { stub_config_exists(false) }
      it "should do nothing and return nil" do
        GitFeats::API.should_not_receive(:upload_feats)
        expect(klass.send(meth)).to be_nil
      end
    end
  end
end
