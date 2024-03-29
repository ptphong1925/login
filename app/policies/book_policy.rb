class BookPolicy < ApplicationPolicy
    def index?
        true
    end
    def show?
        index?
    end

    def new?
        true
    end

    def create?
        new?
    end

    def edit?
        user == record.author
    end

    def update?
        edit?
    end

    def destroy?
        false
    end

end
