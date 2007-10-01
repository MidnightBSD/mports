# New ports collection makefile for:	Digest
# Date created:	   28 May 2002
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD: ports/security/p5-Digest/Makefile,v 1.15 2006/03/23 10:44:04 skv Exp $
# $MidnightBSD$ 
#

PORTNAME=	Digest
PORTVERSION=	1.15
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Digest
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules that calculate message digests

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Digest.3 Digest::base.3 Digest::file.3

.include <bsd.port.mk>
