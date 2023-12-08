require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_calc)
end
get("/square/new") do
  erb(:square_calc)
end
get("/square/results") do

@the_num = params.fetch("users_number").to_f

@the_results = @the_num **2
erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end
get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_results = Math.sqrt(@the_num)
  
  erb(:square_root_results)
  
end
get("/payment/new") do
  erb(:payment_calc)
end
get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pay").to_f

  rate = @apr
  bal = @principal
  term = @years * 12

  r = rate / 1200
  n = r * bal
  d = 1 - (1 + r)**-term
  pmt = n / d


  @pmayt = pmt.to_fs(:currency)
  @apr = rate.to_fs(:percentage, { :precision => 4 } )
  @principal = bal.to_fs(:currency)


  erb(:payment_results)
end
