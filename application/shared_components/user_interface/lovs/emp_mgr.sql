prompt --application/shared_components/user_interface/lovs/emp_mgr
begin
--   Manifest
--     EMP.MGR
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
 p_id=>wwv_flow_imp.id(10742182068541684675)
,p_lov_name=>'EMP.MGR'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_return_column_name=>'EMPNO'
,p_display_column_name=>'ENAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ENAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1089080073
);
wwv_flow_imp.component_end;
end;
/
