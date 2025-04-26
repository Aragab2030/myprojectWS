prompt --application/shared_components/navigation/lists/advanced
begin
--   Manifest
--     LIST: Advanced
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(6160792463658041659)
,p_name=>'Advanced'
,p_list_status=>'PUBLIC'
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160792663909041664)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dial-gauge-chart'
,p_list_text_01=>'Learn how to display charts inside cards using Oracle JET Data Visualizations'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160793039945041667)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'No Data Found'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-emoji-worry'
,p_list_text_01=>'Learn how to define No Data Found messages for Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160793410434041668)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Template Directives'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-brackets'
,p_list_text_01=>'Learn how to define template directives for Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
