--This query compiles a list of the referring DVM for all patients who have been seen at the VMTH in a given time frame, with number of distinct patients per RDVM listed.
SELECT client.CLIENT_ID, client.FIRST_NAME, client.LAST_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.WORK_PHONE, client.FAX_NO, client.EMAIL_ADDR, COUNT(DISTINCT patient.PATIENT_ID) 

FROM UVIS_CLIENT client, UVIS_PATIENT patient, UVIS_MR_EPISODE ep 

WHERE ep.LUD BETWEEN '1-MAR-2013' AND sysdate AND ep.PATIENT_ID = patient.PATIENT_ID AND patient.RDVM_ID = client.CLIENT_ID 

GROUP BY client.CLIENT_ID, client.LAST_NAME, client.FIRST_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.WORK_PHONE, client.FAX_NO, client.EMAIL_ADDR;

--This query is similar to the previous query except it lists number of episodes per RDVM instead of number of patients.
SELECT client.CLIENT_ID, client.FIRST_NAME, client.LAST_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.WORK_PHONE, client.FAX_NO, client.EMAIL_ADDR, patient.PATIENT_ID, COUNT(DISTINCT ep.EPISODE_ID) FROM UVIS_CLIENT client, UVIS_PATIENT patient, UVIS_MR_EPISODE ep WHERE ep.LUD BETWEEN '1-MAR-2013' AND sysdate AND ep.PATIENT_ID = patient.PATIENT_ID AND patient.RDVM_ID = client.CLIENT_ID GROUP BY client.CLIENT_ID, client.FIRST_NAME, client.LAST_NAME, patient.PATIENT_ID, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.WORK_PHONE, client.FAX_NO, client.EMAIL_ADDR;