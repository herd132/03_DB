SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_GRADE;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_STUDENT;

SELECT DEPARTMENT_NAME "학과 명", CATEGORY 계열 FROM TB_DEPARTMENT;
-----------------------------------------------------------------------

SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || ' 명 입니다.' AS "학과별 정원" -- "|| '' ||..."  || = 문자열 이어쓰기
FROM TB_DEPARTMENT;

--------------------------------------------------------------------------

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
AND SUBSTR(STUDENT_SSN, 8, 1) = 2
AND DEPARTMENT_NO = 001;

----------------------------------------------------------------------------

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO = ANY ('A513079', 'A513090' , 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;

------------------------------------------------------------------------------

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

------------------------------------------------------------------------------

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

----------------------------------------------------------------------------------

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-------------------------------------------------------------------------------

SELECT CLASS_NO
FROM TB_CLASS 
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

---------------------------------------------------------------------------------

SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;


-------------------------------------------------------------------------------------

SELECT STUDENT_ADDRESS,STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '전주%'
AND ABSENCE_YN = 'N'
AND TO_CHAR(ENTRANCE_DATE, 'YYYY') = 2002;

------------------------------------------------------------------------------------

SELECT STUDENT_NO, STUDENT_NAME, TO_CHAR(ENTRANCE_DATE, 'YYYY"-"MM"-"DD')
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

------------------------------------------------------------------------------

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(TRIM(PROFESSOR_NAME)) != 3; --문자열은 LENGTH 로 길이를 확인 할 수 있다

-----------------------------------------------------------------------------------

SELECT PROFESSOR_NAME 교수이름, FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(19 || SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD')) / 12) 나이
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY 나이;

-------------------------------------------------------------------------------------

SELECT SUBSTR(PROFESSOR_NAME, 2) 이름
FROM TB_PROFESSOR;

-------------------------------------------------------------------------------------

-------------------------------CHACK 필요 ------------------------------------------
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE (TRUNC((ENTRANCE_DATE-TO_DATE(SUBSTR(STUDENT_SSN, 1, 6))) / 365) > 19)
OR (TRUNC((ENTRANCE_DATE-TO_DATE(SUBSTR(STUDENT_SSN, 1, 6))) / 365) < 19);

-------------------------------------------------------------------------------------

SELECT TO_CHAR(TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'DAY') FROM DUAL;

-------------------------------------------------------------------------------------

SELECT TO_DATE('99/10/11', 'YY/MM/DD')
 ,TO_DATE('49/10/11', 'YY/MM/DD')
,TO_DATE('99/10/11', 'RR/MM/DD')
,TO_DATE('49/10/11', 'RR/MM/DD') FROM DUAL;

SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'),'YYYY/MM/DD') "첫 번째", 
		TO_CHAR(TO_DATE('49/10/11', 'YY/MM/DD'),'YYYY/MM/DD') "두 번째",
       TO_CHAR(TO_DATE('99/10/11', 'RR/MM/DD'), 'RRRR/MM/DD') "세 번째", 
       TO_CHAR(TO_DATE('49/10/11', 'RR/MM/DD'), 'RRRR/MM/DD') "네 번째"
FROM DUAL;

-------------------------------------------------------------------------------------


SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE ENTRANCE_DATE < '2000-01-01';

-------------------------------------------------------------------------------------

SELECT ROUND(SUM(POINT) / COUNT(POINT),1)  평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-------------------------------------------------------------------------------------

SELECT DEPARTMENT_NO 학과번호, COUNT(DEPARTMENT_NO) "학생 수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

--------------------------------------------------------------------------------------

SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

--------------------------------------------------------------------------------------

SELECT SUBSTR(TERM_NO, 1,4) 년도, ROUND(AVG(POINT),1) "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1,4)
ORDER BY 년도;

----------------------------------------------------------------------------------------
SELECT * FROM TB_STUDENT;
SELECT DEPARTMENT_NO , COUNT(*) 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;