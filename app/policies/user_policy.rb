class UserPolicy < ApplicationPolicy
    def edit?
        @user == record
    end

    def show?
        @user == record
    end
end
