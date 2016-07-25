require 'httparty'
module Admin::GifsHelper

  def gif_url_name(search_params)
    url = "http://api.giphy.com/v1/gifs/search?&q=#{search_params}&api_key=dc6zaTOxFJmzC"
    response = HTTParty.get(url)
    parsed = response.parsed_response
    random_url(parsed)
  end

  def random_url(parsed)
    parsed["data"].collect do |set|
      set["images"]["fixed_height_downsampled"]["url"]
    end.sample
  end

end
