class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:delivery_charge_id,:product_status_id,:category_id,:shipment_source_id,:shipping_time_id)
end
