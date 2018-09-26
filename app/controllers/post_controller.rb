require_relative '../services/posts/create'

class PostController < ApplicationController
  before_action :set_data, only: [:create, :rate]
  def create
    post = Posts::Create.call(@data.merge(ip: request.ip))
    json_response(post)
  end

  def rate
    
  end

  def top
  end

  def ip_logins
  end

  private

  def set_data
    @data = JSON.parse(request.body.read, symbolize_names: true)
  end
end
