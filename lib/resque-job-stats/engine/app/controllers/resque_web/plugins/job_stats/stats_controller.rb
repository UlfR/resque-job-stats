module ResqueWeb
  module Plugins
    module JobStats
      class StatsController < ResqueWeb::ApplicationController
        def index
          @jobs = Resque::Plugins::JobStats::Statistic.find_all(Resque::Plugins::JobStats::Statistic::DEFAULT_STATS).sort
          render :index
        end
      end
    end
  end
end
