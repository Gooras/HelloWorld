Create or replace package testPkg
is

function wersja return varchar2;

END;
/
show errors;

REM STOP HEADER

CREATE OR REPLACE PACKAGE BODY proc_ods_a AS


FUNCTION wersja(par VARCHAR DEFAULT NULL) RETURN VARCHAR2 IS
  q      VARCHAR2(200) := 'select proc_tool.';
  RESULT VARCHAR2(200);
BEGIN
     q := q || 'format_wersja(''PKG'', ''I'', '''', ''1'', ''2019-03-21'', ''testPkg'') from dual';
      /*
      q := q || 'format_wersja(''PKG'', ''I'', '''', ''$Revision: 1.173 $''';
      q := replace(replace(q, ' $', ''), '$Revision: ', '');
      q := q || ', ''$Date: 2019/03/18 12:59:43 $'', ''PROC_ODS_A'') from dual';
      q := replace(replace(q, ' $''', ''',''YYYY/MM/DD HH24:mi:ss''), ''YYYY-MM-DD'')'), '''$Date: ', 'to_char(to_date(''');
      */
     EXECUTE IMMEDIATE q
       INTO RESULT;
     RETURN RESULT;
END;
END;
/
