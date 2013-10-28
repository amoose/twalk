class PartyController <  WebsocketRails::BaseController
	before_filter :ensure_logged_in!

	def initialize_session
    # perform application setup here
    controller_store[:party_id] = nil
    controller_store[:connected_clients] = 0
  end

  def client_connected
    controller_store[:connected_clients] = controller_store[:connected_clients]+1
    # binding.pry
  end

  def client_disconnected
    controller_store[:connected_clients] = controller_store[:connected_clients]-1
    current_user.presentations.each do |pres|
      pres.latitude = nil
      pres.longitude = nil
      pres.geolocation_updated_at = nil
      pres.save
    end
    # WebsocketRails["party_#{@presentation.id}"].trigger(:new_client, { :user_id => current_user.id, :nickname => current_user.nickname })
    # WebsocketRails[]
  end

  def control_show
    # binding.pry
    WebsocketRails["party_#{@presentation.id}"].trigger(:move_deck, { :slide => to_slide })
  end

  def ensure_logged_in!
  	if current_user.nil?
  		return nil
  	else
  		return current_user
  	end
  end
end
