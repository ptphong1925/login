class AuthorPolicy < ApplicationPolicy
    def index?
        user.class.name == "Admin" ||
        user.author?
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
        user.author? && user == record
    end

    def update?
        edit?
    end

    def destroy?
        false
    end

end
