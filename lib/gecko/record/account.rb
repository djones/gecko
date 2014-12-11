require 'gecko/record/base'

module Gecko
  module Record
    class Account < Base
      has_many :users
      has_many :locations

      attribute :name,             String
      attribute :industry,         String
      attribute :logo_url,         String,  readonly: true
      attribute :website,          String
      attribute :tax_number,       String
      attribute :country,          String
      attribute :time_zone,        String

      attribute :contact_email,    String
      attribute :contact_mobile,   String
      attribute :contact_phone,    String

      attribute :invoice_details,  String
      attribute :order_details,    String
      attribute :quote_details,    String

      attribute :default_tax_rate, String

      attribute :default_sales_order_tax_type_id, Integer
      attribute :default_tax_treatment

      attribute :tax_number_label, String
      attribute :tax_label,        String

      attribute :default_sales_ledger_account_on, String

      belongs_to :billing_contact,          class_name: "User"
      belongs_to :primary_location,         class_name: "Location"
      belongs_to :primary_billing_location, class_name: "Location"
      belongs_to :default_currency,         class_name: "Currency"

      belongs_to :default_line_item_tax_type,      class_name: "TaxType"
      belongs_to :default_tax_type,                class_name: "TaxType"
      belongs_to :default_tax_exempt,              class_name: "TaxType"
      belongs_to :default_sales_order_tax_type,    class_name: "TaxType"
      belongs_to :default_purchase_order_tax_type, class_name: "TaxType"
      belongs_to :default_tax_exempt,                 class_name: "TaxType"

      attribute :default_purchase_order_price_list_id, String
      attribute :default_sales_order_price_list_id, String

      # belongs_to :default_purchase_order_price_list, class_name: "PriceList"
      # belongs_to :default_order_price_list, class_name: "PriceList"

      # belongs_to :default_payment_term, class_name: "PaymentTerm"

      attribute :stock_level_warn, Boolean
      # attribute :subscription_name,          String
      # attribute :subscription_price,         String
      # attribute :annual_subscription_price,  String
      # attribute :expires_at,                 String

      ## DEPRECATED
      # attribute :default_tax_type_id, Integer

    end

    class AccountAdapter < BaseAdapter
      undef :count
      undef :build

      # Return the account for the logged in user
      #
      # @return [Gecko::Record::Account]
      #
      # @api public
      def current
        if self.has_record_for_id?(:current)
          record_for_id(:current)
        else
          @identity_map[:current] = find(:current)
        end
      end
    end
  end
end
