--This query finds all orders from a specified time frame where the client left the vmth with an outstanding balance remaining.
--Additionally, it checks to see if the client went on a payment plan (determined by the presence of a 2-430 or 2-432 line on the bill.
--The last modified date of this query is 8/26/2015


--Updated 9/11
SELECT EPISODE_ID, HOSPITALIZATION_DATETIME, DISCHARGE_DATETIME, PATIENT_ID, CLIENT_ID, ADMITTING_SERVICE, ATTENDING_SERVICE, INVOICE_TRANS_TYPE, TRANS_DATETIME, TRANS_AMOUNT, BALANCE_DUE_AMT, OUTSTANDING_BALANCE, ORDER_TOTAL_AMT, TOTAL_PAYMENTS, ADMITTING_DVM, ATTENDING_DVM FROM    
   
(SELECT ep.EPISODE_ID, ep.HOSPITALIZATION_DATETIME, ep.DISCHARGE_DATETIME, ep.PATIENT_ID, ep.CLIENT_ID, hdr.INVOICE_ID, hdr.ADMITTING_SERVICE_ID, hdr.ADMITTING_SECTION_ID, hdr.ATTENDING_SERVICE_ID, hdr.ATTENDING_SECTION_ID, hdr.ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX2, nvl(client.BAL_00_30,0)+nvl(client.BAL_31_60,0)+nvl(client.BAL_61_90,0)+nvl(client.BAL_OVER_90,0) OUTSTANDING_BALANCE, hdr.ATTENDING_DVM_ID, hdr.ADMITTING_DVM_ID, hdr.ORDER_TOTAL_AMT FROM UVIS_MR_EPISODE ep, UVIS_ORDER_HDR hdr, UVIS_PATIENT pat, UVIS_CLIENT client WHERE ep.CLIENT_ID = client.CLIENT_ID AND (nvl(client.BAL_00_30,0)+nvl(client.BAL_31_60,0)+nvl(client.BAL_61_90,0)+nvl(client.BAL_OVER_90,0) > 0) AND ep.EPISODE_ID = hdr.ORDER_ID AND ep.HOSPITALIZATION_DATETIME BETWEEN '1-JUL-15' AND '10-JUL-15' AND ep.PATIENT_ID = pat.PATIENT_ID AND pat.ACTIVE_YN = 'Y' AND (pat.SPECIES_ID = '6' OR pat.SPECIES_ID = '7'))   
   
LEFT JOIN (SELECT INVOICE_TRANS_TYPE, TRANS_DATETIME, CLIENT_ID AS CLIENT_ID2, UVIS_INVOICE.TRANS_AMOUNT, UVIS_INVOICE.INVOICE_ID AS INVOICE_ID2, UVIS_INVOICE.BALANCE_DUE_AMT, UVIS_INVOICE.ORDER_ID AS ORDER_ID2, UVIS_INVOICE.ORDER_ID_SUFFIX FROM UVIS_INVOICE WHERE (INVOICE_TRANS_TYPE = 'POS' OR INVOICE_TRANS_TYPE = 'DEPOSIT' OR INVOICE_TRANS_TYPE = 'POA' OR INVOICE_TRANS_TYPE = 'POS PAYMENT' OR INVOICE_TRANS_TYPE = 'CREDIT MEMO' OR INVOICE_TRANS_TYPE = 'PAYMENT FROM COLLECTIONS')) ON (ORDER_ID2 = EPISODE_ID AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX2)   
   
LEFT JOIN (SELECT ORDER_ID, ORDER_ID_SUFFIX, PRODUCT_LINE_ID, PRODUCT_SEQ_ID FROM UVIS_ORDER_DTL WHERE PRODUCT_LINE_ID = '2' AND (PRODUCT_SEQ_ID = '432' OR PRODUCT_SEQ_ID = '430')) ON ORDER_ID = EPISODE_ID  
  
LEFT JOIN (SELECT SERVICE_NAME AS ADMITTING_SERVICE, SERVICE_ID FROM UVIS_SERVICE_AREA_M) ON SERVICE_ID = ADMITTING_SERVICE_ID 
 
--LEFT JOIN (SELECT SECTION_NAME AS ADMITTING_SECTION, SECTION_ID, SERVICE_ID AS SERVICE_ID2 FROM UVIS_SERVICE_AREA_SECTIONS) ON ADMITTING_SERVICE_ID = SERVICE_ID2 AND ADMITTING_SECTION_ID = SECTION_ID
 
LEFT JOIN (SELECT SERVICE_NAME AS ATTENDING_SERVICE, SERVICE_ID AS SERVICE_ID3 FROM UVIS_SERVICE_AREA_M) ON SERVICE_ID3 = ATTENDING_SERVICE_ID 
 
--LEFT JOIN (SELECT SECTION_NAME AS ATTENDING_SECTION, SECTION_ID AS SECTION_ID2, SERVICE_ID AS SERVICE_ID4 FROM UVIS_SERVICE_AREA_SECTIONS) ON ATTENDING_SERVICE_ID = SERVICE_ID4 AND ATTENDING_SECTION_ID = SECTION_ID2
 
LEFT JOIN (SELECT ORDER_ID AS ORDER_ID3, ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX3, SUM(TRANS_AMOUNT) AS TOTAL_PAYMENTS FROM UVIS_INVOICE WHERE (INVOICE_TRANS_TYPE = 'POS' OR INVOICE_TRANS_TYPE = 'POS PAYMENT' OR INVOICE_TRANS_TYPE = 'DEPOSIT') GROUP BY ORDER_ID, ORDER_ID_SUFFIX) ON ORDER_ID2 = ORDER_ID3 AND ORDER_ID_SUFFIX2 = ORDER_ID_SUFFIX3 
 
LEFT JOIN (SELECT EMP_ID, FIRST_NAME||' '||LAST_NAME "ADMITTING_DVM" FROM UVIS_EMPLOYEE) ON EMP_ID = ADMITTING_DVM_ID 
 
LEFT JOIN (SELECT EMP_ID AS EMP_ID2, FIRST_NAME||' '||LAST_NAME "ATTENDING_DVM" FROM UVIS_EMPLOYEE) ON EMP_ID2 = ATTENDING_DVM_ID;