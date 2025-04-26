prompt --application/shared_components/user_interface/lovs/dept_dname
begin
--   Manifest
--     DEPT.DNAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(10742182293259688219)
,p_lov_name=>'DEPT.DNAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'EBA_DEMO_CARD_DEPT'
,p_return_column_name=>'DEPTNO'
,p_display_column_name=>'DNAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1089080073
);
wwv_flow_imp.component_end;
end;
/
