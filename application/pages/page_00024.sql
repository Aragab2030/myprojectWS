prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_name=>'Conditional Actions'
,p_alias=>'CONDITIONAL-ACTIONS1'
,p_step_title=>'Conditional Actions'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.c-label{',
'    display:inline-flex; ',
'    align-items:center;',
'     margin-bottom:10px;',
'}',
'',
'.c-checkbox{',
'    margin-right:10px;',
'    background-color: maroon  !important;',
'     border: 1px solid maroon !important;',
'}',
'',
'/* Good Checkbox style to be viewed */',
'/* input[type="checkbox"][disabled][checked] {',
'  background-color: maroon !important;',
'}',
'input[type="checkbox"][disabled] {',
'  filter: invert(100%) hue-rotate(18deg) brightness(5);',
'} */',
'',
'input[disabled][type="checkbox"]:checked::before {',
unistr('content: "\2714";'),
'    position: relative;',
'    background: maroon;',
'    font-size: 10px;',
'    top: -2.5px;',
'    left: 0.5px;',
'    font-weight: 200;',
'    color: white;',
'    padding: 2px 4px;',
'    font-weight: bold;',
'    border-radius: 4px;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8968239839295263096)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-link'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can add multiple actions per Card.  Also, an action can display conditionally based on column values for each row.</p>',
'<p>This example displays 2 actions per card.  Title action displays without any condition.  Edit button action displays only if employee belongs to department 10.</p>'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11551512584823524269)
,p_plug_name=>'Conditional Card Actions'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleA'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPNO,',
'       ''Human Development Coropration'' ENAME,',
'       ''Subsidary Status'' JOB,',
'       MGR,',
'       HIREDATE,',
'       SAL,',
'       COMM,',
'       ''Published'' DEPTNO,',
'       PROFILE_IMAGE,',
'       MIMETYPE,',
'       FILENAME,',
'       IMAGE_LAST_UPDATE,',
'       TAGS,',
'      (SELECT LISTAGG(''<label class="c-label"><input type="checkbox"  value="'' || SERVICE_NAME || '' " checked disabled class="c-checkbox">'' || SERVICE_NAME || ''</label>'' , ''<br>'') ',
'        WITHIN GROUP (ORDER BY SERVICE_NAME)',
'     FROM MOJ.SERVICES_LIST where status = ''Y'') AS "CARD_BODY"',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(8714309053139)
,p_region_id=>wwv_flow_imp.id(11551512584823524269)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Selected Service</b></p>',
''))
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="margin: 0 20px;">  ',
'     &CARD_BODY!RAW.',
'</div>'))
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
 p_id=>wwv_flow_imp.id(9244344053140)
,p_card_id=>wwv_flow_imp.id(8714309053139)
,p_action_type=>'TITLE'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_authorization_scheme=>wwv_flow_imp.id(11333768303963582080)
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(3331114121008413)
,p_card_id=>wwv_flow_imp.id(8714309053139)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>30
,p_label=>'Deactivate'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-file-o'
,p_is_hot=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(9827897053142)
,p_card_id=>wwv_flow_imp.id(8714309053139)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>40
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-file-o'
,p_is_hot=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(3331015378008412)
,p_card_id=>wwv_flow_imp.id(8714309053139)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>60
,p_label=>'Delete'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-file-o'
,p_is_hot=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(3330605216008408)
,p_card_id=>wwv_flow_imp.id(8714309053139)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5686858597807774237)
,p_name=>'P24_ORDER_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11551512584823524269)
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
,p_ai_enabled=>false
);
wwv_flow_imp.component_end;
end;
/
