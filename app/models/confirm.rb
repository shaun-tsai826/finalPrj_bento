class Confirm < ActiveRecord::Base
    belongs_to :user
    validates_numericality_of :confirm_menu_count, :only_integer => true
    # validates_numericality_of :confirm_total_price, :only_integer => true, :greater_than => 1
end
