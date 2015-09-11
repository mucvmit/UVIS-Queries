--Finds instructions which are specific to a service/section.
SELECT inst.DESCRIPTION, inst.INSTRUCTIONS, serv.SERVICE_NAME, section.SECTION_NAME

FROM UVIS_MR_INST_ADDTL_INST_X x, UVIS_MR_INSTRUCTION_M inst, UVIS_SERVICE_AREA_M serv, UVIS_SERVICE_AREA_SECTIONS section

WHERE inst.INSTRUCTION_ID = x.INSTRUCTION_ID AND x.SERVICE_ID = serv.SERVICE_ID AND x.SECTION_ID = section.SECTION_ID AND x.SERVICE_ID = section.SERVICE_ID;

--Finds all instructions which are not specific to a service/section
SELECT inst.DESCRIPTION, inst.INSTRUCTIONS

FROM UVIS_MR_INSTRUCTION_M inst

WHERE inst.ADDTL_INST_YN = 'N';