prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'OIC Integration'
,p_alias=>'OIC-INTEGRATION'
,p_step_title=>'OIC Integration'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
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
'.b-search{',
'    position: relative;',
'    bottom: -13%;',
'    height: 47px;',
'}',
'',
'.b-add, .b-cancel{',
'     position: relative;',
'     height: 47px;',
'}',
'',
'ul[class*="t-Tabs t-Tabs--simple t-Tabs--large a-Tabs"]{',
'    overflow: unset !important;',
'}',
'.a-Tabs-selected{',
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
'}',
'',
'.f-insert-form{',
'    padding: 0% 2% 2% 2%;',
'}',
'',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8476920140573669)
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
 p_id=>wwv_flow_imp.id(9687790694535833)
,p_plug_name=>'Parent Tab Region'
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
 p_id=>wwv_flow_imp.id(8563628368024003)
,p_plug_name=>'Add Person Information '
,p_region_name=>'f-person-info'
,p_parent_plug_id=>wwv_flow_imp.id(9687790694535833)
,p_region_css_classes=>'f-insert-form'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'PERSON_INFO'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9688875221535844)
,p_plug_name=>'Sparator'
,p_parent_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'<br> <hr> <br>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9689037212535846)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(9688875221535844)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9610541810024909)
,p_plug_name=>'Person Information Report'
,p_parent_plug_id=>wwv_flow_imp.id(9687790694535833)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8266698994581096)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PRS_ID,',
'       QID_NUMBER,',
'       ID_EXPIRY_DATE,',
'       PASSPORT_NUMBER,',
'       BIRTH_DATE,',
'       GENDER,',
'       FULL_NAME_AR,',
'       FULL_NAME_EN,',
'       NATIONALITY,',
'       MOBILE_NUMBER,',
'       EMAIL_ADDRESS,',
'       dbms_lob.getlength(ID_COPY) ID_COPY,',
'       MIME_TYPE,',
'       file_name,',
'       CREATED_BY,',
'       CREATED_DATE,',
'       UPDATED_BY,',
'       UPDATED_DATE',
'  from PERSON_INFO',
'  ORDER BY PRS_ID ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9610692838024910)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>9610692838024910
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857196668060112)
,p_db_column_name=>'PRS_ID'
,p_display_order=>10
,p_column_identifier=>'CB'
,p_column_label=>'Prs Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857237588060113)
,p_db_column_name=>'QID_NUMBER'
,p_display_order=>20
,p_column_identifier=>'CC'
,p_column_label=>'Qid Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857331680060114)
,p_db_column_name=>'ID_EXPIRY_DATE'
,p_display_order=>30
,p_column_identifier=>'CD'
,p_column_label=>'Id Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857423782060115)
,p_db_column_name=>'PASSPORT_NUMBER'
,p_display_order=>40
,p_column_identifier=>'CE'
,p_column_label=>'Passport Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857596515060116)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>50
,p_column_identifier=>'CF'
,p_column_label=>'Birth Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857636518060117)
,p_db_column_name=>'GENDER'
,p_display_order=>60
,p_column_identifier=>'CG'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(9933473130663607)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857921127060120)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>70
,p_column_identifier=>'CJ'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(9934453478656903)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857721675060118)
,p_db_column_name=>'FULL_NAME_AR'
,p_display_order=>80
,p_column_identifier=>'CH'
,p_column_label=>'Full Name Ar'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9857842583060119)
,p_db_column_name=>'FULL_NAME_EN'
,p_display_order=>90
,p_column_identifier=>'CI'
,p_column_label=>'Full Name En'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858065342060121)
,p_db_column_name=>'MOBILE_NUMBER'
,p_display_order=>110
,p_column_identifier=>'CK'
,p_column_label=>'Mobile Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858146660060122)
,p_db_column_name=>'EMAIL_ADDRESS'
,p_display_order=>120
,p_column_identifier=>'CL'
,p_column_label=>'Email Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858252409060123)
,p_db_column_name=>'ID_COPY'
,p_display_order=>130
,p_column_identifier=>'CM'
,p_column_label=>'Id Copy'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PERSON_INFO:ID_COPY:PRS_ID::MIME_TYPE:FILE_NAME:::attachment:<span class="fa fa-download" aria-hidden="true"></span>:'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858320179060124)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>140
,p_column_identifier=>'CN'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858447144060125)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>150
,p_column_identifier=>'CO'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858515573060126)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>160
,p_column_identifier=>'CP'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858640474060127)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>170
,p_column_identifier=>'CQ'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858756726060128)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>180
,p_column_identifier=>'CR'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9858820403060129)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>190
,p_column_identifier=>'CS'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9649530304004638)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'96496'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRS_ID:FULL_NAME_AR:FULL_NAME_EN:QID_NUMBER:NATIONALITY:GENDER:EMAIL_ADDRESS:ID_COPY:'
,p_sort_column_1=>'PRS_ID'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9684635464535802)
,p_plug_name=>'Search By Person ID'
,p_parent_plug_id=>wwv_flow_imp.id(9687790694535833)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8209809387581126)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9612572061024929)
,p_plug_name=>'Person Info From OIC'
,p_parent_plug_id=>wwv_flow_imp.id(9684635464535802)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8266698994581096)
,p_plug_display_sequence=>20
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(9675853530552052)
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_PERSON_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9612681066024930)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>9612681066024930
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9612896050024932)
,p_db_column_name=>'PRS_ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Prs Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613606445024940)
,p_db_column_name=>'FULL_NAME_AR'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Full Name Ar'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613747400024941)
,p_db_column_name=>'FULL_NAME_EN'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Full Name En'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613253645024936)
,p_db_column_name=>'QID_NUMBER'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Qid Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9614176786024945)
,p_db_column_name=>'ID_EXPIRY_DATE'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Id Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9614201474024946)
,p_db_column_name=>'PASSPORT_NUMBER'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>'Passport Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9612789332024931)
,p_db_column_name=>'GENDER'
,p_display_order=>70
,p_column_identifier=>'A'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613049259024934)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Birth Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613424662024938)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613976680024943)
,p_db_column_name=>'EMAIL_ADDRESS'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Email Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9614025621024944)
,p_db_column_name=>'MOBILE_NUMBER'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Mobile Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9612913122024933)
,p_db_column_name=>'ID_COPY'
,p_display_order=>120
,p_column_identifier=>'C'
,p_column_label=>'Id Copy'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613193931024935)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>130
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613305626024937)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>140
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613575300024939)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>150
,p_column_identifier=>'I'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9613824136024942)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>160
,p_column_identifier=>'L'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9683776026541271)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'96838'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FULL_NAME_AR:FULL_NAME_EN:QID_NUMBER:ID_EXPIRY_DATE:PASSPORT_NUMBER:NATIONALITY:BIRTH_DATE:GENDER:EMAIL_ADDRESS:MOBILE_NUMBER:ID_COPY:'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(9614332131024947)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(9676491078552051)
,p_page_plug_id=>wwv_flow_imp.id(9612572061024929)
,p_value_type=>'ITEM'
,p_value=>'P2_PERSON_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9612480424024928)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9689037212535846)
,p_button_name=>'Add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(8350176777581047)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_css_classes=>'b-add'
,p_icon_css_classes=>'fa-plus-square'
,p_grid_new_row=>'Y'
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9614570292024949)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9684635464535802)
,p_button_name=>'Search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(8350176777581047)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'b-search'
,p_icon_css_classes=>'fa-search'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9688975345535845)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9689037212535846)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--gapLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(8350176777581047)
,p_button_image_alt=>'Cancel'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'b-cancel'
,p_icon_css_classes=>'fa-home'
,p_grid_new_row=>'N'
,p_grid_column=>7
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8563801867024005)
,p_name=>'P2_PRS_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_source=>'PRS_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8563970304024006)
,p_name=>'P2_QID_NUMBER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Qid Number'
,p_source=>'QID_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564073149024007)
,p_name=>'P2_ID_EXPIRY_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Id Expiry Date'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'ID_EXPIRY_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564164855024008)
,p_name=>'P2_PASSPORT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Passport Number'
,p_source=>'PASSPORT_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564264302024009)
,p_name=>'P2_BIRTH_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Birth Date'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'BIRTH_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564323073024010)
,p_name=>'P2_GENDER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Gender'
,p_source=>'GENDER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV GENDER'
,p_lov=>'.'||wwv_flow_imp.id(9933473130663607)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564427819024011)
,p_name=>'P2_FULL_NAME_AR'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Full Name Ar'
,p_source=>'FULL_NAME_AR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564541036024012)
,p_name=>'P2_FULL_NAME_EN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Full Name En'
,p_source=>'FULL_NAME_EN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564642553024013)
,p_name=>'P2_NATIONALITY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Nationality'
,p_source=>'NATIONALITY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV NATIONALITY'
,p_lov=>'.'||wwv_flow_imp.id(9934453478656903)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564749245024014)
,p_name=>'P2_MOBILE_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Mobile Number'
,p_source=>'MOBILE_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564865693024015)
,p_name=>'P2_EMAIL_ADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Email Address'
,p_source=>'EMAIL_ADDRESS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8564989182024016)
,p_name=>'P2_ID_COPY'
,p_source_data_type=>'BLOB'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_prompt=>'Id Copy'
,p_source=>'ID_COPY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(8348818401581050)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'DROPZONE_INLINE',
  'dropzone_description', 'Attach QID ',
  'dropzone_title', 'QID Copy',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8565069753024017)
,p_name=>'P2_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8565180538024018)
,p_name=>'P2_CREATED_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'CREATED_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8565291975024019)
,p_name=>'P2_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8565358735024020)
,p_name=>'P2_UPDATED_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_item_source_plug_id=>wwv_flow_imp.id(8563628368024003)
,p_source=>'UPDATED_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9614451598024948)
,p_name=>'P2_PERSON_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9684635464535802)
,p_prompt=>'Person Id'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(8347576426581051)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(9688367624535839)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(9614570292024949)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9688406692535840)
,p_event_id=>wwv_flow_imp.id(9688367624535839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P2_PERSON_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(9688534301535841)
,p_event_id=>wwv_flow_imp.id(9688367624535839)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9612572061024929)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9687086313535826)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert Person Info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 27/10/2024 10:20:40 PM (QP5 v5.388) */',
'DECLARE',
'    l_response       CLOB;',
'    l_request_body   CLOB;',
'     l_BLOB           BLOB;',
'     l_base64    CLOB;',
'BEGIN',
'    apex_web_service.g_request_headers (1).name := ''Content-type'';',
'    apex_web_service.g_request_headers (1).VALUE := ''application/json'';',
'',
'    SELECT BLOB_CONTENT',
'    INTO  l_BLOB',
'    FROM APEX_APPLICATION_TEMP_FILES',
'    WHERE APPLICATION_ID = 101 AND name = :P2_ID_COPY;',
'     ',
'     if l_BLOB is not null',
'     then ',
'        l_base64 := apex_web_service.blob2clobbase64(l_BLOB);',
'        l_base64 := REPLACE(REPLACE(l_base64, CHR(13), ''''), CHR(10), '''');',
'    end if;',
'    l_request_body := ''{',
'        "HR.PERSON_INFO": [',
'            {',
'                "QID_NUMBER": "'' || TO_NUMBER(:P2_QID_NUMBER)|| ''",',
'                "ID_EXPIRY_DATE": "'' || to_char(to_date(:P2_ID_EXPIRY_DATE, ''DD/MM/YYYY''), ''YYYY-MM-DD'')  || ''",',
'                "PASSPORT_NUMBER": "'' || :P2_PASSPORT_NUMBER || ''",',
'                "BIRTH_DATE": "'' ||  to_char(to_date(:P2_BIRTH_DATE, ''DD/MM/YYYY''), ''YYYY-MM-DD'') || ''",',
'                "GENDER": "'' || :P2_GENDER || ''",',
'                "FULL_NAME_AR": "'' || :P2_FULL_NAME_AR || ''",',
'                "FULL_NAME_EN": "'' || :P2_FULL_NAME_EN || ''",',
'                "NATIONALITY": "'' || :P2_NATIONALITY || ''",',
'                "MOBILE_NUMBER": "'' || :P2_MOBILE_NUMBER || ''",',
'                "EMAIL_ADDRESS": "'' || :P2_EMAIL_ADDRESS || ''",',
'                "ID_COPY": "'' || l_base64 || ''"',
'               ',
'            }',
'        ]',
'    }'';',
'',
'',
'    l_response :=',
'        apex_web_service.make_rest_request (',
'            p_url           =>',
'                ''https://oicconnectm-axpnesiqlw1a-je.integration.me-jeddah-1.ocp.oraclecloud.com/ic/api/integration/v1/flows/rest/DEMO_ATP_INSERT/1.0/insert'',',
'            p_username      => ''krishna.munagala@mannai.com.qa'',',
'            p_password      => ''Qatar@20242024'',',
'            p_http_method   => ''POST'',',
'            p_body          => l_request_body);',
'',
'    apex_json.parse(l_response);',
'    IF apex_json.get_varchar2 (p_path => ''message'') = ''successfully Inserted''',
'    THEN',
'        APEX_APPLICATION.g_print_success_message :=',
'            ''Data Inserted Successfully'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(9612480424024928)
,p_internal_uid=>9687086313535826
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8563767260024004)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8563628368024003)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form OIC Integration'
,p_internal_uid=>8563767260024004
);
wwv_flow_imp.component_end;
end;
/
