prompt --application/shared_components/web_sources/apex_youtube_play_list_items
begin
--   Manifest
--     WEB SOURCE: APEX YouTube Play List Items
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(10742113305207473634)
,p_name=>'APEX YouTube Play List Items'
,p_static_id=>'APEX_Youtube_PlayList_Items'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(10742104455972473628)
,p_remote_server_id=>wwv_flow_imp.id(1352489740377360882)
,p_url_path_prefix=>'playlistItems'
,p_credential_id=>wwv_flow_imp.id(4423148159790789797)
,p_pass_ecid=>true
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742114303700473635)
,p_web_src_module_id=>wwv_flow_imp.id(10742113305207473634)
,p_name=>'maxResults'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'25'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742114717471473635)
,p_web_src_module_id=>wwv_flow_imp.id(10742113305207473634)
,p_name=>'part'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'snippet,contentDetails'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742115129061473635)
,p_web_src_module_id=>wwv_flow_imp.id(10742113305207473634)
,p_name=>'playlistId'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'PLUo-NIMouZ_vsHnHudl3W0JfeB-3F4J8_'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10742113485486473634)
,p_web_src_module_id=>wwv_flow_imp.id(10742113305207473634)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
,p_caching=>'ALL_USERS'
,p_invalidate_when=>'10080'
);
wwv_flow_imp.component_end;
end;
/
