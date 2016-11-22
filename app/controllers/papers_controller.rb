class PapersController < ApplicationController
  def index
    @papers = Paper.of_year(params[:year])
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    if @paper.update(paper_params)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def destroy
    @paper = Paper.find(params[:id])
    !@paper.destroy

    redirect_to papers_path
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :venue, :year, { author_ids: [] })
  end
end
