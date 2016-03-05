class PartyController <  WebsocketRails::BaseController
	# before_filter :ensure_logged_in!

	def initialize_session
    # perform application setup here
    controller_store[:party_id] = nil
    controller_store[:connected_clients] = 0
  end

  def client_connected
    controller_store[:connected_clients] = controller_store[:connected_clients]+1
    # WebsocketRails["party_#{@presentation.id}"].trigger(:new_client, { :user_id => current_user.id, :nickname => current_user.nickname })
    # WebsocketRails["party_#{@presentation.id}"].trigger(:client_connected, { :user_id => current_user.id, :nickname => current_user.nickname })
    # puts "client_connected"
    # binding.pry
  end

  def client_disconnected
    controller_store[:connected_clients] = controller_store[:connected_clients]-1
    # WebsocketRails["party_#{@presentation.id}"].trigger(:client_disconnected, { :user_id => current_user.id, :nickname => current_user.nickname })
    # binding.pry
    # current_user.presentations.each do |pres|
    #   pres.latitude = nil
    #   pres.longitude = nil
    #   pres.geolocation_updated_at = nil
    #   pres.save
    # end
    # WebsocketRails["party_#{@presentation.id}"].trigger(:lost_client, { :user_id => current_user.id, :nickname => current_user.nickname })
    # WebsocketRails[]
    # binding.pry
  end

  def control_show
    if message[:slide] and message[:party]
      party_str = "party_#{message[:party]}"
      party = Party.where(:presentation_id => message[:party]).last
      slide = message[:slide]
      party.slide_num = slide
      party.save
      Fiber.new{ 
        WebsocketRails[party_str].trigger(:move_deck, { :slide => slide })
      }.resume
    end
  end

  def ensure_logged_in!
  	current_user
  end
end
