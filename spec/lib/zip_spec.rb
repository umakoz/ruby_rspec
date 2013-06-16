# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Zip do
  let(:zip){ Zip.new }

  context "空欄のとき" do
    it { zip.should_not be_valid("") }
  end

  context "２桁の数字のとき" do
    it { zip.should_not be_valid("11") }
  end

  context "３桁の数字のとき" do
    it { zip.should be_valid("111") }
  end

  context "３桁の数字が000のとき" do
    it { zip.should_not be_valid("000") }
  end

  context "４桁の数字のとき" do
    it {zip.should_not be_valid("1111") } 
  end

  context "６桁の数字のとき" do
    it {zip.should_not be_valid("123456") } 
    it {zip.should_not be_valid("876543") } 
  end

  context "７桁の数字のとき" do
    it { zip.should be_valid("1234567") }
    it { zip.should be_valid("8765432") }
  end

  context "７桁の数字が0000000のとき" do
    it {zip.should_not be_valid("0000000") } 
  end

  context "８桁の数字のとき" do
    it {zip.should_not be_valid("12345678") } 
    it {zip.should_not be_valid("87654321") } 
  end

  context "○○○-○○○○のとき" do
    it {zip.should be_valid("123-4567") } 
    it {zip.should be_valid("876-5432") } 
  end

  context "000-0000のとき" do
    it {zip.should_not be_valid("000-0000") } 
  end

  context "アルファベットが含まれている時" do
    it { zip.should_not be_valid("abc") }
    it { zip.should_not be_valid("abcdefg") }
    it { zip.should_not be_valid("abc-4567") }
    it { zip.should_not be_valid("876-defg") }
  end

  context "ハイフンの位置が間違っている時" do
    it { zip.should_not be_valid("1234-567") }
  end
end
