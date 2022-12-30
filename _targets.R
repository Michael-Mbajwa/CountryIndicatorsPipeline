library(dplyr)
library(ggplot2)
library(targets)
library(CountryIndicatorsPkg)
source("functions.R")


list(
  tar_target(world_bank_indicators, all_indicators()
    
  ),
  
  tar_target(
    all_countries_in_data, CountryIndicatorsPkg::all_countries()
  ),
  
  tar_target(
    plot_existing_countries, CountryIndicatorsPkg::make_plot_countries()
  ),
  
  tar_target(
    spain_details, CountryIndicatorsPkg::country_key_details("spain")
  ),
  
  tar_target(
    angola_details, CountryIndicatorsPkg::country_key_details("angola")
  ),
  
  tar_target(
    plot_spain_details, CountryIndicatorsPkg::map_country(all_country_details=spain_details)
  ),
  
  tar_target(
    plot_angola_details, CountryIndicatorsPkg::map_country(all_country_details=angola_details)
  ),
  
  tar_target(top_ten_infant_deaths_2020, 
             rank_indicators_by_country(indicator_name = "Number of infant deaths", year = "2020", n=10)
  ),
  
  tar_target(plot_top_ten_infant_deaths_2020
             , plot_ranked_indicators(df = top_ten_infant_deaths_2020, indicator = "Number of infant deaths")
  ),
  
  tar_target(top_rail_lines_2019, 
             rank_indicators_by_country(indicator_name = "Rail lines (total route-km)", year = "2019", n=10)
  ),
  
  tar_target(plot_top_rail_lines_2019
             , plot_ranked_indicators(df = top_rail_lines_2019, indicator = "Rail lines (total route-km)")
  ),
  
  tar_target(top_homicides_2019, 
             rank_indicators_by_country(indicator_name = "Intentional homicides (per 100,000 people)", year = "2019", n=10)
  ),
  
  tar_target(plot_top_homicides_2019
             , plot_ranked_indicators(df = top_homicides_2019, indicator = "Intentional homicides (per 100,000 people)")
  ),
  
  tar_target(total_labor_force, 
             rank_indicators_by_country(indicator_name = "Labor force, total", year = "2019", n = 10)
  ),
  
  tar_target(plot_total_labor_force
             , plot_ranked_indicators(df = total_labor_force, indicator = "Labor force, total")
  ),
  
  tar_target(power_outages_firms, 
             rank_indicators_by_country(indicator_name = "Power outages in firms in a typical month (number)", year = "2019", n = 10)
  ),
  
  tar_target(plot_outages_firms
             , plot_ranked_indicators(df = power_outages_firms, indicator = "Power outages in firms in a typical month (number)")
  ),
  
  tar_target(infant_deaths, 
             rank_indicators_by_country(indicator_name = "Number of infant deaths", year = "2019", n = 10)
  ),
  
  tar_target(plot_infant_deaths
             , plot_ranked_indicators(df = infant_deaths, indicator = "Number of infant deaths")
  ),
  
  tar_target(maternal_deaths, 
             rank_indicators_by_country(indicator_name = "Number of maternal deaths", year = "2019", n = 10)
  ),
  
  tar_target(plot_maternal_deaths
             , plot_ranked_indicators(df = maternal_deaths, indicator = "Number of maternal deaths")
  ),
  
  tar_target(physicians_per_thousand, 
             rank_indicators_by_country(indicator_name = "Physicians (per 1,000 people)", year = "2019", n = 10)
  ),
  
  tar_target(plot_physicians_per_thousand
             , plot_ranked_indicators(df = physicians_per_thousand, indicator = "Physicians (per 1,000 people)")
  ),
  
  tar_target(military_expenditure, 
             rank_indicators_by_country(indicator_name = "Military expenditure (current USD)", year = "2019", n = 10)
  ),
  
  tar_target(plot_military_expenditure
             , plot_ranked_indicators(df = military_expenditure, indicator = "Military expenditure (current USD)")
  ),
  
  tar_target(mobile_cellular_subscription, 
             rank_indicators_by_country(indicator_name = "Mobile cellular subscriptions", year = "2019", n = 10)
  ),
  
  tar_target(plot_mobile_cellular_subscription
             , plot_ranked_indicators(df = mobile_cellular_subscription, indicator = "Mobile cellular subscriptions")
  ),
  
  tar_target(idp, 
             rank_indicators_by_country(indicator_name = "Internally displaced persons, total displaced by conflict and violence (number of people)", year = "2019", n = 10)
  ),
  
  tar_target(plot_idp
             , plot_ranked_indicators(df = idp, indicator = "Internally displaced persons (conflict & violence)")
  )
)


