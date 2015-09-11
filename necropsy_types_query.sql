--Finds all 900-30's (a necropsy request) performed in a given time frame and returns the answer to the "SELECT NECROPSY TYPE:" request question for each request.
SELECT * FROM 

(SELECT dtl.ORDER_ID, patient.PATIENT_ID, species.SPECIES, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, dtl.ORDER_ITEM_DATETIME, dtl.ITEM_ID FROM UVIS_ORDER_DTL dtl, UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species WHERE dtl.ORDER_ITEM_STATUS = 'FN' AND dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND dtl.ORDER_ITEM_DATETIME BETWEEN '1-JUL-14' AND '1-JUL-15' AND dtl.ORDER_ID = hdr.ORDER_ID AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = species.SPECIES_ID AND (patient.ACTIVE_YN = 'Y' OR patient.DECEASED_YN = 'Y') AND dtl.ORDER_ID_SUFFIX = hdr.ORDER_ID_SUFFIX)

LEFT JOIN (SELECT answers.REQUEST_ID, answers.ANSWER_CODE FROM UVIS_MR_REQUEST_ANSWERS answers WHERE answers.QUESTION_ID = '5842') ON REQUEST_ID = ITEM_ID;

