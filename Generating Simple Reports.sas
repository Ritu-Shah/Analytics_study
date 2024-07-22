/* Question 1 */

/*Create a query that uses the DESCRIBE TABLE statement 
to determine the data types of the columns in the data table insurance_claims*/
Proc SQL;
describe table sq. Insurance_claims;
Quit;

/*how many columns are numeric and how many columns are character*/
proc sql;
   select 
       sum(case when type='num' then 1 else 0 end) as num_columns,
       sum(case when type='char' then 1 else 0 end) as char_columns
   from dictionary.columns
   where libname='SQ' and memname='INSURANCE_CLAIMS';
quit;

/*Test*/

proc sql;
   select 
       count(*) as total_columns
   from dictionary.columns
   where libname='SQ' and memname='INSURANCE_CLAIMS';
quit;

proc sql;
select count (*) as no_of_columns
from sq.insurance_claims
where table_name='insurance_claims';
quit;

proc sql;
   select count(*) as total_num_columns, as total_char_columns
   from dictionary.columns
   where libname='SQ' and memname='INSURANCE_CLAIMS';
quit;


/* Question 2 */

/*Select the columns policy ID, vehicle age, fuel type, and renewal date*/
proc sql;
Select policy_id, vehicle_age, fuel_type, renewal_date
From sq.insurance_claims;
quit;
/*Label the policy ID column ‘Policy ID’, 'Vehicle Age', ‘Fuel Type’, ‘Renewal Date’*/
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date"
From sq.insurance_claims;
Quit;
/*Apply a date format to the renewal date column that has a formatted value of ddMONYY*/
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date" format=date7.
From sq.insurance_claims;
Quit;
/*Title on the report entitled “Prior claim customers with petrol engines likely to file another claim from a parking lot incident”*/
Title "Prior claim customers with patrol engine likely to file another claim from a parking lot incident";
Proc SQL;
Select policy_id "Policy ID", 
vehicle_age "Vehicle Age", 
fuel_type "Fuel Type", 
renewal_date "Renewal Date" format=date7.
From sq.insurance_claims;
Title;
Quit;
/*Filter the report for vehicles with petrol fuel types*/
Title "Prior claim customers with petrol engine likely to file another claim from a parking lot incident";
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date" format=date7.
From sq.insurance_claims
Where fuel_type="Petrol";
Title;
Quit;
/*Filter the report for vehicles with no parking sensors*/
Title "Prior claim customers with petrol engine likely to file another claim from a parking lot incident";
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date" format=date7.,
is_parking_sensors"Parking Sensors"
From sq.insurance_claims
Where fuel_type="Petrol" and is_parking_sensors="No";
Title;
Quit;
/*Filter the report for customers who have filed claims in the past*/
Title "Prior claim customers with petrol engine likely to file another claim from a parking lot incident";
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date" format=date7.,
is_parking_sensors"Parking Sensors",
claim_status"Claim Status"
From sq. insurance_claims
Where fuel_type="Petrol" and is_parking_sensors="No" and Claim_status >0;
Title;
Quit;
/*Order the report by vehicle age in descending order*/
Title "Prior claim customers with petrol engine likely to file another claim from a parking lot incident";
Proc SQL;
Select policy_id"Policy ID", 
vehicle_age"Vehicle Age", 
fuel_type"Fuel Type", 
renewal_date"Renewal Date" format=date7.,
is_parking_sensors"Parking Sensors",
claim_status"Claim Status"
From sq. insurance_claims
Where fuel_type="Petrol" and is_parking_sensors="No" and Claim_status >0
Order by vehicle_age desc;
Title;
Quit;
