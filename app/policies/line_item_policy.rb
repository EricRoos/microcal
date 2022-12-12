# frozen_string_literal: true

class LineItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    owns_resource?
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    owns_resource?
  end

  def edit?
    owns_resource?
  end

  def destroy?
    owns_resource?
  end

  private

  def owns_resource?
    @record.user == @user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
