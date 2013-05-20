class QuestionsController < ApplicationController

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Your question has been created."
      redirect_to @question
    else
      flash[:alert] = "Unable to create question."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

end
