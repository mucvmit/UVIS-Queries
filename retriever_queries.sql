--Number of Golden retriever orders
SELECT hdr.ORDER_DATETIME, hdr.PATIENT_ID, species.SPECIES, breed.BREED, patient.BIRTHDATE

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '490' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID;

SELECT count(hdr.ORDER_DATETIME), species.SPECIES, breed.BREED

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '490' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID GROUP BY species.SPECIES, breed.BREED;

---Number of labrador retriever orders
SELECT hdr.ORDER_DATETIME, hdr.PATIENT_ID, species.SPECIES, breed.BREED, patient.BIRTHDATE

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '491' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID;

SELECT count(hdr.ORDER_DATETIME), species.SPECIES, breed.BREED

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '491' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID GROUP BY species.SPECIES, breed.BREED;
-- Number of dog orders
SELECT hdr.ORDER_DATETIME, hdr.PATIENT_ID, species.SPECIES, breed.BREED, patient.BIRTHDATE

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID;

SELECT count(hdr.ORDER_DATETIME), species.SPECIES

FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breed

WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breed.SPECIES_ID and patient.BREED_ID = breed.BREED_ID GROUP BY species.SPECIES;

--Patients
SELECT COUNT(PATIENT_ID) FROM (SELECT COUNT(hdr.ORDER_ID), hdr.PATIENT_ID FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '491' GROUP BY hdr.PATIENT_ID);

SELECT COUNT(PATIENT_ID) FROM (SELECT COUNT(hdr.ORDER_ID), hdr.PATIENT_ID FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '490' GROUP BY hdr.PATIENT_ID);

SELECT COUNT(PATIENT_ID) FROM (SELECT COUNT(hdr.ORDER_ID), hdr.PATIENT_ID FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' GROUP BY hdr.PATIENT_ID);

--Patient info
SELECT hdr.PATIENT_ID, species.SPECIES, breeds.BREED, patient.BIRTHDATE FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '490' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID;

SELECT hdr.PATIENT_ID, species.SPECIES, breeds.BREED, patient.BIRTHDATE FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.BREED_ID = '491' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID;

SELECT hdr.PATIENT_ID, species.SPECIES, breeds.BREED, patient.BIRTHDATE FROM UVIS_ORDER_HDR hdr, UVIS_PATIENT patient, UVIS_SPECIES_M species, UVIS_BREEDS_M breeds WHERE hdr.ORDER_DATETIME BETWEEN '1-JAN-90' AND '31-JUL-14' AND hdr.PATIENT_ID = patient.PATIENT_ID AND patient.SPECIES_ID = '6' AND patient.SPECIES_ID = species.SPECIES_ID AND patient.SPECIES_ID = breeds.SPECIES_ID AND patient.BREED_ID = breeds.BREED_ID;