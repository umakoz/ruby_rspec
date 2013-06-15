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
    Zip.new.valid?("000").should be_true
  end
  it "nanaketa" do
    Zip.new.valid?("1234567").should be_true
    Zip.new.valid?("8765432").should be_true
  end
  it "-8keta" do
    Zip.new.valid?("123-4567").should be_true
    Zip.new.valid?("876-5432").should be_true
  end
  it "alpha" do
    Zip.new.valid?("abc-4567").should be_false
    # Zip.new.valid?("876-5432").should be_false
  end
end
