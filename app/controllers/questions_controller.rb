class QuestionsController < ApplicationController
  before_filter :find_question, :only => [:show, :update, :edit, :destroy]
  def index
    @questions = Question.all
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
    #
  end

  def edit
  end

  def update
    if @question.update_attributes(params[:question])
      flash[:notice]="Question has been updated."
      redirect_to @question
    else
      flash[:alert]="Question has not been updated."
      render :action => "edit" 
    end
  end

  def destroy
    @question.destroy
    flash[:notice]= "Question has been deleted."
    redirect_to questions_path
  end

private
  def find_question
    @question = Question.find(params[:id])
  rescue MongoMapper::DocumentNotFound
    flash[:alert] = "The question you were looking for could not be found."
    redirect_to questions_path
  end

end
