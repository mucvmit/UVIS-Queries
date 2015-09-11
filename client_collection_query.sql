--Finds 'POA' type invoice transactions involving clients which are currently at collections.
SELECT client.CLIENT_ID, inv.INVOICE_TRANS_TYPE, inv.TRANS_DATETIME, inv.TRANS_AMOUNT, cred.COLLECTION_YN

FROM UVIS_CLIENT client, UVIS_CLIENT_CREDIT cred, UVIS_INVOICE inv

WHERE client.CLIENT_ID = cred.CLIENT_ID AND cred.COLLECTION_YN = 'Y' AND client.CLIENT_ID = inv.CLIENT_ID AND inv.TRANS_DATETIME BETWEEN '1-MAR-14' AND sysdate AND inv.INVOICE_TRANS_TYPE = 'POA' ORDER BY CLIENT_ID;