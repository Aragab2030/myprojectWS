prompt --application/shared_components/security/authentications/oci_iam_authentication_scheme
begin
--   Manifest
--     AUTHENTICATION: OCI IAM Authentication Scheme
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(8575124164152661)
,p_name=>'OCI IAM Authentication Scheme'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(8574692539302387)
,p_attribute_02=>'OPENID_CONNECT'
,p_attribute_03=>'https://idcs-cb5aa99a0f5e460e9d29112551fa4757.identity.oraclecloud.com:443/.well-known/openid-configuration'
,p_attribute_07=>'profile,groups'
,p_attribute_09=>'sub'
,p_attribute_10=>'groups'
,p_attribute_11=>'N'
,p_attribute_13=>'Y'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure load_dynamic_groups as',
'  l_group_names apex_t_varchar2;',
'begin',
'  --',
'  -- add all group names to l_group_names',
'  --',
'  for i in 1 .. apex_json.get_count(''groups'') loop',
'      apex_string.push (',
'        p_table => l_group_names,',
'        p_value => apex_json.get_varchar2 (',
'                       p_path => ''groups[%d].name'',',
'                       p0     => i ));',
'  end loop;',
'  --',
'  -- save group names in session',
'  --',
'  apex_authorization.enable_dynamic_groups (',
'      p_group_names => l_group_names );',
'end;'))
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'https://tbf42z2exqcy6bz-mandevdb.adb.me-jeddah-1.oraclecloudapps.com/ords/f?p=101'
,p_post_auth_process=>'load_dynamic_groups'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>38929465570457
);
wwv_flow_imp.component_end;
end;
/
