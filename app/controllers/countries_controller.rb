class CountriesController < ApplicationController
  def index
    @countries = Country.all.order(id: :desc)
  end

  def create
    country = Country.new({
      name: params[:task][:name],
      population: params[:task][:population],
      gdp: params[:task][:gdp],
      has_monarch: params[:task][:has_monarch],
#      created_at: params[:task][:created_at],
#      updated_at: params[:task][:updated_at]
      })

    country.save

    redirect_to '/countries'
  end

  def show
    @countries = Country.find(params[:id])
  end


  def show_individual
#    require 'pry'; binding.pry
    @countries = Country.find(params[:id])
  end

  def new
  end

  def edit
    @countries = Country.find(params[:id])
  end

  def update

    task = Country.find(params[:id])
    task.update({
      name: params[:task][:name],
      population: params[:task][:population],
      gdp: params[:task][:gdp],
      has_monarch: params[:task][:has_monarch]
      })

    #  require 'pry'; binding.pry
      task.save
    #  require 'pry'; binding.pry

      redirect_to "/countries/#{task.id}"
  end

end
