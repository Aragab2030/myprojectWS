prompt --application/shared_components/user_interface/lovs/lov_nationality
begin
--   Manifest
--     LOV NATIONALITY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9934453478656903)
,p_lov_name=>'LOV NATIONALITY'
,p_lov_query=>'.'||wwv_flow_imp.id(9934453478656903)||'.'
,p_location=>'STATIC'
,p_version_scn=>38929823372145
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9934751144656903)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Qatar'
,p_lov_return_value=>'QA'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9935103947656903)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Egypt'
,p_lov_return_value=>'EG'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9935592579656903)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'India'
,p_lov_return_value=>'IN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9935925576656903)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Jordan'
,p_lov_return_value=>'JO'
);
wwv_flow_imp.component_end;
end;
/
