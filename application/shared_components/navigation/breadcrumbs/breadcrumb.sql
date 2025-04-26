prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(11333626549511581887)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160801965953070628)
,p_short_name=>'Advanced'
,p_link=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160812356303169066)
,p_short_name=>'Basics'
,p_link=>'f?p=&APP_ID.:20:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Images and Media'
,p_link=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160834672286074569)
,p_short_name=>'Card Actions'
,p_link=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160838479811106478)
,p_parent_id=>wwv_flow_imp.id(6160812356303169066)
,p_short_name=>'Color Coded Cards'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160839149918114514)
,p_parent_id=>wwv_flow_imp.id(6160812356303169066)
,p_short_name=>'Faceted Search'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160839942615121454)
,p_parent_id=>wwv_flow_imp.id(6160812356303169066)
,p_short_name=>'Star Icons'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160840655726128492)
,p_parent_id=>wwv_flow_imp.id(6160812356303169066)
,p_short_name=>'Styles'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160843145353162167)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'BLOB Column as URL'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160844066803168720)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Image URL'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160845419810182550)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Embedded Video'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160847265849202006)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Background Image'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160848160670210170)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Application Static Files'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160896344451981597)
,p_parent_id=>wwv_flow_imp.id(6160834672286074569)
,p_short_name=>'Conditional Actions'
,p_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160897678048007776)
,p_parent_id=>wwv_flow_imp.id(6160834672286074569)
,p_short_name=>'Full Card Action'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160902892962025400)
,p_parent_id=>wwv_flow_imp.id(6160801965953070628)
,p_short_name=>'Charts'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160904269837035555)
,p_parent_id=>wwv_flow_imp.id(6160801965953070628)
,p_short_name=>'No Data Found'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6160904894096042005)
,p_parent_id=>wwv_flow_imp.id(6160801965953070628)
,p_short_name=>'Template Directives'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6161280834299259591)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'Video Images with Durations'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11333626733995581887)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11333780388661582138)
,p_parent_id=>wwv_flow_imp.id(6160828162527978958)
,p_short_name=>'BLOB Column'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp.component_end;
end;
/
