prompt --application/shared_components/navigation/lists/images_and_media
begin
--   Manifest
--     LIST: Images and Media
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
 p_id=>wwv_flow_imp.id(6160823574195955649)
,p_name=>'Images and Media'
,p_list_status=>'PUBLIC'
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160823737314955649)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Application Static Files'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_list_text_01=>'Learn how to reference application static files as Cards images'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160824167150955650)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Background Image'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-film'
,p_list_text_01=>'Learn how to display movie posters as a Cards region''s media background and as it''s icon (for overlay effects)'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160824502934955650)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'BLOB Column'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_list_text_01=>'Learn how to display images in Cards regions that are sourced from a BLOB column'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160824908067955650)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'BLOB Column as URL'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_list_text_01=>'Learn how to display images in Cards regions that are sourced from a BLOB column as a URL'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160825338866955650)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Embedded Video'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-video-camera'
,p_list_text_01=>'Learn how to use the Cards region''s Media Advanced Formatting option to add an HTML <code>&lt;iframe&gt;</code> tag that embeds a video player inline in each card'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160825853679958585)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Image URL'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-camera'
,p_list_text_01=>'Learn how to use Cards regions to display a photo gallery'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6161281326312272744)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Video Images with Durations'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-play'
,p_list_text_01=>'Learn how to display cards that link to YouTube videos and display a background image along with a video duration overlay'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
