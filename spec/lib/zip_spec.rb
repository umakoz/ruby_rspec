# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Zip do
  let(:zip){ Zip.new }

  it "空欄のとき" do
    zip.valid?("").should be_false
  end

  it "２桁の数字のとき" do
    zip.valid?("11").should be_false
  end

  it "３桁の数字のとき" do
    zip.valid?("111").should be_true
  end

  it "３桁の数字が000のとき" do
    zip.valid?("000").should be_false
  end

  it "４桁の数字のとき" do
    zip.valid?("1111").should be_false
    zip.valid?("0000").should be_false
  end

  it "６桁の数字のとき" do
    zip.valid?("123456").should be_false
    zip.valid?("876543").should be_false
  end

  it "７桁の数字のとき" do
    zip.valid?("1234567").should be_true
    zip.valid?("8765432").should be_true
  end

  it "７桁の数字が0000000のとき" do
    zip.valid?("0000000").should be_false
  end

  it "８桁の数字のとき" do
    zip.valid?("12345678").should be_false
    zip.valid?("87654321").should be_false
  end

  it "○○○-○○○○のとき" do
    zip.valid?("123-4567").should be_true
    zip.valid?("876-5432").should be_true
  end

  it "000-0000のとき" do
    zip.valid?("000-0000").should be_false
  end

  it "アルファベットが含まれている時" do
    zip.valid?("abc").should be_false
    zip.valid?("abcdefg").should be_false
    zip.valid?("abc-4567").should be_false
    zip.valid?("876-defg").should be_false
  end

  it "ハイフンの位置が間違っている時" do
    zip.valid?("1234-567").should be_false
  end
end
