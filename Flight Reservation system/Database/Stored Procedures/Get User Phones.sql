-- Create Get User Phones Stored Procedures
create or replace PROCEDURE PRO_GET_USER_PHONES
(  
email_ in PRO_CUSTOMER_PHONES.EMAIL_CPN% TYPE ,
CID out sys_refcursor
)
AS
BEGIN
  open CID for
  select CUSTOMER_PHONE
  from PRO_CUSTOMER_PHONES where EMAIL_CPN=email_ ;
  
END PRO_GET_USER_PHONES;
