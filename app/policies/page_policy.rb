class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
  
  def new?
     create?
  end

  def create?
   true
  end


  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
  end

end