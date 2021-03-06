--Generates a list of all canine or feline orders which are currently open and have an order type of either 'INPATIENT' or 'OUTPATIENT'. 
--Also shows any deposits made on such orders, how much the deposits were made for, and any estimates given for such orders.
select ORDER_ID, ORDER_ID_SUFFIX, ORDER_DATETIME, ORDER_STATUS, ORDER_TYPE, DISCHARGED_YN, DISCHARGE_DATE, PATIENT_ID, PATIENT_NAME, SPECIES, ADMIT_SECTION, ATTEND_SECTION, DEPOSIT_AMOUNT, LO_AMT, HI_AMT FROM 

(SELECT h.ORDER_ID, h.ORDER_ID_SUFFIX, h.ORDER_DATETIME, h.ORDER_STATUS, h.ORDER_TYPE, h.DISCHARGED_YN, h.DISCHARGE_DATE, h.PATIENT_ID, p.PATIENT_NAME, s.SPECIES,
       sec.SECTION_NAME as ADMIT_SECTION, sec2.section_name as ATTEND_SECTION
from UVIS_ORDER_HDR h, uvis_patient p, UVIS_SPECIES_M s, UVIS_SERVICE_AREA_SECTIONS sec, UVIS_SERVICE_AREA_SECTIONS sec2
where h.ORDER_STATUS = 'OPEN'
and (h.ORDER_TYPE = 'INPATIENT' or h.order_type = 'OUTPATIENT')
and h.PATIENT_ID = p.PATIENT_ID
and p.SPECIES_ID = s.SPECIES_ID
and (s.SPECIES = 'CANINE' or s.SPECIES = 'FELINE')
and (h.ADMITTING_SERVICE_ID = sec.SERVICE_ID and h.ADMITTING_SECTION_ID = sec.SECTION_ID)
and (h.ATTENDING_SERVICE_ID = sec2.SERVICE_ID and h.ATTENDING_SECTION_ID = sec2.SECTION_ID))

LEFT JOIN (SELECT ORDER_ID AS ORDER_ID2, ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX2, INVOICE_TRANS_TYPE, TRANS_AMOUNT AS DEPOSIT_AMOUNT FROM UVIS_INVOICE  WHERE INVOICE_TRANS_TYPE = 'DEPOSIT') ON ORDER_ID = ORDER_ID2 AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX2
LEFT JOIN (SELECT ORDER_ID AS ORDER_ID3, ORDER_ID_SUFFIX AS ORDER_ID_SUFFIX3, LO_AMT, HI_AMT FROM UVIS_ESTIMATE_HDR) ON ORDER_ID = ORDER_ID3 AND ORDER_ID_SUFFIX = ORDER_ID_SUFFIX3;
