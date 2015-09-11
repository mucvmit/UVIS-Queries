--Finds canines diagnosed with diagnosis ID 10483, then counts the number of radiology codes (codes with a line number between 700 and 800)
--that appear on that order.
SELECT PATIENT_ID, CLIENT_ID, FIRST_NAME, LAST_NAME, NUM_PATIENTS, EPISODE_ID, ORDER_DATETIME, NUM_RADIOLOGY_CODES FROM 

(SELECT patient.PATIENT_ID, ep.CLIENT_ID, ep.EPISODE_ID, client.FIRST_NAME, client.LAST_NAME FROM UVIS_MR_DIAGNOSIS diag, UVIS_MR_EPISODE ep, UVIS_PATIENT patient, UVIS_CLIENT client 

WHERE diag.DIAGNOSIS_ID = '10483' AND diag.EPISODE_ID = ep.EPISODE_ID AND ep.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.CLIENT_ID = client.CLIENT_ID)

LEFT JOIN (SELECT ORDER_ID, COUNT(PRODUCT_LINE_ID) AS NUM_RADIOLOGY_CODES FROM UVIS_ORDER_DTL WHERE PRODUCT_LINE_ID BETWEEN '700' AND '800' AND ORDER_ITEM_STATUS = 'FN' GROUP BY ORDER_ID) ON EPISODE_ID = ORDER_ID

LEFT JOIN (SELECT ORDER_DATETIME, ORDER_ID AS ORDER_ID2 FROM UVIS_ORDER_HDR WHERE ORDER_ID_SUFFIX = '1') ON EPISODE_ID = ORDER_ID2 

LEFT JOIN (SELECT COUNT(PATIENT_ID) AS NUM_PATIENTS, CLIENT_ID AS CLIENT_ID2 FROM UVIS_PATIENT WHERE ACTIVE_YN = 'Y' GROUP BY CLIENT_ID) ON CLIENT_ID2 = CLIENT_ID ORDER BY PATIENT_ID;

--Finds accessions which have a result field that is a diagnosis, which contain the word 'Mucocele' in the result value.
SELECT ACCESSION_NO, RECEIVED_DATE, RESULT_NAME, RESULT_VALUE FROM 

(SELECT DISTINCT ACCESSION_ID, RESULT_NAME, RESULT_VALUE FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE RESULT_NAME LIKE '%DIAG%' AND (RESULT_VALUE LIKE '%mucocele%' OR RESULT_VALUE LIKE '%Mucocele%' OR RESULT_VALUE LIKE '%MUCOCELE%') AND TEST_CODE != 'BX')

LEFT JOIN (SELECT DISTINCT ACCESSION_ID AS ACCESSION_ID3, PATIENT_ID FROM UVIS_DL_ANIMAL_SPECIMEN_X) ON ACCESSION_ID = ACCESSION_ID3

LEFT JOIN (SELECT PATIENT_ID AS PATIENT_ID2, ANIMAL_ID FROM UVIS_DL_ACCESSION_ANIMAL_X) ON PATIENT_ID = PATIENT_ID2

LEFT JOIN (SELECT ACCESSION_ID AS ACCESSION_ID4, ACCESSION_NO, RECEIVED_DATE FROM UVIS_DL_ACCESSIONS) ON ACCESSION_ID = ACCESSION_ID4;