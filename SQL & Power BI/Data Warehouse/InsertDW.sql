-- Insert DW

insert into DimHost ([host_id],[host_since])
select [host_id],[host_since]  from [air2staging_2nd].[dbo].[hosts]


insert into DimProperty ( [propertyId],[host_id],[latitude],[longitude],[bedrooms],[bathrooms_text],
[accommodates],[instant_bookable],[neighbourhood_cleansed],[room_type],[property_type],
[review_scores_rating],[number_of_reviews],[number_of_reviews_ltm],[last_review],
[first_review],[calculated_host_listings_count])


select [propertyId],[host_id],[latitude],[longitude],[bedrooms],[bathrooms_text],
[accommodates],[instant_bookable],[neighbourhood_cleansed],[room_type],[property_type],
[review_scores_rating],[number_of_reviews],[number_of_reviews_ltm],[last_review],
[first_review],[calculated_host_listings_count]   
from [air2staging_2nd].[dbo].[Property]

insert into FactCalendar ([listing_id] ,[date]  ,[available],[price] ,
[adjusted_price],[minimum_nights], [maximum_nights]
)
select  [listing_id] ,[date]  ,[available],[price] ,
[adjusted_price],[minimum_nights], [maximum_nights] from [air2staging_2nd].[dbo].[calendar]


insert into FactReviews  ([host_id],[listing_id],[date], [reviewer_id]
)
select [host_id],[listing_id], [date], [reviewer_id]  from [air2staging_2nd].[dbo].reviews


insert into Verifications ([host_id],[Verificationid])
select [host_id],[Verificationid]  from [air2staging_2nd].dbo.[Verifications]


insert into VerificationsList ([Verification])

select [verification] from [air2staging_2nd].[dbo].VerificationsList 




