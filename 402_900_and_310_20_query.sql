--Finds orders from a given timeframe which do not contain a 402-900 or 310-20 product code on them.
SELECT * FROM (SELECT patient.client_id, hdr.client_id AS client_id1, patient.patient_name, patient.patient_id, hdr.order_id AS ORDER_ID, hdr.order_datetime, ep.hospitalization_datetime, hdr.discharge_date, service.service_name, trunc(hdr.discharge_date) - trunc(ep.hospitalization_datetime) DAYS 

FROM uvis_patient patient, uvis_order_hdr hdr, uvis_mr_episode ep, uvis_service_area_m service

WHERE hdr.order_datetime between '1-JUL-13' AND '30-JUN-14' AND patient.patient_id = hdr.patient_id AND hdr.order_id = ep.episode_id AND service.service_id = hdr.attending_service_id AND hdr.ORDER_ID_SUFFIX = '1')

LEFT OUTER JOIN (SELECT dtl.ORDER_ID AS order_id1 FROM UVIS_ORDER_DTL dtl WHERE dtl.order_datetime between '1-JUL-13' AND '30-JUN-14' AND ((dtl.product_line_id = '402' AND dtl.product_seq_id = '900') OR (dtl.product_line_id = '310' AND dtl.product_seq_id = '20')))

ON ORDER_ID = order_id1 WHERE order_id1 is NULL AND client_id = client_id1;

--Same as above except excludes client id 86804 and any orders with the order types 'LATE CHARGE', 'PHARMACY', or 'NON-ACCESSION'

SELECT * FROM (SELECT patient.client_id, hdr.client_id AS client_id1, patient.patient_name, patient.patient_id, hdr.order_id AS ORDER_ID, hdr.ORDER_TYPE, hdr.order_datetime, ep.hospitalization_datetime, hdr.discharge_date, service.service_name, trunc(hdr.discharge_date) - trunc(ep.hospitalization_datetime) DAYS 

FROM uvis_patient patient, uvis_order_hdr hdr, uvis_mr_episode ep, uvis_service_area_m service

WHERE hdr.order_datetime between '1-JAN-13' AND '31-DEC-13' AND patient.patient_id = hdr.patient_id AND hdr.order_id = ep.episode_id AND service.service_id = hdr.attending_service_id AND hdr.ORDER_ID_SUFFIX = '1' AND patient.CLIENT_ID != '86804' AND hdr.ORDER_TYPE != 'LATE CHARGE' AND hdr.ORDER_TYPE != 'PHARMACY' AND hdr.ORDER_TYPE != 'NON-ACCESSION')

LEFT OUTER JOIN (SELECT dtl.ORDER_ID AS order_id1 FROM UVIS_ORDER_DTL dtl WHERE dtl.order_datetime between '1-JAN-13' AND '31-DEC-13' AND ((dtl.product_line_id = '402' AND dtl.product_seq_id = '900') OR (dtl.product_line_id = '310' AND dtl.product_seq_id = '20')))

ON ORDER_ID = order_id1 WHERE order_id1 is NULL AND client_id = client_id1;