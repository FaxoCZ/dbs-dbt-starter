{{ config(materialized='view') }}
 
-- ==============================================================================
-- STAGING MODEL: stg_nyc_yellow_taxi
-- Vrstva: Staging (NYC Yellow Taxi)
-- ==============================================================================
 
WITH source_data AS (
    SELECT * FROM {{ source('raw', 'nyc_yellow_taxi') }}
)
 
SELECT
    VendorID AS vendor_id,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    passenger_count,
    trip_distance,
    PULocationID AS pu_location_id,
    DOLocationID AS do_location_id,
    RatecodeID AS ratecode_id,
    store_and_fwd_flag,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge,
    Airport_fee AS airport_fee
FROM source_data