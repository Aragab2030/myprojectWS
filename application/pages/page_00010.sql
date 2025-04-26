prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'APEX Play List'
,p_alias=>'APEX-PLAY-LIST'
,p_step_title=>'&APP_NAME. - Video Images with Durations'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-videoLength {',
'    position: absolute;',
'    bottom: 8px;',
'    right: 8px;',
'    display: inline-block;',
'    padding: 2px 8px;',
'    font-weight: 700;',
'    font-size: 11px;',
'    line-height: 16px;',
'    color: #fff;',
'    background-color: rgba(0,0,0,.75);',
'    border-radius: 2px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6059232090531919965)
,p_plug_name=>'APEX Play List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11382981665036087844)
,p_plug_display_sequence=>20
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(10742113305207473634)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       ETAG,',
'       KIND,',
'       TITLE,',
'       CHANNELID,',
'       PLAYLISTID,',
'       VIDEOID,',
'       URL,',
'       WIDTH,',
'       HEIGHT,',
'       DESCRIPTION,',
'       PUBLISHEDAT,',
'       VIDEOPUBLISHEDAT,',
'       eba_demo_card_pkg.get_video_duration( p_video_id => VIDEOID ) VIDEO_DURATION',
'  from #APEX$SOURCE_DATA#'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6059232592686919970)
,p_region_id=>wwv_flow_imp.id(6059232090531919965)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>true
,p_media_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img class="a-CardView-mediaImg" src="&URL!ATTR." alt="&TITLE!ATTR." />',
'<span class="a-CardView-videoLength"><span class="fa fa-play"></span> &VIDEO_DURATION!HTML.</span>'))
,p_media_display_position=>'FIRST'
,p_media_css_classes=>'a-CardView-media--cover a-CardView-media--widescreen'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(6035139227823361184)
,p_card_id=>wwv_flow_imp.id(6059232592686919970)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'https://www.youtube.com/watch?v=&VIDEOID.'
,p_link_attributes=>'target="_blank"'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(5552194550863217288)
,p_page_id=>10
,p_web_src_param_id=>wwv_flow_imp.id(10742114303700473635)
,p_page_plug_id=>wwv_flow_imp.id(6059232090531919965)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(5552194680374217289)
,p_page_id=>10
,p_web_src_param_id=>wwv_flow_imp.id(10742114717471473635)
,p_page_plug_id=>wwv_flow_imp.id(6059232090531919965)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(5552194707135217290)
,p_page_id=>10
,p_web_src_param_id=>wwv_flow_imp.id(10742115129061473635)
,p_page_plug_id=>wwv_flow_imp.id(6059232090531919965)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6147571256514155493)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(11333689906352581956)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(11333626549511581887)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(11333744412935582036)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6726942762940635702)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-play'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(11333663472828581934)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Instead of embedding videos inline, this page displays the image and duration of the video using <strong>Cards Media Advanced Formatting</strong>. This page uses two different REST Data Sources based on the <a href="https://developers.google.com/y'
||'outube/v3/getting-started" title="YouTube Data API" target="_blank">YouTube Data API</a> to display the &PRODUCT_NAME. videos in that playlist.</p>',
'',
'<ul>',
'    <li><a href="https://developers.google.com/youtube/v3/docs/playlistItems" title="Playlistitems Resource" target="_blank">Playlistitems</a>: Gets videos for a given playlist</li>',
'    <li><a href="https://developers.google.com/youtube/v3/docs/videos" title="Videos Resource" target="_blank">Video</a>: Gets video duration for each video</li>',
'    <li>The <code>eba_demo_card_pkg.get_video_duration</code> function calls a Video REST Data Source using the <a href="https://docs.oracle.com/en/database/oracle/application-express/20.2/aeapi/APEX_EXEC.html#GUID-3CF1D2DD-AEA4-4982-9857-548567AB716'
||'9" title="&PRODUCT_NAME. API Guide" target="_blank">APEX_EXEC</a> API to get the duration for each video</li>',
'    <li>Playlistitems REST Data source has an extra data profile column that is derived from a SQL Expression calling the function above</li>',
'    <li>All these REST Data Sources are cached for 7 days, so there are no extra requests made until the cache expires</li>',
'    <li>To display the video duration, the Media HTML Expression uses an inline CSS class, <code>.a-CardView-videoLength</code>, which is defined on the page (in the <strong>CSS</strong> section''s <strong>Inline</strong> attribute)</li>',
'    <li>A <strong>Full Card Action</strong> is defined to watch the video on YouTube when a card is clicked</li>',
'</ul>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9818926399290666845)
,p_name=>'P10_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6059232090531919965)
,p_item_default=>'PLUo-NIMouZ_vsHnHudl3W0JfeB-3F4J8_'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
