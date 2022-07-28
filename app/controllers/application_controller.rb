class ApplicationController < ActionController::API
  def current_customer
    Customer.find_by(id: params[:customer_id])
  end

  def current_tea
    Tea.find_by(id: params[:tea_id])
  end
end
