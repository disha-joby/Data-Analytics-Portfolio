# COVID-19 Dataset – Global Trend Analysis and Forecasting



## Project Overview

This project analyses global COVID-19 case data from **22 January 2020 to 27 July 2020**. It examines the progression of confirmed cases, deaths, recoveries, active cases, daily new cases, and recovery and death rates. Interactive visualisations are created with Plotly, and Facebook Prophet is used to forecast confirmed cases for the following seven days.

The dataset includes country and province/state information, geographic coordinates, reporting dates, case counts, and WHO region classifications.



## Tools and Technologies

* **Python**
* **Pandas** – data loading, cleaning, date conversion, grouping, and feature calculations
* **Plotly Express** – interactive trend visualisations
* **Plotly Graph Objects** – actual-versus-forecast visualisation and forecast intervals
* **Prophet** – time-series forecasting
* **Google Colab** – notebook environment



## Objectives

* Inspect the dataset structure, data types, missing values, and duplicate records.
* Prepare the date field for time-series analysis.
* Aggregate global COVID-19 figures by date.
* Calculate active cases, daily new cases, recovery rate, and death rate.
* Visualise global case trends and daily infection patterns.
* Use Prophet to forecast confirmed cases over a seven-day horizon.



## Analysis Performed

### 1\. Data Loading and Initial Inspection

* Loaded the `covid\_19\_clean\_complete.csv` dataset using Pandas.
* The dataset contains **49,068 rows and 10 columns**.
* The fields include `Province/State`, `Country/Region`, `Lat`, `Long`, `Date`, `Confirmed`, `Deaths`, `Recovered`, `Active`, and `WHO Region`.
* The records cover **188 dates**, from 22 January 2020 to 27 July 2020.



### 2\. Data Quality Checks

* Checked missing values in all columns.
* Found **34,404 missing values** in `Province/State`; the other nine columns had no missing values.
* Checked for duplicate rows and found **0 duplicates**.
* Converted `Date` from text to Pandas datetime format to support date-based aggregation and forecasting.

The missing province/state values were retained in the notebook; the analysis did not report filling them.



### 3\. Daily Global Aggregation and Derived Metrics

Grouped the data by date and summed the `Confirmed`, `Deaths`, and `Recovered` columns to create a daily global summary containing **188 records**.

The notebook then calculated:

* **Active cases:** Confirmed cases − Deaths − Recovered
* **New cases:** Difference between consecutive days' cumulative confirmed-case totals
* **Recovery rate:** Recovered ÷ Confirmed × 100
* **Death rate:** Deaths ÷ Confirmed × 100

These derived fields were used to examine how the reported global totals and rates changed over the selected period.



### 4\. Interactive Visualisation with Plotly

Created interactive line charts for:

* **Global COVID-19 trend:** Confirmed, recovered, deaths, and active cases over time.
* **Daily new infection trend:** Daily change in cumulative confirmed cases.
* **Recovery rate trend:** Daily recovery rate as a percentage of confirmed cases.



### 5\. Time-Series Forecasting with Prophet

* Prepared a forecasting dataset using the daily `Date` and cumulative `Confirmed` columns.
* Renamed the columns to Prophet's required format: `ds` for dates and `y` for the target values.
* Created and fitted a default Prophet model.
* Generated a future dataframe for **7 additional days**.
* Produced predicted values (`yhat`) and lower and upper forecast bounds (`yhat\_lower` and `yhat\_upper`).
* Built a Plotly chart showing actual confirmed-case totals, predicted values, and the forecast interval.

The forecast covers **28 July 2020 to 3 August 2020**.



### 6\. Seven-Day Forecast Output

The model produced the following predicted cumulative confirmed-case totals:

|Forecast date|Predicted confirmed cases|
|-|-:|
|28 July 2020|16,320,210|
|29 July 2020|16,529,980|
|30 July 2020|16,743,920|
|31 July 2020|16,959,110|
|1 August 2020|17,166,770|
|2 August 2020|17,364,300|
|3 August 2020|17,558,890|

These values are Prophet model estimates, not observed case counts.



## Key Findings

* The dataset contains **49,068 records**, representing **188 reporting dates** across countries and regions.
* The data has no duplicate rows. Missing values are concentrated in `Province/State`.
* The aggregated global cumulative confirmed cases increased from **555 on 22 January 2020** to **16,480,485 on 27 July 2020**.
* By 27 July 2020, the aggregated totals were **654,036 deaths** and **9,468,087 recoveries**.
* The calculated active-case total on 27 July 2020 was **6,358,362**.
* The recovery rate on 27 July 2020 was approximately **57.45%**, while the death rate was approximately **3.97%**.
* The Prophet model generated a seven-day forecast that continued the upward trend in cumulative confirmed cases over the forecast period.



## Conclusion

This project demonstrates the use of Python for global COVID-19 data preparation, trend analysis, interactive visualisation, and short-term time-series forecasting. Aggregating the country-level records by date made it possible to examine global cumulative totals and derived indicators over time.

Prophet was used to project cumulative confirmed cases for the next seven days after the final date in the dataset. These estimates are based only on the historical data supplied to the model and should be treated as an illustrative forecast, not as epidemiological guidance or a statement of what subsequently occurred.

