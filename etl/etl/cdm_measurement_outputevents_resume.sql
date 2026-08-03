-- Resume cdm_measurement after the standard script's first six queries have
-- succeeded and only the outputevents insert remains.
INSERT INTO @etl_project.@etl_dataset.cdm_measurement
SELECT
    src.measurement_id                      AS measurement_id,
    per.person_id                           AS person_id,
    COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
    CAST(src.start_datetime AS DATE)        AS measurement_date,
    src.start_datetime                      AS measurement_datetime,
    CAST(NULL AS STRING)                    AS measurement_time,
    src.type_concept_id                     AS measurement_type_concept_id,
    CAST(NULL AS INT64)                     AS operator_concept_id,
    src.value_as_number                     AS value_as_number,
    COALESCE(src.value_as_concept_id, 0)    AS value_as_concept_id,
    CAST(NULL AS INT64)                     AS unit_concept_id,
    CAST(NULL AS FLOAT64)                   AS range_low,
    CAST(NULL AS FLOAT64)                   AS range_high,
    CAST(NULL AS INT64)                     AS provider_id,
    vis.visit_occurrence_id                 AS visit_occurrence_id,
    CAST(NULL AS INT64)                     AS visit_detail_id,
    src.source_code                         AS measurement_source_value,
    src.source_concept_id                   AS measurement_source_concept_id,
    src.unit_source_value                   AS unit_source_value,
    src.value_source_value                  AS value_source_value,
    CONCAT('measurement.', src.unit_id)     AS unit_id,
    src.load_table_id                       AS load_table_id,
    src.load_row_id                         AS load_row_id,
    src.trace_id                            AS trace_id
FROM
    @etl_project.@etl_dataset.lk_outputevents_mapped src
INNER JOIN
    @etl_project.@etl_dataset.cdm_person per
        ON CAST(src.subject_id AS STRING) = per.person_source_value
INNER JOIN
    @etl_project.@etl_dataset.cdm_visit_occurrence vis
        ON vis.visit_source_value =
           CONCAT(CAST(src.subject_id AS STRING), '|', CAST(src.hadm_id AS STRING))
;
