--This group of queries handles various aspects of the necropsy/disposal code relationship.

SELECT o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_MR_REQUEST.ITEM_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, SUM(DISTINCT eod.CHARGE_AMT), acc.ACCESSION_NO, acc_date FROM (SELECT UVIS_ORDER_DTL.ORDER_ID AS o_id, UVIS_ORDER_DTL.ITEM_TOTAL_AMT AS amt, UVIS_ORDER_DTL.ORDER_DATETIME as acc_date 

FROM UVIS_ORDER_DTL WHERE UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 30 AND UVIS_ORDER_DTL.ORDER_DATETIME BETWEEN '1-JAN-14' AND '31-DEC-14'), UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_ORDER_DTL, UVIS_MR_REQUEST, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_MR_REQUEST_ITEMS 

WHERE ((UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 520) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 521) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 522) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 540) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 560) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 580)) AND UVIS_ORDER_DTL.ORDER_ID = o_id AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ITEM_TOTAL_AMT > 0

AND UVIS_ORDER_DTL.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = dlr.REQUEST_ID_SOURCE AND dlr.ACCESSION_ID = eod.ACCESSION_ID AND dlr.REQUEST_STATUS = 'ACCEPTED' AND eod.ACCESSION_ID = acc.ACCESSION_ID

GROUP BY o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_MR_REQUEST.ITEM_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, acc.ACCESSION_NO, acc_date;


SELECT o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_ORDER_DTL.PRODUCT_LINE_ID, UVIS_ORDER_DTL.PRODUCT_SEQ_ID, UVIS_MR_REQUEST.ITEM_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, SUM(DISTINCT eod.CHARGE_AMT), acc.ACCESSION_NO FROM (SELECT UVIS_ORDER_DTL.ORDER_ID AS o_id, UVIS_ORDER_DTL.ITEM_TOTAL_AMT AS amt 

FROM UVIS_ORDER_DTL WHERE UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 30 AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ORDER_DATETIME BETWEEN '1-JAN-14' AND '31-DEC-14'), UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_ORDER_DTL, UVIS_MR_REQUEST, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_MR_REQUEST_ITEMS 

WHERE ((UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500)) AND UVIS_ORDER_DTL.ORDER_ID = o_id AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ITEM_TOTAL_AMT > 0

AND UVIS_ORDER_DTL.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = dlr.REQUEST_ID_SOURCE AND dlr.ACCESSION_ID = eod.ACCESSION_ID AND dlr.REQUEST_STATUS = 'ACCEPTED' AND eod.ACCESSION_ID = acc.ACCESSION_ID

GROUP BY o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_MR_REQUEST.ITEM_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, acc.ACCESSION_NO;

-- UPDATED 2/26- This checks for necropsies that do have disposal codes
SELECT o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_ORDER_DTL.PRODUCT_LINE_ID, UVIS_ORDER_DTL.PRODUCT_SEQ_ID, prod.BILLING_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, SUM(DISTINCT eod.CHARGE_AMT), acc.ACCESSION_NO, ORDER_DATE FROM (SELECT UVIS_ORDER_DTL.ORDER_ID AS o_id, UVIS_ORDER_DTL.ITEM_TOTAL_AMT AS amt, UVIS_ORDER_DTL.ORDER_DATETIME AS order_date 

FROM UVIS_ORDER_DTL WHERE UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 30 AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ORDER_DATETIME BETWEEN '1-JAN-14' AND '31-DEC-14'), UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_ORDER_DTL, UVIS_MR_REQUEST, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_MR_REQUEST_ITEMS, UVIS_PRODUCT prod

WHERE ((UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500)) AND UVIS_ORDER_DTL.ORDER_ID = o_id AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ITEM_TOTAL_AMT > 0

AND UVIS_ORDER_DTL.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = dlr.REQUEST_ID_SOURCE AND dlr.ACCESSION_ID = eod.ACCESSION_ID AND dlr.REQUEST_STATUS = 'ACCEPTED' AND eod.ACCESSION_ID = acc.ACCESSION_ID AND UVIS_ORDER_DTL.PRODUCT_LINE_ID = prod.PRODUCT_LINE_ID AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = prod.PRODUCT_SEQ_ID

GROUP BY o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, prod.BILLING_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, acc.ACCESSION_NO, ORDER_DATE, UVIS_ORDER_DTL.PRODUCT_LINE_ID, UVIS_ORDER_DTL.PRODUCT_SEQ_ID;


--This checks for necropsies without disposal codes
SELECT * FROM (SELECT DISTINCT dtl.ORDER_ID, lab_charges, ACCESSION_NO, UVIS_MR_REQUEST.REQUEST_ID, dtl.ORDER_DATETIME, serv.SERVICE_NAME AS admitting_service, sect.SECTION_NAME AS admitting_section FROM UVIS_ORDER_DTL dtl, UVIS_MR_REQUEST, (SELECT acc.ACCESSION_NO, acc.ACCESSION_ID, dlr.REQUEST_ID_SOURCE AS req_id1, SUM(eod.CHARGE_AMT) AS lab_charges FROM UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr WHERE eod.ACCESSION_ID = acc.ACCESSION_ID AND acc.ACCESSION_ID = dlr.ACCESSION_ID AND acc.RECEIVED_DATE BETWEEN '30-DEC-13' AND '31-DEC-14' GROUP BY acc.ACCESSION_NO, dlr.REQUEST_ID_SOURCE, acc.ACCESSION_ID), UVIS_MR_REQUEST_ITEMS, UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect, UVIS_ORDER_HDR hdr

WHERE dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 30 AND dtl.ORDER_ITEM_STATUS = 'FN' AND dtl.ORDER_DATETIME BETWEEN '1-JAN-14' AND '31-DEC-14'
AND dtl.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = req_id1 AND dtl.ORDER_ID = hdr.ORDER_ID AND hdr.ADMITTING_SECTION_ID = sect.SECTION_ID AND hdr.ADMITTING_SERVICE_ID = serv.SERVICE_ID AND hdr.ADMITTING_SERVICE_ID = sect.SERVICE_ID)

INNER JOIN (SELECT DISTINCT serv.SERVICE_NAME AS requesting_service, sect.SECTION_NAME AS requestion_section, log.REQUEST_LOG_ID, log.REQUEST_ID AS req_id FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect, UVIS_EMPLOYEE emp, UVIS_MR_REQUEST_LOG log, UVIS_MR_REQUEST_ITEMS items WHERE log.REQUEST_LOG_ACTION = 'INSERTING' AND log.REQUEST_ID = items.REQUEST_ID AND items.PRODUCT_LINE_ID = '900' AND items.PRODUCT_SEQ_ID = '30' AND log.REQUESTING_DVM_ID = emp.EMP_ID AND emp.SERVICE_ID = serv.SERVICE_ID AND emp.SERVICE_ID = sect.SERVICE_ID AND emp.SECTION_ID = sect.SECTION_ID) ON REQUEST_ID = req_id

LEFT OUTER JOIN (SELECT ORDER_ID AS o_id2 FROM UVIS_ORDER_DTL WHERE (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500) AND ORDER_ITEM_STATUS = 'FN') ON ORDER_ID = o_id2 WHERE o_id2 is NULL;


--2015 necropsy checks
SELECT * FROM UVIS_ORDER_DTL WHERE PRODUCT_LINE_ID = 900 AND PRODUCT_SEQ_ID = 30 AND ORDER_DATETIME BETWEEN '1-JAN-15' AND sysdate AND ORDER_ITEM_STATUS = 'FN';

SELECT o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, UVIS_ORDER_DTL.PRODUCT_LINE_ID, UVIS_ORDER_DTL.PRODUCT_SEQ_ID, prod.SHORT_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, SUM(DISTINCT eod.CHARGE_AMT), acc.ACCESSION_NO, ORDER_DATE FROM (SELECT UVIS_ORDER_DTL.ORDER_ID AS o_id, UVIS_ORDER_DTL.ITEM_TOTAL_AMT AS amt, UVIS_ORDER_DTL.ORDER_DATETIME AS order_date 

FROM UVIS_ORDER_DTL WHERE UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 30 AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ORDER_DATETIME BETWEEN '1-JAN-15' AND '31-DEC-15'), UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_ORDER_DTL, UVIS_MR_REQUEST, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_MR_REQUEST_ITEMS, UVIS_PRODUCT prod

WHERE ((UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500)) AND UVIS_ORDER_DTL.ORDER_ID = o_id AND UVIS_ORDER_DTL.ORDER_ITEM_STATUS = 'FN' AND UVIS_ORDER_DTL.ITEM_TOTAL_AMT > 0

AND UVIS_ORDER_DTL.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = dlr.REQUEST_ID_SOURCE AND dlr.ACCESSION_ID = eod.ACCESSION_ID AND dlr.REQUEST_STATUS = 'ACCEPTED' AND eod.ACCESSION_ID = acc.ACCESSION_ID AND UVIS_ORDER_DTL.PRODUCT_LINE_ID = prod.PRODUCT_LINE_ID AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = prod.PRODUCT_SEQ_ID

GROUP BY o_id, UVIS_ORDER_DTL.ORDER_ITEM_SEQ_ID, prod.SHORT_DESCRIPTION, UVIS_ORDER_DTL.ITEM_TOTAL_AMT, acc.ACCESSION_NO, ORDER_DATE, UVIS_ORDER_DTL.PRODUCT_LINE_ID, UVIS_ORDER_DTL.PRODUCT_SEQ_ID;


--This checks for necropsies without disposal codes
SELECT * FROM (SELECT DISTINCT dtl.ORDER_ID, dtl.ORDER_ITEM_SEQ_ID, lab_charges, ACCESSION_NO, UVIS_MR_REQUEST.REQUEST_ID, dtl.ORDER_DATETIME, serv.SERVICE_NAME AS admitting_service, sect.SECTION_NAME AS admitting_section FROM UVIS_ORDER_DTL dtl, UVIS_MR_REQUEST, (SELECT acc.ACCESSION_NO, acc.ACCESSION_ID, dlr.REQUEST_ID_SOURCE AS req_id1, SUM(eod.CHARGE_AMT) AS lab_charges FROM UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_DL_ACCESSIONS@uvisdlab acc, UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr WHERE eod.ACCESSION_ID = acc.ACCESSION_ID AND acc.ACCESSION_ID = dlr.ACCESSION_ID AND acc.RECEIVED_DATE BETWEEN '30-DEC-14' AND '31-DEC-15' GROUP BY acc.ACCESSION_NO, dlr.REQUEST_ID_SOURCE, acc.ACCESSION_ID), UVIS_MR_REQUEST_ITEMS, UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect, UVIS_ORDER_HDR hdr

WHERE dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 30 AND dtl.ORDER_ITEM_STATUS = 'FN' AND dtl.ORDER_DATETIME BETWEEN '1-JAN-15' AND sysdate
AND dtl.ORDER_ID = UVIS_MR_REQUEST.EPISODE_ID AND UVIS_MR_REQUEST.REQUEST_ID = UVIS_MR_REQUEST_ITEMS.REQUEST_ID AND UVIS_MR_REQUEST_ITEMS.PRODUCT_LINE_ID = 900 AND UVIS_MR_REQUEST_ITEMS.PRODUCT_SEQ_ID = 30
AND UVIS_MR_REQUEST.REQUEST_ID = req_id1 AND dtl.ORDER_ID = hdr.ORDER_ID AND hdr.ADMITTING_SECTION_ID = sect.SECTION_ID AND hdr.ADMITTING_SERVICE_ID = serv.SERVICE_ID AND hdr.ADMITTING_SERVICE_ID = sect.SERVICE_ID)

INNER JOIN (SELECT DISTINCT serv.SERVICE_NAME AS requesting_service, sect.SECTION_NAME AS requestion_section, log.REQUEST_LOG_ID, log.REQUEST_ID AS req_id FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect, UVIS_EMPLOYEE emp, UVIS_MR_REQUEST_LOG log, UVIS_MR_REQUEST_ITEMS items WHERE log.REQUEST_LOG_ACTION = 'INSERTING' AND log.REQUEST_ID = items.REQUEST_ID AND items.PRODUCT_LINE_ID = '900' AND items.PRODUCT_SEQ_ID = '30' AND log.REQUESTING_DVM_ID = emp.EMP_ID AND emp.SERVICE_ID = serv.SERVICE_ID AND emp.SERVICE_ID = sect.SERVICE_ID AND emp.SECTION_ID = sect.SECTION_ID) ON REQUEST_ID = req_id

LEFT OUTER JOIN (SELECT ORDER_ID AS o_id2 FROM UVIS_ORDER_DTL WHERE (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500) AND ORDER_ITEM_STATUS = 'FN') ON ORDER_ID = o_id2 WHERE o_id2 is NULL;


--Basic query that gets cases with a necropsy and a disposal.  Can be changed to an outer join to get cases with a necropsy but without a disposal.
SELECT * FROM (SELECT ORDER_ID FROM UVIS_ORDER_DTL WHERE PRODUCT_LINE_ID = '900' AND PRODUCT_SEQ_ID = '30' AND ORDER_DATETIME BETWEEN '1-JAN-15' AND sysdate)

INNER JOIN (SELECT ORDER_ID AS ORDER_ID2 FROM UVIS_ORDER_DTL WHERE (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 20) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2810) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 900 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 14) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 905 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 2400) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 490 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 600) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 590 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 100) OR (UVIS_ORDER_DTL.PRODUCT_LINE_ID = 670 AND UVIS_ORDER_DTL.PRODUCT_SEQ_ID = 500))

ON ORDER_ID = ORDER_ID2;

--Updated on 3-9 to make the dates dynamic
SELECT ORDER_ID, ORDER_ID_SUFFIX, REQUEST_ID, PRODUCT_LINE_ID, PRODUCT_SEQ_ID, ORDER_ITEM_STATUS, ITEM_TOTAL_AMT, ORDER_ITEM_SEQ_ID, SHORT_DESCRIPTION, LAB_CHARGES, ACCESSION_NO, ADMITTING_SERVICE, ADMITTING_SECTION, REQUESTING_SERVICE, REQUESTING_SECTION

FROM (SELECT DISTINCT dtl.ORDER_ID, dtl.ORDER_ID_SUFFIX, items.REQUEST_ID, req.REQUESTING_DVM_ID FROM UVIS_ORDER_DTL dtl, UVIS_MR_REQUEST req, UVIS_MR_REQUEST_ITEMS items WHERE dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND dtl.ORDER_ITEM_DATETIME BETWEEN :p_start_date AND :p_end_date AND dtl.ORDER_ID = req.EPISODE_ID AND req.REQUEST_ID = items.REQUEST_ID AND items.PRODUCT_LINE_ID = dtl.PRODUCT_LINE_ID AND items.PRODUCT_SEQ_ID = dtl.PRODUCT_SEQ_ID AND dtl.ITEM_ID = req.REQUEST_ID)

LEFT JOIN (SELECT dtl.ORDER_ID AS ORDER_ID2, dtl.ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX3, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, dtl.ORDER_ITEM_STATUS, dtl.ITEM_TOTAL_AMT, dtl.ORDER_ITEM_SEQ_ID FROM UVIS_ORDER_DTL dtl WHERE (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 20) OR (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 2810) OR (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 14) OR (dtl.PRODUCT_LINE_ID = 905 AND dtl.PRODUCT_SEQ_ID = 2400) OR (dtl.PRODUCT_LINE_ID = 490 AND dtl.PRODUCT_SEQ_ID = 600) OR (dtl.PRODUCT_LINE_ID = 590 AND dtl.PRODUCT_SEQ_ID = 100) OR (dtl.PRODUCT_LINE_ID = 670 AND dtl.PRODUCT_SEQ_ID = 500)) ON ORDER_ID = ORDER_ID2 AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX3

LEFT JOIN (SELECT prod.SHORT_DESCRIPTION, prod.PRODUCT_LINE_ID AS PRODUCT_LINE_ID2, prod.PRODUCT_SEQ_ID AS PRODUCT_SEQ_ID2 FROM UVIS_PRODUCT prod) ON PRODUCT_LINE_ID = PRODUCT_LINE_ID2 AND PRODUCT_SEQ_ID = PRODUCT_SEQ_ID2

LEFT JOIN (SELECT DISTINCT SUM(eod.CHARGE_AMT) AS LAB_CHARGES, dlr.REQUEST_ID_SOURCE, acc.ACCESSION_NO, acc.ACCESSION_ID FROM UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_DL_ACCESSIONS@uvisdlab acc WHERE dlr.ACCESSION_ID = eod.ACCESSION_ID AND acc.ACCESSION_ID = dlr.ACCESSION_ID GROUP BY dlr.REQUEST_ID_SOURCE, acc.ACCESSION_NO, acc.ACCESSION_ID) ON REQUEST_ID = REQUEST_ID_SOURCE

INNER JOIN (SELECT ADMITTING_SECTION_ID, ADMITTING_SERVICE_ID, ORDER_ID AS ORDER_ID3, ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX2 FROM UVIS_ORDER_HDR) ON ORDER_ID = ORDER_ID3 AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX2

INNER JOIN (SELECT EMP_ID, SECTION_ID AS REQUESTING_SECTION_ID, SERVICE_ID AS REQUESTING_SERVICE_ID FROM UVIS_EMPLOYEE) ON EMP_ID = REQUESTING_DVM_ID

INNER JOIN (SELECT serv.SERVICE_NAME AS admitting_service, sect.SECTION_NAME AS admitting_section, serv.SERVICE_ID, sect.SECTION_ID FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect WHERE serv.SERVICE_ID = sect.SERVICE_ID) ON ADMITTING_SERVICE_ID = SERVICE_ID AND ADMITTING_SECTION_ID = SECTION_ID

INNER JOIN (SELECT serv.SERVICE_NAME AS requesting_service, sect.SECTION_NAME AS requesting_section, serv.SERVICE_ID AS SERVICE_ID2, sect.SECTION_ID AS SECTION_ID2 FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect WHERE serv.SERVICE_ID = sect.SERVICE_ID) ON REQUESTING_SERVICE_ID = SERVICE_ID2 AND REQUESTING_SECTION_ID = SECTION_ID2 ORDER BY ORDER_ID;

--Updated on 3-31 to find disposal codes on different suffixes of the same order as necropsies
SELECT ORDER_ID, ORDER_ID_SUFFIX, REQUEST_ID, PRODUCT_LINE_ID, PRODUCT_SEQ_ID, ORDER_ITEM_STATUS, ITEM_TOTAL_AMT, ORDER_ITEM_SEQ_ID, SHORT_DESCRIPTION, LAB_CHARGES, ACCESSION_NO, ADMITTING_SERVICE, ADMITTING_SECTION, REQUESTING_SERVICE, REQUESTING_SECTION

FROM (SELECT DISTINCT dtl.ORDER_ID, dtl.ORDER_ID_SUFFIX, items.REQUEST_ID, req.REQUESTING_DVM_ID FROM UVIS_ORDER_DTL dtl, UVIS_MR_REQUEST req, UVIS_MR_REQUEST_ITEMS items WHERE dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND dtl.ORDER_ITEM_DATETIME BETWEEN :p_start_date AND :p_end_date AND dtl.ORDER_ID = req.EPISODE_ID AND req.REQUEST_ID = items.REQUEST_ID AND items.PRODUCT_LINE_ID = dtl.PRODUCT_LINE_ID AND items.PRODUCT_SEQ_ID = dtl.PRODUCT_SEQ_ID AND dtl.ITEM_ID = req.REQUEST_ID)

LEFT JOIN (SELECT dtl.ORDER_ID AS ORDER_ID2, dtl.ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX3, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, dtl.ORDER_ITEM_STATUS, dtl.ITEM_TOTAL_AMT, dtl.ORDER_ITEM_SEQ_ID FROM UVIS_ORDER_DTL dtl WHERE (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 20) OR (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 2810) OR (dtl.PRODUCT_LINE_ID = 900 AND dtl.PRODUCT_SEQ_ID = 14) OR (dtl.PRODUCT_LINE_ID = 905 AND dtl.PRODUCT_SEQ_ID = 2400) OR (dtl.PRODUCT_LINE_ID = 490 AND dtl.PRODUCT_SEQ_ID = 600) OR (dtl.PRODUCT_LINE_ID = 590 AND dtl.PRODUCT_SEQ_ID = 100) OR (dtl.PRODUCT_LINE_ID = 670 AND dtl.PRODUCT_SEQ_ID = 500)) ON ORDER_ID = ORDER_ID2 

LEFT JOIN (SELECT prod.SHORT_DESCRIPTION, prod.PRODUCT_LINE_ID AS PRODUCT_LINE_ID2, prod.PRODUCT_SEQ_ID AS PRODUCT_SEQ_ID2 FROM UVIS_PRODUCT prod) ON PRODUCT_LINE_ID = PRODUCT_LINE_ID2 AND PRODUCT_SEQ_ID = PRODUCT_SEQ_ID2

LEFT JOIN (SELECT DISTINCT SUM(eod.CHARGE_AMT) AS LAB_CHARGES, dlr.REQUEST_ID_SOURCE, acc.ACCESSION_NO, acc.ACCESSION_ID FROM UVIS_DL_REQUEST_ACCESSION_X@uvisdlab dlr, UVIS_DL_EOD_CHARGES@uvisdlab eod, UVIS_DL_ACCESSIONS@uvisdlab acc WHERE dlr.ACCESSION_ID = eod.ACCESSION_ID AND acc.ACCESSION_ID = dlr.ACCESSION_ID GROUP BY dlr.REQUEST_ID_SOURCE, acc.ACCESSION_NO, acc.ACCESSION_ID) ON REQUEST_ID = REQUEST_ID_SOURCE

INNER JOIN (SELECT ADMITTING_SECTION_ID, ADMITTING_SERVICE_ID, ORDER_ID AS ORDER_ID3, ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX2 FROM UVIS_ORDER_HDR) ON ORDER_ID = ORDER_ID3 AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX2

INNER JOIN (SELECT EMP_ID, SECTION_ID AS REQUESTING_SECTION_ID, SERVICE_ID AS REQUESTING_SERVICE_ID FROM UVIS_EMPLOYEE) ON EMP_ID = REQUESTING_DVM_ID

INNER JOIN (SELECT serv.SERVICE_NAME AS admitting_service, sect.SECTION_NAME AS admitting_section, serv.SERVICE_ID, sect.SECTION_ID FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect WHERE serv.SERVICE_ID = sect.SERVICE_ID) ON ADMITTING_SERVICE_ID = SERVICE_ID AND ADMITTING_SECTION_ID = SECTION_ID

INNER JOIN (SELECT serv.SERVICE_NAME AS requesting_service, sect.SECTION_NAME AS requesting_section, serv.SERVICE_ID AS SERVICE_ID2, sect.SECTION_ID AS SECTION_ID2 FROM UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS sect WHERE serv.SERVICE_ID = sect.SERVICE_ID) ON REQUESTING_SERVICE_ID = SERVICE_ID2 AND REQUESTING_SECTION_ID = SECTION_ID2 ORDER BY ORDER_ID;
