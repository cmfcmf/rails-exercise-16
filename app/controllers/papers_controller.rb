class PapersController < ApplicationController
  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)

    @paper.author = Author.all().first # TODO Use author from form.

    if @paper.save
      redirect_to @paper.author
    else
      render 'new'
    end
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end
