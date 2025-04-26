prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'No Data Found Message'
,p_alias=>'NO-DATA-FOUND-MESSAGE'
,p_step_title=>'&APP_NAME. - No Data Found'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147571060569155491)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333689906352581956)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(11333626549511581887)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(11333744412935582036)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10461621626093501399)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>As Cards do not have headers, you can define a No Data Found Message with your own icon to make Cards without no results more visible.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10573583144120611905)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333653111901581921)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10737659202743281120)
,p_plug_name=>'No Data Found with Icon'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_query_where=>'1=0'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'No Employees Found'
,p_no_data_found_icon_classes=>'fa-warning fa-lg'
,p_show_total_row_count=>false
,p_plug_header=>'<h2>No Data Found with Icon</h2>'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10737659374220281121)
,p_region_id=>wwv_flow_imp.id(10737659202743281120)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10742189068135729631)
,p_plug_name=>'Default No Data Found'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_query_where=>'1=0'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'<h2>Default No Data Found</h2>'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10742189536137729632)
,p_region_id=>wwv_flow_imp.id(10742189068135729631)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp.component_end;
end;
/
