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
	let(:blacklight_params) { [] }
	subject { BuilderRig.new(blacklight_params,nil) }
	describe "blacklight_params" do
		it do
			expect(subject.blacklight_params).to be
		end
	end
	context "configured params" do
		#TODO what should these be
		let(:blacklight_params) { [] }
		describe "facet_filters" do
			it do
				subject.facet_filters
			end
		end
	end
end