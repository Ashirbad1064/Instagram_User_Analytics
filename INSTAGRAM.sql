use ig_clone;
select * from users;

#Find the 5 oldest users of the Instagram from the database provided

select * from(
select username as users, DATE(created_at) ,DENSE_RANK() OVER(ORDER BY created_at) as old_cust
from ig_clone.users) t
where old_cust<=5;

# Find the users who have never posted a single photo on instagram 


select * from photo_tags

select * from users 


select * from users u
LEFT JOIN 
 photos p
ON u.id=p.user_id 
where p.user_id IS NULL

# Identify the winner of the contest and provide their details to the team

select * from likes
select * from users

select p.id,p.image_url,p.user_id,COUNT(*) as Total_Photos
from photos p INNER JOIN likes l
ON p.id=l.photo_id
INNER JOIN users u
ON u.id=l.user_id
GROUP BY p.id
ORDER BY Total_Photos DESC
LIMIT 1


#Identify and suggest the top 5 most commonly used hashtags on the platform

select id,tag_name,count(tag_name) as top_most
from tags INNER JOIN photo_tags 
ON tags.id=photo_tags.photo_id
GROUP BY tags.id
ORDER BY top_most DESC
LIMIT 5


#What day of the week do most users register on? Provide insights on when to schedule an ad campaign
Select DAYNAME (created_at) as DAYS, COUNT(*) as Total FROM users
GROUP BY DAYS
ORDER BY Total DESC
LIMIT 2



# Provide how many times does average user posts on Instagram. Also, 
#provide the total number of photos on Instagram/total number of users

SELECT ROUND ((SELECT COUNT (*) FROM photos)/ (SELECT COUNT (*) FROM users), 2)


# Provide data on users (bots) who have liked every single photo on the site (since any normal 
#user would not be able to do this).

select * from likes 

select * from users

select id,username,count(id) as total_likes from users
INNER JOIN likes 
ON users.id=likes.user_id
GROUP BY users.id
HAVING total_likes = (SELECT COUNT(*) from photos);









