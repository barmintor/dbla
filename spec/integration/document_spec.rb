require 'spec_helper'
describe Dbla::Document do
	before(:all) do
		class DocumentRig
			include Blacklight::Solr::Document
			include Dbla::Document
		end 
	end
	after(:all) do
		Object.send :remove_const, :DocumentRig
	end
	subject { DocumentRig.new(data) }
	context "doc-001.json" do
		let(:data) { fixture('doc-001.json') { |b| JSON.parse(b.read) } }
		describe "[]" do
			it do
				expect(subject['sourceResource.title']).to eql(["Camp Lee, U.S. National Army Cantonment, Petersburg, Virginia"])
				expect(subject['sourceResource.format']).to eql(["9.5\" x 50\" (sheet size) Panorama (Photographs)", "Photographs"])
			end
		end
		describe "has?" do
			it "should work with only a key" do
				expect(subject.has? 'sourceResource.title').to be(true)
			end
			it "should work with a value" do
			end
		end
	end
end