--Finds all clients who have brought patients in to the Equine Ambulatory section during a given time frame.
SELECT * FROM (SELECT client.CLIENT_ID AS client_id1, client.first_name, client.last_name, client.addr1_ln1, client.addr1_ln2, client.city1, client.state1, client.zip1 FROM UVIS_CLIENT client WHERE client.last_name NOT LIKE '%DO NOT USE%')
INNER JOIN
(SELECT DISTINCT client_id AS client_id2 FROM UVIS_ORDER_HDR hdr WHERE hdr.ADMITTING_SERVICE_ID = '99' AND hdr.ADMITTING_SECTION_ID = '984' AND hdr.ORDER_DATETIME BETWEEN '1-SEP-11' AND sysdate AND hdr.order_id_suffix = '1') ON client_id1 = client_id2;

--Finds the most recent order from clients found in the above query.
SELECT client.first_name, client.last_name, hdr.order_id, hdr.order_datetime, client.addr1_ln1, client.addr1_ln2, client.city1, client.state1, client.zip1 FROM UVIS_CLIENT client, UVIS_ORDER_HDR hdr WHERE client.CLIENT_ID = hdr.CLIENT_ID AND hdr.ADMITTING_SERVICE_ID = '99' AND hdr.ADMITTING_SECTION_ID = '984' AND hdr.ORDER_DATETIME BETWEEN '1-SEP-11' AND sysdate AND hdr.order_id_suffix = '1' AND hdr.ORDER_DATETIME = (SELECT MAX(order_datetime) from UVIS_ORDER_HDR WHERE order_id = hdr.order_id) ORDER BY hdr.order_id;
