--This query finds instances of 440-400, 440-401, 441-400, or 441-401 being used and returns the order id, date, and patient name.
SELECT dtl.ORDER_ID, dtl.ORDER_DATETIME, pat.PATIENT_NAME

FROM UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_PATIENT pat

WHERE dtl.ORDER_ID = ep.EPISODE_ID AND ep.PATIENT_ID = pat.PATIENT_ID AND ((dtl.PRODUCT_LINE_ID = 440 AND (dtl.PRODUCT_SEQ_ID = 400 OR dtl.PRODUCT_SEQ_ID = 401)) OR (dtl.PRODUCT_LINE_ID = 441 AND (dtl.PRODUCT_SEQ_ID = 400 OR dtl.PRODUCT_SEQ_ID = 401)));


--This query finds instances of 900-30 being used and returns order id, date, and patient name.
SELECT dtl.ORDER_ID, dtl.ORDER_DATETIME, pat.PATIENT_NAME

FROM UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_PATIENT pat

WHERE dtl.ORDER_ID = ep.EPISODE_ID AND ep.PATIENT_ID = pat.PATIENT_ID AND dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 30;


--This query combines the previous two to find patients who have had a 900-30 product code on one of their bills in addition to one of the other 4 product codes
--(does not have to be on the same bill).
SELECT PATIENT_ID1, ORDER_DATETIME1, PATIENT_NAME1 FROM (SELECT pat.PATIENT_ID as PATIENT_ID1, dtl.ORDER_DATETIME AS ORDER_DATETIME1, pat.PATIENT_NAME AS PATIENT_NAME1

FROM UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_PATIENT pat

WHERE dtl.ORDER_ID = ep.EPISODE_ID AND ep.PATIENT_ID = pat.PATIENT_ID AND ((dtl.PRODUCT_LINE_ID = 440 AND (dtl.PRODUCT_SEQ_ID = 400 OR dtl.PRODUCT_SEQ_ID = 401)) OR (dtl.PRODUCT_LINE_ID = 441 AND (dtl.PRODUCT_SEQ_ID = 400 OR dtl.PRODUCT_SEQ_ID = 401))))

INNER JOIN (SELECT pat.PATIENT_ID as PATIENT_ID2, dtl.ORDER_DATETIME, pat.PATIENT_NAME

FROM UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_PATIENT pat

WHERE dtl.ORDER_ID = ep.EPISODE_ID AND ep.PATIENT_ID = pat.PATIENT_ID AND dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 30) ON PATIENT_ID1 = PATIENT_ID2;