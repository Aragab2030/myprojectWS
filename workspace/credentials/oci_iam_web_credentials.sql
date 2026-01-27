prompt --workspace/credentials/oci_iam_web_credentials
begin
--   Manifest
--     CREDENTIAL: OCI IAM Web Credentials
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
 p_id=>wwv_flow_imp.id(8574692539302387)
,p_name=>'OCI IAM Web Credentials'
,p_static_id=>'OCI_IAM_Web_Credentials'
,p_authentication_type=>'BASIC'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
