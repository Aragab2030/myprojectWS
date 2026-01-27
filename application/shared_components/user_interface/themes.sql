prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(8440072051580868)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(8439885523580872)
,p_default_page_template=>wwv_flow_imp.id(8199701962581135)
,p_default_dialog_template=>wwv_flow_imp.id(8203104160581133)
,p_error_template=>wwv_flow_imp.id(8189739833581141)
,p_printer_friendly_template=>wwv_flow_imp.id(8199701962581135)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(8189739833581141)
,p_default_button_template=>wwv_flow_imp.id(8350030779581047)
,p_default_region_template=>wwv_flow_imp.id(8276421577581092)
,p_default_chart_template=>wwv_flow_imp.id(8276421577581092)
,p_default_form_template=>wwv_flow_imp.id(8276421577581092)
,p_default_reportr_template=>wwv_flow_imp.id(8276421577581092)
,p_default_tabform_template=>wwv_flow_imp.id(8276421577581092)
,p_default_wizard_template=>wwv_flow_imp.id(8276421577581092)
,p_default_menur_template=>wwv_flow_imp.id(8288800677581086)
,p_default_listr_template=>wwv_flow_imp.id(8276421577581092)
,p_default_irr_template=>wwv_flow_imp.id(8266698994581096)
,p_default_report_template=>wwv_flow_imp.id(8310883062581073)
,p_default_label_template=>wwv_flow_imp.id(8347576426581051)
,p_default_menu_template=>wwv_flow_imp.id(8351645262581046)
,p_default_calendar_template=>wwv_flow_imp.id(8351787114581045)
,p_default_list_template=>wwv_flow_imp.id(8337444590581058)
,p_default_nav_list_template=>wwv_flow_imp.id(8346220622581053)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(8346220622581053)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(8344471674581054)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(8232783803581113)
,p_default_dialogr_template=>wwv_flow_imp.id(8209809387581126)
,p_default_option_label=>wwv_flow_imp.id(8347576426581051)
,p_default_required_label=>wwv_flow_imp.id(8348818401581050)
,p_default_navbar_list_template=>wwv_flow_imp.id(8344055688581054)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/24.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
