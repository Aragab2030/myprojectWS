prompt --application/shared_components/web_sources/apex_youtube_playlists
begin
--   Manifest
--     WEB SOURCE: APEX YouTube Playlists
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
 p_id=>wwv_flow_imp.id(10742102248889473610)
,p_name=>'APEX YouTube Playlists'
,p_static_id=>'APEX_Youtube_Playlists'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(10742093932804473589)
,p_remote_server_id=>wwv_flow_imp.id(1352489740377360882)
,p_url_path_prefix=>'/playlists'
,p_credential_id=>wwv_flow_imp.id(4423148159790789797)
,p_pass_ecid=>true
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742102846511473623)
,p_web_src_module_id=>wwv_flow_imp.id(10742102248889473610)
,p_name=>'channelId'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'UCEpIXFjcQIztReQNLymvYrQ'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742103597819473627)
,p_web_src_module_id=>wwv_flow_imp.id(10742102248889473610)
,p_name=>'maxResults'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'25'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(10742104014015473627)
,p_web_src_module_id=>wwv_flow_imp.id(10742102248889473610)
,p_name=>'part'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'snippet,contentDetails,player'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(10742102476863473618)
,p_web_src_module_id=>wwv_flow_imp.id(10742102248889473610)
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
