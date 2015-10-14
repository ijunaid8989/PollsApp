class PollsController < ApplicationController

	def new
		@poll = Poll.new	
		@polls = Poll.all
	end
	def create
		@poll = Poll.new poll_params
		if @poll.save
			flash[:info] = "Congrats! go for a new one"
			redirect_to '/newpoll'
		end
	end

	def show
		@polls = Poll.all
	end


private

def poll_params
	params.require(:poll).permit(:title)
end


end
