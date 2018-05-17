require 'resque_web'

module ResqueWeb
  module Plugins
    module JobStats
      class Engine < Rails::Engine
        isolate_namespace ResqueWeb::Plugins::JobStats
        paths['app'] << 'lib/resque-job-stats/engine/app'
        paths['app/controllers'] << 'lib/resque-job-stats/engine/app/controllers'
        paths['app/helpers'] << 'lib/resque-job-stats/engine/app/helpers'
        paths['app/views'] << 'lib/resque-job-stats/engine/app/views'
      end

      Engine.routes do
        get 'stats', to: 'stats#index', as: 'stats'
        get 'history/:job_class', to: 'history#index', as: 'history'
      end

      def self.engine_path
        '/job_stats'
      end

      def self.tabs
        [
          {
            'Job Stats' => Engine.routes.url_helpers.stats_path
          }
        ]
      end
    end
  end
end
