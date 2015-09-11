--Compares the module access for two different roles- the two that are compared currently are 'HO_FACULTY and HO_SECTION_CHIEF'.
SELECT x.ROLE, x.MODULE, x.VIEW_ONLY_YN, module.DESCRIPTION FROM UVIS_ROLE_MODULE_X x, UVIS_MODULE_M module WHERE (ROLE = 'HO_FACULTY' OR ROLE = 'HO_SECTION_CHIEF') AND x.MODULE = module.MODULE;

--Compares the module privilege access for two different roles- the two that are compared currently are 'HO_FACULTY and HO_SECTION_CHIEF'.
SELECT x.ROLE, x.MODULE, module.DESCRIPTION, priv.DESCRIPTION FROM UVIS_ROLE_MODULE_PRIV_X x, UVIS_MODULE_M module, UVIS_MODULE_PRIV priv WHERE (x.ROLE = 'HO_FACULTY' OR x.ROLE = 'HO_SECTION_CHIEF') AND x.MODULE = module.MODULE AND x.MODULE_PRIV = priv.MODULE_PRIV;