Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

if Rails.env.production?
  module OmniAuth
    module Strategy
      def full_host
        uri = URI.parse(request.url)
        uri.path = ''
        # uri.query = nil
        uri.port = (uri.scheme == 'https' ? 443 : 80)
        uri.to_s
      end
    end
  end
end