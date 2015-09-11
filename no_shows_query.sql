--This query attempts to find 'no show' appointments- ie appointments where the client did not show up.
--To do so it shows all appointments where the appointment never got flagged as 'Admitted' in the appointment detail table.
--However, that doesn't always necessarily mean that it was a no show, because some sections don't strictly adhere to that apparently.
--As a result the query also shows an 'ORDER DATE' column.  If this column if filled in it means that appointment isn't really a no show,
--because there is an order for that client/patient combo for that day.
--If that column is empty it means that appointment was by all indications a no show.
SELECT APPT_ID, APPT_SEQ, ROLE_NAME, ORDER_ID, CLIENT_ID, PATIENT_ID, APPT_DATE, ORDER_DATE FROM 

(SELECT APPT_ID, APPT_SEQ, ROLE_NAME, CLIENT_ID, PATIENT_ID, TRUNC(APPT_TIME) AS APPT_DATE FROM UVIS_APPT_DTL WHERE ADMITTED_YN = 'N' AND CLIENT_ID is NOT NULL)

LEFT JOIN (SELECT hdr.ORDER_ID, hdr.CLIENT_ID AS CLIENT_ID2, hdr.PATIENT_ID AS PATIENT_ID2, TRUNC(hdr.ORDER_DATETIME) AS ORDER_DATE FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient WHERE hdr.PATIENT_ID = patient.PATIENT_ID AND patient.ACTIVE_YN = 'Y' AND (patient.SPECIES_ID = '6' OR patient.SPECIES_ID = '7')) ON ORDER_DATE = APPT_DATE AND PATIENT_ID = PATIENT_ID2 AND CLIENT_ID = CLIENT_ID2 ORDER BY APPT_DATE DESC;