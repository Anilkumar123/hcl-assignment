class QuestionsController < ApplicationController

	before_action :set_question, except: [:create, :new,]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
  end

  private

  def question_params
    params.require(:question).permit(
      :name,
      :teaming_stages,
      :appears,
      :frequency,
      :required,
      :conditions,
      :role_id,
      :mapping_id
    )
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
