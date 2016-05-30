set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>31149742542967907833
,p_default_application_id=>86025
,p_default_owner=>'EAO'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/region_type/org_halfabee_clobregion
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(34625956207600547891)
,p_plugin_type=>'REGION TYPE'
,p_name=>'ORG.HALFABEE.CLOBREGION'
,p_display_name=>'CLOB Region'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render_clob_region (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'IS',
'    i                     PLS_INTEGER := 1;',
'    l_chunk_sz            PLS_INTEGER := 8000;',
'    l_clob                CLOB;',
'    l_return apex_plugin.t_region_render_result;',
'BEGIN',
'    apex_plugin_util.debug_region( p_plugin, p_region );',
'    ',
'    EXECUTE IMMEDIATE p_region.source INTO l_clob;',
'    ',
'    WHILE i <= dbms_lob.getlength( l_clob ) LOOP',
'        IF p_region.escape_output THEN',
'            apex_plugin_util.print_escaped_value( dbms_lob.substr( l_clob, l_chunk_sz, i ));',
'        ELSE',
'            htp.prn( dbms_lob.substr( l_clob, l_chunk_sz, i ));',
'        END IF;',
'        i := i + l_chunk_sz;',
'    END LOOP;',
'    sys.htp.prn( CHR(13) || CHR(10) );',
'   ',
'    return l_return;',
'END;',
''))
,p_render_function=>'render_clob_region'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:ESCAPE_OUTPUT'
,p_sql_min_column_count=>1
,p_sql_max_column_count=>1
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT clob001',
'  FROM apex_collections',
' WHERE collection_name = ''MY_COLLECTION'''))
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
