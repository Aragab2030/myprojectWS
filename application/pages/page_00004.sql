prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>7959938991391979
,p_default_application_id=>101
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'OAC Dashboard'
,p_alias=>'OAC-DASHBOARD'
,p_step_title=>'OAC Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
' [require jet]',
' https://mannaioacdemo2-axpnesiqlw1a-je.analytics.ocp.oraclecloud.com/public/dv/v1/embedding/jet/embedding.js?IDCS_OAUTH3LEGGED=true',
'',
'-- https://mannaioacdemo2-axpnesiqlw1a-je.analytics.ocp.oraclecloud.com/public/dv/v1/embedding/standalone/embedding.js?IDCS_OAUTH3LEGGED=true'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'requirejs([''knockout'', ''ojs/ojcore'', ''ojs/ojknockout'', ''ojs/ojcomposite'', ''jet-composites/oracle-dv/loader''],function(ko) { ',
' 	 ko.applyBindings(); ',
' 	 }); '))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BreadcrumbRegion {',
'    padding: 0.5% 0.5% 0.5% 0.5% !important;',
'}',
'',
'@media (min-width: 640px) {',
'    .t-Body-title:not(.t-Body-title-shrink) .t-BreadcrumbRegion--useBreadcrumbTitle:not(.t-BreadcrumbRegion--compactTitle) .t-Breadcrumb-item:last-child, .t-BreadcrumbRegion-titleText {',
'        flex-basis: unset;',
'        font-family: var(--ut-breadcrumb-title-font-family);',
'        font-size: small;',
'        font-weight: var(--ut-breadcrumb-title-font-weight, var(--a-base-font-weight-semibold, 500));',
'        line-height: unset;',
'        margin: 0;',
'        overflow: hidden;',
'        text-overflow: ellipsis;',
'    }',
'}',
'',
'ul[class*="t-Tabs t-Tabs--simple t-Tabs--large a-Tabs"]{',
'    overflow: unset !important;',
'}',
'.a-Tabs-selected {',
'     background-color: var(--oc-colors-main-tabBg, var(--oc-colors-main-panelPrimaryBg, #fcfcfc));',
'    border-left: 1px solid var(--oc-colors-main-tabBorder, var(--oc-colors-primaryGrays-50, #aeaeae));',
'    border-right: 1px solid var(--oc-colors-main-tabBorder, var(--oc-colors-primaryGrays-50, #aeaeae));',
'    border-top: 1px solid var(--oc-colors-main-tabBorder, var(--oc-colors-primaryGrays-50, #aeaeae));',
'    border-bottom: 2px solid var(--oc-colors-main-tabBg, var(--oc-colors-main-panelPrimaryBg, #fcfcfc));',
'    position: relative;',
'    bottom: -2px;',
'}',
'',
'.t-Tabs-link:before{',
'    content: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8479811516561266)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8288800677581086)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8173164710581169)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(8351645262581046)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9859651426060137)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--large'
,p_plug_template=>wwv_flow_imp.id(8286224716581087)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9859109318060132)
,p_plug_name=>'Employees Dashboard'
,p_parent_plug_id=>wwv_flow_imp.id(9859651426060137)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width:100%; height:700px" >',
'<oracle-dv project-path="/@Catalog/shared/HR/Reports/OAC_APEX_Integration" active-page="canvas" active-tab-id="1">',
'</oracle-dv>',
'</div>',
'',
'',
'',
'',
'<!-- <iframe src="https://mannaioacdemo2-axpnesiqlw1a-je.analytics.ocp.oraclecloud.com/ui/dv/project.jsp?pageid=visualAnalyzer&reportpath=%2F%40Catalog%2Fshared%2FHR%2FReports%2FPersons_Report&viewermode=true&noheader=true" width="100%" height="800px'
||'" > </iframe> -->',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9859730966060138)
,p_plug_name=>'Person Information Dashboard'
,p_parent_plug_id=>wwv_flow_imp.id(9859651426060137)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<iframe src="https://mannaioacdemo2-axpnesiqlw1a-je.analytics.ocp.oraclecloud.com/ui/dv/project.jsp?pageid=visualAnalyzer&reportpath=%2F%40Catalog%2Fshared%2FHR%2FReports%2FPersons_Report&viewermode=true&noheader=true" width="100%" height="800px" > <'
||'/iframe>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
