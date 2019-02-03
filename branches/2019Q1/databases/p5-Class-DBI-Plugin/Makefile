# Created by: Lars Thegler <lth@FreeBSD.org>
# $FreeBSD: head/databases/p5-Class-DBI-Plugin/Makefile 373448 2014-11-26 13:08:24Z mat $
# $MidnightBSD$

PORTNAME=	Class-DBI-Plugin
PORTVERSION=	0.03
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract base class for Class::DBI plugins

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Class-DBI>=0:${PORTSDIR}/databases/p5-Class-DBI
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
