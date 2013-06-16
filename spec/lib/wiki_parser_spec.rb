# -*- encoding: utf-8 -*-
require 'spec_helper'

describe WikiParser do
  let(:wiki_parser){ WikiParser.new }

  context " * から始まるテキストをリストと判定すること" do
    it { wiki_parser.to_list(" * test").should eq '<ul><li>test</li></ul>' }
  end

  context "* から始まるテキストをリストではないと判定すること" do
    it { wiki_parser.to_list("* test").should eq '* test' }
  end
  
  context "  * から始まるテキストをリストと判定すること" do
    it { wiki_parser.to_list("  * test").should eq '<ul><li>test</li></ul>' }
  end
  
  context "  *から始まるテキストで、*の後２文字目からリストに出力されること" do
    it { wiki_parser.to_list("  *test").should eq '<ul><li>est</li></ul>' }
  end

  context " =で括られたテキストを、ヘッダに変換すること" do
    it { wiki_parser.to_header("= header =").should eq '<h1>header</h1>'}
  end

  context " =で括られたテキストを、ヘッダに変換すること" do
    it { wiki_parser.to_header("= header").should eq '= header'}
  end

  context " =で括られたテキストを、ヘッダに変換すること" do
    it { wiki_parser.to_header("= test =").should eq '<h1>test</h1>'}
  end
end
