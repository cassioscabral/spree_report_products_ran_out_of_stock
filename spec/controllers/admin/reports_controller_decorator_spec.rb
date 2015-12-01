require 'spec_helper'

describe Spree::Admin::ReportsController, :type => :controller do
  stub_authorization!

  describe 'ReportsController.available_reports' do
    it 'should contain sales_total' do
      expect(Spree::Admin::ReportsController.available_reports.keys.include?(:sales_total)).to be true
    end

    it 'should contain products_ran_out_of_stock' do
      expect(Spree::Admin::ReportsController.available_reports.keys.include?(:products_ran_out_of_stock)).to be true
    end

    it 'should have the proper products that ran out of stock description' do
      expect(Spree::Admin::ReportsController.available_reports[:products_ran_out_of_stock][:description]).to eql('Products that ran out of stock')
    end

  end

  after(:each) do
    Spree::Admin::ReportsController.available_reports.delete_if do |key, value|
      key != :sales_total
    end
  end
end
