class UserPolicy < ApplicationPolicy
    def index?
        user.admin?
    end
    def show?
        user.admin? ||
        user == record
    end

    def new?
        user.nil?
    end

    def create?
        new?
    end

    def edit?
        user.admin?
    end

    def update?
        edit?
    end

    def destroy?
    end

end
