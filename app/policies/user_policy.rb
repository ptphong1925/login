class UserPolicy < ApplicationPolicy
    def index?
        true
    end
    def show?
        false
    end

    def new?
        true
    end

    def create?
        new?
    end

    def edit?
        true
    end

    def update?
        edit?
    end

    def destroy?
        false
    end

end
