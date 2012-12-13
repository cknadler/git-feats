require File.expand_path('../spec_helper', __FILE__)
require 'git-feats'

describe GitFeats::Checker do
  let(:klass) { GitFeats::Checker }

  subject { klass }

  describe ".check" do
    let(:meth)  { :check }
    subject     { klass.method(meth) }
    its(:arity) { should eq(1) }
  end
end