class AccessesController < ApplicationController
	require "rubygems"
	require "json"

  def index
  	@accesses = Access.all.order(:role_id)
  end

  def create
  	hash = access_params
  	update(hash)
  	redirect_to accesses_path
  end

  def update(accesses)
    # puts "HASH: #{accesses}"
    accesses.each do |access|
      find_hash = {
        id: access['access_id'].to_i,
        role_id: access['role_id'].to_i,
        page_id: access['page_id'].to_i
      }
      update_hash = {
        can_create:  access['create'],
        can_read:    access['read'],
        can_update:  access['update'],
        can_destroy: access['destroy']
      }
      acc = Access.find_by(find_hash)
      acc.update_attributes(update_hash);
    end
  end

  private
  	def access_params
      json_string = params[:accesses][:json_data]
  		hash = !json_string.empty? ? JSON.parse(json_string) : {}
      return hash
  	end

end
