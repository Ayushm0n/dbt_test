with source as (
    select * from {{ source('transform_db', 'airbyte_postgres_src_test_leads_table') }}
),
renamed as (
    select
    id,
    name as lead_name,
    phone as contact
    from source
)

select * from renamed