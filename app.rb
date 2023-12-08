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
