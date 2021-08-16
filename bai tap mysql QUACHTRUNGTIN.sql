use ig_clone;
-- QUESTION 1: 
select username,created_at from users
order by created_at asc
limit 5;

-- QUESTION 2:
select dayname(created_at) as resgistion_day, count(*) as total from users
group by resgistion_day
order by total desc
limit 2;

-- QUESTION 3:
select username from users 
left join photos
on users.id = photos.user_id
where photos.user_id is null;

-- QUESTION 4:
select username, image_url as picture, count(photo_id) as Total from photos
left join likes on photos.id = likes.photo_id
left join users on users.id = photos.user_id
group by photos.id
order by Total desc
limit 1;

-- QUESTION 5:
select
  (select count(*) from photos) /
  (select count(*) from users) 
  as post;
  
-- QUESTION 6: 
select tags.tag_name as tag, count(*) as total from photo_tags 
left join tags on photo_tags.tag_id = tags.id 
group by tags.id 
order by total desc 
limit 5; 

-- QUESTION 7: 
select username, count(*) as num_likes from users
left join likes on users.id = likes.user_id 
group by users.id
having num_likes = 1;
