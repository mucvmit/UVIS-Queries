--Finds all diagnoses with Neurology listed as the section.
SELECT diag.DIAGNOSIS_ID, diag.DIAGNOSIS, diag.STANDARD_CODE, serv.SERVICE_NAME, section.SECTION_NAME, diag.ACTIVE_YN

FROM UVIS_PRIMARY_DIAGNOSIS_M diag, UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS section, UVIS_DIAGNOSIS_SECTION_X diagx

WHERE diagx.SERVICE_ID = '112' AND diagx.SECTION_ID = '1020' AND diagx.DIAGNOSIS_ID = diag.DIAGNOSIS_ID AND diagx.SERVICE_ID = serv.SERVICE_ID AND diagx.SERVICE_ID = section.SERVICE_ID AND diagx.SECTION_ID = section.SECTION_ID;

--Finds number of times all neurology diagnoses have been used.
SELECT * FROM (SELECT diag.DIAGNOSIS_ID, diag.DIAGNOSIS, diag.STANDARD_CODE, serv.SERVICE_NAME, section.SECTION_NAME, diag.ACTIVE_YN

FROM UVIS_PRIMARY_DIAGNOSIS_M diag, UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS section, UVIS_DIAGNOSIS_SECTION_X diagx

WHERE diagx.SERVICE_ID = '112' AND diagx.SECTION_ID = '1020' AND diagx.DIAGNOSIS_ID = diag.DIAGNOSIS_ID AND diagx.SERVICE_ID = serv.SERVICE_ID AND diagx.SERVICE_ID = section.SERVICE_ID AND diagx.SECTION_ID = section.SECTION_ID)

LEFT JOIN (SELECT COUNT(DIAGNOSIS_ID) AS TIMES_USED, DIAGNOSIS_ID AS DIAGNOSIS_ID1 FROM UVIS_MR_DIAGNOSIS GROUP BY DIAGNOSIS_ID)

ON DIAGNOSIS_ID = DIAGNOSIS_ID1;