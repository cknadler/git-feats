require File.expand_path('../spec_helper', __FILE__)
require 'git-feats'

describe GitFeats::API do
  let(:klass) { GitFeats::API }

  subject { klass }

  describe ".upload_feats" do
    let(:meth)  { :upload_feats }
    subject     { klass.method(meth) }
    its(:arity) { should eq(0) }
  end
end