--Counts the number of orders with Oncology as the Attending Section over a given time frame.
SELECT COUNT(hdr.ORDER_ID) AS CASE_LOAD FROM UVIS_ORDER_HDR hdr WHERE hdr.ATTENDING_SECTION_ID = '1019' AND hdr.ORDER_DATETIME BETWEEN '1-JUL-14' AND '1-JUL-15';
--Sums together the order totals from all Oncology orders over a given time frame.
SELECT SUM(ITEM_TOTAL_AMT) FROM UVIS_ORDER_DTL dtl, UVIS_ORDER_HDR hdr WHERE dtl.ORDER_ID_SUFFIX = hdr.ORDER_ID_SUFFIX AND dtl.ORDER_ITEM_STATUS = 'FN' AND dtl.ORDER_ID = hdr.ORDER_ID AND hdr.ATTENDING_SECTION_ID = '1019' AND hdr.ORDER_DATETIME BETWEEN '1-JUL-11' AND '1-JUL-12';
