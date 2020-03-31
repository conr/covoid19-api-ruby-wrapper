# frozen_string_literal: true

require 'http'

# Ruby wrapper for https://covid19api.com/.
class Covid19
  BASE_URL = 'https://api.covid19api.com'.freeze
  STATUSES = %w[confirmed recoverd deaths].freeze

  class << self
    def info
      serve_request('')
    end

    # Warning: returns 10MB of data - use with caution.
    def all
      serve_request('all')
    end

    def stats
      serve_request('stats')
    end

    def summary
      serve_request('summary')
    end

    def countries
      serve_request('countries')
    end

    def cases_by_day_one(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/dayone/country/#{country}/status/#{status}")
    end

    def cases_by_day_one_live(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/dayone/country/#{country}/status/#{status}/live")
    end

    def cases_by_day_one_total(country, status)
      serve_request("/total/dayone/country/#{country}/status/#{status}")
    end

    def cases_by_country(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/country/#{country}/status/#{status}")
    end

    def cases_by_country_live(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/country/#{country}/status/#{status}/live")
    end

    def cases_by_country_total(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/total/country/#{country}/status/#{status}")
    end

    def cases_live_by_country_and_status(country, status)
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/live/country/#{country}/status/#{status}")
    end

    def cases_live_by_country_after_date(
      country,
      status,
      date: Date.today.prev_day.iso8601
    )
      return invalid_status_msg(status) unless valid_status?(status)

      serve_request("/live/country/#{country}/status/#{status}/date/#{date}")
    end

    private

    def serve_request(suffix)
      response = HTTP.get("#{BASE_URL}/#{suffix}")
      JSON.parse(response)
    end

    def valid_status?(status)
      STATUSES.include?(status.downcase)
    end

    def invalid_status_msg(status)
      "Invalid status \"#{status.downcase}\"." \
        "Please provide one of the following statuses: #{STATUSES.join(', ')}"
    end
  end
end
