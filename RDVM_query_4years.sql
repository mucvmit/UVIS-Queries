--Accumulates a list of referring DVMs for orders which have taken place since 2011
SELECT DISTINCT client.CLIENT_ID, client.FIRST_NAME, client.LAST_NAME, serv.SERVICE_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.ADDR1_LN2, client.CITY1, client.STATE1, client.ZIP1, client.EMAIL_ADDR 

FROM UVIS_CLIENT client, UVIS_ORDER_HDR hdr, UVIS_SERVICE_AREA_M serv 

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-11' AND sysdate AND hdr.RDVM_ID = client.CLIENT_ID AND hdr.ADMITTING_SERVICE_ID = serv.SERVICE_ID AND hdr.ADMITTING_SERVICE_ID = '10';