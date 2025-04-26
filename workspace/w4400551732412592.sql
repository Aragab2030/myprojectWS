prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_default_workspace_id=>4400551732412592
);
end;
/
prompt  WORKSPACE 4400551732412592
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   23:00 Saturday April 26, 2025
--   Exported By:     HR
--   Export Type:     Workspace Export
--   Version:         24.2.3
--   Instance ID:     1000193623458134
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_240200
 
begin
    wwv_flow_imp.set_security_group_id(p_security_group_id=>4400551732412592);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace HR...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 4400600871412607
 ,p_provisioning_company_id => 4400551732412592
 ,p_short_name => 'HR'
 ,p_display_name => 'HR_WS'
 ,p_first_schema_provisioned => 'HR'
 ,p_company_schemas => 'HR:MOI:MOJ:QE_REP'
 ,p_expire_fnd_user_accounts => 'Y'
 ,p_fnd_user_max_login_failures => 15
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'HR'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'HR'
 ,p_builder_notification_message => 'This is for intranal Workspace applications'
 ,p_files_version => 1
 ,p_is_extension_yn => 'N'
 ,p_env_banner_yn => 'N'
 ,p_env_banner_pos => 'LEFT'
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 4000338159498762,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 4000287511498762,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 4000104385498759,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 20246710455303118,
  p_GROUP_NAME => 'myrole',
  p_SECURITY_GROUP_ID => 4400551732412592,
  p_GROUP_DESC => '');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '26496188963538346',
  p_user_name                    => '111111111111',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '111111111111@abc.com',
  p_web_password                 => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503031434','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '29151411725306240',
  p_user_name                    => '222222222222',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '222222222222@abc.com',
  p_web_password                 => '4E7E699CDEEBCB67EBF01D48C289F74A340821DB6E8426258223970B4391DD9AD317EE373093E26FD69E360502609E3FE412D0723B17488B1A28388D9FC55FF6',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202405102359','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '29151830737306287',
  p_user_name                    => '333333333333',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '333333333333@abc.com',
  p_web_password                 => '3E083DB4E883E6F05A4AE8B7A19C849A69A1E851C303E9C5FAAF6721E24D963F077F46233C4A6870965CD4C95FE37773463E8FB4500029F07B40E3DA14C692A3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202403192124','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '29152251239306342',
  p_user_name                    => '444444444444',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '444444444444@abc.com',
  p_web_password                 => '2F844AD85F404120637BFC59192E308086A0A8D53892D0D1A3AB7E0F8BC1CDAE578C50218CD58DF0632B5BF558E60539EF67BBF4842E9159FA7B6E2B77D007D6',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202403192125','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '29152681560306398',
  p_user_name                    => '555555555555',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '555555555555@abc.com',
  p_web_password                 => '8C6A9437F0DCFCAD3F5CEACE1292A68C50B095B6D8512D9338A14F146C0299B1A5741FE893778B64AECD7ED38206D5F1F5458B728F64873CB2280C3D3FCE0308',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202403192125','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '29153049804306450',
  p_user_name                    => '666666666666',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => '666666666666@abc.com',
  p_web_password                 => 'D0C0CCCB08E2CCAFE3FA62D2FA5B66D92310C40E0DAF25849E9BFACA174BD632C74DFF9B9D9CBAB677190125D1C6CAED84517A2874D66448E31ED5821D3B0F1C',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202403191250','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '4400422917412592',
  p_user_name                    => 'ADMIN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab.egabi@gmail.com',
  p_web_password                 => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504181350','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6475763412359198',
  p_user_name                    => 'AHMED',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed@gmail.com',
  p_web_password                 => 'F5038FA74D6A8264EB62CA1CB64B7F3B709DFD402957A5CA8F05785A77AAE94AF8A286C07293560C559D5ACF9922C36D87FCCEE892681CA4C3689A286887077C',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504230909','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '12803419185068235',
  p_user_name                    => 'AHMEDR',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmedr@mail.com',
  p_web_password                 => 'C37BABD573E07A38F62D48D3C68BE97A315E970305CA864F8ADEC4F60B97A645B82B6C4F8C49C9EE95FAE1DE7CEAB64A94E98709E7A85364D20BF72D0676301B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202304100949','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '19982862531782581',
  p_user_name                    => 'ALI',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ali@mannai.com.qa',
  p_web_password                 => 'DB11EB3517F4E30F51F00C0F505549BA9C84D10F985D3704477A313E82C3B52F0902ABC18D2315DE857F7E75FCF8432D013C44D2B5006F11B83C78AD11939787',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202405141820','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24416119358800792',
  p_user_name                    => 'ANACHATT',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ANACHATT@man.com',
  p_web_password                 => '91AB065A68F3C80AF5E2CB67E458FA409A0680DE8D64D59E0E6ABEAB77C8B9A686D8914D813CF7710524CB0F3AA3F2120111DC723171B74E0823E6DACF247772',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402271805','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24412192358794675',
  p_user_name                    => 'ANACHATT@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ANACHATT@man.com',
  p_web_password                 => '143060E09472B0F9884D1FD02687FD273339237AC384CA5BF960EC05FD5A4433462990558C8DACBD05567E6A94532251FA96FFE322C7BDF45E8499FC10473F99',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '20045928171983551',
  p_user_name                    => 'API_AUTH',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'api_auth@mail.com',
  p_web_password                 => '6034BF86F5E2A50B55F3FF8738DCF470E458E5C0CAA21EBD4BADDD599FA5E82C57D6A75F917286427424EFEDA365534809EE25A2726A68E19DD690D75AD91573',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000287511498762:20246710455303118:',
  p_developer_privs              => 'CREATE:EDIT:HELP:MONITOR:SQL:MONITOR:DATA_LOADER',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504160000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '20249357888768870',
  p_user_name                    => 'API_AUTH_REGION',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'a@mail.com',
  p_web_password                 => '3DFB997C8066317BAD5826D521D7C51F2E4B921B57D62019E26B98F4676E5E3C9C3232F5C5D939BC1B0374F4BD1FBAAD30F133CFA8255D4B85B37EDEA42058A5',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '20246710455303118:',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504201251','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17081697512056284',
  p_user_name                    => 'APPROVER_USER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab@mannai.com.qa',
  p_web_password                 => 'D5DDD8BC29C3DE8D0226DAC8367CDA3397881EBEAB361072BC3A0AE58332B0B161062B29CAA13F05436F6B3C4C2300BE1B192FEEF13F6A11329693CA272A6E69',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503031134','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '32637528166644134',
  p_user_name                    => 'BACKOFFICE_EMPLOYEE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'backoffice_employee@abc.com',
  p_web_password                 => '6C98F6AC511A22CC8F9CD411AC50E0E32630F75D4A9AA33CFDB54BF94C010F491073B239E71DC1B627B9AD2EE0FE3BD6DD86EA34E5100323BF2881750322FA37',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202411091611','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '8150071668457354',
  p_user_name                    => 'BACKOFFICE_EMPLOYEE1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'a@mail.com',
  p_web_password                 => '8D3F4876908C1EE2DC50D5E4BB75F42D4A3B3DB87ED093D0638892A930AED99353119118855637B20C7030781524292AE4663C7757116C0A91C57EB5BEDFDAF3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202412151614','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6260908518540778',
  p_user_name                    => 'BO',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'BO@gmail.com',
  p_web_password                 => '2F6F376CE3353BA9970BE0B855F51EC29D7E85B55FB724A264050BC7A31FF61CFF2922A4E812DC1BFA08A8F0BC49987AC9A9AD97BF20F49F82C22EE25BA9F07B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202308062233','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24412956208794760',
  p_user_name                    => 'BO@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'BO@man.com',
  p_web_password                 => '7463F7DD9851E08251AA73C3D9200AB99021351995DA3207ED64665B68EB0E4ABE5AA71C2928BF71454C709D13D93394F14DE0EEE14B0555883B57A5BA378612',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '7000949945580101',
  p_user_name                    => 'CLARA',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'CLARA@gmail.com',
  p_web_password                 => '0BAA629EEF6FBBBBFFB91DBDB3CDAB4EF2545409C2B936B3344718FE93679B198F44B2DF891CBA6D351ECD84C38BFAFCA3620AB10B0A18DB0D6C06581B90BB75',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202304091025','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '32637133361640051',
  p_user_name                    => 'COMMITEE_USER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'commitee_user@abv.com',
  p_web_password                 => '6BAAC77AD19521AE858FE0482B4E0A7969F4750BDCCA3643D2E5C833F9100236900CFAD94C8DC73406B482251873FB38953CA8E65ABAC34476D524AF8357C6C6',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202408291333','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '26775621950088995',
  p_user_name                    => 'COMMITEE_USER1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'commitee_user1@abc.com',
  p_web_password                 => 'BDFE4816B709A8E88F798889CBF0B51A22D80357E1D567EDC1A3D557B14199C2C505424DBA04F3522C84F76C2A1C6D06A7A2C56E6CDF6B298A5B37A19DBC81D7',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202407251310','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24417395623800921',
  p_user_name                    => 'DARYL',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'DARYL@man.com',
  p_web_password                 => 'ECF2D887169F9ADA70E3AF4BC92E7AACF733DDB8B43DC9E645DB2B7A7CEAB52B95487D8FA87D904A74AE9C0B880441EC9D1E271DA132B753CFA229BFDE3330D3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24414517765794935',
  p_user_name                    => 'DARYL@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'DARYL@man.com',
  p_web_password                 => '623CC631B6E79D52E2D832210B8C95F7F2C4798499EDAF5A270E0DD701653983EEBF80B0FE3DD1CAA7D98BDC9EB90170CD4068322598FF2944E93C04B44C4B27',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17082018707061139',
  p_user_name                    => 'EVALUATION_USER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab@mannai.com.qa',
  p_web_password                 => 'A7C8CAB6E1D452BF359397A21DFB5E593B0AE7337F7D53AF83C2BB370DB129A5316AB2FD0A52DEB6F90DDF9F07B01D89281F6E84F2306AAE2DADBEB3FF7CD823',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503031134','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '19983235991784342',
  p_user_name                    => 'HASSAN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'hassan@mannai.com.qa',
  p_web_password                 => 'ADDB296D743FF825BAA56F287D3788BF0524AFC37FF8454093C60BA7CB033EA89CD6542D75080B825BA7FEB2BD7F671A7CC6A27E92B3FE2ABA07069A4D4DBE61',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202405151721','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6044857346794953',
  p_user_name                    => 'HR_ADMIN',
  p_first_name                   => 'Ahmed',
  p_last_name                    => 'Ragab',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab.egabi@gmail.com',
  p_web_password                 => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504181358','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '12472542295668414',
  p_user_name                    => 'HR_ADMIN1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab.egabi@gmail.com',
  p_web_password                 => '88A13F1AC29F8B96A28A3E55589B3BDEB665F8CB10E686FC8215690306951A8D9E7B30691FA4705602D2F22FD08048EBFF5705BBF891AB24E7CA61CBE5FA778D',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202304091028','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '19982441359780875',
  p_user_name                    => 'IBRAHIM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ibrahim@mannai.com.qa',
  p_web_password                 => '916B92B9E235C2941D29FD359C149EFEAE4737E6D25DE37174BC0BBB026AE63CAAAD2C1A77DD0B4183265EC356E3AD1A8338AB7E772869AA36154424D31F4183',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202305291404','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6261118458540826',
  p_user_name                    => 'JANE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'JANE@gmail.com',
  p_web_password                 => '71B9F917F4755F74304DDFE1BB17020DD69E26C2EA8CF5B937FBAF737CED702FF0901B2188FD89624AA78D5F27B924982482FFB1D72108B22E25C37510F86F73',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202302192222','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24412534925794718',
  p_user_name                    => 'JANE@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'JANE@man.com',
  p_web_password                 => '9FFD070A005572F70C79BBC168F27D5A7182876C7B2229956EE8CC8D17B7D06D314A2050FF3A259B4DBC97C3F6499291794A259E101BA14763CA1B4219D69B16',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '7001157661580121',
  p_user_name                    => 'JOHN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'JOHN@gmail.com',
  p_web_password                 => '242DD3498B661F64583CD51C6FFDE07180F653DACBC2D006FF394C2920D8AE2BB098D53B7A38610048471C59DF916B7D04176EEF22FFD9E82C5BB5D8C8A13FC3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202302210947','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24416591318800834',
  p_user_name                    => 'MARTIN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'MARTIN@man.com',
  p_web_password                 => 'B33870930DE822600F0D7ABF5E4BF5571246EBA3FAC7978A356ABAEAF9DC9E99461CC0387074348B5C8BB07625497C5A9C926EEFC5A75E0F90F454717D9FA7FA',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24413767266794850',
  p_user_name                    => 'MARTIN@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'MARTIN@man.com',
  p_web_password                 => '6B05130F2138BDA87905190FBDF6F14788F2A5DF76748CE2BAA6EA921E206E9B136741BA198B9F25B0EFF2BB1B184D6514372EA049A031942AA5146ADF237DA0',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '7000775126580081',
  p_user_name                    => 'MATT',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'MATT@gmail.com',
  p_web_password                 => '6F3C92FB775F26C5A189C97938BEF8C9FF1CC9A76B00C981D7BE8C66B4661F11DFA55137B4BE477D19CCF1B38DE30BC8956C716A685FA12C2A3EF9E7EA5899C3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202310160940','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6475918613359225',
  p_user_name                    => 'MOHAMED',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'mohamed@gmail.com',
  p_web_password                 => '76F1157E18AF5D189F0BA7173CA82F0CF92A7B28EAC188336E23795E530A70321C02C644DF6006283047A34FE6461D9510A8E8C42F28930AFE099AF40E4B6D7E',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202305291353','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17082411773064346',
  p_user_name                    => 'MOI_ADMIN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab@mannai.com.qa',
  p_web_password                 => '55C739CA149C8D3E0892A8251E52DC8BA1F30D04E67CFAA419E0304BD53B81307FA675C9DED4B8F834D58833651AB64E9F3F28294736334FB764340BC90E3C12',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202502190930','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '3153008766494735',
  p_user_name                    => 'MOJ_REG_EMPLOYEE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'moj_reg_employee@mail.com',
  p_web_password                 => 'D5F2D056671D110DC634C05185B45F4FDEAF37242B9924094C3DFA59EA55E13D792E8AFD5B20DED94B4BDE0B02D8899D89CE091C98BF76A21586AFA130617B0B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOJ',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202407251312','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 1,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6261376903540868',
  p_user_name                    => 'PAT',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'PAT@gmail.com',
  p_web_password                 => '557CE1455A78230073CFF34C8E7AA88395A7620CAD72DEE92A3C1A71B7C269C17A40B43A241070FFA1F42F17B4A8DD31920FAA0B1D1E3694E6B93070B727CDA2',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202305291145','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24413311181794806',
  p_user_name                    => 'PAT@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'PAT@man.com',
  p_web_password                 => '5EC96580E3BCE2D8CAE1B73B864F2F34356BDA06EBC4AA17A1FBA1563347A696DFF74BAF6001CAB6EE70F33E67E26A5115D49135493F0BA4683C665E0E866EF3',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17082899431066960',
  p_user_name                    => 'PREPARATION_USER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab@mannai.com.qa',
  p_web_password                 => 'B7C75F728F7B1C81E3BE8904BC25A9617BF55AE1DA24229DEFD05878720243DBF10DC4C9601A9A10CEAB9E2CAF3F20F1C057AF5E7CCCACBEE6077078C52B8FDB',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503031133','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24417709952800964',
  p_user_name                    => 'RAJESH',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'RAJESH@man.com',
  p_web_password                 => 'C722EDC508870AFBE125C983ACCD22FF855657C58D853694A0C656DE5C0B5C50B5F0D27B31A10F0BC940F83791B46B68189996EF2DD58D8EA410D75401683136',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402271951','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24414947354794979',
  p_user_name                    => 'RAJESH@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'RAJESH@man.com',
  p_web_password                 => '6A10D31493528DBEC2961E5488ECD6C07E819D8D8BB62FF6E33C0C6E6BF35E3BC84A5A622C933F615BD8EF5F0265E4EEBEA7EFCB326F3928C0B49176AE8E5BC4',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24415773345800743',
  p_user_name                    => 'ROBERT',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ROBERT@man.com',
  p_web_password                 => '6B3494A63705F407415A54745E55A2DA2389DCD66B8EBF4260B6CA9BCB0AF176317EBED6F37507A4F9547B073D970AF20FAAB89A6D0E59B44850CB5BF0A4692F',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24411709316794620',
  p_user_name                    => 'ROBERT@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ROBERT@man.com',
  p_web_password                 => '86B4C8D7D4C66898314FFCA6E18B59B86DE27E9E94DA7F8CD63A9CB96256F7608078AA960D44B33B0E671FEF6D7AB758CB239D3D4218014E53AEB1D92B43BEA7',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '7000536582580057',
  p_user_name                    => 'SOPHIE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'SOPHIE@gmail.com',
  p_web_password                 => '43171E1670A91A63FB59E8277D992C94544374D8B8201BE7DE5C73D3F00B716EAB9EF6C210B7FFF464D8F12673FEE573344D456713BE8BC895B1EF7800B5793B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202302211016','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '6261539806540910',
  p_user_name                    => 'STEVE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'STEVE@gmail.com',
  p_web_password                 => 'D3AB18CCD0D16D1C84EE064B04E266CCEAD01E3275FE8DE17AFD374003D3C2B03D0BDE7ED78FD7FE0441E8920E0C34BE33307A47F8ABBB889E2328643DE07A29',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402271048','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24415381855795026',
  p_user_name                    => 'STEVE@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'STEVE@man.com',
  p_web_password                 => '505E8B70841F77C39478A6C4D339E6A8D450CCB36EAD95A2620B746F7148646DFC427E8663C0653F7D56D4ACF95D95BEA93AAC781402396E8A158AA6AA8C754A',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17083271494070931',
  p_user_name                    => 'STUDY_USER',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'ahmed.ragab@mannai.com.qa',
  p_web_password                 => '48CDDA3A20C8EC6396EF99531BDCB8F11F9EE45B86C28767DF4FEFBF2328FB05F1160D24DC78B05B47E42409ABD2A3CC05B46B7F5D21E2254F42BA0F4AE944FA',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503031133','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '18219047517297312',
  p_user_name                    => 'STUDY_USER1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'study_user1@mail.com',
  p_web_password                 => 'F97ABF964AF39F0D38ED44957D8D8EFAE6C43CA0CEB48DC39627861A606F471F736B1B6CD2C20ECA9EDA9359B55CAA41584216B3A9F3FDFB4ECDA82C2A391B4B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MOI',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202503050914','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24416979464800879',
  p_user_name                    => 'SUSIE',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'SUSIE@man.com',
  p_web_password                 => '65E2486D4A204352DC8B0575D0EAB12FD294BBACF4B0EEE6A9488C134DD14530429FA3ED632DE5A846C0092C758D04AE918F7B76B8A81DA2422CDE047EFB9B02',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '24414179451794892',
  p_user_name                    => 'SUSIE@MAN.COM',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'SUSIE@man.com',
  p_web_password                 => '144F30DD2221874167EA0780191C39B84CFBE7536F26B8A488FE3F0198A9AAFD434EB9304D2D1E4C625705BEBBED2873BF66B6A2F52E036668C858EC3E36ABF7',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202402270000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17281410113293151',
  p_user_name                    => 'USER1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'user1@gmail.com',
  p_web_password                 => 'DEEDECB02DA2731967C9BCDE796DFA2ED8BAE628CA2ABAB54B8DEC3C9DC2DF29ED5386C10F023D4890A041CEF69C75258DEBF3A164B018EF476B6EE2A6D00323',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202305150000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '17281680531295404',
  p_user_name                    => 'USER2',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'user2@gmail.com',
  p_web_password                 => 'A4453AB4B6A5A1415BFC58F7844B13F8F60831F8592E5B562A9B974ED35990ECBF378BC57C5DF5A99C4FA4034E22C9054513F44F02782B6F693287BC8A4A7E8C',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '4000104385498759:4000287511498762:4000338159498762:',
  p_developer_privs              => 'CREATE:EDIT:HELP:MONITOR:SQL:MONITOR:DATA_LOADER',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202305150000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '20244590766141551',
  p_user_name                    => 'USER_API1',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'a@mail.com',
  p_web_password                 => 'F16A1262A9F29BD46959A25DB933E4131FF541478B237C4836753DF1F1DDEEABD8674E0FB2A86AB19F0FF405AB6A88569C6E18040CEA6B561B500732B799E73B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'HR',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202504200000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
---------------------------
-- D G  B L U E P R I N T S
-- Creating Data Generator Blueprints...
----------------
--Click Count Logs
--
----------------
--mail
--
----------------
--mail log
--
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30128810607815545,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403251152','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30475366203106071,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403272301','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30476892468108200,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403272301','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30532800113141989,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281013','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30664153770319075,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311342','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28490619042106389,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121411','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28493404601123406,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121414','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29657292158733256,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211312','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29663523778740109,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211313','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29669822057744870,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211314','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29676826705757984,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211316','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29888246451474670,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403221329','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29889765956476781,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403221329','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29918864064749187,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403221415','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29982223602025589,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403241127','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30354172818986003,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403271134','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30355694665988232,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403271134','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30535129295148017,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281014','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30677589497349121,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311347','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28482848555055082,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121403','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28638692938599437,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403131347','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28755081908474650,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403141139','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29076444311628648,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191055','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29275430729721287,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403200923','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29277950797723087,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403200924','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29917330595747156,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403221414','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30370658067051737,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403271145','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30807561037715901,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30952691879411393,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404061301','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30954398231415321,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404061302','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 31110666649894054,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404171415','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 31112345864895950,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404171415','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28469673704017606,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121357','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28701323492088076,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403131508','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28859998966825565,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181514','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28863997762826223,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181514','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29043882402365078,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191011','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29169965184125206,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191504','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29270728358683145,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403200917','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29373132094003042,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211110','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29380745193017254,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211113','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29388386785041390,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211117','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29394500121050903,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211118','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29403551902067504,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211121','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29410260027079918,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211123','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29416844240097260,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211126','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17492464627088204,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501011656','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17435618442887301,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17566764738417215,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021031','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17570816446459631,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Rejection Notification for Agreement No: AGR-2024-305',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501021038','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17573564828582765,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021059','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17575539245587996,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021059','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17578083629605265,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021102','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17583941993687404,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021116','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17586278511758248,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021128','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17588317747782454,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021132','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17590498687795518,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021134','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17592573796800289,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021135','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17595097497811668,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021137','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17605941172929417,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501021156','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17802525537373000,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501040937','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17809963326405515,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Rejection Notification for Agreement No: 300-2024wqw',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501040942','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17814561940454990,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501040951','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17817926376460178,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Rejection Notification for Agreement No: 300-2024',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501040951','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17821816400471625,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501040953','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17826242091502454,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Approval Notification for Agreement No: 300-202433',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501040958','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17859671541646712,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041023','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17863975490856951,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041058','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17867557056932075,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041110','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17870604129981226,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041118','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17874365255999156,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Approval Notification for Agreement No: 300-2024',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501041121','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17879824385836128,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041341','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17882091935892750,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041350','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17883063695904379,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Request for Information Regarding Agreement',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'STUDY_USER',
    p_last_updated_on => to_date('202501041354','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17885745497913868,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Approval Notification for Agreement No: 300-2024',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501041354','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17892419461231825,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501041447','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17119266089761807,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17126706889814582,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'Approval Notification for Agreement No: AGR-2024-300',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17128339083822176,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17131413037849931,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17132302069856953,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'Request for Information Regarding Agreement',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'STUDY_USER',
    p_last_updated_on => to_date('202501261726','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 17496936892136501,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Request for Information Regarding Agreement',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'STUDY_USER',
    p_last_updated_on => to_date('202501011705','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 22766241451571332,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202504031228','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 26565497795730715,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202504051022','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33405116769461715,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33404498658438126,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33401840468064564,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33405307041464237,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'HASSAN',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33405867293490118,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'HASSAN',
    p_last_updated_on => to_date('202406182118','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33404868177454176,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33405934689491673,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202406182118','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33404956848456215,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'HASSAN',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33403441436176693,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'HASSAN',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33404296442436190,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33404680936442110,
    p_mail_to => 'ali@mannai.com.qa',
    p_mail_from => 'hassan@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'Travel Request has been Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'HASSAN',
    p_last_updated_on => to_date('202406121356','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33405531956487753,
    p_mail_to => 'hassan@mannai.com.qa',
    p_mail_from => 'alieee@mannai.com.qa',
    p_mail_replyto => '',
    p_mail_subj => 'New Travel Request has been Submitted by ALI',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'ALI',
    p_last_updated_on => to_date('202406182118','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12622642326127350,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12625152159127456,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12607684294126425,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12627682537127557,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33032486842107367,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405121057','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33130499117983406,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405141810','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33609006477450542,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405161047','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33069665035404139,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405130714','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33067955554400968,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405130713','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33028025728104856,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405121057','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33034975661109407,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405121058','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33030614779106093,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405121057','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12620165589127234,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12617652218127070,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12615173071126846,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12612613282126629,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12610162168126525,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12605159026126328,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12602685833126201,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 12600165996126129,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202411091612','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 8236104011381060,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202409011117','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 8234605502380920,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202409011117','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 33036400853110415,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202405121058','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 8111695685279540,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202408291334','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 8162132302560612,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202409010901','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29426419296117229,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211129','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29491845269272320,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211155','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29506102689502037,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211233','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29523213359545309,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211241','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29541875423570028,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211245','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29563554196605109,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29566564273605579,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29570506397609006,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29606349456687848,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211304','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29612363890691439,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211305','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29618618370697139,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211306','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29631244903710360,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211308','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29644676115723631,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211310','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29682855745779646,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211320','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30126372147811590,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403251152','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30555567427429153,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281101','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30557164787437301,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281103','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30563949542453964,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281105','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30565533843455964,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403281106','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30809265984721954,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311613','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30815629813733906,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311615','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30817301322737818,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403311616','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30849239812067229,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404011237','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30850993917075321,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404011239','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30986118655296156,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404071055','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 30987737681297845,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404071056','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 31076992621153334,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404161358','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 31851453672040946,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202404240906','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 3176472031987314,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202407251433','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 3178944779987576,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202407251433','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28474656679027662,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121358','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28479575299035118,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121359','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28487364620060984,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403121404','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28635946553593709,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403131346','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28830723393464553,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181414','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28858497039707859,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181454','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28861462035825909,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181514','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28871919326835060,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181516','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28875171822835796,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181516','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29033354724335610,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191006','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29037225083352240,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191009','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29041092745358254,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191010','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29050265972381217,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191013','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29072888942596104,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191049','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29120032816853876,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191132','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29122547585855004,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191132','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29124263496856145,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191132','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29138288461965778,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191151','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29139777766965982,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191151','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29142453508984434,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191154','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29145275009985642,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191154','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29147756378986295,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191154','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29149267243986520,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191154','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29192860522042559,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403192310','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29221899022349184,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403200001','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29483133172257764,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211153','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29485652645262854,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211154','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29499284141481203,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211230','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29512960643512109,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211235','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29515409017527643,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211238','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29516938509529825,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211238','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29530277811558157,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211243','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29548593679591584,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211248','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29555238756596921,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211249','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29560555721604426,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29562022008605012,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29565020330605223,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29568057204606281,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29576760651619900,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211253','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29585092750637735,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211256','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29592462120657125,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211259','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29599206266679493,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211303','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29624948151706129,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211307','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29638334941717170,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211309','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28829204404463429,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181414','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28838652486675121,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181449','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28840322590676242,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181449','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28866424281826770,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181514','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28867934528831173,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181515','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28870436518831392,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181515','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28876613682836132,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181516','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 28879823229857340,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403181519','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29160503253327479,
    p_mail_to => 'user2@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191251','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29172692569133312,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191505','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29175715892139814,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403191506','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29650984935728328,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211311','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29686679650930464,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211345','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29692613457938850,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'MOJ Office Required',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211346','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29694196471962014,
    p_mail_to => 'user1@rag.com',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Approved',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211350','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29743527644016075,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403211359','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 29980520075020750,
    p_mail_to => 'user1@rag.com ',
    p_mail_from => 'user1@rag.com',
    p_mail_replyto => '',
    p_mail_subj => 'Sell Property Request Rejected',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => '',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202403241127','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 26570628525754243,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'Approval Notification for Agreement No: 77798',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'nobody',
    p_last_updated_on => to_date('202504051022','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 27197161855176500,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202504051022','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 27203029856260832,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202504051022','YYYYMMDDHH24MI'));
end;
/
begin
 wwv_imp_workspace.create_mail_log (
    p_mail_id => 27246760262076843,
    p_mail_to => 'ahmed.ragab@mannai.com.qa',
    p_mail_from => 'no-reply@manoracle.com',
    p_mail_replyto => '',
    p_mail_subj => 'New Agreement Registered',
    p_mail_cc => '',
    p_mail_bcc => '',
    p_mail_send_error => 'ORA-29279: SMTP permanent error: 530 SMTP authentication is required.',
    p_last_updated_by => 'AHMED',
    p_last_updated_on => to_date('202504051022','YYYYMMDDHH24MI'));
end;
/
----------------
--app models
--
----------------
--password history
--
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20127951950847298,
    p_user_id => 4400422917412592,
    p_password => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20244619135141581,
    p_user_id => 20244590766141551,
    p_password => 'F16A1262A9F29BD46959A25DB933E4131FF541478B237C4836753DF1F1DDEEABD8674E0FB2A86AB19F0FF405AB6A88569C6E18040CEA6B561B500732B799E73B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 1975024061597529,
    p_user_id => 32637528166644134,
    p_password => '6C98F6AC511A22CC8F9CD411AC50E0E32630F75D4A9AA33CFDB54BF94C010F491073B239E71DC1B627B9AD2EE0FE3BD6DD86EA34E5100323BF2881750322FA37');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 3152038575482156,
    p_user_id => 26775621950088995,
    p_password => '55D916E938B7581360660BE3FC21F180D171603F79C377687C7A95452FB809C6EC3FEAFCB7362AE37BC84FE43F558B1D3C4198FF00C3918C4E60A863E2C7C38F');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 3152445724484543,
    p_user_id => 26775621950088995,
    p_password => 'BDFE4816B709A8E88F798889CBF0B51A22D80357E1D567EDC1A3D557B14199C2C505424DBA04F3522C84F76C2A1C6D06A7A2C56E6CDF6B298A5B37A19DBC81D7');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 3153129826494760,
    p_user_id => 3153008766494735,
    p_password => 'D5F2D056671D110DC634C05185B45F4FDEAF37242B9924094C3DFA59EA55E13D792E8AFD5B20DED94B4BDE0B02D8899D89CE091C98BF76A21586AFA130617B0B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 8050956150302564,
    p_user_id => 4400422917412592,
    p_password => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 8109612532274554,
    p_user_id => 32637133361640051,
    p_password => '6BAAC77AD19521AE858FE0482B4E0A7969F4750BDCCA3643D2E5C833F9100236900CFAD94C8DC73406B482251873FB38953CA8E65ABAC34476D524AF8357C6C6');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 14831869776347464,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 14832236765355348,
    p_user_id => 6475763412359198,
    p_password => '3809CCA75B0E48295B40D12FDCCEB634A8351D2AE7C2D19069ED9DFAF590CDEFA0E560EEA481768A47DFDE898E6ECBB956BCECD3E298C7663F2A089AD3E6E2A5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 18219144689297345,
    p_user_id => 18219047517297312,
    p_password => '38C57B52047D9BD612994C805790803F47C8C276DBB462EEDC2EDB034145218D08C9FE200FB5F5353087558326F65E6CF8C04B4D9AEF8762FE46E48F289CF645');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20705431614712306,
    p_user_id => 17082411773064346,
    p_password => '55C739CA149C8D3E0892A8251E52DC8BA1F30D04E67CFAA419E0304BD53B81307FA675C9DED4B8F834D58833651AB64E9F3F28294736334FB764340BC90E3C12');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26566584692742192,
    p_user_id => 17083271494070931,
    p_password => '48CDDA3A20C8EC6396EF99531BDCB8F11F9EE45B86C28767DF4FEFBF2328FB05F1160D24DC78B05B47E42409ABD2A3CC05B46B7F5D21E2254F42BA0F4AE944FA');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26567519778746653,
    p_user_id => 17082899431066960,
    p_password => 'B7C75F728F7B1C81E3BE8904BC25A9617BF55AE1DA24229DEFD05878720243DBF10DC4C9601A9A10CEAB9E2CAF3F20F1C057AF5E7CCCACBEE6077078C52B8FDB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26569017372750473,
    p_user_id => 17081697512056284,
    p_password => 'D5DDD8BC29C3DE8D0226DAC8367CDA3397881EBEAB361072BC3A0AE58332B0B161062B29CAA13F05436F6B3C4C2300BE1B192FEEF13F6A11329693CA272A6E69');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26569132009751951,
    p_user_id => 17082018707061139,
    p_password => 'A7C8CAB6E1D452BF359397A21DFB5E593B0AE7337F7D53AF83C2BB370DB129A5316AB2FD0A52DEB6F90DDF9F07B01D89281F6E84F2306AAE2DADBEB3FF7CD823');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26763697482283804,
    p_user_id => 4400422917412592,
    p_password => 'F4F89FBE14368E20D842D4D778927AB1DBCF377F48F09F71AAE845D0FF54BBC802ABF666B970DDE3F2E3CEB0E08658FA92749FF82C36AD1CAB697ED844B381E9');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 27198323987190556,
    p_user_id => 18219047517297312,
    p_password => 'F97ABF964AF39F0D38ED44957D8D8EFAE6C43CA0CEB48DC39627861A606F471F736B1B6CD2C20ECA9EDA9359B55CAA41584216B3A9F3FDFB4ECDA82C2A391B4B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 1983349398637160,
    p_user_id => 32637133361640051,
    p_password => '6BAAC77AD19521AE858FE0482B4E0A7969F4750BDCCA3643D2E5C833F9100236900CFAD94C8DC73406B482251873FB38953CA8E65ABAC34476D524AF8357C6C6');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 2435456356511537,
    p_user_id => 6475763412359198,
    p_password => 'E20B298FB04162966746768B5C2A8812912D0A2BDDBA640B77469EE41B9E19EC16984ACC1A617ED18E2C00A52EAB40E0D1AE0C9377BC63D14DED19699EB8CF99');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 4397602612780206,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 8148226390412375,
    p_user_id => 32637528166644134,
    p_password => '6C98F6AC511A22CC8F9CD411AC50E0E32630F75D4A9AA33CFDB54BF94C010F491073B239E71DC1B627B9AD2EE0FE3BD6DD86EA34E5100323BF2881750322FA37');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 8150185394457409,
    p_user_id => 8150071668457354,
    p_password => '8D3F4876908C1EE2DC50D5E4BB75F42D4A3B3DB87ED093D0638892A930AED99353119118855637B20C7030781524292AE4663C7757116C0A91C57EB5BEDFDAF3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 10094684748092867,
    p_user_id => 6475763412359198,
    p_password => 'E20B298FB04162966746768B5C2A8812912D0A2BDDBA640B77469EE41B9E19EC16984ACC1A617ED18E2C00A52EAB40E0D1AE0C9377BC63D14DED19699EB8CF99');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12597210799103712,
    p_user_id => 4400422917412592,
    p_password => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 28438184130859312,
    p_user_id => 4400422917412592,
    p_password => 'F90A624C6BE0260976B34F845DB36C27D7542C39E7CDA70F81B41B54B358E16924DE9B6718F8CACEA9DAB4550B1EB4C18644F25E17517DBE0B43CEB58D72AD1C');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 23222144478045950,
    p_user_id => 6044857346794953,
    p_password => '108D4500C71D56BBEB027AE328F4B6AE703C8596135BC2A563FA26BD1B29A5289713D5164AF3D0BFFC34E3A8573342DB77358A2A04CB1D7E7C97506F56DF4B34');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24418927155827546,
    p_user_id => 6261539806540910,
    p_password => 'D3AB18CCD0D16D1C84EE064B04E266CCEAD01E3275FE8DE17AFD374003D3C2B03D0BDE7ED78FD7FE0441E8920E0C34BE33307A47F8ABBB889E2328643DE07A29');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29176715914400259,
    p_user_id => 29151411725306240,
    p_password => '4E7E699CDEEBCB67EBF01D48C289F74A340821DB6E8426258223970B4391DD9AD317EE373093E26FD69E360502609E3FE412D0723B17488B1A28388D9FC55FF6');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29176849268406325,
    p_user_id => 29151830737306287,
    p_password => '3E083DB4E883E6F05A4AE8B7A19C849A69A1E851C303E9C5FAAF6721E24D963F077F46233C4A6870965CD4C95FE37773463E8FB4500029F07B40E3DA14C692A3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29177091892413759,
    p_user_id => 29152681560306398,
    p_password => '8C6A9437F0DCFCAD3F5CEACE1292A68C50B095B6D8512D9338A14F146C0299B1A5741FE893778B64AECD7ED38206D5F1F5458B728F64873CB2280C3D3FCE0308');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 33133359352044148,
    p_user_id => 19982862531782581,
    p_password => 'DB11EB3517F4E30F51F00C0F505549BA9C84D10F985D3704477A313E82C3B52F0902ABC18D2315DE857F7E75FCF8432D013C44D2B5006F11B83C78AD11939787');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26496231120538373,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 28437576886842259,
    p_user_id => 6475763412359198,
    p_password => '98811351F968607DE268C358365573E9D78BCAE5D09BF0F13F2D602EDAE9FDCF1184C9C0E91B809C28BBF07D7F1B038712548E6203F7290F4765CF2156CB2BF9');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 33402518165171004,
    p_user_id => 19983235991784342,
    p_password => 'ADDB296D743FF825BAA56F287D3788BF0524AFC37FF8454093C60BA7CB033EA89CD6542D75080B825BA7FEB2BD7F671A7CC6A27E92B3FE2ABA07069A4D4DBE61');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24415867688800790,
    p_user_id => 24415773345800743,
    p_password => '6B3494A63705F407415A54745E55A2DA2389DCD66B8EBF4260B6CA9BCB0AF176317EBED6F37507A4F9547B073D970AF20FAAB89A6D0E59B44850CB5BF0A4692F');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24416241415800834,
    p_user_id => 24416119358800792,
    p_password => '91AB065A68F3C80AF5E2CB67E458FA409A0680DE8D64D59E0E6ABEAB77C8B9A686D8914D813CF7710524CB0F3AA3F2120111DC723171B74E0823E6DACF247772');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24416633121800878,
    p_user_id => 24416591318800834,
    p_password => 'B33870930DE822600F0D7ABF5E4BF5571246EBA3FAC7978A356ABAEAF9DC9E99461CC0387074348B5C8BB07625497C5A9C926EEFC5A75E0F90F454717D9FA7FA');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24417052915800921,
    p_user_id => 24416979464800879,
    p_password => '65E2486D4A204352DC8B0575D0EAB12FD294BBACF4B0EEE6A9488C134DD14530429FA3ED632DE5A846C0092C758D04AE918F7B76B8A81DA2422CDE047EFB9B02');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24417491913800964,
    p_user_id => 24417395623800921,
    p_password => 'ECF2D887169F9ADA70E3AF4BC92E7AACF733DDB8B43DC9E645DB2B7A7CEAB52B95487D8FA87D904A74AE9C0B880441EC9D1E271DA132B753CFA229BFDE3330D3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24417860639801010,
    p_user_id => 24417709952800964,
    p_password => 'C722EDC508870AFBE125C983ACCD22FF855657C58D853694A0C656DE5C0B5C50B5F0D27B31A10F0BC940F83791B46B68189996EF2DD58D8EA410D75401683136');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29176972857409771,
    p_user_id => 29152251239306342,
    p_password => '2F844AD85F404120637BFC59192E308086A0A8D53892D0D1A3AB7E0F8BC1CDAE578C50218CD58DF0632B5BF558E60539EF67BBF4842E9159FA7B6E2B77D007D6');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 31846679520033651,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 32023275197108206,
    p_user_id => 4400422917412592,
    p_password => '0B9108B5774893CC511EE3D2E0D5ADD20AA3BC04086E09CDA3CD2184F15F9731E68AEADF5F968AD7932066584E611847D3C47A7C3C25C4C856685746D8661F6D');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 32689348284886951,
    p_user_id => 29151411725306240,
    p_password => '4E7E699CDEEBCB67EBF01D48C289F74A340821DB6E8426258223970B4391DD9AD317EE373093E26FD69E360502609E3FE412D0723B17488B1A28388D9FC55FF6');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 36023230379261343,
    p_user_id => 4400422917412592,
    p_password => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29151581492306285,
    p_user_id => 29151411725306240,
    p_password => 'F5568299C2B60D0EFFBDEA7C4BD05FB7892259097D0D78D08246124C3BDAC6ADD324442B938E81FFC3E24810B5D46A31CE2D5F7120C1C0C93761ADC2DA305FD2');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29151938734306342,
    p_user_id => 29151830737306287,
    p_password => '3DAAA956144F2E7963AF76EBB898277DEBB0ED38656F7488A368DD232D8A9AAD8FFB7BC84E7CEA3ACAB056EC9FD0E991294AEBA9B6220B38E4BA4BDF359C5A92');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29152336105306398,
    p_user_id => 29152251239306342,
    p_password => 'F6D2CCAD8A102FAC4EE6396E39CEAE50CC4A9C7DEFF5020CBBC4468792611C0EAE1DE5B0144D0FB9DEDBFBF9F16DA41D97D9FCD97CB66DD5D49202414BACE4DF');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29152770498306450,
    p_user_id => 29152681560306398,
    p_password => '95EFDCEF6B4AEC59BC87D8B609CB415AB9099E90E93B75909DA72FC8A5343D31EEC60DC66295BF588744BB81234AE8E1D7938A02601379A39037C2495D9064D9');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 31846480949027607,
    p_user_id => 26775621950088995,
    p_password => '596C9A50C125727BE6E5673FF22546458C3856593736098E345F177A54A6B934434F95B8C5E444F9150359A085F657CD01D6748CDB61FF64B79CB632E1F2D7FB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29153107821306506,
    p_user_id => 29153049804306450,
    p_password => '4A338EF8C3F020DE726EA5AC549BBA092BE33893BC44BD031C4235C1D2E9D66DD7D3D4DE6C023D1E9942B73FF1BD357ACBA9FEBE42697C087D6DD3B73991CD49');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 29154187863320145,
    p_user_id => 29153049804306450,
    p_password => 'D0C0CCCB08E2CCAFE3FA62D2FA5B66D92310C40E0DAF25849E9BFACA174BD632C74DFF9B9D9CBAB677190125D1C6CAED84517A2874D66448E31ED5821D3B0F1C');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 32637278028640079,
    p_user_id => 32637133361640051,
    p_password => '35BA0B79C18467D166A30FD64B7AD2EE836A96F362405F8F9597C1E0DEA1C40402031C6A14AA812398C36F2A7E0985B3CD0E2DDD2CB7069765FF38008B6431E1');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 32637619210644162,
    p_user_id => 32637528166644134,
    p_password => '48A066C906DEA2A4E359DC1AA32EB295C391D6BA5F2C39090A9E31B7128DFAA54D0B315227B406DE5064C0B7CD8D43868E9A9976FE3971B5D2B3BAB2906A6CE5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7000649585580079,
    p_user_id => 7000536582580057,
    p_password => '21E7F4D08584C8041AC3031DA12BD8DE22C03ABE7B37E8D4DFE4B9BDBCA82487B78E07AB8F8540E9F4E4E1B620E8B038D2ADC34AE08AF77237D21DDF4B0F5356');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 34639434551744037,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001086269580121,
    p_user_id => 7000949945580101,
    p_password => '571205FC44F82D0D02E50022F309927E1A56A572BAB83260E63AC9D537F1EBF89B7E1C0E2EDB8358BA1A78E80CD5AAD72E8AA9DD6480092881B88B6661EA3BF4');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001290827580154,
    p_user_id => 7001157661580121,
    p_password => '01D8534744B98FFE1C2341D1222A256F78B4EFAA68DC3AC6D3232B60115A47ACFFAE06A360B52F6CBCD8DB923BCDC52EB1F28D2A0A289A473A471663E2D4A590');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 27517990239446759,
    p_user_id => 6475763412359198,
    p_password => '3F10099F4B8B0AD4088E6A09C213ABC6362B0992D33FDE688C63B9CB2EF9533040D12A8883295F4182AF34C70E5C9BA3851E915499D983D9CE6EEEA63B012614');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 11804315386301690,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12803547445068387,
    p_user_id => 12803419185068235,
    p_password => 'C37BABD573E07A38F62D48D3C68BE97A315E970305CA864F8ADEC4F60B97A645B82B6C4F8C49C9EE95FAE1DE7CEAB64A94E98709E7A85364D20BF72D0676301B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 19983318366784367,
    p_user_id => 19983235991784342,
    p_password => 'D9AC054C8A5E745D333EAEE2C4D763155376B5F58EC4494CBD9D84FB47F92383BA0DAC78AD0F0982C5F6F6793010D425A2BE48BFD88F9176685DF63923E3AFA0');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7000836703580101,
    p_user_id => 7000775126580081,
    p_password => '6D417F0A302ABEDDCF4FD5F0E403FE186715DF48451717EDEC61E1D73C6C7D3477E65DAEC4F7E59254EF873750DCE31E4A5B2FE773E5418DBB604A5CA18DF109');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 18840418230596865,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 19978926391722143,
    p_user_id => 6475918613359225,
    p_password => '76F1157E18AF5D189F0BA7173CA82F0CF92A7B28EAC188336E23795E530A70321C02C644DF6006283047A34FE6461D9510A8E8C42F28930AFE099AF40E4B6D7E');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 43857249028403304,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12473054591669701,
    p_user_id => 6044857346794953,
    p_password => '0BFA2F800534423CD7C51C82FBC9A88350F972EA65395940D51DB426D0145DFF0438AC12FFC54C75CD9D86E208CDC7E2A70B1153CC6576EF69E2EB74A6FE432C');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 11535162356021557,
    p_user_id => 4400422917412592,
    p_password => '2247D5EBAB8E285D64CC300736C17C811DB5472AC8EF3044720AFDB968E480ED6342581523D07C62542E22B449631065D667A92F0FC8BABFBAA9879754C0D70F');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12472037057652998,
    p_user_id => 7000949945580101,
    p_password => '0BAA629EEF6FBBBBFFB91DBDB3CDAB4EF2545409C2B936B3344718FE93679B198F44B2DF891CBA6D351ECD84C38BFAFCA3620AB10B0A18DB0D6C06581B90BB75');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 16013680853272295,
    p_user_id => 6475763412359198,
    p_password => '3F10099F4B8B0AD4088E6A09C213ABC6362B0992D33FDE688C63B9CB2EF9533040D12A8883295F4182AF34C70E5C9BA3851E915499D983D9CE6EEEA63B012614');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17281550734293176,
    p_user_id => 17281410113293151,
    p_password => 'DEEDECB02DA2731967C9BCDE796DFA2ED8BAE628CA2ABAB54B8DEC3C9DC2DF29ED5386C10F023D4890A041CEF69C75258DEBF3A164B018EF476B6EE2A6D00323');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 19982545429780906,
    p_user_id => 19982441359780875,
    p_password => '916B92B9E235C2941D29FD359C149EFEAE4737E6D25DE37174BC0BBB026AE63CAAAD2C1A77DD0B4183265EC356E3AD1A8338AB7E772869AA36154424D31F4183');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 27518072472449109,
    p_user_id => 19982862531782581,
    p_password => '5B83FFF835C458163568192ADD3F75C596FA4D8E88C77081BF9EC6AAE83D619CB2837196996360BA035E612B9A16905610468B72994AAF608DF01DE366052608');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 52648397145029218,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 4400887528412657,
    p_user_id => 4400422917412592,
    p_password => '2247D5EBAB8E285D64CC300736C17C811DB5472AC8EF3044720AFDB968E480ED6342581523D07C62542E22B449631065D667A92F0FC8BABFBAA9879754C0D70F');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6044953716794992,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6475853403359225,
    p_user_id => 6475763412359198,
    p_password => '3F10099F4B8B0AD4088E6A09C213ABC6362B0992D33FDE688C63B9CB2EF9533040D12A8883295F4182AF34C70E5C9BA3851E915499D983D9CE6EEEA63B012614');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6476022931359246,
    p_user_id => 6475918613359225,
    p_password => '76F1157E18AF5D189F0BA7173CA82F0CF92A7B28EAC188336E23795E530A70321C02C644DF6006283047A34FE6461D9510A8E8C42F28930AFE099AF40E4B6D7E');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001311785583976,
    p_user_id => 7000536582580057,
    p_password => '43171E1670A91A63FB59E8277D992C94544374D8B8201BE7DE5C73D3F00B716EAB9EF6C210B7FFF464D8F12673FEE573344D456713BE8BC895B1EF7800B5793B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001456940586035,
    p_user_id => 7000775126580081,
    p_password => '6F3C92FB775F26C5A189C97938BEF8C9FF1CC9A76B00C981D7BE8C66B4661F11DFA55137B4BE477D19CCF1B38DE30BC8956C716A685FA12C2A3EF9E7EA5899C3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001551681587526,
    p_user_id => 7000949945580101,
    p_password => '0ECEAEF4702E9D9989D80696829528FC404CB2A57EFAF9B041DF48E586BDADF6040E95E80992FF5E33354768976B0A9230956C8181DF50ABEC22DC181EC4DF93');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 7001627475589542,
    p_user_id => 7001157661580121,
    p_password => '242DD3498B661F64583CD51C6FFDE07180F653DACBC2D006FF394C2920D8AE2BB098D53B7A38610048471C59DF916B7D04176EEF22FFD9E82C5BB5D8C8A13FC3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12473492803677657,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12471973125650171,
    p_user_id => 7000949945580101,
    p_password => 'DED7862354A502FEC79C174E3D3B28616FCC991A29A4D62C799F47EABF6E16A37A9F91E8C6DB92664375D7D4C6F4FA810A811DA404126D1F9E7EC205024D78FD');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12472625539668440,
    p_user_id => 12472542295668414,
    p_password => '88A13F1AC29F8B96A28A3E55589B3BDEB665F8CB10E686FC8215690306951A8D9E7B30691FA4705602D2F22FD08048EBFF5705BBF891AB24E7CA61CBE5FA778D');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17281796427295428,
    p_user_id => 17281680531295404,
    p_password => 'A4453AB4B6A5A1415BFC58F7844B13F8F60831F8592E5B562A9B974ED35990ECBF378BC57C5DF5A99C4FA4034E22C9054513F44F02782B6F693287BC8A4A7E8C');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 39857978170139609,
    p_user_id => 19982862531782581,
    p_password => '5B83FFF835C458163568192ADD3F75C596FA4D8E88C77081BF9EC6AAE83D619CB2837196996360BA035E612B9A16905610468B72994AAF608DF01DE366052608');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 39858018729145818,
    p_user_id => 7000775126580081,
    p_password => '6F3C92FB775F26C5A189C97938BEF8C9FF1CC9A76B00C981D7BE8C66B4661F11DFA55137B4BE477D19CCF1B38DE30BC8956C716A685FA12C2A3EF9E7EA5899C3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6261009730540825,
    p_user_id => 6260908518540778,
    p_password => '2F6F376CE3353BA9970BE0B855F51EC29D7E85B55FB724A264050BC7A31FF61CFF2922A4E812DC1BFA08A8F0BC49987AC9A9AD97BF20F49F82C22EE25BA9F07B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6261296803540868,
    p_user_id => 6261118458540826,
    p_password => '71B9F917F4755F74304DDFE1BB17020DD69E26C2EA8CF5B937FBAF737CED702FF0901B2188FD89624AA78D5F27B924982482FFB1D72108B22E25C37510F86F73');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6261415276540910,
    p_user_id => 6261376903540868,
    p_password => '557CE1455A78230073CFF34C8E7AA88395A7620CAD72DEE92A3C1A71B7C269C17A40B43A241070FFA1F42F17B4A8DD31920FAA0B1D1E3694E6B93070B727CDA2');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 6261676190540953,
    p_user_id => 6261539806540910,
    p_password => '38C3909DF7B7529FF1D479605D1D0B3B4AF8B93A5C8A74B910EDBD87C342C7D8A0474E522D047C9734E03CEFD2C80270DA2A953CA3D17793108F8CF0ACB1D37F');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 19655198797953601,
    p_user_id => 6261376903540868,
    p_password => '557CE1455A78230073CFF34C8E7AA88395A7620CAD72DEE92A3C1A71B7C269C17A40B43A241070FFA1F42F17B4A8DD31920FAA0B1D1E3694E6B93070B727CDA2');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 16832956954247304,
    p_user_id => 6475763412359198,
    p_password => '3F10099F4B8B0AD4088E6A09C213ABC6362B0992D33FDE688C63B9CB2EF9533040D12A8883295F4182AF34C70E5C9BA3851E915499D983D9CE6EEEA63B012614');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 19982991648782601,
    p_user_id => 19982862531782581,
    p_password => '5B83FFF835C458163568192ADD3F75C596FA4D8E88C77081BF9EC6AAE83D619CB2837196996360BA035E612B9A16905610468B72994AAF608DF01DE366052608');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 25639451126607014,
    p_user_id => 6044857346794953,
    p_password => 'A933A8009063C6EBE9B4C17A88C452D6CE14320DF8AE9FE4D46DA00A0CC9DCF28696992EB51FCE6180012C6A6BAE2710329D58B4EC9270B84B8A99BC72A4AEA5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 27519944134515935,
    p_user_id => 6260908518540778,
    p_password => '2F6F376CE3353BA9970BE0B855F51EC29D7E85B55FB724A264050BC7A31FF61CFF2922A4E812DC1BFA08A8F0BC49987AC9A9AD97BF20F49F82C22EE25BA9F07B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26977202818811045,
    p_user_id => 4400422917412592,
    p_password => '08B00813161D8727DCF0CE62C52C84C96C2CEA8291055104DA4EE4A9D2ECBF89D64D70BF8C8DD5D463E405DCA360951D74AEC59E235A4F484A7D3AD3F3FB6745');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24411864085794670,
    p_user_id => 24411709316794620,
    p_password => '86B4C8D7D4C66898314FFCA6E18B59B86DE27E9E94DA7F8CD63A9CB96256F7608078AA960D44B33B0E671FEF6D7AB758CB239D3D4218014E53AEB1D92B43BEA7');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24412229816794718,
    p_user_id => 24412192358794675,
    p_password => '143060E09472B0F9884D1FD02687FD273339237AC384CA5BF960EC05FD5A4433462990558C8DACBD05567E6A94532251FA96FFE322C7BDF45E8499FC10473F99');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24412690087794760,
    p_user_id => 24412534925794718,
    p_password => '9FFD070A005572F70C79BBC168F27D5A7182876C7B2229956EE8CC8D17B7D06D314A2050FF3A259B4DBC97C3F6499291794A259E101BA14763CA1B4219D69B16');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24413071100794806,
    p_user_id => 24412956208794760,
    p_password => '7463F7DD9851E08251AA73C3D9200AB99021351995DA3207ED64665B68EB0E4ABE5AA71C2928BF71454C709D13D93394F14DE0EEE14B0555883B57A5BA378612');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24413402740794848,
    p_user_id => 24413311181794806,
    p_password => '5EC96580E3BCE2D8CAE1B73B864F2F34356BDA06EBC4AA17A1FBA1563347A696DFF74BAF6001CAB6EE70F33E67E26A5115D49135493F0BA4683C665E0E866EF3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24413876800794892,
    p_user_id => 24413767266794850,
    p_password => '6B05130F2138BDA87905190FBDF6F14788F2A5DF76748CE2BAA6EA921E206E9B136741BA198B9F25B0EFF2BB1B184D6514372EA049A031942AA5146ADF237DA0');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24414213314794935,
    p_user_id => 24414179451794892,
    p_password => '144F30DD2221874167EA0780191C39B84CFBE7536F26B8A488FE3F0198A9AAFD434EB9304D2D1E4C625705BEBBED2873BF66B6A2F52E036668C858EC3E36ABF7');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24414633046794978,
    p_user_id => 24414517765794935,
    p_password => '623CC631B6E79D52E2D832210B8C95F7F2C4798499EDAF5A270E0DD701653983EEBF80B0FE3DD1CAA7D98BDC9EB90170CD4068322598FF2944E93C04B44C4B27');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24415014372795026,
    p_user_id => 24414947354794979,
    p_password => '6A10D31493528DBEC2961E5488ECD6C07E819D8D8BB62FF6E33C0C6E6BF35E3BC84A5A622C933F615BD8EF5F0265E4EEBEA7EFCB326F3928C0B49176AE8E5BC4');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 24415491406795070,
    p_user_id => 24415381855795026,
    p_password => '505E8B70841F77C39478A6C4D339E6A8D450CCB36EAD95A2620B746F7148646DFC427E8663C0653F7D56D4ACF95D95BEA93AAC781402396E8A158AA6AA8C754A');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 26775702623089020,
    p_user_id => 26775621950088995,
    p_password => '596C9A50C125727BE6E5673FF22546458C3856593736098E345F177A54A6B934434F95B8C5E444F9150359A085F657CD01D6748CDB61FF64B79CB632E1F2D7FB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 33133024040037329,
    p_user_id => 6044857346794953,
    p_password => '75B10855CE7BEC98036CAA45D36702F8E6611E674CED026343F9DC43C886BD119E02BDB4AE3FA108D73AF62B750BB7F8C0E958EE1432AEF3118A10879FE62F85');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 33403656306190057,
    p_user_id => 6475763412359198,
    p_password => '18B01838A67B80734988575327AEC5F10FF588E52310A8A1D461E1E67DA764BD2938573A5142796BC0E859388B672CD08D4B8CCB45BF840D2483CF59252D6366');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 2157870765559657,
    p_user_id => 6044857346794953,
    p_password => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 11263067501348642,
    p_user_id => 4400422917412592,
    p_password => 'F4F89FBE14368E20D842D4D778927AB1DBCF377F48F09F71AAE845D0FF54BBC802ABF666B970DDE3F2E3CEB0E08658FA92749FF82C36AD1CAB697ED844B381E9');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 12598089494123921,
    p_user_id => 32637528166644134,
    p_password => '6C98F6AC511A22CC8F9CD411AC50E0E32630F75D4A9AA33CFDB54BF94C010F491073B239E71DC1B627B9AD2EE0FE3BD6DD86EA34E5100323BF2881750322FA37');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 15597006388144851,
    p_user_id => 6044857346794953,
    p_password => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 16997040960393304,
    p_user_id => 4400422917412592,
    p_password => '60C334CE152011E7F2415B778E24CA6B188AC4E9C7302E8BE9E611DAFC590B2E74213DBF026A8AEAB41DB518D088B5B1694DC17A0320AAA0B7D0C2242CDA37DC');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17078675559965609,
    p_user_id => 6475763412359198,
    p_password => '5AF9A08E7DC34D2FFF2B0DD32F73BF5A8CC3F548EEA5CCD271F92BFF655324F7D6183982DB36B833872A445F7660B98F33660B62109390D17E5782D737B638FF');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 22764184293567192,
    p_user_id => 6475763412359198,
    p_password => 'F5038FA74D6A8264EB62CA1CB64B7F3B709DFD402957A5CA8F05785A77AAE94AF8A286C07293560C559D5ACF9922C36D87FCCEE892681CA4C3689A286887077C');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 27116026549832018,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 1891169682577312,
    p_user_id => 26496188963538346,
    p_password => 'FBF42BD1B5AF3BCE50BFA3AFB55653602412073C0DF37C50E8E228378A90562EA78E4E800DF6617D8A56E6A3B724FD850057DA9E923BE2686B2C2D7ADCD55397');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 8491496117796621,
    p_user_id => 6044857346794953,
    p_password => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 11696424157075803,
    p_user_id => 6044857346794953,
    p_password => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 15610407277953626,
    p_user_id => 8150071668457354,
    p_password => '8D3F4876908C1EE2DC50D5E4BB75F42D4A3B3DB87ED093D0638892A930AED99353119118855637B20C7030781524292AE4663C7757116C0A91C57EB5BEDFDAF3');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17080770842026803,
    p_user_id => 6475763412359198,
    p_password => 'E20B298FB04162966746768B5C2A8812912D0A2BDDBA640B77469EE41B9E19EC16984ACC1A617ED18E2C00A52EAB40E0D1AE0C9377BC63D14DED19699EB8CF99');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17081714210056312,
    p_user_id => 17081697512056284,
    p_password => '393E0481F4ECA28B31620B9AA6062ACDEAE2F0747C0AE619E31D9207EA0FB922CD33778E55E4E1FB8DBA77ADD4D5F7EC6C58413507FDA983F84552CE4C51B925');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17082173908061165,
    p_user_id => 17082018707061139,
    p_password => 'C7C397C661EA6B69475EE19EE732F1BCBC87A925C6DEA2ABB7C04EEC81027B1FB4F51B51F81C48EA8CC54EA733853CFC7722A9665A0B3F6B027234BF33D8EF8A');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17082563288064371,
    p_user_id => 17082411773064346,
    p_password => '112C6EF29AF831C3ABCBA2D56F3BEAD743FDD68FC9B511BE0BD13D893FC0041E2CA76B986B1F2C9CDD996EAD7949949619AB7FE3E2623FB682B1C743F8F0BEE1');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17082933124066985,
    p_user_id => 17082899431066960,
    p_password => 'B85127550EE7C4A575A073DB450A719DCBD3DABBCCDFB27E882C028B154A039E49E1DEEECF9CCE85728D7BC88F9FC1051772BE3C7E6D9DA27A795D9AC55A741B');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 17083300717070954,
    p_user_id => 17083271494070931,
    p_password => 'A3F8DC268D2217A8DC9EE6086C4236E1E602AC6DCE67F8F17A91C3BF2E199A0B88216369E8BDB76027A9E2E4600A4551B9452D1C8EE9617B7337A66D77990438');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20046086149983571,
    p_user_id => 20045928171983551,
    p_password => '6034BF86F5E2A50B55F3FF8738DCF470E458E5C0CAA21EBD4BADDD599FA5E82C57D6A75F917286427424EFEDA365534809EE25A2726A68E19DD690D75AD91573');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20135319126896428,
    p_user_id => 6044857346794953,
    p_password => '8F0ED293EAE2559CDB0D18BDFA4455973ED793B3999863D958FEACBA58259369B70785F24255161C55584176E3314EDAD8366E9EA6DB9882751BB95A0B8533CB');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 20249427144768892,
    p_user_id => 20249357888768870,
    p_password => '3DFB997C8066317BAD5826D521D7C51F2E4B921B57D62019E26B98F4676E5E3C9C3232F5C5D939BC1B0374F4BD1FBAAD30F133CFA8255D4B85B37EDEA42058A5');
end;
/
begin
  wwv_imp_workspace.create_password_history (
    p_id => 21404562029398998,
    p_user_id => 6475763412359198,
    p_password => 'F5038FA74D6A8264EB62CA1CB64B7F3B709DFD402957A5CA8F05785A77AAE94AF8A286C07293560C559D5ACF9922C36D87FCCEE892681CA4C3689A286887077C');
end;
/
----------------
--preferences
--
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 4811128718446387,
    p_user_id => 'ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17412783089447014,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '140:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 4811417841446920,
    p_user_id => 'ADMIN',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '112',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17436722820892890,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_119_P3_W33120537612365917',
    p_attribute_value => '33241742963001398____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 4812854477465340,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_18005186450209933_CURRENT_REPORT',
    p_attribute_value => '18414497664150974:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 4260702060845648,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_263527442738503017_CURRENT_REPORT',
    p_attribute_value => '3519668491004502:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5419637805089517,
    p_user_id => 'ADMIN',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '2',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17446517983900814,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_119_P14_W10118242835170946',
    p_attribute_value => '17446019283900803____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17571528874461026,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP_IR_119_P14_W35007762009676096',
    p_attribute_value => '35076001833912406____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5432766900920723,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_15002873478753519_CURRENT_REPORT',
    p_attribute_value => '26501553497477617:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5434052295929226,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '346:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5434159504929231,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '343:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5449098102976739,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5416260000085122_CURRENT_REPORT',
    p_attribute_value => '5444874341974331:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6051779747961809,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_15002873478753519_CURRENT_REPORT',
    p_attribute_value => '26501553497477617:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12804529605393914,
    p_user_id => 'AHMEDR',
    p_preference_name => 'FSP_IR_100_P1_W10803007887728611',
    p_attribute_value => '10835159484745610____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12807225251491678,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_TAB_LAYOUT_2',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6064924579189456,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5415871077085118_CURRENT_REPORT',
    p_attribute_value => '5435974091934778:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6065182809190009,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5417993455085139_CURRENT_REPORT',
    p_attribute_value => '5461988076983187:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327267150197942,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P4_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16027170631346654,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_3028694112145709_CURRENT_REPORT',
    p_attribute_value => '3029596887145712:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12804370099393882,
    p_user_id => 'AHMEDR',
    p_preference_name => 'APEX_IG_5641277674204738_CURRENT_REPORT',
    p_attribute_value => '10811780750731634:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27868148911713201,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_3704459976120823_CURRENT_REPORT',
    p_attribute_value => '5105010913042482:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17286858029408462,
    p_user_id => 'USER1',
    p_preference_name => 'APEX_PDF_ACCESSIBLE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17438673985746481,
    p_user_id => 'USER2',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '561',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17846513992127318,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_17648575699134612_CURRENT_REPORT',
    p_attribute_value => '17829734905125284:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987471350858243,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987685106862745,
    p_user_id => 'ALI',
    p_preference_name => 'FSP114_P2_R19890491377434873_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987733673862751,
    p_user_id => 'ALI',
    p_preference_name => 'FSP114_P2_R19891568096434875_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987894689862779,
    p_user_id => 'ALI',
    p_preference_name => 'FSP114_P2_R19898706828434882_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993417116945956,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20266662996596365,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 9431489090539785,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5402528899234735_CURRENT_REPORT',
    p_attribute_value => '27818993000237613:ICON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20266770348597048,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP115_P2_R40155175996015951_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20266853494597059,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP115_P2_R40156252715015953_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20266940420597101,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP115_P2_R40163391447015960_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20442155677840931,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP116_P2_R60581595748468965_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20442244688840934,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP116_P2_R60582672467468967_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20442390465840939,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP116_P2_R60589811199468974_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12017970794570217,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4500_1157684935965338210_SPLITTER_STATE',
    p_attribute_value => '246:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20485553776677029,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P5_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5826670392056392,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5804756214052667_CURRENT_REPORT',
    p_attribute_value => '5805607229052675:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5826765275056415,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5811745649054206_CURRENT_REPORT',
    p_attribute_value => '5812557133054207:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6038368340937528,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_4348306845399378538_CURRENT_REPORT',
    p_attribute_value => '389684227354049446:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327492784198237,
    p_user_id => 'JANE',
    p_preference_name => 'FSP106_P2_R7243984771663767_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327514333198251,
    p_user_id => 'JANE',
    p_preference_name => 'FSP106_P2_R7251191432663773_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327838602241217,
    p_user_id => 'MATT',
    p_preference_name => 'PERSISTENT_ITEM_P4_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327972755241426,
    p_user_id => 'MATT',
    p_preference_name => 'FSP106_P2_R7242761910663765_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328054051241426,
    p_user_id => 'MATT',
    p_preference_name => 'FSP106_P2_R7243984771663767_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328148081241429,
    p_user_id => 'MATT',
    p_preference_name => 'FSP106_P2_R7251191432663773_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328446081246943,
    p_user_id => 'SOPHIE',
    p_preference_name => 'PERSISTENT_ITEM_P4_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262228723865140,
    p_user_id => 'BO',
    p_preference_name => 'APEX_IG_684401931653782898_CURRENT_REPORT',
    p_attribute_value => '684402829186782900:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262436557875289,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P3_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262871107876146,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P3_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262905542878025,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263268098880004,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P5_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263537538890234,
    p_user_id => 'PAT',
    p_preference_name => 'FSP105_P15_R1679046996253221934_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263647264890237,
    p_user_id => 'PAT',
    p_preference_name => 'FSP105_P15_R1368625112339952852_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263711688890239,
    p_user_id => 'PAT',
    p_preference_name => 'FSP105_P15_R1368632353214952861_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6264707863253021,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '437:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328530647247231,
    p_user_id => 'SOPHIE',
    p_preference_name => 'FSP106_P2_R7242761910663765_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6369273169927450,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P15_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6391612830060206,
    p_user_id => 'BO',
    p_preference_name => 'APEX_IG_5415871077085118_CURRENT_REPORT',
    p_attribute_value => '5435974091934778:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6474467365340514,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P18_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6474691194341235,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P19_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328633405247232,
    p_user_id => 'SOPHIE',
    p_preference_name => 'FSP106_P2_R7243984771663767_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328768718247234,
    p_user_id => 'SOPHIE',
    p_preference_name => 'FSP106_P2_R7251191432663773_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328893742252631,
    p_user_id => 'SOPHIE',
    p_preference_name => 'PERSISTENT_ITEM_P4_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6484721717619968,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P18_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7326872249192498,
    p_user_id => 'JOHN',
    p_preference_name => 'FSP106_P2_R7242761910663765_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7326904971192504,
    p_user_id => 'JOHN',
    p_preference_name => 'FSP106_P2_R7243984771663767_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327080101192525,
    p_user_id => 'JOHN',
    p_preference_name => 'FSP106_P2_R7251191432663773_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327384897198234,
    p_user_id => 'JANE',
    p_preference_name => 'FSP106_P2_R7242761910663765_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20270957420625128,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P5_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20275365305732821,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20281232526890475,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R40155175996015951_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20281314516890478,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R40156252715015953_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20281463305890481,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R40163391447015960_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16432972987031964,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_4348306845399378538_CURRENT_REPORT',
    p_attribute_value => '389684227354049446:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20484005372622235,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17293133615578734,
    p_user_id => 'USER2',
    p_preference_name => 'APEX_PDF_ACCESSIBLE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17293695152597020,
    p_user_id => 'USER2',
    p_preference_name => 'FSP104_P2_R14826705706557838_SORT',
    p_attribute_value => 'sort_11_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17299077419602873,
    p_user_id => 'USER2',
    p_preference_name => 'APEX_IG_17270262476566311_CURRENT_REPORT',
    p_attribute_value => '17294844570602821:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27229813369345590,
    p_user_id => 'MANAGER',
    p_preference_name => 'FSP_IR_117_P2_W27191828963312517',
    p_attribute_value => '27228429528338592____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18352745308363017,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_18337308917361234_CURRENT_REPORT',
    p_attribute_value => '18338230104361234:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 51988128849566993,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39048525975026934,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4000T3',
    p_attribute_value => '556394903837090864',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39048623170026934,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4020T101',
    p_attribute_value => '556395613003092800',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39048727040026934,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4050T3',
    p_attribute_value => '556397202054096672',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39048896312026934,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4300T3',
    p_attribute_value => '556397718560100358',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987963689863631,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P5_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39048926276026934,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4350T3',
    p_attribute_value => '556398801399103962',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049098330026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4470T3',
    p_attribute_value => '666074212329754757',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27199799152314220,
    p_user_id => 'M',
    p_preference_name => 'FSP_IR_117_P1_W26851286943662642',
    p_attribute_value => '27199217936314207____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049187939026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4500T3',
    p_attribute_value => '556400064664109422',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049215228026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4550T3',
    p_attribute_value => '556400313932111365',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049346863026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4600T101',
    p_attribute_value => '556401349222114691',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049447775026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4650T3',
    p_attribute_value => '556401691879116466',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049528305026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4700T3',
    p_attribute_value => '556402525655120954',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049662779026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4750T3',
    p_attribute_value => '556402834682122674',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 39049716472026935,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4850T3',
    p_attribute_value => '556403733815126066',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5433952411929225,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '140:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5465276250983321,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5417993455085139_CURRENT_REPORT',
    p_attribute_value => '5461988076983187:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5636119095176012,
    p_user_id => 'ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6068131095213993,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5804756214052667_CURRENT_REPORT',
    p_attribute_value => '5805607229052675:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6068246346214004,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5811745649054206_CURRENT_REPORT',
    p_attribute_value => '5812557133054207:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262152076864154,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6284486969555650,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '2',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6477096572366732,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P18_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6479129242531212,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P19_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6479431432536392,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P19_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12807466990534123,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_ENABLE_TOOLTIPS',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7224938036613979,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P1225_VIEW_MODE',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19978871954714525,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993348640944162,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327668241214665,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P4_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993533570946170,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP114_P2_R19890491377434873_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993620307946171,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP114_P2_R19891568096434875_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993791689946173,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP114_P2_R19898706828434882_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7820869403895768,
    p_user_id => 'ADMIN',
    p_preference_name => 'CODE_EDITOR_SETTINGS',
    p_attribute_value => '{"theme":"automatic","tabsInsertSpaces":true,"indentSize":"4","tabSize":"4","ruler":false,"minimap":"conditional","accessibilityMode":false,"lineNumbers":true,"whitespace":false,"showSuggestions":true,"bracketPairColorization":false}',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014461521706435,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R39894679840076660_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16025035625291351,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_13214032081080032_CURRENT_REPORT',
    p_attribute_value => '13214945377080035:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8403738966662201,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_786390949359884461_CURRENT_REPORT',
    p_attribute_value => '786401902417889038:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12807026138490782,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_TWO_COLUMN_MODE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014505776706440,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R39895756559076662_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16224173008278345,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_33067104963284167_CURRENT_REPORT',
    p_attribute_value => '38237608039811063:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014673584706460,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R39902895291076669_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10835030880745598,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5641277674204738_CURRENT_REPORT',
    p_attribute_value => '10811780750731634:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20231141476311857,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R39940961716977982_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 11405506715786848,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P4_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17432933676724681,
    p_user_id => 'USER2',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20231257676311868,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R39942038435977984_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17281917042299035,
    p_user_id => 'USER1',
    p_preference_name => 'FSP_IR_104_P6_W17269331651566302',
    p_attribute_value => '17291427091558025____REPORT',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17433030616724957,
    p_user_id => 'USER2',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17433295346724996,
    p_user_id => 'USER2',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17433397984725029,
    p_user_id => 'USER2',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '103',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17433437272727296,
    p_user_id => 'USER2',
    p_preference_name => 'FSP103_P2_R15294640586453501_SORT',
    p_attribute_value => 'sort_1_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17438547928736442,
    p_user_id => 'USER2',
    p_preference_name => 'FSP_IR_103_P3_W17271649289566325',
    p_attribute_value => '17437997297736429____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20231392383311914,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R39949177167977991_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17641047420129373,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_17626555810128010_CURRENT_REPORT',
    p_attribute_value => '17627489814128017:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17661225735125325,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'CODE_EDITOR_SETTINGS',
    p_attribute_value => '{"theme":"automatic","tabsInsertSpaces":true,"indentSize":"4","tabSize":"4","ruler":true,"minimap":"conditional","accessibilityMode":false,"lineNumbers":true,"whitespace":false,"showSuggestions":true,"bracketPairColorization":true}',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26753662100171743,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_26743617351170426_CURRENT_REPORT',
    p_attribute_value => '26744523398170431:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20491719133027040,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP116_P2_R60581595748468965_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20491864036027043,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP116_P2_R60582672467468967_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20491963304027046,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP116_P2_R60589811199468974_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27228980782338592,
    p_user_id => 'M',
    p_preference_name => 'FSP_IR_117_P2_W27191828963312517',
    p_attribute_value => '27228429528338592____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27229235855343870,
    p_user_id => 'B',
    p_preference_name => 'FSP_IR_117_P1_W26851286943662642',
    p_attribute_value => '27199217936314207____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 4812559690456617,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_665073618803777080_CURRENT_REPORT',
    p_attribute_value => '665079563548779201:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5430191184775951,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_PDF_ACCESSIBLE',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5438207081934935,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5415871077085118_CURRENT_REPORT',
    p_attribute_value => '5435974091934778:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5831626727773515,
    p_user_id => 'ADMIN',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '510.979',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7326726306189865,
    p_user_id => 'JOHN',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6048658360837745,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '465.995',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7327173221196576,
    p_user_id => 'JOHN',
    p_preference_name => 'PERSISTENT_ITEM_P5_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328369726244484,
    p_user_id => 'MATT',
    p_preference_name => 'PERSISTENT_ITEM_P4_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7328990845255756,
    p_user_id => 'JOHN',
    p_preference_name => 'PERSISTENT_ITEM_P4_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12807512708534595,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_ENABLE_LAYOUT_VIEW',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6052410641968642,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'CODE_LANGUAGE',
    p_attribute_value => 'PLSQL',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6053170240977175,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_9499495849275742_CURRENT_REPORT',
    p_attribute_value => '23204494782337413:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6206737298290095,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_7705803391510760_CURRENT_REPORT',
    p_attribute_value => '8722386155925944:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6206896470290117,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_3200143775436601_CURRENT_REPORT',
    p_attribute_value => '3205782730441012:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6206902070290132,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_1904913767312218_CURRENT_REPORT',
    p_attribute_value => '1927933294467510:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263171773879534,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263331114886050,
    p_user_id => 'PAT',
    p_preference_name => 'PERSISTENT_ITEM_P3_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6264531915253020,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '335:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6264669647253020,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '170:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35863075034078526,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_35250628596647005_CURRENT_REPORT',
    p_attribute_value => '35859799345077978:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19987585634861998,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6344830831909289,
    p_user_id => 'JANE',
    p_preference_name => 'FSP100_P1_R5641277674204738_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6345055336909289,
    p_user_id => 'JANE',
    p_preference_name => 'FSP_IR_100_P1_W5710329607688002',
    p_attribute_value => '5717282026689131____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6371552204939529,
    p_user_id => 'PAT',
    p_preference_name => 'APEX_IG_684401931653782898_CURRENT_REPORT',
    p_attribute_value => '684402829186782900:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6371620904941914,
    p_user_id => 'PAT',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6371777788944762,
    p_user_id => 'BO',
    p_preference_name => 'APEX_IG_5804756214052667_CURRENT_REPORT',
    p_attribute_value => '5805607229052675:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6371890004944767,
    p_user_id => 'BO',
    p_preference_name => 'APEX_IG_5811745649054206_CURRENT_REPORT',
    p_attribute_value => '5812557133054207:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6454342718298204,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P18_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6454441212298396,
    p_user_id => 'JANE',
    p_preference_name => 'FSP100_P17_R6409539352116470_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6454507892298403,
    p_user_id => 'JANE',
    p_preference_name => 'FSP100_P17_R6410707527116471_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6454643506298418,
    p_user_id => 'JANE',
    p_preference_name => 'FSP100_P17_R6417949190116478_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6454707383300492,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P18_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6473540721321123,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P19_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6473656403322732,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P19_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6474575754340646,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P19_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6476554185363815,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P18_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6476605052364104,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P19_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6476726302366409,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP100_P1_R5641277674204738_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6476963197366410,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP_IR_100_P1_W5710329607688002',
    p_attribute_value => '5717282026689131____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6478028430375640,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP100_P17_R6409539352116470_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6478161663375642,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP100_P17_R6410707527116471_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6478239458375643,
    p_user_id => 'MOHAMED',
    p_preference_name => 'FSP100_P17_R6417949190116478_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6479810559543109,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P18_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6480291568548646,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P18_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6480315705548770,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P19_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6485320934638575,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P19_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6486745602667085,
    p_user_id => 'STEVE',
    p_preference_name => 'APEX_IG_684401931653782898_CURRENT_REPORT',
    p_attribute_value => '684402829186782900:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6819759474107068,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_5415871077085118_CURRENT_REPORT',
    p_attribute_value => '5435974091934778:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6819857167107257,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_5804756214052667_CURRENT_REPORT',
    p_attribute_value => '5805607229052675:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6819925367107268,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_5811745649054206_CURRENT_REPORT',
    p_attribute_value => '5812557133054207:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14842561021488532,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_W',
    p_attribute_value => '882.998',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19993863265946425,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'PERSISTENT_ITEM_P7_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6853917657434114,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_5416260000085122_CURRENT_REPORT',
    p_attribute_value => '5444874341974331:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16025759764337351,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_13061379707186659_CURRENT_REPORT',
    p_attribute_value => '13062210142186662:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16025816433337359,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_13068380382188143_CURRENT_REPORT',
    p_attribute_value => '13069154769188145:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16029006979358746,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28041525881131184,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_359175352067742002_CURRENT_REPORT',
    p_attribute_value => '359189423622765512:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 11405654346787003,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 11463698387604123,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_11448300442602806_CURRENT_REPORT',
    p_attribute_value => '11449123975602809:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 11535256434021984,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5641277674204738_CURRENT_REPORT',
    p_attribute_value => '10811780750731634:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16333003840605446,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '50',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34881035633526493,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_34865786279523896_CURRENT_REPORT',
    p_attribute_value => '34866550893523900:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18883488299808459,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_266470409881026219_CURRENT_REPORT',
    p_attribute_value => '6462635633527704:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18954859809264529,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_17270262476566311_CURRENT_REPORT',
    p_attribute_value => '17294844570602821:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19655090867913584,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P3_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5724820038207646,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5402528899234735_CURRENT_REPORT',
    p_attribute_value => '27818993000237613:ICON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6048341563807937,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6049209626853373,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '101',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 12807164282491678,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PD_TAB_LAYOUT_3',
    p_attribute_value => '0:renderTree_container,0:dynActTree_container,0:procTree_container,0:sharedComp_container,1:grid_layout,1:search,1:help,2:peComponentProperties,2:peAttributesTabPanel,2:pePrintingTabPanel',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6065009979189754,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5416260000085122_CURRENT_REPORT',
    p_attribute_value => '5444874341974331:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19994024333044354,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P7_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014156732704740,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP115_P2_R39894679840076660_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6074189387908960,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_665073618803777080_CURRENT_REPORT',
    p_attribute_value => '665079563548779201:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6075065538929775,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P26_SINCE',
    p_attribute_value => '.125',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014291368704750,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP115_P2_R39895756559076662_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20014399048704784,
    p_user_id => 'IBRAHIM',
    p_preference_name => 'FSP115_P2_R39902895291076669_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20023170539717432,
    p_user_id => 'ALI',
    p_preference_name => 'FSP115_P2_R20015408861712804_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16332594124526535,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_262121216799808381_CURRENT_REPORT',
    p_attribute_value => '2113442552309866:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17283573593339150,
    p_user_id => 'USER2',
    p_preference_name => 'FSP_IR_104_P6_W17269331651566302',
    p_attribute_value => '17291427091558025____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20439598722670825,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R60581595748468965_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18269785565238821,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_18247917387230801_CURRENT_REPORT',
    p_attribute_value => '18248891381230804:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6207193678303267,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5674040527817936_CURRENT_REPORT',
    p_attribute_value => '7074591464739595:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18269863329238834,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_18255038431231492_CURRENT_REPORT',
    p_attribute_value => '18255844609231492:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6261989569862570,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P3_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262040552863764,
    p_user_id => 'BO',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262514335875607,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P15_R1679046996253221934_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262696876875639,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P15_R1368625112339952852_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6262760443875671,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P15_R1368632353214952861_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263026616878287,
    p_user_id => 'JANE',
    p_preference_name => 'PERSISTENT_ITEM_P6_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263445804886309,
    p_user_id => 'PAT',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6263823678891046,
    p_user_id => 'PAT',
    p_preference_name => 'PERSISTENT_ITEM_P6_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6344563198907812,
    p_user_id => 'BO',
    p_preference_name => 'FSP100_P1_R5641277674204738_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6344729865907818,
    p_user_id => 'BO',
    p_preference_name => 'FSP_IR_100_P1_W5710329607688002',
    p_attribute_value => '5717282026689131____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6477133387366846,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P19_SHOW_EXPIRED',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6478346426376092,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P18_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6485870977648032,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P2_R1363741280714372585_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6485915605648039,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P2_R1363742465278372586_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6486077236648065,
    p_user_id => 'JANE',
    p_preference_name => 'FSP105_P2_R1363749652543372596_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6486444955666009,
    p_user_id => 'STEVE',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6486554875666795,
    p_user_id => 'STEVE',
    p_preference_name => 'PERSISTENT_ITEM_P5_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6486604305666931,
    p_user_id => 'STEVE',
    p_preference_name => 'PERSISTENT_ITEM_P3_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18977942449716082,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_17270262476566311_CURRENT_REPORT',
    p_attribute_value => '17294844570602821:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20439656774670839,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R60582672467468967_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20439706419670887,
    p_user_id => 'ALI',
    p_preference_name => 'FSP116_P2_R60589811199468974_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27229616202345470,
    p_user_id => 'MANAGER',
    p_preference_name => 'FSP_IR_117_P1_W26851286943662642',
    p_attribute_value => '27199217936314207____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27230342321359173,
    p_user_id => 'BB',
    p_preference_name => 'FSP_IR_117_P1_W26851286943662642',
    p_attribute_value => '27199217936314207____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20480576134489346,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20483894402607415,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P7_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20484108252622731,
    p_user_id => 'MOHAMED',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27231304131365648,
    p_user_id => 'N',
    p_preference_name => 'FSP_IR_117_P1_W26851286943662642',
    p_attribute_value => '27199217936314207____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 13501796272752398,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_8022730619697371_CURRENT_REPORT',
    p_attribute_value => '8023669344697376:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 38670909851307459,
    p_user_id => 'MANNAI_APEX1',
    p_preference_name => 'FSP122_P12_R38659348182268775_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7008762959743865,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_138_P8_W9630415348788352',
    p_attribute_value => '9746140950109689____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27229414854343987,
    p_user_id => 'B',
    p_preference_name => 'FSP_IR_117_P2_W27191828963312517',
    p_attribute_value => '27228429528338592____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27519288441487165,
    p_user_id => 'ALI',
    p_preference_name => 'FSP_IR_119_P2_W27509723835428468',
    p_attribute_value => '27516905891429517____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27520111689516514,
    p_user_id => 'BO',
    p_preference_name => 'FSP_IR_119_P2_W27509723835428468',
    p_attribute_value => '27516905891429517____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27867981180708945,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_4803890382119538_CURRENT_REPORT',
    p_attribute_value => '5820473146534722:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7009314657755781,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_12265145651784960_CURRENT_REPORT',
    p_attribute_value => '14214960941501535:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24014663274852042,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4500_P1220_R11177418830226625_SORT',
    p_attribute_value => 'fsp_sort_8',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20024044868149162,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_22147801256189259_CURRENT_REPORT',
    p_attribute_value => '22584438691328092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8033419919698592,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_8022730619697371_CURRENT_REPORT',
    p_attribute_value => '8023669344697376:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 50466515171839429,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_13214032081080032_CURRENT_REPORT',
    p_attribute_value => '13214945377080035:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24418218636802951,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W2050828593861326',
    p_attribute_value => '2117833588027975____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24418406095802967,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W92468021968325911',
    p_attribute_value => '95148537308558700____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28041495898099489,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_754958438006534386_CURRENT_REPORT',
    p_attribute_value => '754972509561557896:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24421575570868671,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P34_R2317966930424404_SORT',
    p_attribute_value => 'sort_11_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24421721250868681,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P34_W243294104975845793',
    p_attribute_value => '243322903983850177____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26867794999390917,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P28_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26868060291446379,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P7020_W2533511338513173',
    p_attribute_value => '2550626531514215____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26868188092446393,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P7020_R29895294190987845_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27750002107452929,
    p_user_id => 'ADMIN',
    p_preference_name => 'WD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '490.99',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435344926797710,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4000T3',
    p_attribute_value => '72328790154483268',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435436118797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4020T101',
    p_attribute_value => '72329795312505899',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435527888797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4050T3',
    p_attribute_value => '72330278206509731',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435672055797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4300T3',
    p_attribute_value => '16565172685526446',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435791764797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4350T3',
    p_attribute_value => '72331295244515034',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435825232797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4470T3',
    p_attribute_value => '182005134783173294',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28435958396797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4500T3',
    p_attribute_value => '72332249557526712',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436005277797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4550T3',
    p_attribute_value => '72332775553531661',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436152731797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4600T101',
    p_attribute_value => '77533347140630629',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436250917797712,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4650T3',
    p_attribute_value => '78840186844083825',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436301279797714,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4700T3',
    p_attribute_value => '72333216619538152',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5212536420071918,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_119_P5_W7449416542636453',
    p_attribute_value => '7469195866663653____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5212634402071918,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_119_P5_W7451454349636473',
    p_attribute_value => '7510513023280715____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19225605385291951,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP110_P19_R25933873576188160_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24451656650746210,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24468318674973014,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P959_W483659607062898467',
    p_attribute_value => '483660631524898748____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24533612795093062,
    p_user_id => 'RAJESH',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24536592809109645,
    p_user_id => 'ANACHATT',
    p_preference_name => 'PERSISTENT_ITEM_P7_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24538326347110990,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P3_R48549354782090993_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24538415179110990,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P3_R48566523623091010_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19222667327153789,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_110_P10_W22060861261477224',
    p_attribute_value => '22069065605522553____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19224875120279679,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP110_P16_R22459146175668777_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19225557863291951,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP110_P19_R22830606512592357_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24538565849110990,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P3_R48573796134091018_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26251639882831598,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_WINDOW_MGMT_MODE',
    p_attribute_value => 'FOCUS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26251725399831598,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_WINDOW_MGMT_SHARE_WINDOW',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26292904284857507,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_120_P3_W26272093259854867',
    p_attribute_value => '26292444703857464____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26688743140000056,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P431_W478896025956673213',
    p_attribute_value => '478896612991674411____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26920379018604796,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P13_R25718051169860846_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26920444922604796,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P13_R25735168987860879_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26920523656604796,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P13_R25742348898860893_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26975261656694589,
    p_user_id => 'RAJESH',
    p_preference_name => 'PERSISTENT_ITEM_P7_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27834157612859856,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_206906187134624410_SPLITTER_STATE',
    p_attribute_value => '288:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28600247424135865,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28600355700136225,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28600539726136273,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28600638597136320,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '104',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28606698622787965,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28606745263787985,
    p_user_id => '111111111111',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28620789927885510,
    p_user_id => '111111111111',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '511',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29327261487596853,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P32_W113343220869056532',
    p_attribute_value => '113442478716144516____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29327368864596853,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P32_W113344484620056544',
    p_attribute_value => '113442932040144545____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29812849239173023,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29959487321547314,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29959520356547315,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29999511643385370,
    p_user_id => '111111111111',
    p_preference_name => 'FSP108_P14_R25792039276936543_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29999646748385370,
    p_user_id => '111111111111',
    p_preference_name => 'FSP108_P14_R25799274079936550_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29999755998386070,
    p_user_id => '111111111111',
    p_preference_name => 'FSP108_P13_R25735168987860879_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29999888907386070,
    p_user_id => '111111111111',
    p_preference_name => 'FSP108_P13_R25742348898860893_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30426402363889421,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P31_W27453609881129622',
    p_attribute_value => '27552867728217606____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30426521918889421,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P31_W27454873632129634',
    p_attribute_value => '27553321052217635____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30481903455133756,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P31_W60434251129648908',
    p_attribute_value => '60846972343174293____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30529517919126432,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P31_W60434251129648908',
    p_attribute_value => '60846972343174293____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30537857074359532,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P31_W60434251129648908',
    p_attribute_value => '60846972343174293____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30567731752486012,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_225857161514926537_CURRENT_REPORT',
    p_attribute_value => '229170045038968477:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30818948278723485,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10033_W45598736292889449',
    p_attribute_value => '45609298009889456____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30819327255726193,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10053_W45707128146889548',
    p_attribute_value => '45716934633889554____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30978445530286025,
    p_user_id => '333333333333',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30978526190286025,
    p_user_id => '333333333333',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30982537448290423,
    p_user_id => '333333333333',
    p_preference_name => 'FSP_IR_108_P31_W60434251129648908',
    p_attribute_value => '60846972343174293____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30982609455290520,
    p_user_id => '333333333333',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30982711551290520,
    p_user_id => '333333333333',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30982826342291532,
    p_user_id => '333333333333',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33131266552994034,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33132157099004943,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '438',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33133169178039334,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP101_P7_R1854623469476853_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33133273746039362,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP101_P7_R8095825246832414_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33403081522176165,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP101_P26_R3080348205660770_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33403175143176168,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP101_P26_R3081519297660771_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33403296256176187,
    p_user_id => 'HASSAN',
    p_preference_name => 'FSP101_P26_R3088786791660785_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33404029407225909,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33407814956621615,
    p_user_id => 'ALI',
    p_preference_name => 'FSP_IR_101_P5_W18333268522734689',
    p_attribute_value => '18339849501735571____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35200628269595968,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P2300_W2050828593861326',
    p_attribute_value => '2117833588027975____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35200849596595989,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P2300_W92468021968325911',
    p_attribute_value => '95148537308558700____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5181086456063212,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_13061379707186659_CURRENT_REPORT',
    p_attribute_value => '13062210142186662:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5181165875063220,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_13068380382188143_CURRENT_REPORT',
    p_attribute_value => '13069154769188145:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24205695323363565,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_1160689086381952747_SPLITTER_STATE',
    p_attribute_value => '156:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5869135149159142,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_50140917753387043_CURRENT_REPORT',
    p_attribute_value => '5849379278156546:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24565261629456662,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P4_R24153542036279606_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24565388309456662,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P4_R24170665350279618_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24016613731855946,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4500_P1220_W467846302875971481',
    p_attribute_value => '467848523688971977____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24036037402145575,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P9500_W6235802409406749',
    p_attribute_value => '6252917602407791____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24565420445456662,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P4_R24177876358279625_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605460094674650,
    p_user_id => 'RAJESH',
    p_preference_name => 'APEX_IG_7705803391510760_CURRENT_REPORT',
    p_attribute_value => '8722386155925944:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605585190674660,
    p_user_id => 'RAJESH',
    p_preference_name => 'APEX_IG_3200143775436601_CURRENT_REPORT',
    p_attribute_value => '3205782730441012:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605631542674668,
    p_user_id => 'RAJESH',
    p_preference_name => 'APEX_IG_1904913767312218_CURRENT_REPORT',
    p_attribute_value => '1927933294467510:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26506005492569868,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P10_W46793339895286227',
    p_attribute_value => '46801544239331556____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26590228492700031,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P28_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26775578318080395,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P33_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26776538897096720,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26776625452096720,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27424581403753676,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_206907763710624430_SPLITTER_STATE',
    p_attribute_value => '409:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19225023097280339,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_22460353561668789_CURRENT_REPORT',
    p_attribute_value => '22650866529798056:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27443128630941610,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29126063761924468,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29158149503324731,
    p_user_id => '666666666666',
    p_preference_name => 'FSP_IR_108_P31_W27453609881129622',
    p_attribute_value => '27552867728217606____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29158249257324731,
    p_user_id => '666666666666',
    p_preference_name => 'FSP_IR_108_P31_W27454873632129634',
    p_attribute_value => '27553321052217635____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29158328139325221,
    p_user_id => '666666666666',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30922073958305075,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5674040527817936_CURRENT_REPORT',
    p_attribute_value => '7074591464739595:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33132035097997637,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '96:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33408059045622526,
    p_user_id => 'ALI',
    p_preference_name => 'APEX_IG_13061379707186659_CURRENT_REPORT',
    p_attribute_value => '13062210142186662:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33408110435622540,
    p_user_id => 'ALI',
    p_preference_name => 'APEX_IG_13068380382188143_CURRENT_REPORT',
    p_attribute_value => '13069154769188145:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33409277538652007,
    p_user_id => 'ADMIN',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_W',
    p_attribute_value => '897.99',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8951623591724820,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_10254817320036552_CURRENT_REPORT',
    p_attribute_value => '10445330288165819:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15967255610793085,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_5847196986156035_CURRENT_REPORT',
    p_attribute_value => '15955649099792871:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15982774125795021,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_110_P4_W5848191364156045',
    p_attribute_value => '15982288844794990____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604045486595796,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604191780596468,
    p_user_id => 'RAJESH',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604359078596498,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24031023748867454,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____ICON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24450950100744787,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604492098596520,
    p_user_id => 'RAJESH',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '107',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604682182641467,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP_IR_4000_P9601_W7716039542378463',
    p_attribute_value => '7733154735379505____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604861829642496,
    p_user_id => 'RAJESH',
    p_preference_name => 'F4000_206907763710624430_SPLITTER_STATE',
    p_attribute_value => '290:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605064790643000,
    p_user_id => 'RAJESH',
    p_preference_name => 'F4000_1160689086381952747_SPLITTER_STATE',
    p_attribute_value => '200:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605145197666007,
    p_user_id => 'RAJESH',
    p_preference_name => 'WD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '545',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24611446806899556,
    p_user_id => 'RAJESH',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '545',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27648198887235078,
    p_user_id => 'ADMIN',
    p_preference_name => 'PD_TAB_LAYOUT_3',
    p_attribute_value => '0:renderTree_container,0:dynActTree_container,0:procTree_container,0:sharedComp_container,1:grid_layout,1:search,1:help,2:peComponentProperties,2:peAttributesTabPanel,2:pePrintingTabPanel',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27696505793559796,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55126324829683304',
    p_attribute_value => '55225582676771288____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27696605127559796,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55127588580683316',
    p_attribute_value => '55226036000771317____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28604717366349796,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '428:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28620881136886628,
    p_user_id => '111111111111',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '429:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29744210461020304,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10010_W45552468617889350',
    p_attribute_value => '45558048125889362____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29684682746824960,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_20915676136405505_CURRENT_REPORT',
    p_attribute_value => '21352313571544338:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29684782192824978,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_266470409881026219_CURRENT_REPORT',
    p_attribute_value => '6462635633527704:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29763149844062554,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_108_P32_W113343220869056532',
    p_attribute_value => '113442478716144516____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29763224063062554,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_108_P32_W113344484620056544',
    p_attribute_value => '113442932040144545____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29800405041141529,
    p_user_id => '222222222222',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29959995800559456,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_2675372452330944_CURRENT_REPORT',
    p_attribute_value => '1642513948221388:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29960237171559484,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_1651611827240822_CURRENT_REPORT',
    p_attribute_value => '1665669478337827:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30368671419043650,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W29955425936518249',
    p_attribute_value => '30368147150043634____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30533513251142415,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P25_W60476775295553092',
    p_attribute_value => '60889496509078477____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30818583189719351,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10031_W45619772380889462',
    p_attribute_value => '45626084567889470____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30818707195721193,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10032_W45612577419889458',
    p_attribute_value => '45617409700889461____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33031346359106953,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP104_P25_R58489862927523835_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33031403977106953,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_104_P25_W93100450417860792',
    p_attribute_value => '93513171631386177____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33601181393422992,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_3028694112145709_CURRENT_REPORT',
    p_attribute_value => '3029596887145712:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24004373101842643,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8951427684724412,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP138_P16_R10253609934036540_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7008022794647759,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_138_P10_W9855325019844987',
    p_attribute_value => '9863529363890316____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24004519412843442,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4500_P1004_W467833818073240350',
    p_attribute_value => '467836414517307027____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24031105531868368,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P9601_W7716039542378463',
    p_attribute_value => '7733154735379505____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24251096598143150,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'WD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '545',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24275358185494001,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_206906187134624410_SPLITTER_STATE',
    p_attribute_value => '290:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24418613011803828,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24421437382867298,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24430557506929600,
    p_user_id => 'STEVE',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8033660531702073,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_925260747421540222_CURRENT_REPORT',
    p_attribute_value => '2807177378527946:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24430698310934831,
    p_user_id => 'STEVE',
    p_preference_name => 'PERSISTENT_ITEM_P11_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24529645173455973,
    p_user_id => 'ANACHATT',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27163808656187614,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27164567870195459,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27165299226207981,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27165300345213951,
    p_user_id => 'ADMIN',
    p_preference_name => 'CODE_LANGUAGE',
    p_attribute_value => 'PLSQL',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27563324691296278,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_7705803391510760_CURRENT_REPORT',
    p_attribute_value => '8722386155925944:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27563430200296292,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_3200143775436601_CURRENT_REPORT',
    p_attribute_value => '3205782730441012:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27563534833296306,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_1904913767312218_CURRENT_REPORT',
    p_attribute_value => '1927933294467510:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28605431830366670,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '545',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28605640316763431,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28605721481768759,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28605955981768785,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28606043873768814,
    p_user_id => '111111111111',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '108',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28619818762850270,
    p_user_id => '111111111111',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '438:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28680494898897467,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29125835230924117,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P31_W27453609881129622',
    p_attribute_value => '27552867728217606____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29125902083924117,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P31_W27454873632129634',
    p_attribute_value => '27553321052217635____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29444389809169659,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P32_W113343220869056532',
    p_attribute_value => '113442478716144516____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29444452158169659,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P32_W113344484620056544',
    p_attribute_value => '113442932040144545____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32793762273172159,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P4207_W47814307723191364',
    p_attribute_value => '47815210532192150____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33042524240378293,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_104_P31_W93057926251956608',
    p_attribute_value => '93470647465481993____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33042674623379381,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33402390083066107,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33406447970567754,
    p_user_id => 'ALI',
    p_preference_name => 'FSP_IR_101_P15_W15616948479685803',
    p_attribute_value => '15620363745687420____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33407523174621382,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P7_R1854623469476853_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33407671748621414,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P7_R8095825246832414_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33408823046638573,
    p_user_id => 'ALI',
    p_preference_name => 'APEX_IG_3028694112145709_CURRENT_REPORT',
    p_attribute_value => '3029596887145712:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34623944490553418,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_33611216906471859_CURRENT_REPORT',
    p_attribute_value => '33612137615471865:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33074398240456410,
    p_user_id => '222222222222',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 6645337215813179,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_21546336307856480_CURRENT_REPORT',
    p_attribute_value => '21982973742995313:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24605317328673231,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP_IR_4000_P9500_W6235802409406749',
    p_attribute_value => '6252917602407791____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24569097067583332,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP105_P2_R24041141617164675_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24569111731583332,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP105_P2_R24058229042164696_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24569230405583332,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP105_P2_R24065429403164706_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24604966500643000,
    p_user_id => 'RAJESH',
    p_preference_name => 'F4000_206906187134624410_SPLITTER_STATE',
    p_attribute_value => '290:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27164929672201507,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP108_P23_R49652858377564791_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27258038643558356,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_925260747421540222_CURRENT_REPORT',
    p_attribute_value => '2807177378527946:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27464452341200550,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4000_1160689086381952747_SPLITTER_STATE',
    p_attribute_value => '140:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27888221382076517,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P25_W110647814316885228',
    p_attribute_value => '110747072163973212____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27888438036076517,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P25_W110649078067885240',
    p_attribute_value => '110747525487973241____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28679233942895807,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29154238706321918,
    p_user_id => '666666666666',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29154376338321918,
    p_user_id => '666666666666',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33074553025456468,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33074613901456532,
    p_user_id => '222222222222',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '104',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 35200488475595079,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19400633995551734,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_110_P5_W21317352142400556',
    p_attribute_value => '21337131466427756____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5179146719537721,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_119_P10_W8192925661713121',
    p_attribute_value => '8201130005758450____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19400789529551734,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_110_P5_W21319389949400576',
    p_attribute_value => '21378448623044818____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19400807139552004,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_24470681893417197_CURRENT_REPORT',
    p_attribute_value => '26420497183133772:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27175875554390975,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_9499495849275742_CURRENT_REPORT',
    p_attribute_value => '23204494782337413:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24016406614852121,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4500_P1225_R164053306541529880_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8951232245721029,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_138_P4_W9024437864173760',
    p_attribute_value => '9049753567174476____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17176795920833812,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_15967630973794504_CURRENT_REPORT',
    p_attribute_value => '17166256473833720:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24781074250741696,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_49203160527226200_CURRENT_REPORT',
    p_attribute_value => '51152975816942775:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28442911367953259,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55728630129855375',
    p_attribute_value => '55827887976943359____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28443014383953259,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55729893880855387',
    p_attribute_value => '55828341300943388____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29236196102417578,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29849741448221256,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30561732567450406,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30561807462450407,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30819174196724118,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10034_W45587725526889440',
    p_attribute_value => '45595482103889447____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32647661780704084,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'PERSISTENT_ITEM_P28_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32651832589709740,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_104_P31_W93057926251956608',
    p_attribute_value => '93470647465481993____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681158133851989,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'APEX_IG_145966830050364231_CURRENT_REPORT',
    p_attribute_value => '62460246824518092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681254443851989,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'APEX_IG_145968076579364243_CURRENT_REPORT',
    p_attribute_value => '62448153229502540:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32689425551887556,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_58631504613549118_CURRENT_REPORT',
    p_attribute_value => '58840335403017550:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32689586486887556,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_58632617002549129_CURRENT_REPORT',
    p_attribute_value => '58841031526017554:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32793409846168339,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P4070_W47949429235486335',
    p_attribute_value => '47951124794493113____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32795393255189289,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P431_W478896025956673213',
    p_attribute_value => '478896612991674411____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33618512181473795,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_33611216906471859_CURRENT_REPORT',
    p_attribute_value => '33612137615471865:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7009259212755534,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_138_P5_W9113853707768339',
    p_attribute_value => '9172912381412581____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18108367920240337,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_22115650667121016_CURRENT_REPORT',
    p_attribute_value => '22552288102259849:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24411461478774971,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24780866118741398,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P5_W46049830776209559',
    p_attribute_value => '46069610100236759____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 7009157783755534,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_138_P5_W9111815900768319',
    p_attribute_value => '9131595224795519____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20251129421341375,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_20520667758325646_CURRENT_REPORT',
    p_attribute_value => '20957305193464479:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24203970625354237,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'F4000_206907763710624430_SPLITTER_STATE',
    p_attribute_value => '290:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24780949551741398,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P5_W46051868583209579',
    p_attribute_value => '46110927256853821____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24781192770742079,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_46134212736058236_CURRENT_REPORT',
    p_attribute_value => '46168132731272694:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25706264014768907,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P260_W40585608941890825',
    p_attribute_value => '40587517034894377____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25706373753769246,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P267_R22486830752876187_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25706514892774654,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P10_W46793339895286227',
    p_attribute_value => '46801544239331556____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25957688482740168,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29177138066415328,
    p_user_id => '555555555555',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29177221130415328,
    p_user_id => '555555555555',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29694728948975759,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29694854184975759,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29821678313192051,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP108_P32_R113344401457056543_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681379416852848,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'PERSISTENT_ITEM_P28_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32775638593016584,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP104_P13_R58358844110168579_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32775740413016584,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_104_P13_W62579101058825949',
    p_attribute_value => '62991822272351334____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33070412740180785,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33131396234994168,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33131563896994181,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33131677630994198,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '101',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33402951895176003,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33403517361176715,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33405610323489165,
    p_user_id => 'HASSAN',
    p_preference_name => 'PERSISTENT_ITEM_P30_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33601766983429309,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_101_P5_W18333268522734689',
    p_attribute_value => '18339849501735571____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24527660094450707,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP107_P2_R48510032754001436_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20251284456356240,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_20915676136405505_CURRENT_REPORT',
    p_attribute_value => '21352313571544338:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21845434516963062,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_110_P8_W21835951590420589',
    p_attribute_value => '21951677191741926____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24527751835450707,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP107_P2_R48517233115001446_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24527490645450117,
    p_user_id => 'ANACHATT',
    p_preference_name => 'PERSISTENT_ITEM_P6_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24527554319450707,
    p_user_id => 'ANACHATT',
    p_preference_name => 'FSP107_P2_R48492945329001415_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24527974897455268,
    p_user_id => 'ANACHATT',
    p_preference_name => 'PERSISTENT_ITEM_P6_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24533765163093198,
    p_user_id => 'RAJESH',
    p_preference_name => 'PERSISTENT_ITEM_P7_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26500951763552957,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P28_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26694297497024440,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P14_R25775209286936528_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26694311274024440,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P14_R25792039276936543_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26694432719024442,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P14_R25799274079936550_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26779951431103684,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P33_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26911608530574178,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP108_P14_R25775209286936528_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26911730888574178,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP108_P14_R25792039276936543_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26911829619574178,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP108_P14_R25799274079936550_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27734862018368992,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W82835356030039583',
    p_attribute_value => '82934613877127567____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27734993471368992,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W82836619781039595',
    p_attribute_value => '82935067201127596____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27806560535809006,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P25_R25849383870216123_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27806650458809006,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P25_R25866187805216135_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27806734173809006,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP108_P25_R25873360026216142_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28429837226113845,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P25_W84142689853959100',
    p_attribute_value => '84241947701047084____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28429936262113845,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P25_W84143953604959112',
    p_attribute_value => '84242401025047113____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29306915700428887,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_21515661633785596_CURRENT_REPORT',
    p_attribute_value => '21952299068924429:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29307089817428912,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_262121216799808381_CURRENT_REPORT',
    p_attribute_value => '2113442552309866:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29355565096824818,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P32_W113343220869056532',
    p_attribute_value => '113442478716144516____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29355631092824820,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P32_W113344484620056544',
    p_attribute_value => '113442932040144545____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29517541161541379,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29800233751140151,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_108_P31_W27453609881129622',
    p_attribute_value => '27552867728217606____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29800321859140151,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_108_P31_W27454873632129634',
    p_attribute_value => '27553321052217635____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29886119168473456,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 29886280583473456,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30525797011039481,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W90946254727640042',
    p_attribute_value => '91358975941165427____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 30561680775450378,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_108_P31_W60434251129648908',
    p_attribute_value => '60846972343174293____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32647703699706628,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_58631504613549118_CURRENT_REPORT',
    p_attribute_value => '58840335403017550:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32647880290706628,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_58632617002549129_CURRENT_REPORT',
    p_attribute_value => '58841031526017554:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32651936853709785,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_145966830050364231_CURRENT_REPORT',
    p_attribute_value => '62460246824518092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32652069487709785,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_145968076579364243_CURRENT_REPORT',
    p_attribute_value => '62448153229502540:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32680950476851962,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'FSP104_P14_R58415714399244243_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681031065851962,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'FSP_IR_104_P14_W123569929849947742',
    p_attribute_value => '123982651063473127____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681442605859479,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_145966830050364231_CURRENT_REPORT',
    p_attribute_value => '62460246824518092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32681588490859479,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_145968076579364243_CURRENT_REPORT',
    p_attribute_value => '62448153229502540:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32775882420016831,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32792885237163603,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32794586980184414,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_4000_P959_W483659607062898467',
    p_attribute_value => '483660631524898748____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32796836239224595,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33401998338065332,
    p_user_id => 'ALI',
    p_preference_name => 'PERSISTENT_ITEM_P30_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33402072635065567,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P26_R3080348205660770_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33402176942065579,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P26_R3081519297660771_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33402292569065610,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P26_R3088786791660785_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33407903833621739,
    p_user_id => 'ALI',
    p_preference_name => 'FSP101_P10_R8098632239832442_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 33408284494622792,
    p_user_id => 'ALI',
    p_preference_name => 'APEX_IG_13214032081080032_CURRENT_REPORT',
    p_attribute_value => '13214945377080035:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24557077719401168,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P4_R48605345748116346_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24557194407401168,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P4_R48622469062116358_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24557231879401168,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP107_P4_R48629680070116365_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24563732832442254,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P3_R24097551070254253_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24563854047442256,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P3_R24114719911254270_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24539221484115395,
    p_user_id => 'RAJESH',
    p_preference_name => 'PERSISTENT_ITEM_P6_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 24563976020442256,
    p_user_id => 'RAJESH',
    p_preference_name => 'FSP105_P3_R24121992422254278_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 25934206002608695,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26234374805710087,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26234470358710087,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26293039765862282,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'APEX_IG_26279655424855782_CURRENT_REPORT',
    p_attribute_value => '26280484372855785:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26497119215543973,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26497275173543973,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20627759286179918,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_21515661633785596_CURRENT_REPORT',
    p_attribute_value => '21952299068924429:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26626482034798346,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P31_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26650219347895412,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P28_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26776494918096232,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P28_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26867535003390775,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_26007829491241418_CURRENT_REPORT',
    p_attribute_value => '26216660280709850:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26867680379390775,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_26008941880241429_CURRENT_REPORT',
    p_attribute_value => '26217356403709854:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26867836835408907,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P28_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26912441337575451,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P28_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27002503441052371,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_786390949359884461_CURRENT_REPORT',
    p_attribute_value => '786401902417889038:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27164397272193118,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27553938943217645,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P31_W27453609881129622',
    p_attribute_value => '27552867728217606____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27554043617217645,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_108_P31_W27454873632129634',
    p_attribute_value => '27553321052217635____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28258795258681889,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55690058616796740',
    p_attribute_value => '55789316463884724____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28258855651681889,
    p_user_id => 'COMMITEE_USER1',
    p_preference_name => 'FSP_IR_108_P14_W55691322367796752',
    p_attribute_value => '55789769787884753____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28321972016757942,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W84034452692600357',
    p_attribute_value => '84133710539688341____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28322060634757943,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W84035716443600369',
    p_attribute_value => '84134163863688370____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436401113797714,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4750T3',
    p_attribute_value => '72333757135541211',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 28436558053797714,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4850T3',
    p_attribute_value => '72334735125547461',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5029954777684406,
    p_user_id => '111111111111',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '160:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32637975124660314,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32693504712889475,
    p_user_id => '222222222222',
    p_preference_name => 'FSP_IR_104_P31_W93057926251956608',
    p_attribute_value => '93470647465481993____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32693604898889500,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_145966830050364231_CURRENT_REPORT',
    p_attribute_value => '62460246824518092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32693791139889500,
    p_user_id => '222222222222',
    p_preference_name => 'APEX_IG_145968076579364243_CURRENT_REPORT',
    p_attribute_value => '62448153229502540:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32793280324163817,
    p_user_id => '111111111111',
    p_preference_name => 'APEX_IG_665073618803777080_CURRENT_REPORT',
    p_attribute_value => '665079563548779201:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 32796757801223993,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'FSP_IR_104_P31_W93057926251956608',
    p_attribute_value => '93470647465481993____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201482667371303,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4400_W27796519609844319',
    p_attribute_value => '27798220762844327____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201531222371637,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_2675372452330944_CURRENT_REPORT',
    p_attribute_value => '1642513948221388:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201640526371645,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P4410_R4004965443629330_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201715025371650,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P4410_R1622849868577319_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201825222371654,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_1651611827240822_CURRENT_REPORT',
    p_attribute_value => '1665669478337827:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 34201999992371657,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P4410_R29873113508481210_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 5048755793734009,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5031396230685812_CURRENT_REPORT',
    p_attribute_value => '5037473997731117:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27198995966194410,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'FSP_IR_100_P11_W93022286514718881',
    p_attribute_value => '93143491865354362____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27199798854196850,
    p_user_id => 'AHMED',
    p_preference_name => 'F4000_1160689086381952747_SPLITTER_STATE',
    p_attribute_value => '185:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27200041278197839,
    p_user_id => 'AHMED',
    p_preference_name => 'F4000_206906187134624410_SPLITTER_STATE',
    p_attribute_value => '290:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27200420276211426,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P22_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27201024260244189,
    p_user_id => 'AHMED',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '136:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8150704411462870,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'PERSISTENT_ITEM_P29_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8150913777463675,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'FSP104_P13_R58358844110168579_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8151035035463675,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'FSP_IR_104_P13_W62579101058825949',
    p_attribute_value => '62991822272351334____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8151138113463714,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'APEX_IG_145966830050364231_CURRENT_REPORT',
    p_attribute_value => '62460246824518092:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8151243891463714,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'APEX_IG_145968076579364243_CURRENT_REPORT',
    p_attribute_value => '62448153229502540:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8151459420473975,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'PERSISTENT_ITEM_P29_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27201262923250329,
    p_user_id => 'AHMED',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '511',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27244150253730350,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8160083876557892,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'PERSISTENT_ITEM_P26_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8167351489616882,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'PERSISTENT_ITEM_P30_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8245126695502887,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'FSP104_P13_R58358844110168579_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8245286432502887,
    p_user_id => 'COMMITEE_USER',
    p_preference_name => 'FSP_IR_104_P13_W62579101058825949',
    p_attribute_value => '62991822272351334____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10019081997455076,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_10003392156452448_CURRENT_REPORT',
    p_attribute_value => '10004283952452453:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10019161397455076,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_10011485045453584_CURRENT_REPORT',
    p_attribute_value => '10012211656453585:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8493040043426723,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_101_P15_W15616948479685803',
    p_attribute_value => '15620363745687420____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8615457327619414,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_112_P25_W5199826330663126',
    p_attribute_value => '8614922335619378____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8619982571621492,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_5199725024663125_CURRENT_REPORT',
    p_attribute_value => '8616714787621364:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10094702115093462,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_10011485045453584_CURRENT_REPORT',
    p_attribute_value => '10012211656453585:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8830909643526214,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_359175352067742002_CURRENT_REPORT',
    p_attribute_value => '359189423622765512:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 1975412234598721,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P26_SORT_BY',
    p_attribute_value => 'CREATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 1996530485751592,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX$RDS_4000_9801_1957406633376301_active_tab',
    p_attribute_value => 'SHOW_ALL',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2004898947924639,
    p_user_id => 'ADMIN',
    p_preference_name => 'AI_CONSENT_BUILDER',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2796646137433529,
    p_user_id => 'ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P688_APPLICATION',
    p_attribute_value => '137',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14830334130336567,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P3_W9345149865241691',
    p_attribute_value => '9485701004055307____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14830591239338826,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P85_W46873705123500571',
    p_attribute_value => '47014256262314187____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14830763573338828,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P85_W34861659236791870',
    p_attribute_value => '44473351620068931____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14830950541339712,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P33_W30782587792864050',
    p_attribute_value => '30923138931677666____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14831119892340004,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P42_W12471694801064603',
    p_attribute_value => '12736734884011297____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14831388062340017,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P42_W36666713698087240',
    p_attribute_value => '36807264836900856____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14831566978340026,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P42_W13707434836061294',
    p_attribute_value => '13869274717375107____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 14831751662340034,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P42_W13709103307061311',
    p_attribute_value => '13869921300375166____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10098607105100943,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_10003392156452448_CURRENT_REPORT',
    p_attribute_value => '10004283952452453:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10113678947170265,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_9010861399115342_CURRENT_REPORT',
    p_attribute_value => '10103525363170034:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15603421826161412,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_1573009001030403_CURRENT_REPORT',
    p_attribute_value => '1748625822176016:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15603599753176242,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P73_R78240013758270704_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15797173657111365,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_110_P10_W22060861261477224',
    p_attribute_value => '22069065605522553____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15998125198763425,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP4000_P4761_R746836409020161499_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15998326101763790,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4751_W30840414634229054',
    p_attribute_value => '30841408940231502____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15998527745784434,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15998863713791775,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4207_W47814307723191364',
    p_attribute_value => '47815210532192150____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16198280350656876,
    p_user_id => '111111111111',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '2',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16239520302386889,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P5_W9049737507610984',
    p_attribute_value => '9062934106640716____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16239750643386948,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P5_W9051840503611005',
    p_attribute_value => '9089131689806258____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16239944011390210,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P54_W19167196958207517',
    p_attribute_value => '19432237041154211____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16240144550390221,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P54_W43362215855230154',
    p_attribute_value => '43502766994043770____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16240326506417978,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P7_W14284982735081733',
    p_attribute_value => '14298179334111465____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16240714475418517,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P9_W19825117788176562',
    p_attribute_value => '19838314387206294____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16240940372418745,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P11_W11938685732544625',
    p_attribute_value => '11975976918739878____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16241112490418750,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P11_W11936582736544604',
    p_attribute_value => '11949779335574336____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16241340599418992,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P12_W14863717982836371',
    p_attribute_value => '14876914581866103____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16241566310419314,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P13_W17826927239303866',
    p_attribute_value => '17840123838333598____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16242425596421720,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P17_W19215111174486707',
    p_attribute_value => '19355662313300323____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16242629746422051,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P18_W15979643795269937',
    p_attribute_value => '16120194934083553____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16242887051422351,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P19_W22786962811823041',
    p_attribute_value => '22927513950636657____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16243058840422606,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P28_W26397394524655225',
    p_attribute_value => '26537945663468841____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16243494988423085,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P25_W27327574622610426',
    p_attribute_value => '27340771221640158____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16281441933778940,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP110_P16_R22459146175668777_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16281694372779821,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_22460353561668789_CURRENT_REPORT',
    p_attribute_value => '22650866529798056:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16282127827782953,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP110_P19_R22830606512592357_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16282277354782953,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP110_P19_R25933873576188160_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16833047960436268,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP101_P10_R8098632239832442_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17120148662768575,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP119_P4_R33329704461575690_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17121831682789465,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17121900730789600,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP119_P5_R33384921035638057_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17122353697789792,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17123009417797273,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP119_P5_R33384921035638057_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17123796241811337,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P9_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17124985412813407,
    p_user_id => 'EVALUATION_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17125703283814335,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP119_P7_R33494913569663001_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17126135881814567,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17412262004446215,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17412467904446232,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17412550634446250,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '119',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17412619088446992,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '2',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17413133511450462,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P34_ROWS',
    p_attribute_value => '50',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17413252984450478,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P34_R77549119545304597_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17413441437451653,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P19_W451745617575288584',
    p_attribute_value => '451746507039288843____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17414161111451865,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17414230654456779,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '511',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17429489722809068,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P34_W243294104975845793',
    p_attribute_value => '243322903983850177____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17432861866867723,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'CODE_LANGUAGE',
    p_attribute_value => 'PLSQL',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17456864302391301,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4350_P29_W9294827650405715',
    p_attribute_value => '9296821143409975____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17457063709392732,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4350_P24_W370332345019891192',
    p_attribute_value => '370342431106891204____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17482097672974525,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_119_P14_W17438831853898914',
    p_attribute_value => '17481592999974487____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17498581867170932,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '406:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17805352454394020,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'WD_PE_CODE_EDITOR_DLG_H',
    p_attribute_value => '511',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17824534071477531,
    p_user_id => 'EVALUATION_USER',
    p_preference_name => 'FSP119_P6_R33439724443652806_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2501105705241098,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_1992165096671936_CURRENT_REPORT',
    p_attribute_value => '2492310319236606:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2513950930376448,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_22460353561668789_CURRENT_REPORT',
    p_attribute_value => '22650866529798056:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3151616296470248,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P40_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16240587516418240,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P8_W17020312102141484',
    p_attribute_value => '17033508701171216____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16241824859420229,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P6_W11605046487493701',
    p_attribute_value => '11618243086523433____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16242035883420792,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P14_W12445034200135305',
    p_attribute_value => '12585585338948921____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16242274635421139,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P16_W15834612126626598',
    p_attribute_value => '15975163265440214____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16243231024422851,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P29_W26431019009828441',
    p_attribute_value => '26571570148642057____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16243659577423423,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P20_W23639394433125926',
    p_attribute_value => '23652591032155658____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16243855972424139,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP_IR_102_P21_W31243116295080207',
    p_attribute_value => '31256312894109939____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16280411162759985,
    p_user_id => '111111111111',
    p_preference_name => 'FSP110_P19_R22830606512592357_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16280586452759987,
    p_user_id => '111111111111',
    p_preference_name => 'FSP110_P19_R25933873576188160_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16607786968102389,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_263527442738503017_CURRENT_REPORT',
    p_attribute_value => '3519668491004502:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17493667474107820,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'F4000_1160689086381952747_SPLITTER_STATE',
    p_attribute_value => '185:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17824729113477556,
    p_user_id => 'EVALUATION_USER',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17829086500508234,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P4761_R746836409020161499_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17829117407508326,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P385_R543179732397973700_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17858355573636300,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP119_P1_R32811381929312298_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17871636906982484,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP_IR_119_P14_W35007762009676096',
    p_attribute_value => '35076001833912406____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17871891965985001,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP_IR_119_P14_W17438831853898914',
    p_attribute_value => '17481592999974487____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17875134429002193,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4860_W1344148979658039780',
    p_attribute_value => '1344151403727114740____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17875803542459295,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1620_W312277037396040233',
    p_attribute_value => '312279461465115193____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17876389177466715,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1931_W249349528073883039',
    p_attribute_value => '309920184639832447____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17877475248477118,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1100_W188062805545626087',
    p_attribute_value => '188067100209684276____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17877992822801162,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4400_W27796519609844319',
    p_attribute_value => '27798220762844327____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878079910801843,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_2675372452330944_CURRENT_REPORT',
    p_attribute_value => '1642513948221388:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878179603801856,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P4410_R4004965443629330_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878266161801859,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P4410_R1622849868577319_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878329162801875,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_263527442738503017_CURRENT_REPORT',
    p_attribute_value => '3519668491004502:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878421815801937,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_1651611827240822_CURRENT_REPORT',
    p_attribute_value => '1665669478337827:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17878559197801942,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P4410_R29873113508481210_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17886489594917365,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP119_P4_R33329704461575690_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17886727788936151,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_119_P10041_W31905993025085905',
    p_attribute_value => '31909148812085908____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17889687908121923,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4420_W27858227168431340',
    p_attribute_value => '27878126485138981____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17997437377117082,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_119_P3_W33120537612365917',
    p_attribute_value => '33241742963001398____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17997838201150373,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18197385494741501,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P197_R935666971301945228_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18212007586183629,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P260_W40585608941890825',
    p_attribute_value => '40587517034894377____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18212169892183915,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_925260747421540222_CURRENT_REPORT',
    p_attribute_value => '2807177378527946:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18212292909183954,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P267_R22486830752876187_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18218894342287851,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18219423353298148,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18219559094298284,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'FSP119_P4_R33329704461575690_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18219736652298307,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18219822173299375,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18222450543345510,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP119_P1_R32811381929312298_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18222609093348293,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4070_W47949429235486335',
    p_attribute_value => '47951124794493113____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18222806831352137,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W2050828593861326',
    p_attribute_value => '2117833588027975____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18223057358352151,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W92468021968325911',
    p_attribute_value => '95148537308558700____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18905547855039378,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4350_P25_W9307709001462905',
    p_attribute_value => '9309908769463151____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18905960040039546,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P25_DATE',
    p_attribute_value => '.125',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18908202650073365,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P959_W483659607062898467',
    p_attribute_value => '483660631524898748____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20705872058713931,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4207_W47814307723191364',
    p_attribute_value => '47815210532192150____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20706587893327634,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '290:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20842082109174700,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P34_R2317966930424404_SORT',
    p_attribute_value => 'sort_11_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21363574409499956,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP119_P2_R34405687757740611_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22570952030147807,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_1573009001030403_CURRENT_REPORT',
    p_attribute_value => '1748625822176016:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22571073928147826,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_537043026726394623_CURRENT_REPORT',
    p_attribute_value => '537166913744389086:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22572269837175903,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P22_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22764082597559371,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_100_P3_W75953780361153711',
    p_attribute_value => '76074985711789192____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 23165396474815464,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_100_P11_W93022286514718881',
    p_attribute_value => '93143491865354362____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26566617028743334,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP100_P4_R76162947210363484_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26566878105743406,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_100_P11_W93022286514718881',
    p_attribute_value => '93143491865354362____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26567479016743785,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP100_P1_R75644624678100092_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26567693139748829,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP100_P5_R76218163784425851_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26567851852748864,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP_IR_100_P11_W93022286514718881',
    p_attribute_value => '93143491865354362____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27112700681713607,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_27076812335710432_CURRENT_REPORT',
    p_attribute_value => '27077766677710443:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2159198243602584,
    p_user_id => '111111111111',
    p_preference_name => 'FSP_IR_104_P2_W78389359805802355',
    p_attribute_value => '78403223979803526____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2166939661727648,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_WINDOW_MGMT_MODE',
    p_attribute_value => 'FOCUS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2167000807727648,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_WINDOW_MGMT_SHARE_WINDOW',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2178152166883226,
    p_user_id => '111111111111',
    p_preference_name => 'PERSISTENT_ITEM_P26_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2757651502873564,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4100T3',
    p_attribute_value => '74913758140436872',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 2757704857873564,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_THEME_STYLE_A4498T3',
    p_attribute_value => '182005134783173294.4498',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3161307826745092,
    p_user_id => 'MOJ_REG_EMPLOYEE',
    p_preference_name => 'PERSISTENT_ITEM_P40_SORT_BY',
    p_attribute_value => 'LAST_UPDATED_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3174166067986031,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP108_P13_R25735168987860879_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3174258736986031,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'FSP_IR_108_P13_W29955425936518249',
    p_attribute_value => '30368147150043634____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27112852973713607,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_27099837642711717_CURRENT_REPORT',
    p_attribute_value => '27100667273711720:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27194300950137143,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10125491647687875,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_9010861399115342_CURRENT_REPORT',
    p_attribute_value => '10103525363170034:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17078261436917385,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_1573009001030403_CURRENT_REPORT',
    p_attribute_value => '1748625822176016:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17078315776917403,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_537043026726394623_CURRENT_REPORT',
    p_attribute_value => '537166913744389086:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17120005465768160,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17120265618777385,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17120617451780826,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17122138513789620,
    p_user_id => 'PREPARATION_USER',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17122724659794128,
    p_user_id => 'EVALUATION_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17122898422795726,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17122927282796948,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P8_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17123204446797296,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17123347904797701,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'PERSISTENT_ITEM_P8_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17125987835814365,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP_IR_119_P11_W50189043765931087',
    p_attribute_value => '50310249116566568____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17132442204858103,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P16_SHOW_EXPIRED',
    p_attribute_value => 'N',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17133342221868079,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P16_SORT_BY',
    p_attribute_value => 'DUE_ON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17496127894125851,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P9500_W6235802409406749',
    p_attribute_value => '6252917602407791____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17496269133126326,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_7705803391510760_CURRENT_REPORT',
    p_attribute_value => '8722386155925944:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17496392239126365,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_3200143775436601_CURRENT_REPORT',
    p_attribute_value => '3205782730441012:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17496470497126392,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_1904913767312218_CURRENT_REPORT',
    p_attribute_value => '1927933294467510:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17496521427127268,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_5674040527817936_CURRENT_REPORT',
    p_attribute_value => '7074591464739595:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17497122649138632,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P7020_W2533511338513173',
    p_attribute_value => '2550626531514215____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17497211668138668,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P7020_R29895294190987845_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17498003820161626,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_119_P14_W17438831853898914',
    p_attribute_value => '17481592999974487____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18015095141200996,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP119_P1_R32811381929312298_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18015108585201793,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_18007698987195506_CURRENT_REPORT',
    p_attribute_value => '18008548423195506:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26571424113754596,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP_IR_100_P14_W77841004758463890',
    p_attribute_value => '77909244582700200____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26571577915754646,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP100_P1_R75644624678100092_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 26571785113755592,
    p_user_id => 'APPROVER_USER',
    p_preference_name => 'FSP_IR_100_P3_W75953780361153711',
    p_attribute_value => '76074985711789192____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27194621040137223,
    p_user_id => 'AHMED',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '119',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27195024156141210,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_925260747421540222_CURRENT_REPORT',
    p_attribute_value => '2807177378527946:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27198718237194326,
    p_user_id => 'STUDY_USER1',
    p_preference_name => 'FSP100_P4_R76162947210363484_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27199978137197340,
    p_user_id => 'AHMED',
    p_preference_name => 'F4000_206907763710624430_SPLITTER_STATE',
    p_attribute_value => '290:true',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27200293300207725,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP100_P5_R76218163784425851_SORT',
    p_attribute_value => 'sort_5_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27200711833222132,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_60840941735983300_CURRENT_REPORT',
    p_attribute_value => '60841791171983300:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 27200979224224853,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_100_P14_W77841004758463890',
    p_attribute_value => '77909244582700200____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 10904250294530318,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'APEX_IG_10114124488170905_CURRENT_REPORT',
    p_attribute_value => '10896689711527250:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3174315390986059,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_113343154928056531_CURRENT_REPORT',
    p_attribute_value => '29836571702210392:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 3174454111986059,
    p_user_id => 'BACKOFFICE_EMPLOYEE',
    p_preference_name => 'APEX_IG_113344401457056543_CURRENT_REPORT',
    p_attribute_value => '29824478107194840:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17431881721839148,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_119_P14_W35007762009676096',
    p_attribute_value => '35076001833912406____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17432054823844056,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 8167201686575434,
    p_user_id => 'BACKOFFICE_EMPLOYEE1',
    p_preference_name => 'FSP_IR_104_P31_W93057926251956608',
    p_attribute_value => '93470647465481993____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17432408054844257,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'APEX_IG_665073618803777080_CURRENT_REPORT',
    p_attribute_value => '665079563548779201:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17433222658868298,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P546_W30205316146531602',
    p_attribute_value => '30206031208532453____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17436542231892584,
    p_user_id => 'STUDY_USER',
    p_preference_name => 'FSP_IR_119_P14_W35007762009676096',
    p_attribute_value => '35076001833912406____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17461485872698870,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17493596762107514,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P9601_W7716039542378463',
    p_attribute_value => '7733154735379505____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22572049910172931,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 22572378055176115,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP100_P1_R75644624678100092_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20043400801771471,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P150_W1131851802868154106',
    p_attribute_value => '1136339945374460703____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17434120189546146,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P4003_W632908938554265910',
    p_attribute_value => '632910390117265918____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20043581544771856,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_754958438006534386_CURRENT_REPORT',
    p_attribute_value => '754972509561557896:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20043762605772846,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P190_W4402214405520520',
    p_attribute_value => '1606130693443833____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20044109554788050,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P120_W349780070697459222',
    p_attribute_value => '349830769421520089____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20044337449788473,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P110_W345304742814156446',
    p_attribute_value => '349792885320463043____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20045502936965629,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20045725446966028,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4350_P53_W34954404769221837',
    p_attribute_value => '34956410007247564____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20001834255583746,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20134724147890850,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4070_W47949429235486335',
    p_attribute_value => '47951124794493113____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20043236823770009,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P130_W708529861800941074',
    p_attribute_value => '708580560525001941____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20135016166891492,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W2050828593861326',
    p_attribute_value => '2117833588027975____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20135213219891512,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P2300_W92468021968325911',
    p_attribute_value => '95148537308558700____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20135471493899521,
    p_user_id => 'HR_ADMIN',
    p_preference_name => 'FSP101_P24_R20133271724887953_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20137358911079135,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P7100_W2235513044684112',
    p_attribute_value => '1513253287078617____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20137466899079996,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P1921_R310374200946241813_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21601842084930793,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P9601_W7716039542378463',
    p_attribute_value => '7733154735379505____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15800508136354073,
    p_user_id => 'AHMED',
    p_preference_name => 'F4100_P1_SHOW_UPDATES',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16026086499475187,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP119_P1_R57035269326682792_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15021181076026793,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 15400449140030153,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16026148597475543,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP119_P2_R58629575155111105_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16750379515098507,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_119_P3_W57344425009736411',
    p_attribute_value => '57465630360371892____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 16750948392210918,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P33_R427665843253594857_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17438603873603859,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP_IR_4000_P1235_W480642409196787876',
    p_attribute_value => '480643318916789165____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17438768300605278,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P1237_R125623624628434962_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 17438801382605282,
    p_user_id => 'MOI_ADMIN',
    p_preference_name => 'FSP4000_P1237_R125625719218442826_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18463601259749437,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4350_P96_R185602275935580522_SORT',
    p_attribute_value => 'sort_3_desc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18463955487785628,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18474928331795779,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_120_P10010_W18465187713794754',
    p_attribute_value => '18471057152794782____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18520088264813609,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P4910_W3738700462051133',
    p_attribute_value => '3741124531126093____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18520170405814218,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4000_P4911_R52412001060114527_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18610747312154007,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4000_P4761_R746836409020161499_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18610887957154234,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4000_P385_R543179732397973700_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18611204120177257,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P688_W5633379337882843',
    p_attribute_value => '6300998346442124____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18611324352177284,
    p_user_id => 'AHMED',
    p_preference_name => 'PERSISTENT_ITEM_P688_APPLICATION',
    p_attribute_value => '119',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18611586415177407,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P688_W5633926744882849',
    p_attribute_value => '6310559989467102____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18611665802177425,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4000_P688_R207469307328320096_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18612535569187629,
    p_user_id => 'AHMED',
    p_preference_name => 'AI_CONSENT_BUILDER',
    p_attribute_value => 'Y',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18612710899210032,
    p_user_id => 'AHMED',
    p_preference_name => 'APEX_IG_5402528899234735_CURRENT_REPORT',
    p_attribute_value => '27818993000237613:ICON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18612873090210040,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4600_P1_R4876236258998332_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18612944031210050,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4600_P1_R15607707130231509_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18613097723210057,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP4600_P1_R10424237842079440_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18613341568210979,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P9800_W3401447582525813',
    p_attribute_value => '3407798782570138____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18615668472235743,
    p_user_id => 'AHMED',
    p_preference_name => 'FSP_IR_4000_P1620_W312277037396040233',
    p_attribute_value => '312279461465115193____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 18816749499047996,
    p_user_id => 'ADMIN',
    p_preference_name => 'F4500_1157686386582338224_SPLITTER_STATE',
    p_attribute_value => '170:false',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19831030161322996,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_3304651691587419_CURRENT_REPORT',
    p_attribute_value => '3903492105430583:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19850899563327954,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP156_P3_R19842134415326534_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19851119977360714,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19851414648361692,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4500_P3100_R82702857605738101_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19851899527363153,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4500_P3110_R1595347007342836_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20043941240780132,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4850_P170_W736097149705755986',
    p_attribute_value => '740585292212062583____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20130987761877059,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1901_W3290607658489431',
    p_attribute_value => '3451665554620404____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20131252344884001,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P1946_R229851931201472455_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20137583661082128,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P1922_R922351464945024904_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20246149398266493,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4350_P51_W441077109644796807',
    p_attribute_value => '441077718682801782____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20844471843953109,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4400_W27796519609844319',
    p_attribute_value => '27798220762844327____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20851855758016332,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P4410_R4004965443629330_SORT',
    p_attribute_value => 'sort_4_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19830496321311590,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 19830605309319348,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P1800_W15698721914328105',
    p_attribute_value => '15700317824328377____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20851904747016335,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P4410_R1622849868577319_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 20852010415016418,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P4410_R29873113508481210_SORT',
    p_attribute_value => 'sort_3_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21201448051309132,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4000_P109_R591702465565020403_SORT',
    p_attribute_value => 'sort_2_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21401885186376428,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4000_P4100_W3727618522871356',
    p_attribute_value => '3728530690872449____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403254030381468,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4600_P200_W5312744428399715',
    p_attribute_value => '5346708973540098____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403310162382823,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P1_R4876236258998332_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403455872382832,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P1_R15607707130231509_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403571192382840,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P1_R10424237842079440_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403644905383684,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P100_R6335901170146534_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21403854711386845,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4600_P2030_W11166970035554301',
    p_attribute_value => '11180568937561381____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21404032981389715,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4600_P300_W5613062644530338',
    p_attribute_value => '5705047486344537____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21404176623390371,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_5714789063586345_CURRENT_REPORT',
    p_attribute_value => '5715653679586349:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21404349545391690,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4650_P8005_W638523033329835783',
    p_attribute_value => '645439567443372925____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21405156077425703,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP_IR_4600_P1000_W5165652406832107',
    p_attribute_value => '5190010758943919____',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21405291318431406,
    p_user_id => 'ADMIN',
    p_preference_name => 'APEX_IG_16491671812495530_CURRENT_REPORT',
    p_attribute_value => '22669552408594787:GRID',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21405343936446668,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P100_R156403623260150739_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21405789396460270,
    p_user_id => 'ADMIN',
    p_preference_name => 'FSP4600_P105_R5445151085568826_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21407677717473554,
    p_user_id => 'API_AUTH',
    p_preference_name => 'APEX_IG_5402528899234735_CURRENT_REPORT',
    p_attribute_value => '27818993000237613:ICON',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21407721195473556,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP4600_P1_R4876236258998332_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21407878284473557,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP4600_P1_R15607707130231509_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21407995620473564,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP4600_P1_R10424237842079440_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21408074797474932,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP4600_P100_R156403623260150739_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21408170692474934,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP4600_P100_R6335901170146534_SORT',
    p_attribute_value => 'sort_1_asc',
    p_tenant_id => '');
end;
/
begin
  wwv_imp_workspace.create_preferences$ (
    p_id => 21408386404476384,
    p_user_id => 'API_AUTH',
    p_preference_name => 'FSP_IR_4600_P112_W11171837955554350',
    p_attribute_value => '15591164110482871____',
    p_tenant_id => '');
end;
/
----------------
--query builder
--
begin
  wwv_imp_workspace.create_qb_saved_query (
    p_id => 12213955784371187
    ,p_query_owner => 'HR'
    ,p_title => 'APEX Activity Monitor'
 ,p_qb_sql => 
'select workspace'||wwv_flow.LF||
'      , application_name '||wwv_flow.LF||
'      , application_id, page_id'||wwv_flow.LF||
'      , count(*) total_page_events'||wwv_flow.LF||
'      , avg(elapsed_time) avg_elapsed_time'||wwv_flow.LF||
'      , sum(elapsed_time) elapsed_time'||wwv_flow.LF||
'from apex_workspace_activity_log'||wwv_flow.LF||
'--where view_date between to_date(''202311190900'',''RRRRMMDDHH24MISS'') and to_date(''202411191200'',''RRRRMMDDHH24MISS'')'||wwv_flow.LF||
'group by workspace, application_name, application_id, page_'||
'id'||wwv_flow.LF||
'order by 6, 7 asc'
    ,p_description => ''
    ,p_query_type => 'R'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061021','YYYYMMDDHH24MI')
    ,p_last_updated_by => 'HR_ADMIN'
    ,p_last_updated_on => to_date('202304061021','YYYYMMDDHH24MI'));
end;
/
----------------
--sql scripts
--
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '73657420646566696E6520275E2720766572696679206F66660D0A70726F6D7074202E2E2E6562615F64656D6F5F77665F646F635F6170740D0A637265617465206F72207265706C616365207061636B61676520626F6479206562615F64656D6F5F7766';
wwv_flow_imp.g_varchar2_table(2) := '5F646F635F6170742061730D0A0D0A66756E6374696F6E20636865636B5F617661696C6162696C697479280D0A20202020705F646F63746F725F6964202020202020202020696E206E756D6265722C0D0A20202020705F726571756573745F6461746520';
wwv_flow_imp.g_varchar2_table(3) := '2020202020696E2074696D657374616D7020776974682074696D65207A6F6E65290D0A72657475726E2076617263686172320D0A69730D0A202020206C5F6E6F2020202020206E756D626572203A3D20303B0D0A626567696E0D0A2020202073656C6563';
wwv_flow_imp.g_varchar2_table(4) := '7420646F63746F725F6E6F0D0A202020202020696E746F206C5F6E6F0D0A20202020202066726F6D206170706F696E746D656E740D0A20202020207768657265207363686564756C6520203D20705F726571756573745F646174650D0A20202020202020';
wwv_flow_imp.g_varchar2_table(5) := '616E6420646F63746F725F6E6F203D20705F646F63746F725F69643B0D0A2020202072657475726E202742555359273B0D0A657863657074696F6E0D0A202020207768656E206E6F5F646174615F666F756E64207468656E0D0A20202020202020207265';
wwv_flow_imp.g_varchar2_table(6) := '7475726E2027415641494C41424C45273B0D0A656E6420636865636B5F617661696C6162696C6974793B0D0A0D0A66756E6374696F6E20636F6E6669726D5F6170706F696E746D656E74280D0A20202020705F646F63746F725F69642020202020202020';
wwv_flow_imp.g_varchar2_table(7) := '20696E206E756D6265722C0D0A20202020705F726571756573745F64617465202020202020696E2074696D657374616D7020776974682074696D65207A6F6E652C0D0A20202020705F646F63746F725F656D61696C202020202020696E20766172636861';
wwv_flow_imp.g_varchar2_table(8) := '72322C0D0A20202020705F70617469656E745F6E616D65202020202020696E2076617263686172322C0D0A20202020705F70617469656E745F656D61696C2020202020696E2076617263686172322C0D0A20202020705F776F726B666C6F775F69642020';
wwv_flow_imp.g_varchar2_table(9) := '2020202020696E206E756D626572290D0A72657475726E206E756D6265720D0A69730D0A202020206C5F626F6F6B696E675F69642020206E756D6265723B0D0A626567696E0D0A202020696E7365727420696E746F206170706F696E746D656E7420280D';
wwv_flow_imp.g_varchar2_table(10) := '0A2020202020202070617469656E745F757365726E616D652C0D0A20202020202020646F63746F725F6E6F2C0D0A202020202020207363686564756C652C0D0A2020202020202070617469656E745F656D61696C2C0D0A20202020202020646F63746F72';
wwv_flow_imp.g_varchar2_table(11) := '5F656D61696C2C0D0A202020202020207374617475732C0D0A20202020202020776F726B666C6F775F6964292020200D0A20202076616C75657320280D0A20202020202020705F70617469656E745F6E616D652C0D0A20202020202020705F646F63746F';
wwv_flow_imp.g_varchar2_table(12) := '725F69642C0D0A20202020202020705F726571756573745F646174652C0D0A20202020202020705F70617469656E745F656D61696C2C0D0A20202020202020705F646F63746F725F656D61696C2C0D0A2020202020202027434F4E4649524D4544272C0D';
wwv_flow_imp.g_varchar2_table(13) := '0A20202020202020705F776F726B666C6F775F69640D0A20202020202020290D0A2020202072657475726E696E6720626F6F6B696E675F696420696E746F206C5F626F6F6B696E675F69643B0D0A0D0A2020202072657475726E206C5F626F6F6B696E67';
wwv_flow_imp.g_varchar2_table(14) := '5F69643B0D0A656E6420636F6E6669726D5F6170706F696E746D656E743B0D0A0D0A66756E6374696F6E207570646174655F66656573280D0A20202020705F646F63746F725F6964202020202020202020696E206E756D6265722C0D0A20202020705F72';
wwv_flow_imp.g_varchar2_table(15) := '6571756573745F64617465202020202020696E2076617263686172322C0D0A20202020705F626F6F6B696E675F69642020202020202020696E206E756D6265722C0D0A20202020705F70617469656E745F6E616D65202020202020696E20766172636861';
wwv_flow_imp.g_varchar2_table(16) := '7232290D0A72657475726E206E756D6265720D0A69730D0A202020206C5F666565202020202020202020206E756D626572203A3D203530303B0D0A626567696E0D0A202020202D2D20636865636B20746861742074686973206973206E6F742061206361';
wwv_flow_imp.g_varchar2_table(17) := '7365206F6620666F6C6C6F7775700D0A2020202073656C65637420300D0A202020202020696E746F206C5F6665652066726F6D206475616C0D0A2020202020776865726520657869737473202873656C6563742070617469656E745F757365726E616D65';
wwv_flow_imp.g_varchar2_table(18) := '0D0A20202020202020202020202020202020202020202066726F6D206170706F696E746D656E740D0A202020202020202020202020202020202020202077686572652070617469656E745F757365726E616D65203D20705F70617469656E745F6E616D65';
wwv_flow_imp.g_varchar2_table(19) := '0D0A20202020202020202020202020202020202020202020616E6420646F63746F725F6E6F20202020202020203D20705F646F63746F725F69640D0A20202020202020202020202020202020202020202020616E64207363686564756C65202020202020';
wwv_flow_imp.g_varchar2_table(20) := '2020203E3D20746F5F74696D657374616D705F747A28705F726571756573745F646174652C2744442D4D4F4E2D5959595920484832343A4D493A53532729202D20370D0A20202020202020202020202020202020202020202020616E6420737461747573';
wwv_flow_imp.g_varchar2_table(21) := '20202020202020202020203D20275041494427293B0D0A202020202D2D2075706461746520746865206170706F696E746D656E74207461626C6520746F207265666C6563742074686520726576697365642066656520666F722074686520636F6E73756C';
wwv_flow_imp.g_varchar2_table(22) := '746174696F6E0D0A202020207570646174655F6170706F696E746D656E74280D0A2020202020202020705F626F6F6B696E675F6964202020203D3E20705F626F6F6B696E675F69642C0D0A2020202020202020705F66656520202020202020202020203D';
wwv_flow_imp.g_varchar2_table(23) := '3E206C5F666565293B0D0A0D0A2020202072657475726E206C5F6665653B0D0A657863657074696F6E0D0A202020207768656E206E6F5F646174615F666F756E64207468656E0D0A20202020202020202D2D2074686973206973206E6F74206120666F6C';
wwv_flow_imp.g_varchar2_table(24) := '6C6F7775700D0A202020202020202072657475726E206C5F6665653B0D0A0D0A656E64207570646174655F666565733B0D0A0D0A70726F636564757265207570646174655F6170706F696E746D656E74280D0A20202020705F626F6F6B696E675F696420';
wwv_flow_imp.g_varchar2_table(25) := '20202020202020696E206E756D6265722C0D0A20202020705F737461747573202020202020202020202020696E2076617263686172322064656661756C74206E756C6C2C0D0A20202020705F666565202020202020202020202020202020696E206E756D';
wwv_flow_imp.g_varchar2_table(26) := '6265722064656661756C74206E756C6C290D0A69730D0A626567696E0D0A20202020757064617465206170706F696E746D656E740D0A202020202020207365742073746174757320202020203D20636F616C6573636528705F7374617475732C20737461';
wwv_flow_imp.g_varchar2_table(27) := '747573292C0D0A202020202020202020202066656520202020202020203D20636F616C6573636528705F6665652C20202020666565290D0A2020202020776865726520626F6F6B696E675F6964203D20705F626F6F6B696E675F69643B0D0A656E642075';
wwv_flow_imp.g_varchar2_table(28) := '70646174655F6170706F696E746D656E743B0D0A0D0A656E64206562615F64656D6F5F77665F646F635F6170743B0D0A2F0D0A73686F77206572723B';
end;
/
begin
  wwv_imp_workspace.create_script (
    p_id => 24020669491865107,
    p_flow_id => 4500,
    p_name => '24020669491865107/MEDICAL_SCRIPTS_PKG_BODY',
    p_pathid => null,
    p_filename => 'MEDICAL_SCRIPTS_PKG_BODY',
    p_title => 'MEDICAL_SCRIPTS_PKG_BODY',
    p_mime_type => 'text/plain',
    p_dad_charset => '',
    p_created_by => 'HR_ADMIN',
    p_created_on => to_date('202402262101','YYYYMMDDHH24MI'),
    p_updated_by => '',
    p_updated_on => to_date('','YYYYMMDDHH24MI'),
    p_deleted_as_of => to_date('000101010000','YYYYMMDDHH24MI'),
    p_content_type => 'BLOB',
    p_blob_content => wwv_flow_imp.g_varchar2_table,
    p_language => '',
    p_description => '',
    p_file_type => 'SCRIPT',
    p_file_charset => 'utf-8');
end;
/
begin
  wwv_imp_workspace.create_sw_results (
    p_id => 24030867266865321,
    p_file_id => 24020669491865107,
    p_job_id => null,
    p_run_by => 'HR_ADMIN',
    p_run_as => 'HR',
    p_started => to_date('202402262101','YYYYMMDDHH24MI'),
    p_start_time => 42865321,
    p_ended => to_date('202402262101','YYYYMMDDHH24MI'),
    p_end_time => 42865328,
    p_status => 'COMPLETE',
    p_run_comments => '');
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '626567696E0D0A202020206578656375746520696D6D656469617465202764726F70207461626C65206170706F696E746D656E74273B0D0A202020206578656375746520696D6D656469617465202764726F70207461626C6520646F63746F72273B0D0A';
wwv_flow_imp.g_varchar2_table(2) := '202020206578656375746520696D6D656469617465202764726F70207461626C652070617469656E745F666565646261636B273B0D0A202020206578656375746520696D6D656469617465202764726F702073657175656E6365206170706F696E745F73';
wwv_flow_imp.g_varchar2_table(3) := '6571273B0D0A202020206578656375746520696D6D656469617465202764726F702073657175656E63652070617469656E745F736571273B0D0A2020657863657074696F6E0D0A202020207768656E206F7468657273207468656E0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(4) := '2064626D735F6F75747075742E7075745F6C696E6528274442204F626A65637473206E6F7420657869737427293B0D0A2020656E643B0D0A20202F0D0A200D0A2020435245415445205441424C4520224150504F494E544D454E54220D0A202020282020';
wwv_flow_imp.g_varchar2_table(5) := '202022424F4F4B494E475F494422204E554D424552282A2C30292C0D0A202020202250415449454E545F555345524E414D452220564152434841523228343029204E4F54204E554C4C20454E41424C452C0D0A2020202022444F43544F525F4E4F22204E';
wwv_flow_imp.g_varchar2_table(6) := '554D424552282A2C3029204E4F54204E554C4C20454E41424C452C0D0A20202020225343484544554C45222054494D455354414D502028362920574954482054494D45205A4F4E45204E4F54204E554C4C20454E41424C452C0D0A202020202250415449';
wwv_flow_imp.g_varchar2_table(7) := '454E545F454D41494C2220564152434841523228343029204E4F54204E554C4C20454E41424C452C0D0A2020202022444F43544F525F454D41494C2220564152434841523228343029204E4F54204E554C4C20454E41424C452C0D0A2020202022535441';
wwv_flow_imp.g_varchar2_table(8) := '54555322205641524348415232283130292C0D0A202020202246454522204E554D4245522C0D0A2020202022574F524B464C4F575F494422204E554D4245522C0D0A20202020205052494D415259204B4559202822424F4F4B494E475F494422290D0A20';
wwv_flow_imp.g_varchar2_table(9) := '205553494E4720494E4445582020454E41424C450D0A20202029203B0D0A0D0A2020435245415445205441424C452022444F43544F52220D0A202020282020202022444E4F22204E554D424552282A2C30292C0D0A2020202022444E414D452220564152';
wwv_flow_imp.g_varchar2_table(10) := '4348415232283230292C0D0A20202020225350454349414C495A4154494F4E22205641524348415232283230292C0D0A20202020225155414C494649434154494F4E222043484152283135292C0D0A2020202022444F435F454D41494C22205641524348';
wwv_flow_imp.g_varchar2_table(11) := '41523228313030292044454641554C542027646E616D65406162632E636F6D272C0D0A20202020205052494D415259204B4559202822444E4F22290D0A20205553494E4720494E4445582020454E41424C450D0A20202029203B0D0A0D0A202043524541';
wwv_flow_imp.g_varchar2_table(12) := '5445205441424C45202250415449454E545F464545444241434B220D0A202020282020202022494422204E554D424552282A2C30292C0D0A202020202250415449454E545F4E414D4522205641524348415232283430292C0D0A2020202022444F43544F';
wwv_flow_imp.g_varchar2_table(13) := '525F4E4F2220564152434841523228313030292C0D0A20202020224150504F494E544D454E54222054494D455354414D502028362920574954482054494D45205A4F4E452C0D0A2020202022464545444241434B22205641524348415232283430303029';
wwv_flow_imp.g_varchar2_table(14) := '2C0D0A2020202022524154494E4722204E554D424552282A2C3029204E4F54204E554C4C20454E41424C452C0D0A2020202022435245415445445F4154222054494D455354414D502028362920574954482054494D45205A4F4E452C0D0A202020202255';
wwv_flow_imp.g_varchar2_table(15) := '5044415445445F4154222054494D455354414D502028362920574954482054494D45205A4F4E450D0A20202029203B0D0A0D0A204352454154452053455155454E43452020224150504F494E545F5345512220204D494E56414C55452031204D41585641';
wwv_flow_imp.g_varchar2_table(16) := '4C5545203939393939393920494E4352454D454E54204259203120535441525420574954482039303120434143484520313030204E4F4F5244455220204E4F4359434C4520204E4F4B45455020204E4F5343414C452020474C4F42414C203B0D0A0D0A20';
wwv_flow_imp.g_varchar2_table(17) := '4352454154452053455155454E434520202250415449454E545F5345512220204D494E56414C55452031204D415856414C55452039393939393920494E4352454D454E54204259203120535441525420574954482032303120434143484520313030204E';
wwv_flow_imp.g_varchar2_table(18) := '4F4F5244455220204E4F4359434C4520204E4F4B45455020204E4F5343414C452020474C4F42414C203B0D0A0D0A2020435245415445204F52205245504C4143452045444954494F4E41424C45205452494747455220224150504F494E544D454E545F54';
wwv_flow_imp.g_varchar2_table(19) := '220D0A6265666F72650D0A696E73657274206F7220757064617465206F722064656C657465206F6E20224150504F494E544D454E54220D0A666F72206561636820726F770D0A626567696E0D0A20202020696620696E73657274696E67207468656E0D0A';
wwv_flow_imp.g_varchar2_table(20) := '20202020202020206966203A6E65772E626F6F6B696E675F6964206973206E756C6C207468656E0D0A2020202020202020202020203A6E65772E626F6F6B696E675F6964203A3D206170706F696E745F7365712E6E65787476616C3B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(21) := '2020656E642069663B0D0A20202020656E642069663B0D0A656E643B0D0A2F0D0A414C544552205452494747455220224150504F494E544D454E545F542220454E41424C453B0D0A0D0A2020435245415445204F52205245504C4143452045444954494F';
wwv_flow_imp.g_varchar2_table(22) := '4E41424C452054524947474552202250415449454E545F464545444241434B5F54220D0A6265666F72650D0A696E73657274206F7220757064617465206F722064656C657465206F6E202250415449454E545F464545444241434B220D0A666F72206561';
wwv_flow_imp.g_varchar2_table(23) := '636820726F770D0A626567696E0D0A20202020696620696E73657274696E67207468656E0D0A20202020202020206966203A6E65772E6964206973206E756C6C207468656E0D0A2020202020202020202020203A6E65772E6964203A3D2070617469656E';
wwv_flow_imp.g_varchar2_table(24) := '745F7365712E6E65787476616C3B0D0A2020202020202020656E642069663B0D0A20202020656E642069663B0D0A656E643B0D0A2F0D0A414C5445522054524947474552202250415449454E545F464545444241434B5F542220454E41424C453B0D0A0D';
wwv_flow_imp.g_varchar2_table(25) := '0A200D0A2D2D20696E7365727420646F6320646174610D0A696E7365727420696E746F20646F63746F722076616C7565730D0A2831302C2027524F42455254272C20274F4E434F4C4F4759272C274D53272C27726F62657274406162632E636F6D27293B';
wwv_flow_imp.g_varchar2_table(26) := '0D0A0D0A696E7365727420696E746F20646F63746F722076616C7565730D0A2832302C2027424F272C202743415244494F4C4F4759272C202746524353272C27626F406162632E636F6D27293B0D0A0D0A696E7365727420696E746F20646F63746F7220';
wwv_flow_imp.g_varchar2_table(27) := '76616C7565730D0A2833302C20274A414E45272C2027454E54272C274D424253272C276A616E65406162632E636F6D27293B0D0A0D0A696E7365727420696E746F20646F63746F722076616C7565730D0A2834302C2027414E414348415454272C202750';
wwv_flow_imp.g_varchar2_table(28) := '535943484941545259272C274D53272C27616E6E65406162632E636F6D27293B0D0A0D0A696E7365727420696E746F20646F63746F722076616C7565730D0A2835302C2027504154272C202747454E4552414C272C274D424253272C2770617440616263';
wwv_flow_imp.g_varchar2_table(29) := '2E636F6D27293B0D0A0D0A696E7365727420696E746F20646F63746F722076616C7565730D0A2836302C20274D415254494E272C202752454E4F4C4F4759272C274D53272C276D617274696E406162632E636F6D27293B';
end;
/
begin
  wwv_imp_workspace.create_script (
    p_id => 24004976866851581,
    p_flow_id => 4500,
    p_name => '24004976866851581/MEDICAL_SCRIPTS',
    p_pathid => null,
    p_filename => 'MEDICAL_SCRIPTS',
    p_title => 'MEDICAL_SCRIPTS',
    p_mime_type => 'text/plain',
    p_dad_charset => '',
    p_created_by => 'HR_ADMIN',
    p_created_on => to_date('202402262058','YYYYMMDDHH24MI'),
    p_updated_by => '',
    p_updated_on => to_date('','YYYYMMDDHH24MI'),
    p_deleted_as_of => to_date('000101010000','YYYYMMDDHH24MI'),
    p_content_type => 'BLOB',
    p_blob_content => wwv_flow_imp.g_varchar2_table,
    p_language => '',
    p_description => '',
    p_file_type => 'SCRIPT',
    p_file_charset => 'utf-8');
end;
/
begin
  wwv_imp_workspace.create_sw_results (
    p_id => 24014705703852042,
    p_file_id => 24004976866851581,
    p_job_id => null,
    p_run_by => 'HR_ADMIN',
    p_run_as => 'HR',
    p_started => to_date('202402262059','YYYYMMDDHH24MI'),
    p_start_time => 42852046,
    p_ended => to_date('202402262059','YYYYMMDDHH24MI'),
    p_end_time => 42852101,
    p_status => 'COMPLETE',
    p_run_comments => '');
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '435245415445205441424C452022454D505F3122200D0A280D0A2022454D504E4F22204E554D4245522047454E4552415445442042592044454641554C54204F4E204E554C4C204153204944454E54495459204D494E56414C55452031204D415856414C';
wwv_flow_imp.g_varchar2_table(2) := '55452039393939393939393939393939393939393939393939393939393939200D0A20494E4352454D454E54204259203120535441525420574954482038303030204E4F4341434845204E4F4F5244455220204E4F4359434C4520204E4F4B4545502020';
wwv_flow_imp.g_varchar2_table(3) := '4E4F54204E554C4C20454E41424C452C200D0A2022454D505F4E414D4522205641524348415232283130292C0D0A20224D475222204E554D42455228342C30292C0D0A20434F4E53545241494E542022454D505F315F504B22205052494D415259204B45';
wwv_flow_imp.g_varchar2_table(4) := '59202822454D504E4F2229293B0D0A0D0A696E7365727420696E746F20656D705F3128656D706E6F2C20656D705F6E616D652C206D6772292076616C756573202831302C20274A4F484E272C203330293B0D0A696E7365727420696E746F20656D705F31';
wwv_flow_imp.g_varchar2_table(5) := '28656D706E6F2C20656D705F6E616D652C206D6772292076616C756573202832302C2027434C415241272C3330293B0D0A696E7365727420696E746F20656D705F3128656D706E6F2C20656D705F6E616D652C206D6772292076616C756573202833302C';
wwv_flow_imp.g_varchar2_table(6) := '20274A414E45272C203430293B0D0A696E7365727420696E746F20656D705F3128656D706E6F2C20656D705F6E616D652C206D6772292076616C756573202834302C20274D415454272C203530293B0D0A696E7365727420696E746F20656D705F312865';
wwv_flow_imp.g_varchar2_table(7) := '6D706E6F2C20656D705F6E616D652C206D6772292076616C756573202835302C2027534F50484945272C206E756C6C293B0D0A636F6D6D69743B0D0A0D0A435245415445205441424C452022454D505F54524156454C5F52455155455354220D0A280D0A';
wwv_flow_imp.g_varchar2_table(8) := '225245515F494422204E554D4245522047454E4552415445442042592044454641554C54204F4E204E554C4C0D0A4153204944454E54495459204D494E56414C55452031204D415856414C55452039393939393939393939393939393939393939393939';
wwv_flow_imp.g_varchar2_table(9) := '39393939393920494E4352454D454E54204259203120535441525420574954482038303030204E4F4341434845204E4F4F52444552204E4F4359434C45204E4F4B454550204E4F54204E554C4C20454E41424C452C0D0A22454D505F4E4F222056415243';
wwv_flow_imp.g_varchar2_table(10) := '48415232283130292C0D0A2254524156454C5F5459504522205641524348415232283235292C0D0A224E4F5F4F465F4441595322204E554D42455228342C30292C0D0A22455354494D415445445F434F535422204E554D42455228382C30292C0D0A2255';
wwv_flow_imp.g_varchar2_table(11) := '5044415445445F425922205641524348415232283230292C0D0A2253544154555322205641524348415232283230292C0D0A434F4E53545241494E542022454D505F54524156454C5F524551554553545F504B22205052494D415259204B455920282252';
wwv_flow_imp.g_varchar2_table(12) := '45515F49442229293B';
end;
/
begin
  wwv_imp_workspace.create_script (
    p_id => 7220658551613206,
    p_flow_id => 4500,
    p_name => '7220658551613206/TRAVEL_REQUEST_APP_SCRIPT',
    p_pathid => null,
    p_filename => 'TRAVEL_REQUEST_APP_SCRIPT',
    p_title => 'TRAVEL_REQUEST_APP_SCRIPT',
    p_mime_type => 'text/plain',
    p_dad_charset => '',
    p_created_by => 'HR_ADMIN',
    p_created_on => to_date('202302210830','YYYYMMDDHH24MI'),
    p_updated_by => '',
    p_updated_on => to_date('','YYYYMMDDHH24MI'),
    p_deleted_as_of => to_date('000101010000','YYYYMMDDHH24MI'),
    p_content_type => 'BLOB',
    p_blob_content => wwv_flow_imp.g_varchar2_table,
    p_language => '',
    p_description => '',
    p_file_type => 'SCRIPT',
    p_file_charset => 'utf-8');
end;
/
begin
  wwv_imp_workspace.create_sw_results (
    p_id => 7224021513613951,
    p_file_id => 7220658551613206,
    p_job_id => null,
    p_run_by => 'HR_ADMIN',
    p_run_as => 'HR',
    p_started => to_date('202302210831','YYYYMMDDHH24MI'),
    p_start_time => 4613954,
    p_ended => to_date('202302210831','YYYYMMDDHH24MI'),
    p_end_time => 4613979,
    p_status => 'COMPLETE',
    p_run_comments => '');
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '73657420646566696E6520275E2720766572696679206F66660D0A70726F6D7074202E2E2E6562615F64656D6F5F77665F646F635F6170740D0A637265617465206F72207265706C616365207061636B616765206562615F64656D6F5F77665F646F635F';
wwv_flow_imp.g_varchar2_table(2) := '617074206175746869642063757272656E745F757365722061730D0A0D0A66756E6374696F6E20636865636B5F617661696C6162696C697479280D0A20202020705F646F63746F725F6964202020202020202020696E206E756D6265722C0D0A20202020';
wwv_flow_imp.g_varchar2_table(3) := '705F726571756573745F64617465202020202020696E2074696D657374616D7020776974682074696D65207A6F6E65290D0A72657475726E2076617263686172323B0D0A0D0A66756E6374696F6E20636F6E6669726D5F6170706F696E746D656E74280D';
wwv_flow_imp.g_varchar2_table(4) := '0A20202020705F646F63746F725F6964202020202020202020696E206E756D6265722C0D0A20202020705F726571756573745F64617465202020202020696E2074696D657374616D7020776974682074696D65207A6F6E652C0D0A20202020705F646F63';
wwv_flow_imp.g_varchar2_table(5) := '746F725F656D61696C202020202020696E2076617263686172322C0D0A20202020705F70617469656E745F6E616D65202020202020696E2076617263686172322C0D0A20202020705F70617469656E745F656D61696C2020202020696E20766172636861';
wwv_flow_imp.g_varchar2_table(6) := '72322C0D0A20202020705F776F726B666C6F775F696420202020202020696E206E756D626572290D0A72657475726E206E756D6265723B0D0A0D0A66756E6374696F6E207570646174655F66656573280D0A20202020705F646F63746F725F6964202020';
wwv_flow_imp.g_varchar2_table(7) := '202020202020696E206E756D6265722C0D0A20202020705F726571756573745F64617465202020202020696E2076617263686172322C0D0A20202020705F626F6F6B696E675F69642020202020202020696E206E756D6265722C0D0A20202020705F7061';
wwv_flow_imp.g_varchar2_table(8) := '7469656E745F6E616D65202020202020696E207661726368617232290D0A72657475726E206E756D6265723B0D0A0D0A70726F636564757265207570646174655F6170706F696E746D656E74280D0A20202020705F626F6F6B696E675F69642020202020';
wwv_flow_imp.g_varchar2_table(9) := '202020696E206E756D6265722C0D0A20202020705F737461747573202020202020202020202020696E2076617263686172322064656661756C74206E756C6C2C0D0A20202020705F666565202020202020202020202020202020696E206E756D62657220';
wwv_flow_imp.g_varchar2_table(10) := '64656661756C74206E756C6C293B0D0A0D0A656E64206562615F64656D6F5F77665F646F635F6170743B0D0A2F0D0A73686F77206572723B';
end;
/
begin
  wwv_imp_workspace.create_script (
    p_id => 24016920255861378,
    p_flow_id => 4500,
    p_name => '24016920255861378/MEDICAL_SCRIPTS_PKG_SPEC',
    p_pathid => null,
    p_filename => 'MEDICAL_SCRIPTS_PKG_SPEC',
    p_title => 'MEDICAL_SCRIPTS_PKG_SPEC',
    p_mime_type => 'text/plain',
    p_dad_charset => '',
    p_created_by => 'HR_ADMIN',
    p_created_on => to_date('202402262100','YYYYMMDDHH24MI'),
    p_updated_by => '',
    p_updated_on => to_date('','YYYYMMDDHH24MI'),
    p_deleted_as_of => to_date('000101010000','YYYYMMDDHH24MI'),
    p_content_type => 'BLOB',
    p_blob_content => wwv_flow_imp.g_varchar2_table,
    p_language => '',
    p_description => '',
    p_file_type => 'SCRIPT',
    p_file_charset => 'utf-8');
end;
/
begin
  wwv_imp_workspace.create_sw_results (
    p_id => 24020379684861756,
    p_file_id => 24016920255861378,
    p_job_id => null,
    p_run_by => 'HR_ADMIN',
    p_run_as => 'HR',
    p_started => to_date('202402262100','YYYYMMDDHH24MI'),
    p_start_time => 42861756,
    p_ended => to_date('202402262100','YYYYMMDDHH24MI'),
    p_end_time => 42861759,
    p_status => 'COMPLETE',
    p_run_comments => '');
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2D2D20637265617465207461626C65730D0A637265617465207461626C6520646570745F3320280D0A20202020696420202020202020202020202020202020202020202020202020202020206E756D6265722067656E6572617465642062792064656661';
wwv_flow_imp.g_varchar2_table(2) := '756C74206F6E206E756C6C206173206964656E74697479200D0A2020202020202020202020202020202020202020202020202020202020202020202020636F6E73747261696E7420646570745F335F69645F706B207072696D617279206B65792C0D0A20';
wwv_flow_imp.g_varchar2_table(3) := '202020646570745F6E616D6520202020202020202020202020202020202020202020766172636861723228352063686172292C0D0A202020206C6F636174696F6E2020202020202020202020202020202020202020202020766172636861723228333020';
wwv_flow_imp.g_varchar2_table(4) := '63686172290D0A290D0A3B0D0A0D0A637265617465207461626C6520656D703320280D0A20202020696420202020202020202020202020202020202020202020202020202020206E756D6265722067656E6572617465642062792064656661756C74206F';
wwv_flow_imp.g_varchar2_table(5) := '6E206E756C6C206173206964656E74697479200D0A2020202020202020202020202020202020202020202020202020202020202020202020636F6E73747261696E7420656D70335F69645F706B207072696D617279206B65792C0D0A20202020656D705F';
wwv_flow_imp.g_varchar2_table(6) := '6E616D65202020202020202020202020202020202020202020202076617263686172322833302063686172290D0A2020202020202020202020202020202020202020202020202020202020202020202020636F6E73747261696E7420656D70335F656D70';
wwv_flow_imp.g_varchar2_table(7) := '5F6E616D655F756E7120756E69717565206E6F74206E756C6C2C0D0A20202020686972655F6461746520202020202020202020202020202020202020202020646174652C0D0A2020202073616C2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(8) := '20202020206E756D6265722064656661756C74202731303030272C0D0A20202020646570745F6E6F2020202020202020202020202020202020202020202020206E756D6265720D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(9) := '20202020202020636F6E73747261696E7420656D70335F646570745F6E6F5F666B0D0A20202020202020202020202020202020202020202020202020202020202020202020207265666572656E63657320646570745F33206F6E2064656C657465206361';
wwv_flow_imp.g_varchar2_table(10) := '73636164650D0A290D0A3B0D0A0D0A2D2D207461626C6520696E6465780D0A63726561746520696E64657820656D70335F6931206F6E20656D70332028646570745F6E6F293B0D0A0D0A2D2D206C6F616420646174610D0A200D0A696E7365727420696E';
wwv_flow_imp.g_varchar2_table(11) := '746F20646570745F3320280D0A2020202069642C0D0A20202020646570745F6E616D652C0D0A202020206C6F636174696F6E0D0A292076616C75657320280D0A20202020312C0D0A20202020274445505431272C0D0A202020202754616E717565636974';
wwv_flow_imp.g_varchar2_table(12) := '6F73270D0A293B0D0A0D0A696E7365727420696E746F20646570745F3320280D0A2020202069642C0D0A20202020646570745F6E616D652C0D0A202020206C6F636174696F6E0D0A292076616C75657320280D0A20202020322C0D0A2020202027444550';
wwv_flow_imp.g_varchar2_table(13) := '5432272C0D0A202020202753756761726C6F6166270D0A293B0D0A0D0A696E7365727420696E746F20646570745F3320280D0A2020202069642C0D0A20202020646570745F6E616D652C0D0A202020206C6F636174696F6E0D0A292076616C7565732028';
wwv_flow_imp.g_varchar2_table(14) := '0D0A20202020332C0D0A20202020274445505431272C0D0A202020202744616C652043697479270D0A293B0D0A0D0A696E7365727420696E746F20646570745F3320280D0A2020202069642C0D0A20202020646570745F6E616D652C0D0A202020206C6F';
wwv_flow_imp.g_varchar2_table(15) := '636174696F6E0D0A292076616C75657320280D0A20202020342C0D0A20202020274445505432272C0D0A202020202747726F7376656E6F72270D0A293B0D0A0D0A636F6D6D69743B0D0A0D0A616C746572207461626C6520646570745F330D0A6D6F6469';
wwv_flow_imp.g_varchar2_table(16) := '66792069642067656E65726174656420616C77617973206173206964656E746974792072657374617274207374617274207769746820353B0D0A200D0A2D2D206C6F616420646174610D0A2D2D206C6F616420646174610D0A200D0A696E736572742069';
wwv_flow_imp.g_varchar2_table(17) := '6E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020312C0D0A2020202027';
wwv_flow_imp.g_varchar2_table(18) := '47726963656C6461204C75656262657273272C0D0A2020202073797364617465202D2037352C0D0A2020202035342C0D0A20202020340D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E';
wwv_flow_imp.g_varchar2_table(19) := '616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020322C0D0A20202020274465616E20426F6C6C696368272C0D0A2020202073797364617465202D20';
wwv_flow_imp.g_varchar2_table(20) := '32372C0D0A2020202037342C0D0A20202020330D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A202020';
wwv_flow_imp.g_varchar2_table(21) := '20646570745F6E6F0D0A292076616C75657320280D0A20202020332C0D0A20202020274D696C6F204D616E6F6E69272C0D0A2020202073797364617465202D2031322C0D0A2020202037362C0D0A20202020320D0A293B0D0A0D0A696E7365727420696E';
wwv_flow_imp.g_varchar2_table(22) := '746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020342C0D0A20202020274C';
wwv_flow_imp.g_varchar2_table(23) := '617572696365204B61726C272C0D0A2020202073797364617465202D20312C0D0A2020202035372C0D0A20202020330D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20';
wwv_flow_imp.g_varchar2_table(24) := '202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020352C0D0A202020202741756775737420527570656C272C0D0A2020202073797364617465202D2034312C0D0A2020';
wwv_flow_imp.g_varchar2_table(25) := '202034302C0D0A20202020330D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E';
wwv_flow_imp.g_varchar2_table(26) := '6F0D0A292076616C75657320280D0A20202020362C0D0A202020202753616C6F6D6520477569737469272C0D0A2020202073797364617465202D2037322C0D0A2020202039312C0D0A20202020340D0A293B0D0A0D0A696E7365727420696E746F20656D';
wwv_flow_imp.g_varchar2_table(27) := '703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020372C0D0A20202020274C6F76696520';
wwv_flow_imp.g_varchar2_table(28) := '5269746163636F272C0D0A2020202073797364617465202D2036322C0D0A2020202031372C0D0A20202020310D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020';
wwv_flow_imp.g_varchar2_table(29) := '686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A20202020382C0D0A2020202027436861796120477265637A6B6F77736B69272C0D0A2020202073797364617465202D2036382C0D0A';
wwv_flow_imp.g_varchar2_table(30) := '2020202038352C0D0A20202020330D0A293B0D0A0D0A696E7365727420696E746F20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A2020202064657074';
wwv_flow_imp.g_varchar2_table(31) := '5F6E6F0D0A292076616C75657320280D0A20202020392C0D0A20202020275477696C6120436F6F6C62657468272C0D0A2020202073797364617465202D2036302C0D0A2020202031382C0D0A20202020330D0A293B0D0A0D0A696E7365727420696E746F';
wwv_flow_imp.g_varchar2_table(32) := '20656D703320280D0A2020202069642C0D0A20202020656D705F6E616D652C0D0A20202020686972655F646174652C0D0A2020202073616C2C0D0A20202020646570745F6E6F0D0A292076616C75657320280D0A2020202031302C0D0A20202020274361';
wwv_flow_imp.g_varchar2_table(33) := '726C6F74746120416368656E62616368272C0D0A2020202073797364617465202D2037332C0D0A2020202035372C0D0A20202020320D0A293B0D0A0D0A636F6D6D69743B0D0A0D0A616C746572207461626C6520656D70330D0A6D6F6469667920696420';
wwv_flow_imp.g_varchar2_table(34) := '67656E65726174656420616C77617973206173206964656E74697479207265737461727420737461727420776974682031313B0D0A200D0A';
end;
/
begin
  wwv_imp_workspace.create_script (
    p_id => 12214971544608326,
    p_flow_id => 4500,
    p_name => '12214971544608326/Depts',
    p_pathid => null,
    p_filename => 'Depts',
    p_title => 'Depts',
    p_mime_type => 'text/plain',
    p_dad_charset => '',
    p_created_by => 'HR_ADMIN',
    p_created_on => to_date('202304061100','YYYYMMDDHH24MI'),
    p_updated_by => 'HR_ADMIN',
    p_updated_on => to_date('202304061101','YYYYMMDDHH24MI'),
    p_deleted_as_of => to_date('000101010000','YYYYMMDDHH24MI'),
    p_content_type => 'BLOB',
    p_blob_content => wwv_flow_imp.g_varchar2_table,
    p_language => '',
    p_description => '',
    p_file_type => 'SCRIPT',
    p_file_charset => 'utf-8');
end;
/
begin
  wwv_imp_workspace.create_sw_results (
    p_id => 12278479470610523,
    p_file_id => 12214971544608326,
    p_job_id => null,
    p_run_by => 'HR_ADMIN',
    p_run_as => 'HR',
    p_started => to_date('202304061101','YYYYMMDDHH24MI'),
    p_start_time => 610526,
    p_ended => to_date('202304061101','YYYYMMDDHH24MI'),
    p_end_time => 610607,
    p_status => 'COMPLETE',
    p_run_comments => '');
end;
/
----------------
--sql commands
--
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 9468326158840428
 ,p_command => 
'alter table "DEPT" add'||wwv_flow.LF||
'("DEPT_MANAGER" NUMBER(20,2))'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202303141411','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 9468814719873740
 ,p_command => 
'drop TABLE "DEPT2"'||wwv_flow.LF||
'cascade constraints'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202303141416','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 11806911199417468
 ,p_command => 
'alter table "STUDENTS" add constraint'||wwv_flow.LF||
'"STUDENTS_CON" primary key ("ID")'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304031043','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12015826633235340
 ,p_command => 
'select a."FIRST_NAME", '||wwv_flow.LF||
'       a."EMPLOYEE_ID", '||wwv_flow.LF||
'       count(*) c'||wwv_flow.LF||
'from   "EMPLOYEES" a, "EMPLOYEES" b'||wwv_flow.LF||
'where  a."EMPLOYEE_ID" = b."MANAGER_ID"'||wwv_flow.LF||
'group by a."FIRST_NAME", a."EMPLOYEE_ID"'||wwv_flow.LF||
'order by 3 desc'||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304051019','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12016409551291976
 ,p_command => 
'select '||wwv_flow.LF||
' EMPNO,'||wwv_flow.LF||
' ENAME,'||wwv_flow.LF||
' JOB,'||wwv_flow.LF||
' MGR,'||wwv_flow.LF||
' HIREDATE,'||wwv_flow.LF||
' SAL,'||wwv_flow.LF||
' COMM,'||wwv_flow.LF||
' DEPTNO'||wwv_flow.LF||
' from EMP'||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304051029','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 9468725129872051
 ,p_command => 
'truncate table "DEPT2"'||wwv_flow.LF||
'/'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202303141416','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12012642508231701
 ,p_command => 
'select EMPLOYEE_ID,'||wwv_flow.LF||
'       FIRST_NAME,'||wwv_flow.LF||
'       LAST_NAME,'||wwv_flow.LF||
'       EMAIL,'||wwv_flow.LF||
'       PHONE_NUMBER,'||wwv_flow.LF||
'       HIRE_DATE,'||wwv_flow.LF||
'       (select "JOB_TITLE" from "JOBS" x where x."JOB_ID" = a."JOB_ID") "JOB_ID",'||wwv_flow.LF||
'       SALARY,'||wwv_flow.LF||
'       COMMISSION_PCT,'||wwv_flow.LF||
'       (select "FIRST_NAME" from "EMPLOYEES" x where x."EMPLOYEE_ID" = a."MANAGER_ID") "MANAGER_ID",'||wwv_flow.LF||
'       (select "DEPARTMENT_NAME" from "DEPARTMENTS" x where x."DEPART'||
'MENT_ID" = a."DEPARTMENT_ID") "DEPARTMENT_ID"'||wwv_flow.LF||
'from "EMPLOYEES" a'||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304051019','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12016219437245604
 ,p_command => 
'select * from emp;'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304051021','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 9468471046843546
 ,p_command => 
'alter table "DEPT" modify'||wwv_flow.LF||
'("DEPT_MANAGER" NUMBER(10,2))'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202303141411','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 9468517728866589
 ,p_command => 
'create table "DEPT2" as'||wwv_flow.LF||
'select "DEPTNO","DNAME"'||wwv_flow.LF||
'from "DEPT"'||wwv_flow.LF||
'where DEPTNO < 40'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202303141415','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 17674844754492739
 ,p_command => 
'SELECT *'||wwv_flow.LF||
'  FROM apex_collections'||wwv_flow.LF||
' WHERE collection_name = ''EMPLOYEE_DETAILS_COLLECTION'';'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202305171442','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 17675362558494012
 ,p_command => 
'SELECT *'||wwv_flow.LF||
'  FROM apex_collections'||wwv_flow.LF||
' WHERE collection_name = ''EMPLOYEE_DETAILS_COLLECTION'';'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202305171442','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 17675431006495056
 ,p_command => 
'SELECT n001 AS EMP_NO'||wwv_flow.LF||
'  FROM apex_collections'||wwv_flow.LF||
' WHERE collection_name = ''EMPLOYEE_DETAILS_COLLECTION'';'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202305171442','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 6050797730941398
 ,p_command => 
'SELECT ''Manager Name: '' || FIRST_NAME || '' '' || LAST_NAME as FIRST_NAME,MANAGER_ID '||wwv_flow.LF||
'FROM EMPLOYEES '||wwv_flow.LF||
'WHERE MANAGER_ID = :P_MANAGER_ID'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202302161626','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12213887115362815
 ,p_command => 
'select workspace'||wwv_flow.LF||
'      , application_name '||wwv_flow.LF||
'      , application_id, page_id'||wwv_flow.LF||
'      , count(*) total_page_events'||wwv_flow.LF||
'      , avg(elapsed_time) avg_elapsed_time'||wwv_flow.LF||
'      , sum(elapsed_time) elapsed_time'||wwv_flow.LF||
'from apex_workspace_activity_log'||wwv_flow.LF||
'--where view_date between to_date(''202311190900'',''RRRRMMDDHH24MISS'') and to_date(''202411191200'',''RRRRMMDDHH24MISS'')'||wwv_flow.LF||
'group by workspace, application_name, application_id, page_'||
'id'||wwv_flow.LF||
'order by 6, 7 asc'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061020','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12280922963634901
 ,p_command => 
'drop TABLE "DEPT_3"'||wwv_flow.LF||
'cascade constraints'||wwv_flow.LF||
'/   '||wwv_flow.LF||
''
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061105','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12015946041243235
 ,p_command => 
'select * from emp;'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304051021','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12213537791356628
 ,p_command => 
'select workspace'||wwv_flow.LF||
'      , application_name '||wwv_flow.LF||
'      , application_id, page_id'||wwv_flow.LF||
'      , count(*) total_page_events'||wwv_flow.LF||
'      , avg(elapsed_time) avg_elapsed_time'||wwv_flow.LF||
'      , sum(elapsed_time) elapsed_time'||wwv_flow.LF||
'from apex_workspace_activity_log'||wwv_flow.LF||
'where view_date between to_date(''201911190900'',''RRRRMMDDHH24MISS'') and to_date(''201911191200'',''RRRRMMDDHH24MISS'')'||wwv_flow.LF||
'group by workspace, application_name, application_id, page_id'||
''||wwv_flow.LF||
'order by 6, 7 asc'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061019','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12213626126360515
 ,p_command => 
'select workspace'||wwv_flow.LF||
'      , application_name '||wwv_flow.LF||
'      , application_id, page_id'||wwv_flow.LF||
'      , count(*) total_page_events'||wwv_flow.LF||
'      , avg(elapsed_time) avg_elapsed_time'||wwv_flow.LF||
'      , sum(elapsed_time) elapsed_time'||wwv_flow.LF||
'from apex_workspace_activity_log'||wwv_flow.LF||
'where view_date between to_date(''202411190900'',''RRRRMMDDHH24MISS'') and to_date(''201911191200'',''RRRRMMDDHH24MISS'')'||wwv_flow.LF||
'group by workspace, application_name, application_id, page_id'||
''||wwv_flow.LF||
'order by 6, 7 asc'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061019','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 12213768511362007
 ,p_command => 
'select workspace'||wwv_flow.LF||
'      , application_name '||wwv_flow.LF||
'      , application_id, page_id'||wwv_flow.LF||
'      , count(*) total_page_events'||wwv_flow.LF||
'      , avg(elapsed_time) avg_elapsed_time'||wwv_flow.LF||
'      , sum(elapsed_time) elapsed_time'||wwv_flow.LF||
'from apex_workspace_activity_log'||wwv_flow.LF||
'where view_date between to_date(''202311190900'',''RRRRMMDDHH24MISS'') and to_date(''202411191200'',''RRRRMMDDHH24MISS'')'||wwv_flow.LF||
'group by workspace, application_name, application_id, page_id'||
''||wwv_flow.LF||
'order by 6, 7 asc'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202304061019','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 1800591365427685
 ,p_command => 
'alter user admin account unlock;'
    ,p_created_by => 'HR_ADMIN'
    ,p_created_on => to_date('202401092137','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 30819401802730287
 ,p_command => 
'BEGIN'||wwv_flow.LF||
'    APEX_UTIL.set_workspace (p_workspace => ''HR_WS'');'||wwv_flow.LF||
'    apex_workflow.remove_development_instances (p_application_id => 108);'||wwv_flow.LF||
'    COMMIT;'||wwv_flow.LF||
'END;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202403312148','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 29090223176662239
 ,p_command => 
'select sysdate, dump(sysdate) as date_bytes from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202403191100','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 29124955946879384
 ,p_command => 
'select workflow_id,'||wwv_flow.LF||
'       workflow_def_name,'||wwv_flow.LF||
'       workflow_def_app_name,'||wwv_flow.LF||
'       title,'||wwv_flow.LF||
'       initiator,'||wwv_flow.LF||
'       state_code,'||wwv_flow.LF||
'       created_on,'||wwv_flow.LF||
'       created_ago,'||wwv_flow.LF||
'       created_ago_hours,'||wwv_flow.LF||
'       last_updated_on,'||wwv_flow.LF||
'       badge_text,'||wwv_flow.LF||
'       badge_state'||wwv_flow.LF||
'  from table ( apex_workflow.get_workflows ('||wwv_flow.LF||
'                   p_context => ''SINGLE_WORKFLOW'''||wwv_flow.LF||
'                   , p_application_id => 108'||wwv_flow.LF||
'      '||
'             ) )'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202403191136','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 29236278994435020
 ,p_command => 
'select workflow_id,'||wwv_flow.LF||
'       workflow_def_name,'||wwv_flow.LF||
'       workflow_def_app_name,'||wwv_flow.LF||
'       title,'||wwv_flow.LF||
'       initiator,'||wwv_flow.LF||
'       state_code,'||wwv_flow.LF||
'       created_on,'||wwv_flow.LF||
'       created_ago,'||wwv_flow.LF||
'       created_ago_hours,'||wwv_flow.LF||
'       last_updated_on,'||wwv_flow.LF||
'       badge_text,'||wwv_flow.LF||
'       badge_state'||wwv_flow.LF||
'  from table ( apex_workflow.get_workflows ('||wwv_flow.LF||
'                   p_context => ''INITIATED_BY_ME'''||wwv_flow.LF||
'                   , p_application_id => :APP_ID'||wwv_flow.LF||
'  '||
'                 ) )'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202403200016','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 5051397088531004
 ,p_command => 
'select apex_application.get_callback_url from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202408062231','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 5051468456533689
 ,p_command => 
'select APEX_AUTHENTICATION.GET_CALLBACK_URL () from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202408062231','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 5557986396507962
 ,p_command => 
'select APEX_AUTHENTICATION.GET_CALLBACK_URL () from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202408070114','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 11730689347810273
 ,p_command => 
'SELECT LISTAGG(''<label class="c-label"><input type="checkbox"  value="'' || SERVICE_NAME || '' " checked disabled class="c-checkbox">'' || SERVICE_NAME || ''</label>'' , ''<br>'') '||wwv_flow.LF||
'        WITHIN GROUP (ORDER BY SERVICE_NAME)'||wwv_flow.LF||
'     FROM SERVICES_LIST'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202410241548','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 8831695776602307
 ,p_command => 
'select ''APEX'' tool, '||wwv_flow.LF||
'       version_no '||wwv_flow.LF||
'from apex_release'||wwv_flow.LF||
'union all'||wwv_flow.LF||
'select ''ORDS'', '||wwv_flow.LF||
'        ords.installed_version '||wwv_flow.LF||
'from dual'||wwv_flow.LF||
'union all'||wwv_flow.LF||
'select ''Database'' tool,'||wwv_flow.LF||
'       coalesce( x.version_full, x.version ) version_no'||wwv_flow.LF||
'from xmltable( '||wwv_flow.LF||
'  ''*'' passing xmltype('||wwv_flow.LF||
'    cursor('||wwv_flow.LF||
'      select pcv.* '||wwv_flow.LF||
'      from product_component_version pcv'||wwv_flow.LF||
'      where pcv.product like ''Oracle%'')) '||wwv_flow.LF||
'columns version varchar2(100) '||
'path ''/ROWSET/ROW/VERSION'','||wwv_flow.LF||
'version_full varchar2(100) path ''/ROWSET/ROW/VERSION_FULL'') x'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202409091445','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 10904383009542496
 ,p_command => 
'SELECT'||wwv_flow.LF||
'    region.region_name,'||wwv_flow.LF||
'    region.region_id'||wwv_flow.LF||
'FROM'||wwv_flow.LF||
'    apex_application_page_regions region'||wwv_flow.LF||
'    JOIN apex_application_page_items item ON region.application_id = item.application_id'||wwv_flow.LF||
'        AND region.page_id = item.page_id'||wwv_flow.LF||
'WHERE'||wwv_flow.LF||
'    item.item_name = :PX_ITEM_NAME'||wwv_flow.LF||
'    AND item.application_id = :APP_ID'||wwv_flow.LF||
'    AND item.page_id = :APP_PAGE_ID;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202410081722','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 10904461658545287
 ,p_command => 
'SELECT'||wwv_flow.LF||
'    region.region_name,'||wwv_flow.LF||
'    region.region_id'||wwv_flow.LF||
'FROM'||wwv_flow.LF||
'    apex_application_page_regions region'||wwv_flow.LF||
'    JOIN apex_application_page_items item ON region.application_id = item.application_id'||wwv_flow.LF||
'        AND region.page_id = item.page_id'||wwv_flow.LF||
'WHERE'||wwv_flow.LF||
'    --item.item_name = :PX_ITEM_NAME'||wwv_flow.LF||
'    --AND '||wwv_flow.LF||
'    item.application_id = :APP_ID'||wwv_flow.LF||
'    AND item.page_id = :APP_PAGE_ID;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202410081722','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 11730701733811598
 ,p_command => 
'SELECT SERVICE_NAME'||wwv_flow.LF||
'     FROM SERVICES_LIST'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202410241548','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18908982434098300
 ,p_command => 
'CREATE USER john_doe IDENTIFIED BY XXXXX;'||wwv_flow.LF||
'GRANT CONNECT, RESOURCE TO john_doe;'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202501151214','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18909062654100771
 ,p_command => 
'CREATE USER john_doe IDENTIFIED BY XXXXX;'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202501151214','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18909156741101356
 ,p_command => 
'GRANT CONNECT, RESOURCE TO john_doe;'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202501151214','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20843556371200542
 ,p_command => 
'select * from APEX_APPLICATION_TEMP_FILES;'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202502230918','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20843619136205353
 ,p_command => 
'select *'||wwv_flow.LF||
'  from apex_application_temp_files'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202502230919','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20844649085219435
 ,p_command => 
'select *'||wwv_flow.LF||
'  from apex_application_temp_files'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202502230922','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 4597813690424381
 ,p_command => 
'select APEX_AUTHENTICATION.GET_CALLBACK_URL () from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202408010033','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 5557614785499403
 ,p_command => 
'select APEX_AUTHENTICATION.GET_CALLBACK_URL () from dual;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202408070112','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOJ');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 25963684457443045
 ,p_command => 
'SELECT sql_id, sql_text, elapsed_time/1000000 AS elapsed_time_sec '||wwv_flow.LF||
'FROM v$sql '||wwv_flow.LF||
'WHERE elapsed_time > 5000000  -- Queries taking more than 5 seconds'||wwv_flow.LF||
'ORDER BY elapsed_time DESC;'
    ,p_created_by => 'MOI_ADMIN'
    ,p_created_on => to_date('202503031043','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 4000558711772679
 ,p_command => 
'SELECT STATUS FROM DBA_REGISTRY'||wwv_flow.LF||
'WHERE COMP_ID = ''APEX'';'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202503151658','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 13800138270942018
 ,p_command => 
'SELECT'||wwv_flow.LF||
'    s.sid,'||wwv_flow.LF||
'    s.serial#,'||wwv_flow.LF||
'    p.spid AS os_process,'||wwv_flow.LF||
'    s.username,'||wwv_flow.LF||
'    s.status,'||wwv_flow.LF||
'    s.program,'||wwv_flow.LF||
'    s.sql_id,'||wwv_flow.LF||
'    t.used_urec,'||wwv_flow.LF||
'    t.used_ublk'||wwv_flow.LF||
'FROM v$session s'||wwv_flow.LF||
'LEFT JOIN v$transaction t ON s.saddr = t.ses_addr'||wwv_flow.LF||
'JOIN v$process p ON s.paddr = p.addr'||wwv_flow.LF||
'WHERE s.username IS NOT NULL;'
    ,p_created_by => 'AHMED'
    ,p_created_on => to_date('202503231409','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 13800200951945307
 ,p_command => 
'SELECT * FROM ('||wwv_flow.LF||
'    SELECT'||wwv_flow.LF||
'        sql_id,'||wwv_flow.LF||
'        executions,'||wwv_flow.LF||
'        elapsed_time / 1000000 elapsed_sec,'||wwv_flow.LF||
'        sql_text'||wwv_flow.LF||
'    FROM v$sql'||wwv_flow.LF||
'    ORDER BY elapsed_time DESC'||wwv_flow.LF||
') WHERE ROWNUM <= 10;'
    ,p_created_by => 'AHMED'
    ,p_created_on => to_date('202503231410','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 13800398211947145
 ,p_command => 
'SHOW PARAMETER sga_target;'
    ,p_created_by => 'AHMED'
    ,p_created_on => to_date('202503231410','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18816814777051240
 ,p_command => 
'select max(salary) as max_salary'||wwv_flow.LF||
'  from employees'||wwv_flow.LF||
''
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504062140','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18819307250216703
 ,p_command => 
'select max(salary) as max_salary'||wwv_flow.LF||
'  from employees;'||wwv_flow.LF||
''
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504062207','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 18819474943217359
 ,p_command => 
'select max(salary) as max_salary'||wwv_flow.LF||
'  from emp;'||wwv_flow.LF||
''
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504062207','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20044528764807170
 ,p_command => 
'select * from depts;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504160856','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20044673474808745
 ,p_command => 
'select * from sys_agreemnts;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504160857','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20044704004811304
 ,p_command => 
'select * from sys_agreements;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504160857','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20045084630833085
 ,p_command => 
'select agreemnt_id from sys_agreements;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504160901','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20045114768833829
 ,p_command => 
'select agreement_id from sys_agreements;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504160901','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20130146426864606
 ,p_command => 
'select * from regions'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504181352','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20130209722865653
 ,p_command => 
'select * from depts'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504181353','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'MOI');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20130331388867412
 ,p_command => 
'select * from departments;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504181353','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
begin
  wwv_imp_workspace.create_sw_sql_cmds (
    p_id => 20130459511867950
 ,p_command => 
'select * from regions;'
    ,p_created_by => 'ADMIN'
    ,p_created_on => to_date('202504181353','YYYYMMDDHH24MI')
    ,p_parsed_schema => 'HR');
end;
/
----------------
--Quick SQL saved models
--
----------------
--user access log
--
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504181349','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504181350','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504181357','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504221124','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504221209','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504191245','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504201241','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504210900','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504212308','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504212309','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504220939','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504251438','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 127,
    p_owner => 'HR',
    p_access_date => to_date('202504251438','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504251440','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'AHMED',
    p_auth_method => 'is_login_password_valid',
    p_app => 4155,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504230909','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504230909','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504181357','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504181358','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'is_login_password_valid',
    p_app => 4155,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504181358','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504181358','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504201047','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504212223','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'HR_ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 101,
    p_owner => 'HR',
    p_access_date => to_date('202504212225','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504222000','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504230812','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Application Express Accounts',
    p_app => 112,
    p_owner => 'MOJ',
    p_access_date => to_date('202504230908','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504230909','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'API_AUTH',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504230921','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log1$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504262157','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504031251','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504031251','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504031307','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504071356','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504071442','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504071443','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504151252','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504051310','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504051323','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504062138','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 144,
    p_owner => 'MOI',
    p_access_date => to_date('202504062219','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504131149','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031247','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031250','YYYYMMDDHH24MI'),
    p_ip_address => '127.0.0.1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031251','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031341','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031459','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504031459','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504031459','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061321','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061705','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061752','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061753','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 146,
    p_owner => 'MOI',
    p_access_date => to_date('202504062335','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504100916','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504051309','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061120','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504061120','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'APEX Auth',
    p_app => 120,
    p_owner => 'HR',
    p_access_date => to_date('202504061126','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061142','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 151,
    p_owner => 'MOI',
    p_access_date => to_date('202504062348','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504100935','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504101517','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504160849','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'MOI_ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031332','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504031506','YYYYMMDDHH24MI'),
    p_ip_address => '127.0.0.1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061327','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061327','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061329','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 119,
    p_owner => 'MOI',
    p_access_date => to_date('202504061331','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061336','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 123,
    p_owner => 'MOI',
    p_access_date => to_date('202504061336','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'AHMED',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061341','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504061457','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Internal Authentication',
    p_app => 4100,
    p_owner => 'APEX_240200',
    p_access_date => to_date('202504131509','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'ADMIN',
    p_auth_method => 'Oracle APEX Accounts',
    p_app => 156,
    p_owner => 'HR',
    p_access_date => to_date('202504131540','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'API_AUTH',
    p_auth_method => 'WWV_FLOW_WORKSPACE_USER_API',
    p_app => 0,
    p_owner => '',
    p_access_date => to_date('202504160928','YYYYMMDDHH24MI'),
    p_ip_address => '127.0.0.1',
    p_remote_user => '',
    p_auth_result => 5,
    p_custom_status_text => '');
end;
/
begin
  wwv_imp_workspace.create_user_access_log2$ (
    p_login_name => 'API_AUTH',
    p_auth_method => 'WWV_FLOW_WORKSPACE_USER_API',
    p_app => 0,
    p_owner => '',
    p_access_date => to_date('202504160929','YYYYMMDDHH24MI'),
    p_ip_address => '127.0.0.1',
    p_remote_user => '',
    p_auth_result => 5,
    p_custom_status_text => '');
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'HR';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA HR - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_240200
-- Exported 23:00 Saturday April 26, 2025 by: 
--
 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'DEPARTMENTS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 12007136511218500 + wwv_flow_imp.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'DEPARTMENTS',
  p_report_region_title => 'Departments',
  p_form_region_title => 'Departments',
  p_description => '');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
 p_column_id => 12007234726218623 + wwv_flow_imp.g_id_offset
,p_table_id => 12007136511218500 + wwv_flow_imp.g_id_offset
,p_column_name => 'DEPARTMENT_ID'
,p_label => 'Department Id'
,p_help_text => 'Primary key column of departments table.'
,p_display_seq_form => 1
,p_display_in_form => 'Y'
,p_display_as_form => 'NATIVE_NUMBER_FIELD'
,p_display_as_tab_form => 'TEXT'
,p_display_seq_report => 1
,p_display_in_report => 'Y'
,p_display_as_report => 'ESCAPE_SC'
,p_aggregate_by => 'N'
,p_required => 'Y'
,p_alignment => 'R'
,p_display_width => 30
,p_max_width => 4
,p_height => 1
,p_group_by => 'N'
,p_searchable => 'N'
);
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
 p_column_id => 12007305526218625 + wwv_flow_imp.g_id_offset
,p_table_id => 12007136511218500 + wwv_flow_imp.g_id_offset
,p_column_name => 'DEPARTMENT_NAME'
,p_label => 'Department Name'
,p_help_text => 'A not null column that shows name of a department. Administration,'||chr(10)||
'Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public'||chr(10)||
'Relations, Sales, Finance, and Accounting. '
,p_display_seq_form => 2
,p_display_in_form => 'Y'
,p_display_as_form => 'NATIVE_TEXT_FIELD'
,p_display_as_tab_form => 'TEXT'
,p_display_seq_report => 2
,p_display_in_report => 'Y'
,p_display_as_report => 'ESCAPE_SC'
,p_aggregate_by => 'N'
,p_required => 'Y'
,p_alignment => 'L'
,p_display_width => 60
,p_max_width => 30
,p_height => 1
,p_group_by => 'N'
,p_searchable => 'Y'
);
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
 p_column_id => 12007589624218625 + wwv_flow_imp.g_id_offset
,p_table_id => 12007136511218500 + wwv_flow_imp.g_id_offset
,p_column_name => 'LOCATION_ID'
,p_label => 'Location Id'
,p_help_text => 'Location id where a department is located. Foreign key to location_id column of locations table.'
,p_display_seq_form => 4
,p_display_in_form => 'Y'
,p_display_as_form => 'NATIVE_NUMBER_FIELD'
,p_display_as_tab_form => 'TEXT'
,p_display_seq_report => 4
,p_display_in_report => 'Y'
,p_display_as_report => 'ESCAPE_SC'
,p_aggregate_by => 'N'
,p_required => 'N'
,p_alignment => 'R'
,p_display_width => 30
,p_max_width => 4
,p_height => 1
,p_group_by => 'N'
,p_searchable => 'N'
);
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
 p_column_id => 12007424628218625 + wwv_flow_imp.g_id_offset
,p_table_id => 12007136511218500 + wwv_flow_imp.g_id_offset
,p_column_name => 'MANAGER_ID'
,p_label => 'Manager Id'
,p_help_text => 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.'
,p_display_seq_form => 3
,p_display_in_form => 'Y'
,p_display_as_form => 'NATIVE_NUMBER_FIELD'
,p_display_as_tab_form => 'TEXT'
,p_display_seq_report => 3
,p_display_in_report => 'Y'
,p_display_as_report => 'ESCAPE_SC'
,p_aggregate_by => 'N'
,p_required => 'N'
,p_alignment => 'R'
,p_display_width => 30
,p_max_width => 6
,p_height => 1
,p_group_by => 'N'
,p_searchable => 'N'
);
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'MOI';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA MOI - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_240200
-- Exported 23:00 Saturday April 26, 2025 by: 
--
-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'MOJ';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA MOJ - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_240200
-- Exported 23:00 Saturday April 26, 2025 by: 
--
-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'QE_REP';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA QE_REP - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_240200
-- Exported 23:00 Saturday April 26, 2025 by: 
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 23:00 Saturday April 26, 2025 by: 
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'HR';
 
end;
/

begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
