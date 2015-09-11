--These scripts were used to modify the QUESTION_ID sequence that is a part of the UVIS_MR_QUESTIONS table when
--scripts were used to create a large batch of result questions for radiology requests.
ALTER SEQUENCE SEQ_QUESTION increment by 600;
SELECT UVIS.SEQ_QUESTION.nextval FROM dual;
ALTER SEQUENCE SEQ_QUESTION increment by 1;