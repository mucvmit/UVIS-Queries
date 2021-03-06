--Finds positive results of SSLE, MPHF, MFIA, MANM, MEHR, MSLE, or MANS tests.
SELECT ACCESSION_NO, RECEIVED_DATE, SPECIMEN_ID, SPECIMEN_DESC, SPECIES, TEST_CODE, TEST_CODE_DESCR FROM 

(SELECT ACCESSION_ID, SPECIMEN_ID, TEST_CODE FROM UVIS_DL_TEST_RESULTS_ENTRY WHERE (TEST_CODE = 'SSLE' OR TEST_CODE = 'MPHF' OR TEST_CODE = 'MFIA' OR TEST_CODE = 'MANM' OR TEST_CODE = 'MEHR' OR TEST_CODE = 'MSLE' OR TEST_CODE = 'MANS') AND RESULT_NAME = 'POS/NEG' AND RESULT_VALUE = 'POSITIVE' ORDER BY TEST_CODE)

INNER JOIN (SELECT ACCESSION_ID AS ACCESSION_ID1, ACCESSION_NO, RECEIVED_DATE FROM UVIS_DL_ACCESSIONS) ON ACCESSION_ID = ACCESSION_ID1

INNER JOIN (SELECT TEST_CODE AS TEST_CODE1, TEST_CODE_DESCR FROM UVIS_DL_TEST_M) ON TEST_CODE = TEST_CODE1

INNER JOIN (SELECT SPECIMEN_ID AS SPECIMEN_ID1, SPECIMEN_CODE, PATIENT_ID FROM UVIS_DL_ANIMAL_SPECIMEN_X) ON SPECIMEN_ID = SPECIMEN_ID1

INNER JOIN (SELECT ITEM_NAME AS SPECIMEN_DESC, SHORT_CODE FROM UVIS_DL_VALIDATION_LIST_ITEM WHERE ACTIVE_YN = 'Y') ON SHORT_CODE = SPECIMEN_CODE

INNER JOIN (SELECT PATIENT_ID AS PATIENT_ID1, SPECIES_ID FROM UVIS_DL_ACCESSION_ANIMAL_X) ON PATIENT_ID = PATIENT_ID1

INNER JOIN (SELECT SPECIES, SPECIES_ID AS SPECIES_ID1 FROM UVIS_SPECIES_M) ON SPECIES_ID = SPECIES_ID1;