# $MidnightBSD$
# $FreeBSD: ports/lang/p5-Switch/Makefile,v 1.20 2010/01/09 23:27:56 pgollucci Exp $

PORTNAME=	Switch
PORTVERSION=	2.17
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CHORNY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Switch - A switch statement for Perl

LICENSE=	perl

BUILD_DEPENDS=	p5-Filter>0:devel/p5-Filter
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
