--Finds all GGT tests done over a time frame.
SELECT DISTINCT res.REQUEST_ID, res.RESULT_ID, req.HOSP_REQUEST_ID, res.RESULT_VALUE, res.RSTATUS_DATETIME, spec.SPECIES FROM UVIS_CL_RESULT res, UVIS_CL_REQUEST req, UVIS_CL_PATIENT pat, UVIS_SPECIES_M spec

WHERE (res.TEST_ID = 31 OR res.RTEST_ID = 31) AND res.PATIENT_ID = pat.PATIENT_ID AND pat.SPECIES_ID = spec.SPECIES_ID AND res.REQUEST_ID = req.REQUEST_ID;