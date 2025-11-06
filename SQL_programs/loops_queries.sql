
----------Infinite Loop-------
DO $$
DECLARE
   start_cnt int:=0;
   end_cnt int:=5;
BEGIN
	LOOP
		RAISE NOTICE 'This is the counter %',start_cnt;
		start_cnt=start_cnt+1;
		EXIT WHEN start_cnt>end_cnt;
	END LOOP;
END
$$


--------------------For loop------------------------
1.

	DO $$
	BEGIN
		FOR i IN 1..5 LOOP
			RAISE NOTICE 'Value = %', i;
		END LOOP;
	END $$;
-----------Dynamic (for loop)-----------------------
2.
	DO $$
	DECLARE
		start_cnt int:=0;
		end_cnt int:=6;
	BEGIN
		FOR i IN start_cnt..end_cnt LOOP
			RAISE NOTICE 'Value = %', i;
		END LOOP;
	END $$;
--------------WHILE LOOP---------------
	-----static------
1.  DO $$
	DECLARE 
		start_cnt int:=0;
		end_cnt int:=3;
	BEGIN
		 WHILE start_cnt<=end_cnt LOOP
		 RAISE NOTICE 'This is the % th iteration',start_cnt;
		 start_cnt=start_cnt+1;
		 END LOOP;
	END$$
	------dynamic-----------
2.  DO $$
	DECLARE 
		start_cnt int:=0;
		end_cnt int:=0;
	BEGIN
	    select count(1) INTO end_cnt from employee;
		 WHILE start_cnt<=end_cnt LOOP
		 RAISE NOTICE 'This is the % th iteration',start_cnt;
		 start_cnt=start_cnt+1;
		 END LOOP;
	END$$

----------------For in Query---------------
DO $$
DECLARE
	rec record;
BEGIN
	FOR rec in SELECT * FROM employee LOOP
	RAISE NOTICE  'This is the department %',rec.department;
	END LOOP;
END 
$$

-------------FOR EACH QUERY--------------

DO $$
DECLARE
    skills TEXT[] := ARRAY['SQL', 'Java', 'Python'];
    s TEXT;
BEGIN
    FOREACH s IN ARRAY skills
    LOOP
        RAISE NOTICE 'Skill: %', s;
    END LOOP;
END $$;
