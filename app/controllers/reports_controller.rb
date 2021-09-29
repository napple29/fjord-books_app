class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    redirect_to report_path(@report.id)
  end

  def show
    @report = Report.find(params[:id])
  end
  
  def update
    @report.update(report_params)
    redirect_to report_path(@report.id)
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:id, :title, :content)
  end
end

