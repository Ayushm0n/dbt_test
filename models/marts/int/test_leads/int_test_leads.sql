with 

test_leads as (
    select * from {{ ref('stg_test_leads')}}
),

renamed as (
    select
    id,
    name as lead_name,
    phone as contact
    from source
),

notNull as (
    select
    *
    from renamed
    where
    id IS NOT NULL AND
    lead_name IS NOT NULL AND
    contact IS NOT NULL
),

unqiueContact as (
    select
    MIN(id) as id,
    lead_name,
    contact
    from notNull
    GROUP BY contact
)

select * from unqiueContact