# Created by: Lars Thegler <lth@FreeBSD.org>
# $FreeBSD: head/databases/p5-Class-DBI-Plugin-AbstractCount/Makefile 373448 2014-11-26 13:08:24Z mat $
# $MidnightBSD$

PORTNAME=	Class-DBI-Plugin-AbstractCount
PORTVERSION=	0.08
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get COUNT(*) results with abstract SQL

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Class-DBI-Plugin>=0.02:${PORTSDIR}/databases/p5-Class-DBI-Plugin \
		p5-Class-DBI>=0.95:${PORTSDIR}/databases/p5-Class-DBI \
		p5-SQL-Abstract>=1.50:${PORTSDIR}/databases/p5-SQL-Abstract
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
