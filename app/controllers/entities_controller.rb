class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
    @total = @entities.sum(:amount)
    @user = current_user
  end

  def show
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
    @entity = @entities.find(params[:id])
  end

  def new
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    @user = current_user
    @group = @user.groups.find(params[:group_id])

    @entity = Entity.new(entity_params.merge(author_id: @user.id))
    if @entity.save
      redirect_to groups_path, notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    if @entity.destroy
      redirect_to groups_path, notice: 'Recipe deleted successfully'
    else
      redirect_to groups_path, alert: 'Error: could not be deleted'
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id, :author_id)
  end
end
