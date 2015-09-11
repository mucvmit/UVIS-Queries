--Finds all orders where the client is facult/staff over a given time frame.
SELECT patient.patient_id, patient.patient_name, client.client_id, client.first_name, client.last_name, type.client_type, ep.hospitalization_datetime, ep.discharge_datetime, ep.episode_id, dtl.order_id_suffix, dtl.product_line_id, dtl.product_seq_id, prod.short_description, dtl.order_item_datetime

FROM UVIS_PATIENT patient, UVIS_CLIENT client, UVIS_ORDER_DTL dtl, UVIS_ORDER_HDR hdr, UVIS_CLIENT_TYPE_M type, UVIS_MR_EPISODE ep, UVIS_PRODUCT prod

WHERE dtl.order_datetime BETWEEN '1-JUL-14' AND '30-JUN-15' AND dtl.order_id = hdr.order_id AND hdr.client_id = client.client_id AND hdr.patient_id = patient.patient_id 

AND dtl.order_item_status = 'FN' AND client.client_type_id = '4' AND client.client_type_id = type.client_type_id AND hdr.order_id = ep.episode_id AND dtl.product_line_id = prod.product_line_id AND dtl.product_seq_id = prod.product_seq_id AND hdr.ORDER_ID_SUFFIX = dtl.ORDER_ID_SUFFIX;