class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  rescue_from StandardError do |exception|
    puts exception.message
    exception.backtrace.map { |line| puts line }
    render json: { error: exception.message, backtrace: exception.backtrace }, status: 500
  end

  def index
    @object = model_class.order(created_at: sort).limit(limit).offset(offset)
    render json: @object.map(&:to_h)
  end

  def show
    render json: model_class.find(params[:id]).to_h
  end

  def update
    @object = model_name.find(params[:id]).update(object_params)
    render json: @object.to_hash
  end

  def destroy
    model_class.find(params[:id]).destroy
    render json: {}
  end

  private

  def model_class
    controller_name.classify.constantize
  end

  def limit
    params[:limit] || 10
  end

  def offset
    params[:offset] || 0
  end

  def sort
    return :desc unless valid_sort_param?
    params[:sort].to_sym
  end

  def valid_sort_param?
    %w(asc desc).include?(params[:sort])
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end
end
