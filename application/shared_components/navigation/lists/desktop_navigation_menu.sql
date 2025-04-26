prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
--   Manifest
--     LIST: Desktop Navigation Menu
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
 p_id=>wwv_flow_imp.id(11333626991482581890)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>1089080073
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11333776848811582123)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_icon_attributes=>'title="#LIST_LABEL#"'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10741549490107258119)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Basics'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,12,13,18,20'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6137775871349258746)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Color Coded Cards'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-paint-brush'
,p_parent_list_item_id=>wwv_flow_imp.id(10741549490107258119)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'18'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9816606431301541541)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Faceted Search'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-filter'
,p_parent_list_item_id=>wwv_flow_imp.id(10741549490107258119)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6137768159083151349)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Star Icons'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-star-o'
,p_parent_list_item_id=>wwv_flow_imp.id(10741549490107258119)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6137771221813166827)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Styles'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cards'
,p_parent_list_item_id=>wwv_flow_imp.id(10741549490107258119)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Images and Media'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6056299505791525023)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Application Static Files'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11339592902501311738)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Background Image'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-film'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11333778357447582127)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'BLOB Column'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-image'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6060153452535757793)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'BLOB Column as URL'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-image-o'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742115763129482931)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Embedded Video'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-video-camera'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6,10'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11336982317534490131)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Image URL'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-camera'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6161283638392278964)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Video Images with Durations'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-play'
,p_parent_list_item_id=>wwv_flow_imp.id(10742077044098322286)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742180060953670607)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Card Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13,15,16,22'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742184277793708824)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Conditional Actions'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-workflow'
,p_parent_list_item_id=>wwv_flow_imp.id(10742180060953670607)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'16'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742183648086702743)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Full Card Action'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-check'
,p_parent_list_item_id=>wwv_flow_imp.id(10742180060953670607)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742149530440606624)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'REST Data Sources'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-download'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6160801013569070619)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Advanced'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ellipsis-h'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9818082567081713904)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Charts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dial-gauge-chart'
,p_parent_list_item_id=>wwv_flow_imp.id(6160801013569070619)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10742188634467729631)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'No Data Found'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-emoji-worry'
,p_parent_list_item_id=>wwv_flow_imp.id(6160801013569070619)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6058604173119148784)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Template Directives'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-brackets'
,p_parent_list_item_id=>wwv_flow_imp.id(6160801013569070619)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
