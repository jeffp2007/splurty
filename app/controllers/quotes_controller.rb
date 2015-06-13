class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
		@characters = ['Andy Bernard', 'Angela Martin', 'Clark Green', 'Creed Bratton', 'Darryl Philbin', 'David Wallace', 'Dwight Schrute', 'Erin Hannon',' Gabe Lewis', 'Holly Flax', 'Jan Levinson', 'Jim Halpert', 'Karen Filippelli', 'Kelly Kapoor', 'Kevin Malone', 'Meredith Palmer', 'Michael Scott', 'Nellie Bertram', 'Oscar Martinez', 'Pam Beesly', 'Pete Miller', 'Phyllis Lapin', 'Robert California', 'Roy Anderson', 'Ryan Howard', 'Stanley Hudson', 'Toby Flenderson']
	end

	def create
	    @quote = Quote.create(quote_params)
	    if @quote.invalid?
	      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
	    end
		redirect_to thanks_path
	end

	def about
	end

	def thanks
		@quote = Quote.last
	end


	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end

end