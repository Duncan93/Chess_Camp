class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  # check authorization
  authorize_resource
  
  def index
    @activeFamilies = Family.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    @inactiveFamilies = Family.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def show
    @familyStudents = @family.students.alphabetical.to_a
  end

  def new
    @family = Family.new
  end

  def edit
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to @family, notice: "The family #{@family.family_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @family.update(family_params)
      redirect_to @family, notice: "The family #{@family.family_name} was added to the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @family.destroy
    redirect_to families_url, notice: "The family #{@family.family_name} was removed from the system."
  end

  private
    def set_family
      @family = Family.find(params[:id])
    end

    def family_params
      params.require(:family).permit(:family_name, :parent_first_name, :email, :phone, :active)
    end
end
