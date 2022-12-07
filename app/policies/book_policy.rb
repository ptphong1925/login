class BookPolicy < ApplicationPolicy

    class Scope
        def initialize(user, scope)
          @user  = user
          @scope = scope
        end
    
        def resolve
          if user.admin?
            scope.all
          else
            scope.where(out_of_print: true)
          end
        end
    
        private
    
        attr_reader :user, :scope
      end

    def index?
        true
    end

    def show?
        index?
    end

    def new?
        user.author?
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
    end

    
end