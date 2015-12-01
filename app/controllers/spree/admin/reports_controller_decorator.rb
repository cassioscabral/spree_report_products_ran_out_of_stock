module Spree
  module Admin
    ReportsController.class_eval do
      def initialize
        super
        ReportsController.add_available_report!(:sales_total)
        ReportsController.add_available_report!(:products_ran_out_of_stock)
      end
    end
  end
end
