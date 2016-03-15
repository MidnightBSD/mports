# $FreeBSD: ports/databases/p5-SQL-Abstract-Limit/Makefile,v 1.5 2006/05/01 13:51:46 lbr Exp $
# $MidnightBSD$

PORTNAME=	SQL-Abstract-Limit
PORTVERSION=	0.120
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../by-authors/id/D/DA/DAVEBAIRD
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-0.12

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQL Portability layer for LIMIT emulation

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI \
		${SITE_PERL}/SQL/Abstract.pm:${PORTSDIR}/databases/p5-SQL-Abstract 
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=	perl
PERL_MODBUILD=	yes

.include <bsd.port.mk>

