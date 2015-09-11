--This query provides a list of all RDVM/patient combinations in the Small Animal service over a given timeframe.
SELECT client.CLIENT_ID, client.FIRST_NAME, client.LAST_NAME, hdr.PATIENT_ID, hdr.ORDER_ID, hdr.ORDER_DATETIME, serv.SERVICE_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.WORK_PHONE, client.FAX_NO, client.EMAIL_ADDR 

FROM UVIS_CLIENT client, UVIS_ORDER_HDR hdr, UVIS_SERVICE_AREA_M serv 

WHERE hdr.ORDER_DATETIME BETWEEN '1-MAR-13' AND sysdate AND hdr.ORDER_ID_SUFFIX = '1' AND hdr.RDVM_ID = client.CLIENT_ID AND hdr.ADMITTING_SERVICE_ID = serv.SERVICE_ID AND hdr.ADMITTING_SERVICE_ID = '10';