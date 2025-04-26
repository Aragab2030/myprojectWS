prompt --application/shared_components/navigation/lists/home
begin
--   Manifest
--     LIST: Home
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
 p_id=>wwv_flow_imp.id(6160958219980814425)
,p_name=>'Home'
,p_list_status=>'PUBLIC'
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160958472610814426)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Basics'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_text_01=>'Learn how to create color coded cards, a Cards region with a Faceted Search, and several other Cards regions using various styles'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160958795846814426)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Images and Media'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_list_text_01=>'Learn how to display images and embedded videos in Cards regions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160959198826814426)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Card Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_text_01=>'Learn how to make an each card link to a given URL or how to define different elements on each card that link to different URLs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160959592891814427)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Advanced'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ellipsis-h'
,p_list_text_01=>'Learn how to create a Cards region of charts, define a Cards region''s No Data Found message, and use template directives to dynamically display information'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
