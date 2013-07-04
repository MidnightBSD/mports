# New ports collection makefile for: apr-svn
# Date created:		1 February 2003
# Whom:			Lev Serebryakov <lev@serebryakov.spb.ru>
#
# $MidnightBSD: mports/devel/apr-svn/Makefile,v 1.3 2008/10/10 18:20:30 laffer1 Exp $
# $FreeBSD: ports/devel/apr-svn/Makefile,v 1.3 2005/12/09 21:15:48 rodrigc Exp $

APR_UTIL_WITH_GDBM=             yes
APR_UTIL_WITH_BERKELEY_DB=	yes
APR_SVN_WITHOUT_THREADS_4=	yes
MASTERDIR=			${.CURDIR}/../apr
CONFLICTS=			apr-[0-9]* apr-db42-[0-9]*

APR_SLAVE_PORT=			yes

.include "${MASTERDIR}/Makefile"
