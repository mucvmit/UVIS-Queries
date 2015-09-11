--Finds patients which have been diagnosed with prostate and gotten necropsies ordered.
SELECT * FROM (SELECT ep.patient_id, patient.patient_name, ep.hospitalization_datetime AS diagnosis_date, ep.episode_id AS diagnosis_episode_id FROM UVIS_MR_DIAGNOSIS diag, UVIS_MR_EPISODE ep, UVIS_PATIENT patient WHERE diag.episode_id = ep.episode_id AND ep.patient_id = patient.patient_id AND (diagnosis_id = '2604' OR diagnosis_id = '2603' OR diagnosis_id = '61')) 

INNER JOIN (SELECT DISTINCT hdr.patient_id AS patient_id_hdr, dtl.order_item_datetime AS necropsy_date, hdr.order_id AS necropsy_order_id FROM uvis_order_dtl dtl, uvis_order_hdr hdr WHERE dtl.product_line_id = '900' AND dtl.product_seq_id = '30' AND dtl.order_item_status = 'FN' AND dtl.order_id = hdr.order_id)

ON patient_id = patient_id_hdr;