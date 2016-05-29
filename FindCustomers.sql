select distinct c.name from new_schema.customers as c 
inner join new_schema.purchaises as p
on c.customerid = p.customerid
where
p.productname = "молоко"
and not exists
(
select * from new_schema.purchaises as p1
where c.customerid = p1.customerid
and
p1.productname = "сметана"  
and 
TIMESTAMPDIFF(month, p1.purchaisedatetime, now()) <= 1
);
