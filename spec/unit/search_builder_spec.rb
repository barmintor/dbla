require 'spec_helper'
describe Dbla::SearchBuilderBehavior do
	before(:all) do
		class BuilderRig < Blacklight::SearchBuilder
		  include Dbla::SearchBuilderBehavior
		end 
	end
	after(:all) do
		Object.send :remove_const, :BuilderRig
	end
	subject { BuilderRig.new([],nil) }
	describe "blacklight_params" do
		it do
			expect(subject.blacklight_params).to be
		end
	end
end