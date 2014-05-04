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
    send_message :new_client, { :message => "!!new user connected!"}
  end

  def client_disconnected
    controller_store[:connected_clients] = controller_store[:connected_clients]-1
    # WebsocketRails["party_#{@presentation.id}"].trigger(:client_disconnected, { :user_id => current_user.id, :nickname => current_user.nickname })
    # current_user.presentations.each do |pres|
    #   pres.latitude = nil
    #   pres.longitude = nil
    #   pres.geolocation_updated_at = nil
    #   pres.save
    # end
    # WebsocketRails["party_#{@presentation.id}"].trigger(:lost_client, { :user_id => current_user.id, :nickname => current_user.nickname })
    # WebsocketRails[]
  end

  def control_show
    if message[:slide] and message[:party]
      party = "party_#{message[:party]}"
      slide = message[:slide]
      WebsocketRails[party].trigger(:move_deck, { :slide => slide })
    end
    # send_message :move_deck, { :message => "deck moved!"}
  end

  def join
    logger.info "JOINED!"
  end

  def ensure_logged_in!
  	current_user
  end
end
