class HomeController < ApplicationController
	def index
		unless current_user
			redirect_to '/sign_in'
		end
	end

	def request_new_page
	end

  def real_time
  end

  def traffic_source
  end

  def seo
  end

  def social
  end

  def page_statistics
  end

  def request_new_page
  end

  def update_page
  end

  def delete_page
  end

  def change_plan
  end

  def create_form
  end

  def add_feed
  end

end
