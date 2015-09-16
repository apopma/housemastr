class HousesController < ApplicationController
  def show

    search_params = params.select do
      |param| param.start_with?("min") || param.start_with?("max")
    end

    @houses = House.none
    search_params.each do |search_method, val|
      if @houses.empty?
        @houses = House.send(search_method, val) if @houses.respond_to?(search_method)
      else
        @houses = @houses.send(search_method, val) if @houses.respond_to?(search_method)
      end
    end

    render :show
  end
end
