with 
test_leads as (
    select * from {{ ref('stg_test_leads')}}
),

renamed as (
    select
    id,
    name as lead_name,
    phone as contact
    from test_leads
)

select * from renamed
