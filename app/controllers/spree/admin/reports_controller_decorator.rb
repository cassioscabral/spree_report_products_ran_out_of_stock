module Spree
  module Admin
    ReportsController.class_eval do
      def initialize
        super
        ReportsController.add_available_report!(:sales_total)
        ReportsController.add_available_report!(:products_ran_out_of_stock)
      end

      def products_ran_out_of_stock
        params[:q] = {} unless params[:q]

        if params[:q][:updated_at_gt].blank?
          params[:q][:updated_at_gt] = Time.zone.now.beginning_of_month
        else
          params[:q][:updated_at_gt] = Time.zone.parse(params[:q][:updated_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
        end

        if params[:q] && !params[:q][:updated_at_lt].blank?
          params[:q][:updated_at_lt] = Time.zone.parse(params[:q][:updated_at_lt]).end_of_day rescue ""
        end

        params[:q][:s] ||= "updated_at desc"

        # ransack don't work well with includes/join
        @search = Variant.ransack(params[:q])

        @variants = Variant.includes(:stock_items).where("spree_stock_items.count_on_hand == 0").references(:spree_stock_items).where("spree_variants.updated_at >= ?", params[:q][:updated_at_gt])

        if params[:q][:updated_at_lt].present?
            @variants = @variants.where("spree_variants.updated_at <= ?", params[:q][:updated_at_lt])
        end
      end
    end
  end
end
