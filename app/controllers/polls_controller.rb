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

	def edit
		@poll = Poll.find(params[:id])
	end

	def show
		@poll = Poll.find(params[:id])

	end

	def update
		@poll = Poll.find(params[:id])
		if @poll.update_attributes poll_params
			redirect_to "/newpoll"
		end
	end

	def destroy
		Poll.find(params[:id]).destroy
		redirect_to "/newpoll"
	end
private

def poll_params
	params.require(:poll).permit(:title)
end

end
