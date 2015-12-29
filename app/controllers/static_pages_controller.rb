class StaticPagesController < ApplicationController
  before_filter :unauthenticated_only, only: [:register_login]

  def home
    @sponsored_parties = Party.where('featured_until > ?', Date.today).paginate(:page => params[:page], :per_page => 4)
    @current_parties = Party.select('parties.*, count(user_id) as count_all').joins(:attendances).group('party_id').order('count_all DESC').limit(4)
  end

  def register_login
  end

  def privacy_policy
  end
  
  def terms_of_use
  end
  
  def site_map
  end
  
  def about_us
  end

  private

  def unauthenticated_only
  	if signed_in?
  		redirect_to root_url
  	end
  end
end
