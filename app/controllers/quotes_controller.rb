class QuotesController < ApplicationController

	before_filter :characters

	def index
		@quote = Quote.order("RANDOM()").first
	end

	def create
	    @quote = Quote.create(quote_params)
	    if @quote.invalid?
	    	flash[:error] = '<strong>Could not save.</strong> The data you entered is invalid.'
	    	redirect_to root_path
		else
			flash[:success] = 'You successfully added the following quote from The Office.'
			redirect_to thanks_path
		end
	end

	def about
	end

	def thanks
		@last_quote = Quote.last
	end

	def show
		@quote = Quote.where(:id => params[:id]).first
		if @quote.blank?
			render :text => "Not Found", :status => :not_found
		end
	end



	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end

	def characters
		@characters = ['Andy Bernard', 'Angela Martin', 'Clark Green', 'Creed Bratton', 'Darryl Philbin', 'David Wallace', 'Dwight Schrute', 'Erin Hannon',' Gabe Lewis', 'Holly Flax', 'Jan Levinson', 'Jim Halpert', 'Karen Filippelli', 'Kelly Kapoor', 'Kevin Malone', 'Meredith Palmer', 'Michael Scott', 'Nellie Bertram', 'Oscar Martinez', 'Pam Beesly', 'Pete Miller', 'Phyllis Lapin', 'Robert California', 'Roy Anderson', 'Ryan Howard', 'Stanley Hudson', 'Toby Flenderson']
	end

end