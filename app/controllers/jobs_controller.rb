class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:location]
      @city = params[:location]
      render :location
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.comments.all.reverse
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated successfully!"
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} from #{job.company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :location)
  end
end
