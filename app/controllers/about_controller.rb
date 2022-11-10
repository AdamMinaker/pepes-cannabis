class AboutController < ApplicationController
  def index
    @about = About.all
  end

  def show
    @about = About.find(params[:id])
  end

  def new
    @about = About.new
  end

  def edit; end

  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html do
          redirect_to about_url(@about), notice: "About was successfully created."
        end
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def about_params
    params.require(:about).permit(:title, :content)
  end
end
