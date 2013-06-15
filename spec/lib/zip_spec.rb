# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Zip do
  # let(:sample){ Sample.new }

  it "blank" do
    Zip.new.valid?("").should be_false
  end
  it "niketa" do
    Zip.new.valid?("11").should be_false
  end
  it "sanketa" do
    Zip.new.valid?("111").should be_true
  end
end
