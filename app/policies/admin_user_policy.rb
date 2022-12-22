class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.admin?
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    p @admin_user
    @admin_user.admin?
  end

  private
    def admin_user_params
      params.require(:admin_user).permit(:role)
    end
end
