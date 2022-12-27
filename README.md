# CountryIndicatorsPipeline

Author: **Michael Mbajwa**

Student ID: **0210152807**

To run this pipeline, you will have to simply:

- Clone the repository;
- Run ```renv::restore()``` to install all the required libraries.

You should now restart your R session and rhen run the pipeline with ```targets::tar_make()```

You can take a look at some plots by running: ```tar_read(plot_physicians_per_thousand)
tar_read(plot_infant_deaths)
tar_read(plot_mobile_cellular_subscription)
tar_read(plot_top_ten_infant_deaths_2020)
tar_read(plot_maternal_deaths)
tar_read(plot_angola_details)
tar_read(plot_military_expenditure)
tar_read(plot_top_homicides_2019)
tar_read(plot_existing_countries)
tar_read(plot_top_rail_lines_2019)
tar_read(plot_outages_firms)
tar_read(plot_spain_details)
tar_read(plot_idp)```


You can take a look at some output tables by running:
```tar_read(physicians_per_thousand)
tar_read(infant_deaths)
tar_read(mobile_cellular_subscription)
tar_read(top_ten_infant_deaths_2020)
tar_read(maternal_deaths)
tar_read(angola_details)
tar_read(military_expenditure)
tar_read(top_homicides_2019)
tar_read(all_countries_in_data)
tar_read(top_rail_lines_2019)
tar_read(power_outages_firms)
tar_read(spain_details)
tar_read(total_labor_force)
tar_read(idp)
tar_read(world_bank_indicators)```