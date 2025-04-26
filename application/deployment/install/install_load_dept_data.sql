prompt --application/deployment/install/install_load_dept_data
begin
--   Manifest
--     INSTALL: INSTALL-load dept data
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(9820198026717879205)
,p_install_id=>wwv_flow_imp.id(10742148063054587001)
,p_name=>'load dept data'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (10,''ACCOUNTING'',''NEW YORK'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (20,''RESEARCH'',''DALLAS'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (30,''SALES'',''CHICAGO'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (40,''OPERATIONS'',''BOSTON'');'))
);
wwv_flow_imp.component_end;
end;
/
