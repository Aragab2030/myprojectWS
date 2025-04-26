prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Conditional Actions'
,p_alias=>'CONDITIONAL-ACTIONS'
,p_step_title=>'&APP_NAME. - Conditional Actions'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147570756345155488)
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
 p_id=>wwv_flow_imp.id(8959702644721538479)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-link'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can add multiple actions per Card.  Also, an action can display conditionally based on column values for each row.</p>',
'<p>This example displays 2 actions per card.  Title action displays without any condition.  Edit button action displays only if employee belongs to department 10.</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11542975390249799652)
,p_plug_name=>'Conditional Card Actions'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"ENAME","expr":"\"ENAME\" asc"},{"key":"JOB","expr":"\"JOB\" asc"},{"key":"DEPTNO","expr":"\"DEPTNO\" asc"}],"itemName":"P16_ORDER_BY"}'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10742185209673708830)
,p_region_id=>wwv_flow_imp.id(11542975390249799652)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'BLOB'
,p_icon_blob_column_name=>'PROFILE_IMAGE'
,p_icon_position=>'START'
,p_icon_description=>'&ENAME. - &JOB.'
,p_badge_column_name=>'DEPTNO'
,p_badge_label=>'Department: '
,p_media_adv_formatting=>false
,p_pk1_column_name=>'EMPNO'
,p_mime_type_column_name=>'MIMETYPE'
,p_last_updated_column_name=>'IMAGE_LAST_UPDATE'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(10737659433801281122)
,p_card_id=>wwv_flow_imp.id(10742185209673708830)
,p_action_type=>'TITLE'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_authorization_scheme=>wwv_flow_imp.id(11333768303963582080)
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(10737659139590281119)
,p_card_id=>wwv_flow_imp.id(10742185209673708830)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>30
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-file-o'
,p_is_hot=>true
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':JOB = ''DEVEOPER'' or :DEPTNO = 10'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5678318326537049566)
,p_name=>'P16_ORDER_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11542975390249799652)
,p_item_default=>'DEPTNO'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Ename;ENAME,Job;JOB,Deptno;DEPTNO'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(11333741881545582031)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
