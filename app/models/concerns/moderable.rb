module Moderable
  extend ActiveSupport::Concern

  included do
      def status?
      response =  RestClient.get "https://moderation.logora.fr/predict?text=#{content}",
      {content_type: :json, accept: :json}
      prediction = JSON.parse(response)
        if prediction["prediction"]["0"] <= 0.1669644832611084
            self.update!(is_accepted: false)
        else
            self.update!(is_accepted: true)
        end
      end
  end
end
