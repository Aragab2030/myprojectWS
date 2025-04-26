prompt --application/create_application
begin
--   Manifest
--     FLOW: 112
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'ORACLE')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Sample Cards')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SAMPLE-CARDS')
,p_application_group=>wwv_flow_imp.id(1268170835711543)
,p_application_group_name=>'Sample Apps'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'96B41F545B0BFBFD24D94728B21AA084727E5AF81068F10BD0F3883560FFE2B6'
,p_checksum_salt_last_reset=>'19990804000000'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2020.08.14.'
,p_authentication_id=>wwv_flow_imp.id(11333626210504581886)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Sample Cards'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'24.1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'S'
,p_deep_linking=>'Y'
,p_pass_ecid=>'N'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_tokenize_row_search=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Sample Cards'
,p_substitution_string_02=>'JET_VISUALIZATION_URL'
,p_substitution_value_02=>'https://www.oracle.com/webfolder/technetwork/jet/jetCookbook.html?component=home&demo=rootVisualizations'
,p_substitution_string_03=>'MOVIEDB_API'
,p_substitution_value_03=>'https://www.themoviedb.org/documentation/api'
,p_substitution_string_04=>'GOOGLE_API'
,p_substitution_value_04=>'https://developers.google.com/youtube/v3/docs'
,p_substitution_string_05=>'PRODUCT_NAME'
,p_substitution_value_05=>'Oracle APEX'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>41
,p_version_scn=>491007752
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
,p_copyright_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Name: #APP_NAME#',
'Copyright (c) 2012, #YEAR# Oracle and/or its affiliates.',
'Licensed under the Universal Permissive License v 1.0',
'as shown at https://oss.oracle.com/licenses/upl/'))
);
wwv_flow_imp.component_end;
end;
/
