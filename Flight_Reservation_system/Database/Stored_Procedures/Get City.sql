-- Create Get City Stored Procedures
create or replace PROCEDURE PRO_get_city (out_city out sys_refcursor)
AS
BEGIN
open out_city for
  select name
  from pro_airport;

end PRO_get_city;