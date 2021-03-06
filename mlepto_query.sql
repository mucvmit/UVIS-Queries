--Returns Specimen ID and POS/NEG results for any MLEPTO tests done over a given time frame.
SELECT ACCESSION_NO, SPECIES, SPECIMEN_ID, RECEIVED_DATE, RESULT_NAME, RESULT_VALUE, RESULT_NAME2, RESULT_VALUE2 FROM (SELECT acc.ACCESSION_NO, acc.ACCESSION_ID, entry.SPECIMEN_ID, species.SPECIES, acc.RECEIVED_DATE, entry.RESULT_NAME, entry.RESULT_VALUE

FROM UVIS_DL_ACCESSIONS acc, UVIS_DL_TEST_RESULTS_ENTRY entry, UVIS_DL_ANIMAL_SPECIMEN_X specx, UVIS_SPECIES_M species, UVIS_DL_ACCESSION_ANIMAL_X anx

WHERE entry.ACCESSION_ID = acc.ACCESSION_ID AND acc.RECEIVED_DATE BETWEEN '1-JAN-11' AND '1-JAN-15' AND entry.TEST_CODE = 'MLEPTO' AND entry.RESULT_NAME = 'SPECIMEN ID' and acc.ACCESSION_ID = specx.ACCESSION_ID AND entry.SPECIMEN_ID = specx.SPECIMEN_ID AND specx.PATIENT_ID = anx.PATIENT_ID AND anx.SPECIES_ID = species.SPECIES_ID)

LEFT JOIN (SELECT RESULT_NAME AS RESULT_NAME2, RESULT_VALUE AS RESULT_VALUE2, SPECIMEN_ID AS SPECIMEN_ID2, ACCESSION_ID AS ACCESSION_ID2 FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE TEST_CODE = 'MLEPTO' AND RESULT_NAME = 'POS/NEG') ON ACCESSION_ID = ACCESSION_ID2 AND SPECIMEN_ID = SPECIMEN_ID2 ORDER BY ACCESSION_NO;
