#if defined _A_MYSQL_INCLUDED
    #endinput
#endif
#define _A_MYSQL_INCLUDED

#if !defined MySQL
    enum MySQL {}
#endif

#define MYSQL_INVALID_HANDLE (MySQL:0)
#define MYSQL_DEFAULT_HANDLE (MySQL:1)

native MySQL:mysql_connect(const host[], const user[], const database[], const password[], port = 3306, const socket[] = "");
native mysql_close(MySQL:handle = MYSQL_DEFAULT_HANDLE);
native mysql_errno(MySQL:handle = MYSQL_DEFAULT_HANDLE);
native mysql_escape_string(const source[], destination[], MySQL:handle = MYSQL_DEFAULT_HANDLE, max_len = sizeof(destination));
native mysql_format(MySQL:handle, output[], len, const format[], GLOBAL_TAG_TYPES:...);
native mysql_query(MySQL:handle, const query[], bool:use_cache = true);

native cache_num_rows();
native cache_get_value_name(row, const column_name[], destination[], max_len = sizeof(destination));
native cache_get_value_name_int(row, const column_name[], &destination);
native cache_get_value_name_float(row, const column_name[], &Float:destination);
