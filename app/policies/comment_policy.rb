class CommentPolicy < ApplicationPolicy
    def index?
        true
    end
    def show?
        true
    end

    def new?
        Comment.all.count < 1000
    end

    def create?
        new?
    end

    def edit?
        new?
    end

    def update?
        edit?
    end

    def destroy?
        true
    end
end