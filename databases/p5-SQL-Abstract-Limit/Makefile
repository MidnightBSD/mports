# Created by: Lars Balker Rasmussen <lbr@FreeBSD.org>
# $FreeBSD: head/databases/p5-SQL-Abstract-Limit/Makefile 373448 2014-11-26 13:08:24Z mat $
# $MidnightBSD$

PORTNAME=	SQL-Abstract-Limit
PORTVERSION=	0.141
PORTREVISION=	2
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQL Portability layer for LIMIT emulation

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-SQL-Abstract>=1.24:${PORTSDIR}/databases/p5-SQL-Abstract \
		p5-DBI>=0:${PORTSDIR}/databases/p5-DBI
BUILD_DEPENDS:=	${RUN_DEPENDS}
TEST_DEPENDS=	p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception \
		p5-Test-Deep>=0:${PORTSDIR}/devel/p5-Test-Deep

USES=		perl5
USE_PERL5=	modbuild

PERL_MODBUILD=	yes

.include <bsd.port.mk>
