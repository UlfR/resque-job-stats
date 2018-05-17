module ResqueWeb
  module Plugins
    module JobStats
      module StatsHelper
        def time_display(float)
          float.zero? ? "" : ("%.2f" % float.to_s) + "s"
        end

        def number_display(num)
          num.zero? ? "" : num
        end

        def stat_header(stat_name)
          stat_name.to_s.gsub(/_/,' ').capitalize
        end
      end
    end
  end
end
