prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'BLOB Column as URL'
,p_alias=>'BLOB-COLUMN-AS-URL'
,p_step_title=>'&APP_NAME. - BLOB Column as URL'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147570237521155483)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333689906352581956)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(11333626549511581887)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(11333744412935582036)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7418782345631739396)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-file-image-o'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Sometimes, you want to control and customize the display of a BLOB column using an HTML <code>&lt;img&gt;</code> tag.  Since BLOB columns cannot be referenced by column substitutions (e.g. #COLUMN_NAME#), you need to get the BLOB column value as a'
||' URL.  Once you have the URL, you can format the display of the image using an HTML <code>&lt;img&gt;</code> tag.  To get the BLOB as a URL, you have these 3 options:</p>',
'',
'<ol>',
'    <li>Define a Media Resource RESTful Service</li>',
'    <li>Define an On-Demand Page or an Application Process to display an Image from a BLOB column</li>',
'    <li>Use the <a href="https://docs.oracle.com/en/database/oracle/application-express/20.2/aeapi/GET_BLOB_FILE_SRC-Function.html#GUID-21F2D33A-A616-48B5-BAF5-A85C0EDC998F" target="_blank">APEX_UTIL.GET_BLOB_FILE_SRC</a> API.  Bear in mind, this API'
||' requires a reference to a valid File Browse page item that exists somewhere in the app.</li>',
'</ol>',
'',
'<p>A Media Resource RESTful Service is the preferred implementation method, but to make this app self contained, this page uses method #2 (above).</p>',
'',
'<ul>',
'    <li>Page item <strong>P5_EMPNO</strong> hidden item added</li>',
'    <li>Ajax Callback <strong>GETIMAGE</strong> calls <em>eba_demo_card_pkg.get_profile_image</em></li>',
'    <li>Procedure <em>eba_demo_card_pkg.get_profile_image</em> initiates BLOB column download as inline</li>',
'    <li>The href value of the <code>&lt;img&gt;</code> tag in the Cards Media HTML Expression calls the <strong>GETIMAGE</strong> ajax process while also passing the EMPNO column value</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12025601052714325332)
,p_plug_name=>'Media Image'
,p_region_css_classes=>'test'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>30
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
'       apex_page.get_url(',
'           p_request     => ''APPLICATION_PROCESS=GETIMAGE'',',
'           p_clear_cache => 5,',
'           p_items       => ''P5_EMPNO'',',
'           p_values      => EMPNO ) BLOB_URL,',
'       IMAGE_LAST_UPDATE,',
'       TAGS',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>true
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6060155943166757907)
,p_region_id=>wwv_flow_imp.id(12025601052714325332)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>true
,p_media_html_expr=>'<img src="&BLOB_URL!ATTR." alt="&ENAME!ATTR." style="width:128px;height:128px;">'
,p_media_display_position=>'FIRST'
,p_pk1_column_name=>'EMPNO'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060040045055992380)
,p_name=>'P5_EMPNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12025601052714325332)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6060039921531992379)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GETIMAGE'
,p_process_sql_clob=>'eba_demo_card_pkg.get_profile_image( p_empno => :P5_EMPNO );'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to get employee profile image.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>691708836481978015
);
wwv_flow_imp.component_end;
end;
/
