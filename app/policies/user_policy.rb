class UserPolicy < ApplicationPolicy
    def index?
        user.admin?
    end
    def edit?
        user == record
    end

    def show?
        user.admin? ||
        user == record
    end
end
