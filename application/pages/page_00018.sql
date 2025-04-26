prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Color Coded Cards'
,p_alias=>'COLOR-CODED-CARDS'
,p_step_title=>'&APP_NAME. - Color Coded Cards'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root {',
'    --a-cv-subtitle-text-color: inherit;',
'    --a-cv-subcontent-text-color: inherit;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147569779443155478)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333689906352581956)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(11333626549511581887)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(11333744412935582036)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6162731981920418665)
,p_plug_name=>'Icons'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPNO,',
'       ENAME,',
'       JOB,',
'       MGR,',
'       HIREDATE,',
'       SAL,',
'       COMM,',
'       DEPTNO,',
'       case when deptno = 10 then',
'           ''u-color-2''',
'       when deptno = 20 then',
'           ''u-color-3''',
'       when deptno = 30 then',
'           ''u-color-4''',
'       when deptno = 40 then',
'           ''u-color-5''',
'       end card_color',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6162732042131418666)
,p_region_id=>wwv_flow_imp.id(6162731981920418665)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DEPTNO'
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_css_classes=>'&CARD_COLOR!ATTR.'
,p_icon_position=>'TOP'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6162732180692418667)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333653327844581922)
,p_plug_display_sequence=>20
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'NO')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6907212960802395608)
,p_plug_name=>'Cards'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPNO,',
'       ENAME,',
'       JOB,',
'       MGR,',
'       HIREDATE,',
'       SAL,',
'       COMM,',
'       DEPTNO,',
'       case when deptno = 10 then',
'           ''u-color-2''',
'       when deptno = 20 then',
'           ''u-color-3''',
'       when deptno = 30 then',
'           ''u-color-4''',
'       when deptno = 40 then',
'           ''u-color-5''',
'       end card_color',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6137776703706258753)
,p_region_id=>wwv_flow_imp.id(6907212960802395608)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DEPTNO'
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9006759184008709588)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-paint-brush'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can color code cards or icons based on a column value.</p>',
'<p>This page color codes cards and icon background colors by departments. The region query uses <a href="https://apex.oracle.com/pls/apex/apex_pm/r/ut/color-and-status-modifiers" target="_blank">Universal Theme Color Modifiers</a> and selects this as'
||' column:',
'<pre>',
'case when deptno = 10 then',
'    ''u-color-2''',
'when deptno = 20 then',
'    ''u-color-3''',
'when deptno = 30 then',
'    ''u-color-4''',
'when deptno = 40 then',
'    ''u-color-5''',
'end card_color',
'</pre>',
'Cards CSS Classes and Icon CSS Classes use this column substitution, <em>&CARD_COLOR !ATTR.</em>, to get the value.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
