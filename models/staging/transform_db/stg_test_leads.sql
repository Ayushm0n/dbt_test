with source as (
    select * from {{ source('transform_db', 'airbyte_postgres_src_test_leads_table') }}
),
columns as (
    select
    id,
    name,
    phone
    from source
)

select * from columns