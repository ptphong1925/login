class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: :new

  before_action :set_author, only: %i[ show edit update destroy ]

  # before_action(only: [:show, :edit, :update, :destroy]) { authorize @author }
  # after_action(only: [:index]) { authorize @authors }
  # after_action(only: [:new, :create]) { authorize @author }

  def index
    @authors = Search.by_keyword(Author.all, params[:keyword], "users.username", "users.first_name", "users.last_name" )
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:username, :password_digest, :first_name, :last_name, :role, :token_user, :email, :visits, :orders_count, :lock_version, :keyword)
  end
end
