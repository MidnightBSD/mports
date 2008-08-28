--
-- Execute the following SQL statements to enable PL/Ruby.
--
-- $FreeBSD: ports/databases/postgresql-plruby/files/createlang.sql,v 1.1 2001/06/28 08:52:19 knu Exp $
--

CREATE FUNCTION plruby_call_handler() RETURNS OPAQUE
	AS '!!PLRUBY_SO!!'
	LANGUAGE 'C';

CREATE TRUSTED PROCEDURAL LANGUAGE 'plruby'
	HANDLER plruby_call_handler
	LANCOMPILER 'PL/Ruby';

--
