prompt --workspace/credentials/credentials_for_oic_get_person_info_by_id
begin
--   Manifest
--     CREDENTIAL: Credentials for OIC Get Person Info by ID
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(9670581204552056)
,p_name=>'Credentials for OIC Get Person Info by ID'
,p_static_id=>'credentials_for_oic_get_person_info_by_id'
,p_authentication_type=>'BASIC'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://oicconnectm-axpnesiqlw1a-je.integration.me-jeddah-1.ocp.oraclecloud.com/ic/api/',
''))
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
