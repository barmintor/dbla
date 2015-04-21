require 'spec_helper'
describe Dbla::DocumentPresenter do
	subject { Dbla::DocumentPresenter.new(data,{},{}) }
	describe "title methods" do
		context "with field" do
			let(:data) {{'sourceResource' => {'title' =>'foo'}}}
			it do
				expect(subject.document_heading).to eql('foo')
				expect(subject.document_show_html_title).to eql('foo')
			end
		end
		context "without field" do
			let(:data) {{'sourceResource' => {},'id' => 'foo'}}
			it do
				expect(subject.document_heading).to eql('foo')
				expect(subject.document_show_html_title).to eql('foo')
			end
		end
	end
end