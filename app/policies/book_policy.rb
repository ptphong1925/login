class BookPolicy < ApplicationPolicy
    def index?
        user.admin?
    end
end