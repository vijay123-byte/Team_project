----USING FOR LOOP----

DO $$
DECLARE 
	rec record;
BEGIN
	FOR rec IN (SELECT * FROM employee) LOOP
	
		RAISE NOTICE 'Emp Name % and Emp Department %',rec.empname,rec.department;
	END LOOP;

END $$;


-----USING WHILE LOOP----


DO $$
DECLARE
	counter int:=0;
	end_counter int;
BEGIN
	SELECT COUNT(*) INTO end_counter FROM employee;
    WHILE counter<=end_counter LOOP
		  RAISE NOTICE 'This is % iteration',counter;
		 counter=counter+1; 
		  
	END LOOP;

END $$;
---------------INFINITE LOOP------------
DO $$
DECLARE 
	rec record;
	c_emp cursor for select * from employee;
BEGIN
	OPEN c_emp;
	     LOOP
		 	 FETCH c_emp into rec;
			 EXIT WHEN NOT FOUND;
			 RAISE NOTICE 'This is employee name %',rec.empname;
			
		 END LOOP;
	CLOSE c_emp;

END $$;

--------------------USE IF AND ELSE IF BLOCKS----------

DO $$
DECLARE 
	rec record;
BEGIN
	 	FOR rec in (SELECT * FROM employee) LOOP
			IF rec.department='HR' THEN 
					RAISE NOTICE '10 Increment for %',rec.department;
			ELSIF rec.department='SQL developer' THEN 
					RAISE NOTICE '20 Increment for %',rec.department;
			ELSE
					RAISE NOTICE '50 Increment for %',rec.department;
			END IF;
		END LOOP;
		
END $$;

