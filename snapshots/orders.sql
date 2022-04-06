{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='dbt',
      unique_key='id',
      strategy='timestamp',
      updated_at='_ETL_LOADED_AT'
    )
}}

SELECT * FROM {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}