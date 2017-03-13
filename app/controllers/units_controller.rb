class UnitsController < ApplicationController

  def index
    @units_category = UnitCategory.find(params[:unit_category])
    @units = Unit.where(unit_category: @units_category)
  end

end
