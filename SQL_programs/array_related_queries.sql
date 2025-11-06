
select * from  employee

---------------------------------------
empid || empname|| department ||salary
----------------------------------------
3	   "Vamsi"	"Backend Developer"	50
2	   "J && P"	"HR"             	60
1	   "vijay"	"SQL Developer"	    30
4	   "John"	"SQL Developer"	    30
--------------------------------------

----------------------Declaring the Array and displaying------------------

DO $$
DECLARE
	roles text[]='{"SQL","Backend Developer","Data scientist"}';
	var text;
BEGIN
	FOREACH var in ARRAY roles LOOP
		RAISE NOTICE 'This is the skill %',var;
	END LOOP;
END 
$$

-----------Dynamic adding the elements and Displaying the elements------------------------
DO $$
DECLARE
	rec record;
	roles text[]='{}';
	var text;
BEGIN
	FOR rec in select * from employee LOOP
	IF array_position(roles, rec.department) IS NULL  /* It is adding the non-duplicates */
		THEN roles=array_append(roles,rec.department);
		--RAISE NOTICE 'This is the %',roles;
	END IF;
	END LOOP;
	RAISE NOTICE '----We are displaying the array elements---------';
	FOREACH  var in ARRAY roles LOOP
		RAISE NOTICE 'This department %',var;
	END LOOP;
END
$$

------------Adding && Removing----------
SELECT array_append(ARRAY[1,2,3,4],55);
SELECT array_prepend(5,ARRAY[1,2,3,4])
SELECT array_remove(ARRAY[1,2,5,4],3)
SELECT array_replace(ARRAY[1,2,3,4],3,77)
--------Searching the element----------------------

SELECT array_position(ARRAY[1,2,3,55],55) -----4(index)
SELECT array_positions(ARRAY[1,2,3,4,4],4)-----------{4,5} --indecies

SELECT 1=ANY(ARRAY[1,2,3,4])---TRUE
SELECT 11=ANY(ARRAY[1,2,3,4])----FALSE

SELECT 1=ALL(ARRAY[1,2,3,4])----FALSE
SELECT 1=ALL(ARRAY[1,1,1,1])

----------Getting Information----------
SELECT array_length(ARRAY[1,2,3],1)------ (3) no.of elements
SELECT array_ndims(ARRAY[[1,2,3,4], [5,6,7,8]]);
SELECT array_lower(ARRAY[1,2,4],1)-------->Lower Bound
SELECT array_upper(ARRAY[1,2,4],1)--------Uppder Bound


---------Aggregating data ----------------------------------

SELECT UNNEST(ARRAY[1,2,3,4])-- It converts into row wise
SELECT array_to_string(ARRAY[1,2,3,4],',')---------'1,2,3,4'
SELECT string_to_array('1,2,3,4',',')------------------{1,2,3,4}

select string_agg(salary::character varying,',')
from employee


select STRING_AGG(salary::text, '-')
from employee



------Adding && Removing the Elements------------

SELECT array_prepend(6,ARRAY[1,2,3,4])
SELECT array_append(ARRAY[1,2,3,4],55)
SELECT array_remove(ARRAY[1,2,3,4],3)
SELECT array_replace(ARRAY[1,2,3,4],3,44)

---------Getting Information-----

SELECT array_ndims(ARRAY[1,2,3,4])
SELECT array_length(ARRAY[1,2,3,4],1)
SELECT array_lower(ARRAY[1,2,3,4],1)
SELECT array_upper(ARRAY[1,2,3,4],1)

--------searching element-----

SELECT array_position(ARRAY[1,42,3,4],2)
SELECT array_positions(ARRAY[1,2,3,2],2)


------CHANGING ARRAY--------

SELECT array_to_string(ARRAY[1,2,3,4],',')
SELECT string_to_array('1,2,3,4',',')

SELECT UNNEST(ARRAY[1,2,4])

WITH CTE AS(
	SELECT UNNEST(ARRAY[1,2,4]) as id

)
SELECT string_agg(id::TEXT,',')
from CTE







