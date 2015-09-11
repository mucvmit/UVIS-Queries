--Finds all Organism ID results from BAERO tests done on a Urine sample
SELECT * FROM (SELECT * FROM (SELECT acc.ACCESSION_NO, entry.ACCESSION_ID AS aid1, entry.SPECIMEN_ID, species.SPECIES, entry.TEST_CODE, entry.RESULT_NAME, entry.RESULT_VALUE 

FROM UVIS_DL_TEST_RESULTS_ENTRY entry, UVIS_DL_TEST_RESULTS_M results, UVIS_DL_ACCESSIONS acc, UVIS_DL_ACCESSION_ANIMAL_X animal, UVIS_SPECIES_M species

WHERE entry.ACCESSION_ID = results.ACCESSION_ID AND results.RECORDED_DATE BETWEEN '1-JAN-14' AND '16-NOV-14' AND entry.TEST_CODE = 'BAERO' AND entry.RESULT_NAME = 'ORGANISM ID' AND entry.TEST_CODE = results.TEST_CODE AND entry.RESULT_VALUE IS NOT NULL AND results.SPECIMEN_ID = entry.SPECIMEN_ID AND entry.ACCESSION_ID = acc.ACCESSION_ID AND results.PATIENT_ID = animal.PATIENT_ID AND animal.SPECIES_ID = '6' AND animal.SPECIES_ID = species.SPECIES_ID)

INNER JOIN (SELECT DISTINCT ACCESSION_ID AS aid2, SPECIMEN_ID AS SPECIMEN_ID1 FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE TEST_CODE = 'BAERO' AND RESULT_NAME = 'SPECIMEN ID' AND (RESULT_VALUE LIKE '%URINE%' OR RESULT_VALUE LIKE '%Urine%') AND RESULT_VALUE is NOT NULL)

ON aid1 = aid2 AND SPECIMEN_ID = SPECIMEN_ID1)

INNER JOIN (SELECT RESULT_VALUE, ACCESSION_ID AS aid3, SPECIMEN_ID AS SPECIMEN_ID2, TEST_CODE AS TEST_CODE1 FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE RESULT_NAME = 'SPECIMEN ID')

ON aid1 = aid3 AND SPECIMEN_ID = SPECIMEN_ID2 AND TEST_CODE = TEST_CODE1;

--Finds all Organism ID results from BANA tests done on a Urine sample
SELECT * FROM (SELECT * FROM (SELECT acc.ACCESSION_NO, entry.ACCESSION_ID AS aid1, entry.SPECIMEN_ID, species.SPECIES, entry.TEST_CODE, entry.RESULT_NAME, entry.RESULT_VALUE 

FROM UVIS_DL_TEST_RESULTS_ENTRY entry, UVIS_DL_TEST_RESULTS_M results, UVIS_DL_ACCESSIONS acc, UVIS_DL_ACCESSION_ANIMAL_X animal, UVIS_SPECIES_M species

WHERE entry.ACCESSION_ID = results.ACCESSION_ID AND results.RECORDED_DATE BETWEEN '1-JAN-14' AND '16-NOV-14' AND entry.TEST_CODE = 'BANA' AND entry.RESULT_NAME = 'ORGANISM ID' AND entry.TEST_CODE = results.TEST_CODE AND entry.RESULT_VALUE IS NOT NULL AND results.SPECIMEN_ID = entry.SPECIMEN_ID AND entry.ACCESSION_ID = acc.ACCESSION_ID AND results.PATIENT_ID = animal.PATIENT_ID AND animal.SPECIES_ID = '6' AND animal.SPECIES_ID = species.SPECIES_ID)

INNER JOIN (SELECT DISTINCT ACCESSION_ID AS aid2, SPECIMEN_ID AS SPECIMEN_ID1 FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE TEST_CODE = 'BANA' AND RESULT_NAME = 'SPECIMEN ID' AND (RESULT_VALUE LIKE '%URINE%' OR RESULT_VALUE LIKE '%Urine%') AND RESULT_VALUE is NOT NULL)

ON aid1 = aid2 AND SPECIMEN_ID = SPECIMEN_ID1)

INNER JOIN (SELECT RESULT_VALUE, ACCESSION_ID AS aid3, SPECIMEN_ID AS SPECIMEN_ID2, TEST_CODE AS TEST_CODE1 FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE RESULT_NAME = 'SPECIMEN ID')

ON aid1 = aid3 AND SPECIMEN_ID = SPECIMEN_ID2 AND TEST_CODE = TEST_CODE1;