require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
	describe "GET #application" do
		it "responds successfully with an HTTP 200 status code" do
			get :application
			expect(response).to be_success
			expect(response).to have_http(200)
		end

		it "renders the application template" do
			get :application
			expect(response).to render_template("application")
		end

		it "creates all user into @user" do
			user1, user2 = User.create!, Post.create!
			get :application

			expect(assigns(:users)).to match_array([post1, post2])
		end
	end
end
