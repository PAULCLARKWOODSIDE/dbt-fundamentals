{{ config(materialized='table', sort='start_date') }}

  {{ dbt_utils.date_spine(
      datepart="day",
      start_date = "TO_DATE('01/01/2020', 'mm/dd/yyyy')",
      end_date   = "TO_DATE('01/01/2021', 'mm/dd/yyyy')",
      )
  }}