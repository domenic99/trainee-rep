class HomeController < ApplicationController
  def index
    doc = Nokogiri::HTML(open("http://eslfuncast.libsyn.com/rss"))
    @tmp = doc.css('enclosure')[0]['url'].to_s
  end

  def audio
    doc = Nokogiri::HTML(open("http://eslfuncast.libsyn.com/rss"))
    link = doc.css('enclosure')[params[:id].to_i]
    unless link.nil?
      render json: { success: link['url'].to_s }
    else
      render json: { success: "" }
    end
  end
end
