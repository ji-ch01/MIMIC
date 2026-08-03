-- Compatibility table for MIMIC-IV structured-data conversions that do not
-- include the optional waveform proof-of-concept inputs.
CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_meas_waveform_mapped AS
SELECT
    CAST(NULL AS INT64)    AS measurement_id,
    CAST(NULL AS INT64)    AS subject_id,
    CAST(NULL AS INT64)    AS hadm_id,
    CAST(NULL AS STRING)   AS reference_id,
    CAST(NULL AS INT64)    AS target_concept_id,
    CAST(NULL AS STRING)   AS target_domain_id,
    CAST(NULL AS DATETIME) AS start_datetime,
    CAST(NULL AS FLOAT64)  AS value_as_number,
    CAST(NULL AS INT64)    AS unit_concept_id,
    CAST(NULL AS STRING)   AS source_code,
    CAST(NULL AS INT64)    AS source_concept_id,
    CAST(NULL AS STRING)   AS unit_source_value,
    CAST(NULL AS STRING)   AS unit_id,
    CAST(NULL AS STRING)   AS load_table_id,
    CAST(NULL AS INT64)    AS load_row_id,
    CAST(NULL AS STRING)   AS trace_id
FROM UNNEST([1]) AS unused
WHERE FALSE
;
