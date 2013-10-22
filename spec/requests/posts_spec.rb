require 'spec_helper'

describe "Post controller" do
	describe "for not signed in users" do

		describe "in the posts controller" do

			describe "submitting to the create action" do
		  		before { get root_path }
		  		specify { expect(response).not_to redirect_to(signin_path) }
			end
		end
	end
end