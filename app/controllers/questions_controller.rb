class QuestionsController < ApplicationController

	before_action :set_poll
	before_action :set_kind_options

	def new
		@question = @poll.questions.build
		@questions = Question.all
	end
	def create
		@question = @poll.questions.build question_params
		if @question.save
			redirect_to root_url
		end
	end

	def edit
		@question = Question.find params[:id]
	end

	def show
		@question = Question.find params[:id]
	end

	def update
		@question = Question.find params[:id]
		if @question.update_attributes question_params
			redirect_to root_url
		end
	end

	def destroy
		Question.find(params[:id]).destroy
		redirect_to root_url
	end

	private 

	def question_params
		params.require(:question).permit(:title,:kind,:poll_id)
	end

	def set_poll
		@poll = Poll.find(params[:poll_id])
	end

	def set_kind_options
		@kind_questions = [
			['Open Question','open'],
			['Multiple Choice', 'choice']
		]
	end

end
