class GroupsController < ApplicationController
  before_action :set_group, only: %i(show edit update destroy)

  # GET /groups
  def index
    @groups = Group.all
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was created successfully.'
    else
      render :new
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # GET /groups/1
  def show
  end

  # PATCH /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was updated successfully.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was deleted.'
  end

  private

  def set_group
    @group = Group.find params[:id]
  end

  def group_params
    params.require(:group).permit(:start_time)
  end
end
