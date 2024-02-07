require "sinatra"
require "sinatra/reloader"

get("/") do
    erb(:square)    
end

get("/square/new") do
    erb(:square)
end

get("/square/results") do
    @user_number = params.fetch("number")
    @square = @user_number.to_f**2
    erb(:square_result)
end

get("/square_root/new") do
    erb(:square_root)
end

get("/square_root/results") do
    @user_number = params.fetch("user_number")
    @square_root_of_number = Math.sqrt(@user_number.to_f)
    erb(:square_root_result)
end

get("/payment/new") do
    erb(:payment)
end

get("/payment/results") do
    user_percentage = params.fetch("user_apr")
    percentage = user_percentage.to_f
    interest_rate_period = percentage/100
    interest_rate_period /= 12

    user_percentage = user_percentage.to_f

    @display_percentage = user_percentage.to_fs(:percentage, {:precision => 4})

    @user_years = params.fetch("user_years")
    number_monthly_periods = @user_years.to_i*12

    user_principle = params.fetch("user_pv")
    principle = user_principle.to_f

    @display_principle = principle.to_fs(:currency)

    numerator = interest_rate_period * principle
    denominator = 1 - (1 + interest_rate_period)**-(number_monthly_periods)

    payment = numerator / denominator

    @display_payment = payment.to_fs(:currency)

    erb(:payment_result)
end

get("/random/new") do
    erb(:random)
end

get("/random/results") do
    @min_number = params.fetch("user_min").to_f
    @max_number = params.fetch("user_max").to_f

    @random_number = rand(@min_number..@max_number)

    erb(:random_result)
end
