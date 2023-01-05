# CountryIndicatorsPipeline

### Author: **Michael Mbajwa**

### Student ID: **0210152807**

### Email: **michael.mbajwa.001@student.uni.lu**


To run this pipeline, you will have to simply:

- Clone the repository by running ```git clone git@github.com:Michael-Mbajwa/CountryIndicatorsPkg.git``` or ```git clone https://github.com/Michael-Mbajwa/CountryIndicatorsPipeline.git```
- Run ```renv::restore()``` to install all the required libraries.

- The functions and data used in this pipeline are hosted in a separate package called [CountryIndicatorsPkg](https://github.com/Michael-Mbajwa/CountryIndicatorsPkg)

- You should now restart your R session and then run the pipeline with ```targets::tar_make()```


You can take a look at some plots by running:
```targets::tar_read(plot_physicians_per_thousand)
targets::tar_read(plot_infant_deaths)
targets::tar_read(plot_mobile_cellular_subscription)
targets::tar_read(plot_top_ten_infant_deaths_2020)
targets::tar_read(plot_maternal_deaths)
targets::tar_read(plot_angola_details)
targets::tar_read(plot_military_expenditure)
targets::tar_read(plot_top_homicides_2019)
targets::tar_read(plot_existing_countries)
targets::tar_read(plot_top_rail_lines_2019)
targets::tar_read(plot_outages_firms)
targets::tar_read(plot_spain_details)
targets::tar_read(plot_idp)
```
You can take a look at some output tables by running:
```targets::tar_read(physicians_per_thousand)
targets::tar_read(infant_deaths)
targets::tar_read(mobile_cellular_subscription)
targets::tar_read(top_ten_infant_deaths_2020)
targets::tar_read(maternal_deaths)
targets::tar_read(angola_details)
targets::tar_read(military_expenditure)
targets::tar_read(top_homicides_2019)
targets::tar_read(all_countries_in_data)
targets::tar_read(top_rail_lines_2019)
targets::tar_read(power_outages_firms)
targets::tar_read(spain_details)
targets::tar_read(total_labor_force)
targets::tar_read(idp)
targets::tar_read(world_bank_indicators)
```

## SHINY APP

To run the shiny app in this project:

- Ensure you have run ```renv::restore()``` to install all the required libraries.
- Run ```shiny::runApp(".")```
- Expand the screen for best display of the shiny dashboard.