--Generates a list of all products requested during a given time frame which have 'Radiology' listed as their request area.
SELECT DISTINCT prod.PRODUCT_LINE_ID, prod.PRODUCT_SEQ_ID, prod.LONG_DESCRIPTION 

FROM UVIS_PRODUCT prod, UVIS_MR_REQUEST req, UVIS_MR_REQUEST_ITEMS items 

WHERE items.PRODUCT_LINE_ID = prod.PRODUCT_LINE_ID AND items.PRODUCT_SEQ_ID = prod.PRODUCT_SEQ_ID AND req.REQUEST_ID = items.REQUEST_ID AND req.ENTERED_DATE_TIME BETWEEN '1-FEB-15' AND '1-AUG-15' AND req.AREA_ID = '3';