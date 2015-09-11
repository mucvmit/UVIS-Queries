--This query returns accessions from a given time frame which contain a BX test code and where the RDVM for the accession is either Joan Coates, Dennis Obrien,
-- Fred Wininger, Nick Archambault, Melissa Carpenter, Daniela Mauler, or Rob Daniel.
--From these accessions it returns the result name and value of any Organ System or Standard Diagnosis results
SELECT accessions.RECEIVED_DATE, dvm.LAST_NAME, dvm.FIRST_NAME, accessions.ACCESSION_NO, results_entry.RESULT_NAME, results_entry.RESULT_VALUE, results_entry.RESULT_VALUE_2ND

FROM UVIS_DL_ACCESSIONS accessions, UVIS_DL_TEST_RESULTS_M results, UVIS_DL_TEST_RESULTS_ENTRY results_entry, UVIS_DL_RDVM dvm

WHERE results.TEST_CODE = 'BX' AND results.ACCESSION_ID = accessions.ACCESSION_ID AND results.ACCESSION_ID = results_entry.ACCESSION_ID AND results.TEST_CODE = results_entry.TEST_CODE AND (results_entry.RESULT_NAME = 'ORGAN SYSTEM' OR results_entry.RESULT_NAME = 'STANDARD DIAG') 

AND accessions.RDVM_ID = dvm.RDVM_ID AND results_entry.RESULT_VALUE is NOT NULL AND accessions.RECEIVED_DATE BETWEEN '1-AUG-11' AND '1-AUG-14'

AND ((dvm.FIRST_NAME = 'JOAN' AND dvm.LAST_NAME = 'COATES') OR (dvm.FIRST_NAME = 'DENNIS' AND dvm.LAST_NAME = 'OBRIEN') OR (dvm.FIRST_NAME = 'FRED' AND dvm.LAST_NAME = 'WININGER') OR (dvm.FIRST_NAME = 'NICK' AND dvm.LAST_NAME = 'ARCHAMBAULT') OR (dvm.FIRST_NAME = 'MELISSA' AND dvm.LAST_NAME = 'CARPENTIER') OR (dvm.FIRST_NAME = 'DANIELA' AND dvm.LAST_NAME = 'MAULER') OR (dvm.FIRST_NAME = 'ROB' AND dvm.LAST_NAME = 'DANIEL'))