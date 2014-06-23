class PositionsController < ApplicationController

  def create
    position = Position.new(position_params)
    position.organization_id = params[:organization_id]
    position.save

    redirect_to edit_positions_path(Organization.find(params[:organization_id]))
  end

  private

    def position_params
      params.require(:position).permit(:title)
    end

end
