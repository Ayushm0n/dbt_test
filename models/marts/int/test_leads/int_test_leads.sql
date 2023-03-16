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
),

notNullData as (
    select
    id,
    lead_name,
    contact
    from renamed
    WHERE
    lead_name IS NOT NULL
    AND contact IS NOT NULL
),

unqiueContact as (
    select
    MIN(id) as id,
    lead_name,
    contact
    from notNullData
    GROUP BY contact, lead_name
)

select * from unqiueContact