--Finds a list of roles, modules each role has access to, and any special module privileges that each role has access to.  Works for both hospital and lab.
SELECT ROLE, ROLE_DESC, MODULE, MODULE_DESC, VIEW_ONLY_YN, MODULE_PRIV, PRIV_DESC FROM

(SELECT ROLE, DESCRIPTION AS ROLE_DESC FROM UVIS_ROLE_M)

LEFT JOIN (SELECT ROLE AS ROLE1, MODULE, VIEW_ONLY_YN FROM UVIS_ROLE_MODULE_X) ON ROLE = ROLE1

LEFT JOIN (SELECT ROLE AS ROLE2, MODULE AS MODULE1, MODULE_PRIV FROM UVIS_ROLE_MODULE_PRIV_X) ON ROLE = ROLE2 AND MODULE = MODULE1

LEFT JOIN (SELECT DESCRIPTION AS PRIV_DESC, MODULE AS MODULE2, MODULE_PRIV AS MODULE_PRIV1 FROM UVIS_MODULE_PRIV) ON MODULE= MODULE2 AND MODULE_PRIV = MODULE_PRIV1

LEFT JOIN (SELECT MODULE AS MODULE3, DESCRIPTION AS MODULE_DESC FROM UVIS_MODULE_M) ON MODULE = MODULE3 ORDER BY ROLE;



--Finds users and lists their username, employee status, role, and what modules/privileges they have access to.  Also works on both lab and hospital side.
select LAST_NAME, FIRST_NAME, USERNAME, EMP_STATUS, ROLE, MODULE, MODULE_DESC, MODULE_PRIV, PRIV_DESC from 

(SELECT emp.LAST_NAME, emp.FIRST_NAME, emp.USERNAME, emp.EMP_STATUS, sys.ROLE FROM UVIS_EMPLOYEE emp, UVIS_SYSTEM_USER_M sys WHERE emp.EMP_STATUS <> 'INACTIVE' AND emp.USERNAME = sys.USERNAME)
 
LEFT JOIN (SELECT USERNAME AS USERNAME2, MODULE, MODULE_PRIV FROM UVIS_MODULE_PRIV_USER_X) ON USERNAME = USERNAME2
 
LEFT JOIN (SELECT DESCRIPTION AS PRIV_DESC, MODULE AS MODULE2, MODULE_PRIV AS MODULE_PRIV1 FROM UVIS_MODULE_PRIV) ON MODULE= MODULE2 AND MODULE_PRIV = MODULE_PRIV1

LEFT JOIN (SELECT MODULE AS MODULE3, DESCRIPTION AS MODULE_DESC FROM UVIS_MODULE_M) ON MODULE = MODULE3 order by 3 asc;