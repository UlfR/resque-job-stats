module ResqueWeb
  module Plugins
    module JobStats
      module HistoryHelper
        def check_or_cross_stat(value)
          value ? "&#x2713;" : "&#x2717;"
        end
      end
    end
  end
end
