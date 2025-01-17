--1
SELECT EMP_ID,EMP_NAME,PHONE,TO_CHAR(HIRE_DATE, 'YY"/"MM"/"DD')
FROM EMPLOYEE
WHERE DEPT_CODE =  'D1'
AND EMP_NAME != '전지연';

--2
SELECT EMP_ID,EMP_NAME,PHONE,SALARY,JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY = (SELECT MAX(SALARY)
			   FROM EMPLOYEE
			   WHERE HIRE_DATE >= '2000-01-01');
			
--3		  
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
								FROM EMPLOYEE
								WHERE EMP_NAME = '노옹철')
AND EMP_NAME != '노옹철';			  

--4
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, TO_CHAR(HIRE_DATE, 'YY"/"MM"/"DD')
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
								FROM EMPLOYEE
								WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2000);
			  
--5						
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, EMP_NO, TO_CHAR(HIRE_DATE, 'YY"/"MM"/"DD')
FROM EMPLOYEE
WHERE (DEPT_CODE, MANAGER_ID) = (SELECT DEPT_CODE, MANAGER_ID
								FROM EMPLOYEE
								WHERE EMP_NO LIKE '77%'
								AND SUBSTR(EMP_NO, 8, 1) = '2');
							

--6
SELECT EMP_ID, EMP_NAME, NVL(DEPT_TITLE, '소속없음'), JOB_NAME, TO_CHAR(HIRE_DATE, 'YY"/"MM"/"DD')
FROM EMPLOYEE MAIN
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING(JOB_CODE)
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)
				 FROM EMPLOYEE SUB
				 WHERE ENT_YN = 'N'
				 AND MAIN.DEPT_CODE = SUB.DEPT_CODE
				 OR (SUB.DEPT_CODE IS NULL AND MAIN.DEPT_CODE IS NULL))
ORDER BY HIRE_DATE;

SELECT EMP_NAME ,EMP_NO FROM EMPLOYEE;
--7
SELECT EMP_ID, EMP_NAME, JOB_NAME,
2024 - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1 ,6), 'RRMMDD')) 나이,
TO_CHAR((SALARY + (SALARY * NVL(BONUS, 0)))*12, 'L999,999,999') 연봉
FROM EMPLOYEE MAIN
JOIN JOB ON (MAIN.JOB_CODE = JOB.JOB_CODE)
WHERE EMP_NO = (SELECT MAX(EMP_NO)
				  FROM EMPLOYEE SUB
				  WHERE SUB.JOB_CODE = MAIN.JOB_CODE)
ORDER BY EMP_NO;

SELECT TO_DAYS(881130) FROM DUAL;
SELECT TO_DAYS('2024-10-14');
