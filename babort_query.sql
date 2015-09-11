--Finds the results of all BABORT tests done over a time frame.  Returns the specimen ID result and the Organism ID result.
SELECT * FROM (SELECT acc.RECEIVED_DATE, acc.ACCESSION_NO, acc.ACCESSION_ID AS acc_id1, results.TEST_COUNT AS test_count1, results.SPECIMEN_ID, results.TEST_CODE, results.RESULT_NAME, results.RESULT_VALUE FROM UVIS_DL_ACCESSIONS acc, UVIS_DL_TEST_RESULTS_ENTRY results WHERE acc.ACCESSION_ID = results.ACCESSION_ID AND results.TEST_CODE = 'BABORT' AND acc.RECEIVED_DATE BETWEEN '1-JAN-11' AND '31-DEC-14' AND results.RESULT_NAME = 'SPECIMEN ID' AND results.RESULT_VALUE is NOT NULL)

INNER JOIN 

(SELECT acc.ACCESSION_ID AS acc_id2, results.TEST_COUNT AS test_count2, results.SPECIMEN_ID AS SPECIMEN_ID1, results.RESULT_NAME, results.RESULT_VALUE FROM UVIS_DL_ACCESSIONS acc, UVIS_DL_TEST_RESULTS_ENTRY results WHERE acc.ACCESSION_ID = results.ACCESSION_ID AND results.TEST_CODE = 'BABORT' AND acc.RECEIVED_DATE BETWEEN '1-JAN-11' AND '31-DEC-14' AND results.RESULT_NAME = 'ORGANISM ID' AND results.RESULT_VALUE is NOT NULL)

ON acc_id1 = acc_id2 AND test_count1 = test_count2 AND SPECIMEN_ID = SPECIMEN_ID1;
