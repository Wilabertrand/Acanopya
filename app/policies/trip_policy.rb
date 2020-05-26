class TripPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      if user.admin?
        scope.all #Trip.all
      else
        scope.where(user: user)
      end
    end
  end 

  def new?
    create?
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user || user.admin?
  end

end
