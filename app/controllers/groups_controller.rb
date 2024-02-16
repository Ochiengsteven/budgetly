class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @groups = @user.groups.order(created_at: :desc)
    @total_amount = @groups.sum { |group| group.entities.sum(:amount) }
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params.merge(user_id: current_user.id))

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, status: 422
    end
  end

  def destroy
    @user = current_user
    @group = @user.groups.find(params[:id])
    if @group.destroy
      redirect_to groups_path, notice: 'Recipe deleted successfully'
    else
      redirect_to groups_path, alert: 'Error: could not be deleted'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
