-- 1
select *
  from (select CHLOCCT, count(*)
          from flight f
         where CHRMINE = 'ON TIME'
        group by CHLOCCT
        order by 2 desc
       )
limit 3;

--2
select f.*
  from flight f
  join country c on (lower(f.CHLOCCT) = lower(c.country))
 where "Area in km²" > 1000000;

--3
select c.country
      ,count(*) flights
      ,count(*) - lag(count(*)) over (order by count(*)) diff
  from flight f
  join country c on (lower(f.CHLOCCT) = lower(c.country))
 where Population > 10000000
group by c.country
having flights < 50
order by 2 desc;