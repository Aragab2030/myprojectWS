prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8466729730580828)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
