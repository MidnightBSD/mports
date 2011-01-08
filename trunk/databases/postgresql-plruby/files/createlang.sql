--
-- Execute the following SQL statements to enable PL/Ruby.
--
-- $FreeBSD: ports/databases/postgresql-plruby/files/createlang.sql,v 1.2 2009/05/16 07:53:31 knu Exp $
--

CREATE FUNCTION plruby_call_handler() RETURNS language_handler
	AS '!!PLRUBY_SO!!'
	LANGUAGE 'C';

CREATE TRUSTED LANGUAGE 'plruby'
	HANDLER plruby_call_handler
	LANCOMPILER 'PL/Ruby';

--
