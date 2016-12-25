# Main controller
class HomeController < ApplicationController
  def index
    doc = Nokogiri::HTML(open('http://eslfuncast.libsyn.com/rss'))
    @tmp = doc.css('enclosure')[0]['url'].to_s
  end

  def audio
    doc = Nokogiri::HTML(open('http://eslfuncast.libsyn.com/rss'))
    link = doc.css('enclosure')[params[:id].to_i]
    if link.nil?
      render json: { success: '' }
    else
      render json: { success: link['url'].to_s }
    end
  end
end
