--Returns a list of clients who have brought felines in over a given time frame
SELECT DISTINCT client.CLIENT_ID, client.BUSINESS_FARM_NAME, client.FIRST_NAME, client.LAST_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.EMAIL_ADDR

FROM UVIS_CLIENT client, UVIS_PATIENT patient, UVIS_ORDER_HDR hdr

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-12' AND sysdate AND hdr.CLIENT_ID = client.CLIENT_ID AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '7' ORDER BY CLIENT_ID;