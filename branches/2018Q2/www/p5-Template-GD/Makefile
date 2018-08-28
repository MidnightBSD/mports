# New ports collection makefile for:	p5-Template-GD
# Date created:		Oct 11, 2008
# Whom:			Lucas Holt
#
# $MidnightBSD$

PORTNAME=	Template-GD
PORTVERSION=	2.66
PORTREVISON=	1
CATEGORIES=	www textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Template Toolkit plugin to interface with GD modules
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Template.pm:${PORTSDIR}/www/p5-Template-Toolkit
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
