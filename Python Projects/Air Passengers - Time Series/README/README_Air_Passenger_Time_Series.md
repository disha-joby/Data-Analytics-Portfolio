# Air Passenger Time Series Forecasting

## Project Overview
This project analyses the AirPassengers time-series dataset, which records monthly passenger totals from 1949 to 1960. The notebook explores the time-dependent pattern in passenger numbers and develops an ARIMA-based forecasting workflow.

## Tools and Technologies
- Python
- NumPy
- Pandas
- Matplotlib
- Seaborn
- Statsmodels time-series tools (including ACF/PACF plotting and ARIMA-related modelling)
- Scikit-learn metrics (`mean_squared_error`)

## Objectives
- Examine monthly passenger trends over time.
- Prepare the passenger data for time-series analysis.
- Investigate trend and stationarity-related behaviour.
- Use autocorrelation and partial autocorrelation plots to support model selection.
- Fit and compare ARIMA configurations and evaluate forecast errors.

## Analysis Performed
- Loaded `AirPassengers.csv` and inspected its monthly `Month` and `#Passengers` columns.
- Renamed the columns to `month` and `passengers`.
- Checked for missing values and duplicate records.
- Used time-series visualisations and rolling statistics to inspect the series.
- Imported ACF and PACF plotting functions to examine autocorrelation patterns.
- Built an ARIMA modelling and prediction workflow.
- Calculated Root Mean Squared Error (RMSE) to compare model results and plotted actual versus predicted passenger values.

## Key Findings
- The dataset contains **144 monthly observations**, covering January 1949 through December 1960.
- The displayed data rises from 112 passengers in January 1949 to 432 in December 1960, with a peak of 606 in August 1960.
- The notebook checks for missing values and duplicates; the displayed checks report zero missing values and zero duplicate rows.
- The workflow compares ARIMA configurations using RMSE. The lowest-RMSE model should be identified from the notebook's final sorted results when reporting a specific model or score.

## Conclusion
The project demonstrates a time-series forecasting workflow for monthly air passenger numbers. Trend inspection, rolling statistics, ACF/PACF analysis, ARIMA modelling, and RMSE comparison are used to understand the historical pattern and evaluate forecasts. The observed increase over the period indicates that forecasting should account for the series' changing level and time-dependent structure.
