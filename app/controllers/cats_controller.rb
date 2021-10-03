class CatsController < ApplicationController
  before_action :authorize_request, except: %i[create index_public]
  before_action :find_cat, except: %i[create index]
  def index
    @cats = Cat.all
    render json: @cats, status: :ok
  end

  def cat_details
    @cats = Cat.all.pluck(:name)
    render json: @cats, status: :ok
  end
    
  def show
    render json: @cat, status: :ok
  end

  private

  def find_cat
    @cat = Cat.find_by_name!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Cat not found' }, status: :not_found
  end
end
