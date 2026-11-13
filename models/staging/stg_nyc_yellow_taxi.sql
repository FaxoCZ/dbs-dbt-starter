{{ config(materialized='view') }}

-- ==============================================================================
-- STAGING MODEL: stg_nyc_yellow_taxi
-- Vrstva: Staging (Číselník zón)
-- ==============================================================================

WITH source_data AS (
    SELECT * FROM {{ source('raw', 'nyc_yellow_taxi') }}
)

SELECT
    VendorID AS vendor_id,
    tpep_pickup_datetime AS tpep_pickup_datetime,
    tpep_dropoff_datetime AS tpep_dropoff_datetime,
    service_zone
FROM source_data
