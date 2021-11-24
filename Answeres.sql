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

