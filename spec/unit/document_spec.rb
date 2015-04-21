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
	context "flat fields" do
		let(:data) { {'foo' => 'bar', 'lol' => ['wut', 'no']} }
		it do
			expect(subject['foo']).to eql('bar')
			expect(subject['lol']).to eql(['wut', 'no'])
		end
	end
	context "nested document references" do
		let(:data) { {'foo' => 'bar', 'lol' => ['wut', 'no'], 'o' => {'hai' => {'rly' => ['yarly','norly']}}} }
		it do
			expect(subject['foo']).to eql('bar')
			expect(subject['lol']).to eql(['wut', 'no'])
			expect(subject['o.hai.rly']).to eql(['yarly','norly'])
			expect(subject['o.hai.wut']).to eql([])
		end
	end
end