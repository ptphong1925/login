class AdminPolicy < ApplicationPolicy
    def index?
        user.class.name == "Admin"
    end
    def show?
        index?
    end

    def new?
        false
    end

    def create?
        false
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
