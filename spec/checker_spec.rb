require File.expand_path('../spec_helper', __FILE__)
require 'git-feats'

PRIVATE_METHODS = [ :complete_and_report?, :get_matched_feat_vals,
                    :load_achievements, :write_achievements ]
PATH            = Dir.home + '/.git_feats/'
HISTORY_PATH    = PATH + "history"
COMPLETED_PATH  = PATH + "completed"

def stub_config_exists(exists)
  GitFeats::Config.stub(:exists?) { exists } 
end


describe GitFeats::Checker do
  let(:klass) { GitFeats::Checker }
  subject     { klass }

  def clear_completed
    if File.exists?(COMPLETED_PATH)
      %x(cp #{COMPLETED_PATH} #{COMPLETED_PATH + "_old"})
      %x(rm #{COMPLETED_PATH})
    end
  end

  def restore_completed
    if File.exists?(COMPLETED_PATH + "_old")
      %x(cp #{COMPLETED_PATH + "_old"} #{COMPLETED_PATH})
      %x(rm #{COMPLETED_PATH + "_old"})
    end
  end

  its(:private_methods) { should include(*PRIVATE_METHODS) }

  describe ".check" do
    let(:meth)  { :check }
    subject     { klass.method(meth) }
    its(:arity) { should eq(1) }

    #TODO: Refactor the following code.
    context "when args is valid" do
      let(:args) { GitFeats::Args.new(["submodule", "add", "status", "commit"]) }
      let(:submod_count) { GitFeats::History.unserialize["submodule add"] }
      it "should add one to the history of status" do
        eq_submod_count = submod_count
        klass.send(meth, args)
        expect(submod_count).to eq(eq_submod_count)
      end

      it "should add completed status to completed history" do
        clear_completed
        expect(GitFeats::Completed.unserialize).to eq([])
        klass.send(meth, args)
        expect(GitFeats::Completed.unserialize).to eq(["sublet"])
        restore_completed
      end 
    end

    context "when args are not valid" do 
      let(:args) { GitFeats::Args.new(["some_arg"]) }

      it "should not add one to the history of status" do
        klass.should_not_receive(:upload_feats)
        klass.send(meth, args)
        expected_status_num = GitFeats::History.unserialize["some_arg"]
        expect(expected_status_num).to be_nil
      end

      it "should not add anything to completed history" do
        clear_completed
        expect(GitFeats::Completed.unserialize).to eq([])
        klass.should_not_receive(:upload_feats)
        klass.send(meth, args)
        expect(GitFeats::Completed.unserialize).to eq([])
        restore_completed
      end 
    end
  end

  # describe ".upload_feats" do
  #   let(:meth)            { :upload_feats }
  #   subject               { klass.method(meth) }
  #   its(:arity)           { should eq(0) }
  #   context "when GitFeats::Config exists" do
  #     let(:upload_string) { "API upload feats report string" }
  #     before { stub_config_exists(true) }
  #     it "should call GitFeats::API.upload_feats" do
  #       GitFeats::API.should_receive(:upload_feats).and_return(upload_string)
  #       expect(klass.send(meth)).to eq(upload_string)
  #     end
  #   end
  #   context "when GitFeats::Config does NOT exist" do
  #     before { stub_config_exists(false) }
  #     it "should do nothing and return nil" do
  #       GitFeats::API.should_not_receive(:upload_feats)
  #       expect(klass.send(meth)).to be_nil
  #     end
  #   end
  # end
end