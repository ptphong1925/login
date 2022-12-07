class UserPolicy < ApplicationPolicy
    def index?
        user.class.name == "Admin" || user
    end
    def show?
        user.class.name == "Admin" || user
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
