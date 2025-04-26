prompt --application/shared_components/web_sources/apex_youtube_videos
begin
--   Manifest
--     WEB SOURCE: APEX Youtube Videos
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
 p_id=>wwv_flow_imp.id(6059998927428808789)
,p_name=>'APEX Youtube Videos'
,p_static_id=>'APEX_Youtube_Videos'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(6059995988092808764)
,p_remote_server_id=>wwv_flow_imp.id(1352489740377360882)
,p_url_path_prefix=>'videos'
,p_credential_id=>wwv_flow_imp.id(4423148159790789797)
,p_pass_ecid=>true
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(6059999525980808799)
,p_web_src_module_id=>wwv_flow_imp.id(6059998927428808789)
,p_name=>'id'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'77snU7P3ykA'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(6059999950139808803)
,p_web_src_module_id=>wwv_flow_imp.id(6059998927428808789)
,p_name=>'part'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'contentDetails'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(6059999118883808792)
,p_web_src_module_id=>wwv_flow_imp.id(6059998927428808789)
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
