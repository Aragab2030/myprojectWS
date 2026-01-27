prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8173696361581166)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>38929822458771
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8473360155580802)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8476531495573671)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'OIC Integration'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_list_item_icon=>'fa-anchor'
,p_parent_list_item_id=>wwv_flow_imp.id(8473360155580802)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8478158221569522)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'ODA'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-robot'
,p_parent_list_item_id=>wwv_flow_imp.id(8473360155580802)
,p_security_scheme=>'!'||wwv_flow_imp.id(8466400793580829)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8479426493561266)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'OAC Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-tachometer'
,p_parent_list_item_id=>wwv_flow_imp.id(8473360155580802)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp.component_end;
end;
/
