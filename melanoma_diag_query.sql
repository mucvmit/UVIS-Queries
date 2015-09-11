--Finds instances where a Diagnosis or Standard Diag result was entered that matched contained the word 'MELANOMA'
SELECT ACCESSION_NO, SPECIES, RECEIVED_DATE, TEST_CODE, RESULT_NAME, RESULT_VALUE 

FROM (SELECT acc.ACCESSION_NO, acc.ACCESSION_ID, acc.RECEIVED_DATE, entry.TEST_CODE, entry.RESULT_NAME, entry.RESULT_VALUE, entry.SPECIMEN_ID FROM UVIS_DL_TEST_RESULTS_ENTRY entry, UVIS_DL_ACCESSIONS acc WHERE (entry.RESULT_NAME = 'STANDARD DIAG' OR entry.RESULT_NAME = 'DIAGNOSIS') AND entry.RESULT_VALUE LIKE '%MELANOMA%' AND entry.ACCESSION_ID = acc.ACCESSION_ID)

LEFT JOIN (SELECT species.SPECIES, anx.ACCESSION_ID AS ACCESSION_ID2, specx.SPECIMEN_ID AS SPECIMEN_ID2 FROM UVIS_SPECIES_M species, UVIS_DL_ACCESSION_ANIMAL_X anx, UVIS_DL_ANIMAL_SPECIMEN_X specx WHERE anx.ACCESSION_ID = specx.ACCESSION_ID AND anx.SPECIES_ID = species.SPECIES_ID) ON ACCESSION_ID = ACCESSION_ID2 AND SPECIMEN_ID = SPECIMEN_ID2 ORDER BY ACCESSION_NO;