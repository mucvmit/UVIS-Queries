--Finds all clients who have had a patient seen at the VMTH over a given time frame.
SELECT DISTINCT client.CLIENT_ID, ctype.CLIENT_TYPE, client.FIRST_NAME, client.LAST_NAME, client.BUSINESS_FARM_NAME, client.ADDR1_LN1, client.CITY1, client.STATE1, client.ZIP1 FROM UVIS_CLIENT client, UVIS_ORDER_HDR hdr, UVIS_CLIENT_TYPE_M ctype

WHERE hdr.CLIENT_ID = client.CLIENT_ID AND hdr.ORDER_DATETIME BETWEEN '1-JAN-13' AND sysdate AND client.CLIENT_TYPE_ID = ctype.CLIENT_TYPE_ID ORDER BY CLIENT_ID;