require "financialmodelingprep"

api = Financialmodelingprep::FinancialStatementsApi.new

infos, status, headers = api.get_income_statements_with_http_info(
  symbol: "AAPL",
  apikey: ENV["FMP_API_KEY"] || "",
  datatype: "json",
  limit: 1,
  period: "annual")

puts status
puts infos

# https://financialmodelingprep.com/api/v3/income-statement/AAPL?limit=120&apikey=KEY&period=annual
