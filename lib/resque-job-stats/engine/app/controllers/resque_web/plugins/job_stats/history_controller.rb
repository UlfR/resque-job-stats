module ResqueWeb
  module Plugins
    module JobStats
      class HistoryController < ResqueWeb::ApplicationController
        def index
          @job_class = Resque::Plugins::JobStats.measured_jobs.find { |j| j.to_s == params[:job_class] }

          @start = 0
          @start = params[:start].to_i if params[:start]
          @limit = 100
          @limit = params[:limit].to_i if params[:limit]

          @histories = @job_class.job_histories(@start, @limit)
          @size = @job_class.histories_recorded

          render :index
        end
      end
    end
  end
end
