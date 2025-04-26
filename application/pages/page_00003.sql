prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.3'
,p_default_workspace_id=>20
,p_default_application_id=>7920
,p_default_id_offset=>8529837867671528
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Basic Cards'
,p_alias=>'BASIC-CARDS'
,p_step_title=>'&APP_NAME. - Styles Ahmed'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6093866770699966902)
,p_plug_name=>'Style B'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>true
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6093866873485966903)
,p_region_id=>wwv_flow_imp.id(6093866770699966902)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_position=>'TOP'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6093866932725966904)
,p_plug_name=>'Style C'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>true
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6093867009805966905)
,p_region_id=>wwv_flow_imp.id(6093866932725966904)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_position=>'TOP'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6093867106860966906)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333653111901581921)
,p_plug_display_sequence=>20
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147569991323155481)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333689906352581956)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(11333626549511581887)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(11333744412935582036)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7467874194192308492)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-cards'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>You can display Cards in 3 different styles.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10741549895179258121)
,p_plug_name=>'Style A'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleA'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>true
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10741550413236258122)
,p_region_id=>wwv_flow_imp.id(10741549895179258121)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_position=>'TOP'
,p_media_adv_formatting=>false
);
wwv_flow_imp.component_end;
end;
/
