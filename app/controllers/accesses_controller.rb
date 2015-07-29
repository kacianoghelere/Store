class AccessesController < ApplicationController
	require "rubygems"
	require "json"

  def index
  	@accesses = Access.all.order(:role_id)
  end

  def create
  	acc = access_params
  	puts acc[:accesses]
  	# debugger
  	@accesses = Access.all.order(:role_id)
  	render 'accesses/index'
  end

  private
  	def access_params
  		json_string = params[:accesses]
  		debugger
  		!json_string.empty? ? JSON.parse(json_string) : {}
  	end
end
