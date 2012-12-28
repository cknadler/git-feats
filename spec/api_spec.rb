require File.expand_path('../spec_helper', __FILE__)
require 'git-feats'
require 'faraday'


describe GitFeats::API do
  let(:klass) { GitFeats::API }
  subject { klass }

  describe ".upload_feats" do
    let(:meth)  { :upload_feats }
    subject     { klass.method(meth) }
    its(:arity) { should eq(-1) }

    # request mocks with faraday
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post('/api/feats') {[200, {}, '{"message":"OK"}']}
    end

    test = Faraday.new do |builder|
      builder.adapter :test, stubs
    end

    it "display success if response is 200" do
      response = test.post('/api/feats')
    end
  end
end
