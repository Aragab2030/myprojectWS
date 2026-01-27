prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(9900462500214944)
);
wwv_flow_imp.component_end;
end;
/
