# $MidnightBSD$
# $FreeBSD: ports/lang/p5-Switch/Makefile,v 1.20 2010/01/09 23:27:56 pgollucci Exp $

PORTNAME=	Switch
PORTVERSION=	2.16
CATEGORIES=	lang perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/R/RG/RGARCIA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Switch - A switch statement for Perl
LICENSE=	perl

BUILD_DEPENDS=	p5-Filter>0:${PORTSDIR}/devel/p5-Filter
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Switch.3

.include <bsd.port.mk>
