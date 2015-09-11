--1  Finds patients which have had a 440-400, 440-401, 441-400, 441-401, 721-2200, or 721-2201 product code on one of their bills and returns 
--relevant information about the patient and order, including whether the patient is deceased or not.
SELECT patient.DECEASED_YN, patient.PATIENT_NAME, patient.PATIENT_ID, dtl.ORDER_ID, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, patient.DECEASED_DATE, dtl.ORDER_ITEM_DATETIME, species.SPECIES, breeds.BREED, sex.SEX

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID 

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID AND dtl.ORDER_ITEM_STATUS = 'FN';

--2  Same as 1 except filters to select only patients who deceased within 7 days of order date.
SELECT patient.DECEASED_YN, patient.PATIENT_NAME, patient.PATIENT_ID, dtl.ORDER_ID, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, patient.DECEASED_DATE, dtl.ORDER_ITEM_DATETIME, species.SPECIES, breeds.BREED, sex.SEX

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID 

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID 

AND dtl.ORDER_ITEM_STATUS = 'FN' AND trunc(patient.DECEASED_DATE) BETWEEN trunc(dtl.ORDER_ITEM_DATETIME)-5 AND trunc(dtl.ORDER_ITEM_DATETIME)+2; 

--3 Same as 2 except allows deceased date to be NULL as well.
SELECT patient.DECEASED_YN, patient.PATIENT_NAME, patient.PATIENT_ID, dtl.ORDER_ID, dtl.PRODUCT_LINE_ID, dtl.PRODUCT_SEQ_ID, patient.DECEASED_DATE, dtl.ORDER_ITEM_DATETIME, species.SPECIES, breeds.BREED, sex.SEX

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID 

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID 

AND dtl.ORDER_ITEM_STATUS = 'FN' AND ((trunc(patient.DECEASED_DATE) NOT BETWEEN (trunc(dtl.ORDER_ITEM_DATETIME) - 5) AND (trunc(dtl.ORDER_ITEM_DATETIME) + 2)) OR patient.DECEASED_DATE is NULL); 

--4 Joins 2 with the list of orders with a 900-30 product code on it, ie checking to see if the deceased animals got necropsies.
SELECT deceased, name, patient_id, order_id, deceased_date, order_date, species, breed, sex 

FROM (SELECT patient.DECEASED_YN AS deceased, patient.PATIENT_NAME AS name, patient.PATIENT_ID AS patient_id, dtl.ORDER_ID AS order_id, dtl.PRODUCT_LINE_ID AS line, dtl.PRODUCT_SEQ_ID AS seq, patient.DECEASED_DATE AS deceased_date, dtl.ORDER_ITEM_DATETIME AS order_date, species.SPECIES AS species, breeds.BREED AS breed, sex.SEX AS sex

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID 

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID 

AND dtl.ORDER_ITEM_STATUS = 'FN' AND trunc(patient.DECEASED_DATE) BETWEEN trunc(dtl.ORDER_ITEM_DATETIME)-5 AND trunc(dtl.ORDER_ITEM_DATETIME)+2) INNER JOIN 

(SELECT dtl.ORDER_ID AS order_id1 FROM UVIS_ORDER_DTL dtl WHERE dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND ORDER_ITEM_STATUS = 'FN') ON order_id = order_id1;

--Updated 4 Queries
--Query 4 limited to Dogs
SELECT deceased, name, patient_id, order_id, hosp_date, cpr_date, deceased_date, necropsy_date, species, breed, sex 

FROM (SELECT patient.DECEASED_YN AS deceased, patient.PATIENT_NAME AS name, patient.PATIENT_ID AS patient_id, dtl.ORDER_ID AS order_id, dtl.PRODUCT_LINE_ID AS line, dtl.PRODUCT_SEQ_ID AS seq, ep.HOSPITALIZATION_DATETIME AS hosp_date, patient.DECEASED_DATE AS deceased_date, dtl.ORDER_ITEM_DATETIME AS cpr_date, species.SPECIES AS species, breeds.BREED AS breed, sex.SEX AS sex

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID AND species.SPECIES = 'CANINE'

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID 

AND dtl.ORDER_ITEM_STATUS = 'FN' AND trunc(patient.DECEASED_DATE) BETWEEN trunc(dtl.ORDER_ITEM_DATETIME)-5 AND trunc(dtl.ORDER_ITEM_DATETIME)+2) INNER JOIN 

(SELECT dtl.ORDER_ID AS order_id1, dtl.ORDER_ITEM_DATETIME AS necropsy_date FROM UVIS_ORDER_DTL dtl WHERE dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND ORDER_ITEM_STATUS = 'FN') ON order_id = order_id1;


--Query 4 limited to Cats
SELECT deceased, name, patient_id, order_id, hosp_date, cpr_date, deceased_date, necropsy_date, species, breed, sex 

FROM (SELECT patient.DECEASED_YN AS deceased, patient.PATIENT_NAME AS name, patient.PATIENT_ID AS patient_id, dtl.ORDER_ID AS order_id, dtl.PRODUCT_LINE_ID AS line, dtl.PRODUCT_SEQ_ID AS seq, ep.HOSPITALIZATION_DATETIME AS hosp_date, patient.DECEASED_DATE AS deceased_date, dtl.ORDER_ITEM_DATETIME AS cpr_date, species.SPECIES AS species, breeds.BREED AS breed, sex.SEX AS sex

FROM UVIS_PATIENT patient, UVIS_ORDER_DTL dtl, UVIS_MR_EPISODE ep, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds, UVIS_SEX_M sex

WHERE patient.PATIENT_ID = ep.PATIENT_ID AND ep.EPISODE_ID = dtl.ORDER_ID AND species.SPECIES = 'FELINE'

AND (((dtl.PRODUCT_LINE_ID = '440' OR dtl.PRODUCT_LINE_ID = '441') AND (dtl.PRODUCT_SEQ_ID = '400' OR dtl.PRODUCT_SEQ_ID = '401')) OR (dtl.PRODUCT_LINE_ID = '721' AND (dtl.PRODUCT_SEQ_ID = '2200' OR dtl.PRODUCT_SEQ_ID = '2201')))

AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID AND patient.SEX_ID = sex.SEX_ID 

AND dtl.ORDER_ITEM_STATUS = 'FN' AND trunc(patient.DECEASED_DATE) BETWEEN trunc(dtl.ORDER_ITEM_DATETIME)-5 AND trunc(dtl.ORDER_ITEM_DATETIME)+2) INNER JOIN 

(SELECT dtl.ORDER_ID AS order_id1, dtl.ORDER_ITEM_DATETIME AS necropsy_date FROM UVIS_ORDER_DTL dtl WHERE dtl.PRODUCT_LINE_ID = '900' AND dtl.PRODUCT_SEQ_ID = '30' AND ORDER_ITEM_STATUS = 'FN') ON order_id = order_id1;
