require "financialmodelingprep"

fmp_api_key = ENV.has_key?("FMP_API_KEY") ? ENV["FMP_API_KEY"] || "" : ""

if fmp_api_key.size < 1
  puts "api key env variable `FMP_API_KEY` is required"
else
  cfg = Financialmodelingprep::Configuration.new do |config|
    config.api_key = {
      :apikey => fmp_api_key,
    }
  end

  client = Financialmodelingprep::ApiClient.new cfg

  api = Financialmodelingprep::FinancialStatementsApi.new client

  infos, status, headers = api.get_income_statements_with_http_info(
    symbol: "AAPL",
    datatype: "json",
    limit: 1,
    period: "annual")

  puts status

  infos.each { |info|
    puts info.to_json
  }

  # https://financialmodelingprep.com/api/v3/income-statement/AAPL?limit=120&apikey=KEY&period=annual
end
