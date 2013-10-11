class PartyController <  WebsocketRails::BaseController
	def initialize_session
    # perform application setup here
    controller_store[:party_id] = nil
  end

  def start

  end
end
