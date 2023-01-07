class CurrentUser

  def self.find_by(token_user)
    person_id, person_role = JsonWebToken.decode(token_user)
    case person_role
    when "Admin"
      Admin.find(person_id)
    when "User"
      User.find(person_id)
    end
  end
  
end