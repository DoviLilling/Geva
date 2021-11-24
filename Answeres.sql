-- 1
select *
  from (select CHLOCCT, count(*)
          from flight f
         where CHRMINE = 'ON TIME'
        group by CHLOCCT
        order by 2 desc
       )
limit 3;