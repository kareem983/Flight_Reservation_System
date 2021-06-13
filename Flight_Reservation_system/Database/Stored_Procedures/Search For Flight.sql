-- Create Search For Flight Stored Procedures
create or replace PROCEDURE PRO_SEARCH_FOR_Flight (sourcee in VARCHAR2 , des in VARCHAR2 , cid out sys_refcursor)AS
BEGIN
open cid for

 select F.flight_num , f.source_place, f.des_place,f.launch_time, s.num_of_seats,s.price,s.status
  from pro_flight F , pro_seat S
  where f.source_place = sourcee and f.des_place = des and s.f_seat = f.flight_num;
  
END PRO_SEARCH_FOR_Flight;
