prompt --application/shared_components/navigation/lists/basics
begin
--   Manifest
--     LIST: Basics
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
 p_id=>wwv_flow_imp.id(6160808450858161535)
,p_name=>'Basics'
,p_list_status=>'PUBLIC'
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160808624124161536)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Color Coded Cards'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-paint-brush'
,p_list_text_01=>'Learn how to color code cards based on a column value'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160809010553161537)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Faceted Search'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-filter'
,p_list_text_01=>'Learn how to combine a Cards region with a Faceted Search'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160809459659161537)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Star Icons'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-star-o'
,p_list_text_01=>'Learn how to use CSS styling to change the default shape of each card''s icon initials'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160809819359161537)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Styles'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cards'
,p_list_text_01=>'Learn how to use the A, B, and C styles of a Cards region display'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
