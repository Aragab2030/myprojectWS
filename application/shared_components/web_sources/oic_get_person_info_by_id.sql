prompt --application/shared_components/web_sources/oic_get_person_info_by_id
begin
--   Manifest
--     WEB SOURCE: OIC Get Person Info by ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(9675853530552052)
,p_name=>'OIC Get Person Info by ID'
,p_static_id=>'oic_get_person_info_by_id'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(9670849050552054)
,p_remote_server_id=>wwv_flow_imp.id(9664822597580242)
,p_url_path_prefix=>'integration/v1/flows/rest/DEMO_SELECT_RECORDS_ATP/1.0/select'
,p_credential_id=>wwv_flow_imp.id(9670581204552056)
,p_version_scn=>38929777086068
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(9676491078552051)
,p_web_src_module_id=>wwv_flow_imp.id(9675853530552052)
,p_name=>'PRS_ID'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'NUMBER'
,p_is_required=>false
,p_value=>'1'
,p_is_query_param=>true
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(9676059289552051)
,p_web_src_module_id=>wwv_flow_imp.id(9675853530552052)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp.component_end;
end;
/
