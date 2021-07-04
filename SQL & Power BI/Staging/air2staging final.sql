--Staging

Create database air2staging_2nd 

--Copy reviews limited table from air2 to air2staging

Select [host_id],listing_id,[date],reviewer_id into reviews from air2.dbo.reviews  
inner join air2.dbo.property on air2.dbo.property.propertyId=air2.dbo.reviews.listing_id



--Copy hosts limited table from air2 to air2staging

Select host_id, host_since into hosts from air2.dbo.hosts

--Copy calendar table from air2 to air2staging

Select [listing_id],[date],[available],[price],[adjusted_price],[minimum_nights],[maximum_nights] into calendar from air2.dbo.calendar

--Copy verificationslist

select [id],[verification] into VerificationsList from air2.dbo.verificationslist
--inner

--Copy verifications

select air2.dbo.hosts.[host_id],[verificationid] into Verifications from air2.dbo.verifications
--inner
inner join air2.dbo.hosts on air2.dbo.hosts.host_id= air2.dbo.verifications.host_id
inner join air2.dbo.verificationslist on air2.dbo.verificationslist.id= air2.dbo.verifications.verificationid


--Copy property table from air2 to air2staging
Select property.propertyId ,[host_id],[latitude],[longitude],[bedrooms],[beds],[bathrooms_text],[accommodates],[instant_bookable],

--from neighbourhood

[neighbourhood_cleansed],

--from room_types

[room_type],

--from property_types

[property_type],

--from review_summary 

[review_scores_rating],
[number_of_reviews],
[number_of_reviews_ltm],
[last_review],
[first_review],

--from calculated

[calculated_host_listings_count]

INTO Property
from air2.[dbo].property 

--inner
inner join air2.dbo.neighbourhood on air2.dbo.neighbourhood.propertyId=air2.dbo.property.propertyId
--inner
inner join air2.dbo.room_types on air2.dbo.room_types.room_typeId=air2.dbo.property.room_typeId
--inner
inner join air2.dbo.property_types on air2.dbo.property_types.property_typeId=air2.dbo.property.property_typeId
--inner
inner join air2.dbo.calculated on air2.dbo.calculated.propertyid=air2.dbo.property.propertyId
--inner
inner join air2.dbo.reviewsSummary on air2.dbo.reviewsSummary.propertyid=air2.dbo.property.propertyId
--inner


