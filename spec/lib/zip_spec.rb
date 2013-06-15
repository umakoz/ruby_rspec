# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Zip do
  # let(:sample){ Sample.new }

  it "空欄のとき" do
    Zip.new.valid?("").should be_false
  end

  it "２桁の数字のとき" do
    Zip.new.valid?("11").should be_false
  end

  it "３桁の数字のとき" do
    Zip.new.valid?("111").should be_true
    Zip.new.valid?("000").should be_true
  end

  it "７桁の数字のとき" do
    Zip.new.valid?("1234567").should be_true
    Zip.new.valid?("8765432").should be_true
  end

  it "○○○-○○○○のとき" do
    Zip.new.valid?("123-4567").should be_true
    Zip.new.valid?("876-5432").should be_true
  end

  it "アルファベットが含まれている時" do
    Zip.new.valid?("abc-4567").should be_false
    Zip.new.valid?("876-defg").should be_false
  end

  it "ハイフンの位置が間違っている時" do
    Zip.new.valid?("1234-567").should be_false
  end
end
