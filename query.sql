-- Запит 1:
select brand, laptop_name, display_size, processor_type,
STRING_AGG(concat(disk.capacity, ' ', disk.type), '/') as disk_space,
discount_price, old_price, 
concat(laptop.ratings_5max, ' / 5') as ratings_5max
from laptop natural join disk natural join disk_space
group by laptop_id 
order by laptop_id;
-- Запит 2:
select brand, laptop_name, display_size,
concat(gpu.vendor, ' ', gpu.name, ' ', gpu.vram), 
discount_price 
from laptop natural join gpu
order by laptop_id;
-- Запит 3:
select brand, laptop_name, display_size,
gpu.name, gpu.vram,
discount_price 
from laptop natural join gpu 
where gpu.vendor = 'NVIDIA' AND gpu.vram = '(8 GB)'
order by laptop.discount_price DESC;
