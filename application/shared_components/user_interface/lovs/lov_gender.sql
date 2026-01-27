prompt --application/shared_components/user_interface/lovs/lov_gender
begin
--   Manifest
--     LOV GENDER
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
 p_id=>wwv_flow_imp.id(9933473130663607)
,p_lov_name=>'LOV GENDER'
,p_lov_query=>'.'||wwv_flow_imp.id(9933473130663607)||'.'
,p_location=>'STATIC'
,p_version_scn=>38929823340200
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9933742912663603)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Male'
,p_lov_return_value=>'M'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(9934197953663602)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Female'
,p_lov_return_value=>'F'
);
wwv_flow_imp.component_end;
end;
/
