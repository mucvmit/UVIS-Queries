--This generates a list of default comments attached to Serology test codes
SELECT resx.TEST_CODE, resx.RESULT_NAME, format.DESCRIPTION, resx.DEFAULT_VAL

FROM UVIS_DL_TEST_RESULT_X resx, UVIS_DL_REPORT_FORMAT_M format

WHERE resx.TEST_CODE LIKE 'S%' AND resx.RESULT_NAME = 'COMMENTS' AND resx.REPORT_FORMAT_ID = format.REPORT_FORMAT_ID;