prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Gauge Meter Chart Cards'
,p_alias=>'GAUGE-METER-CHART-CARDS'
,p_step_title=>'&APP_NAME. - Charts'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'[require jet]'
,p_javascript_code_onload=>'require(["ojs/ojgauge"], function() {});'
,p_css_file_urls=>'#JET_CSS_DIRECTORY#alta/oj-alta-notag-min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.speedometer {',
'    align: center;',
'    margin-top: 5px;',
'    margin-bottom: 5px;',
'    height: 120px;',
'    width: 100%;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147570969888155490)
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
 p_id=>wwv_flow_imp.id(9818082988728713905)
,p_plug_name=>'Gauge Meter Chart Cards'
,p_region_name=>'gauge-container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with v_speed as (',
'    select id,',
'       state,',
'       license_plate,',
'       location,',
'       vehicle_speed,',
'       posted_speed,',
'       vehicle_speed - posted_speed over_speed,',
'       posted_speed max_val',
'    from eba_demo_card_vehicle_speed )',
'select s.id, s.state, s.license_plate, s.location,',
'       s.vehicle_speed,',
'       s.posted_speed,',
'       s.over_speed,',
'       s.max_val',
'from v_speed s',
'where over_speed > 0'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(9818083423134713908)
,p_region_id=>wwv_flow_imp.id(9818082988728713905)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>'<strong>&LICENSE_PLATE.</strong> '
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'LOCATION'
,p_body_adv_formatting=>true
,p_body_html_expr=>'&VEHICLE_SPEED. mph in &POSTED_SPEED. zone'
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'STATE'
,p_badge_label=>'State: '
,p_media_adv_formatting=>true
,p_media_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<oj-status-meter-gauge',
'    id = "vehichle_speed"',
'    angle-extent = 250',
'    start-angle = 215',
'    min = "0"',
'    max = "&MAX_VAL!ATTR."',
'    labelled-by="readOnly"',
'    thresholds=''[{"max": 5, "color": "yellow"},{"max": 19, "color": "orange"},{"max": 40, "color": "red"}]''',
'    value = "&OVER_SPEED!ATTR."',
'    label.text ="mph over"',
'    orientation = "circular"',
'    class="speedometer" readonly>',
'</oj-status-meter-gauge>'))
,p_media_display_position=>'BODY'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11212633713432616566)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-dial-gauge-chart'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can display charts on cards using <a href="&JET_VISUALIZATION_URL." target="_blank">Oracle JET Data Visualizations</a>. This page uses <a href="https://www.oracle.com/webfolder/technetwork/jet/jetCookbook.html?component=statusMeterGauge&demo=s'
||'tatusMeterGaugeCircular" target="_blank">Status Meter Gauge</a>.</p>',
'',
'<p>Cards region does not load necessary Oracle JET library and CSS for you.  To display the vehicle speed using Status Meter Gauge:</p>',
'',
'<ol>',
'',
'',
'<li>',
'    Enter <em>[require jet]</em> command as page inline JavaScript URL to automatically load Oracle JET RequireJS and configuration.',
'</li>',
'',
'<li>',
'   Load Status Meter Gauge module by adding a call to require as page JavaScript execute on page load:',
'     <pre>require(["ojs/ojgauge"], function() {});</pre>',
'</li>',
'',
'<li>',
'    Add the following as page CSS File URLs to load Oracle JET CSS without tag selectors:',
'    <pre>&#35;JET_CSS_DIRECTORY&#35;alta/oj-alta-notag-min.css</pre>',
'</li>',
'',
'<li>',
'    Use Oracle JET <strong>&lt;oj-status-meter-gauge&gt;</strong> element as Cards Media HTML Expression.',
'</li>',
'',
'</ol>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
