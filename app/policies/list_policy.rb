class ListPolicy < ApplicationPolicy

  def show?
    user.present? && (record.user == user)
  end

end