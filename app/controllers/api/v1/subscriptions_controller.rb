class Api::V1::SubscriptionsController < ApplicationController
  before_action :require_valid_customer, only: %i[index create]
  before_action :require_valid_tea, only: [:create]
  before_action :require_valid_status, only: [:update]

  def index
    subscriptions = current_customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :bad_request
    end
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :frequency, :status)
  end

  def require_valid_customer
    render json: { errors: 'Customer not found' }, status: :bad_request unless current_customer
  end

  def require_valid_tea
    render json: { errors: 'Tea not found' }, status: :bad_request unless current_tea
  end

  def require_valid_status
    if params[:status] != 'active' && params[:status] != 'cancelled'
      render json: { errors: 'Status not valid' }, status: :bad_request
    end
  end
end
