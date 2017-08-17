# An object that gathers featured pianos for a user

class FeaturedPianos
  def self.for(user_id)
    for_user = User.find(user_id)

    pianos_since_last_login = Piano.where(
      created_at: (for_user.last_login..Time.now),
      user_id: for_user.id
    )

    # pianos_currently_featured = Piano.where(HAS IMAGE)
    # pianos_since_last_login.or(pianos_currently_featured)
  end
end
