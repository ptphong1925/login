class UserPolicy < ApplicationPolicy
    def index?
        true
    end
    def show?
        user.admin? || user
    end

    def new?
        user.nil?
    end

    def create?
        new?
    end

    def edit?
        user == record
    end

    def update?
        edit?
    end

    def destroy?
        false
    end

end
