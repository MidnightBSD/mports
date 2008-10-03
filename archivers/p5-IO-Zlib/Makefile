# New ports collection makefile for:	IO::Zlib
# Date created:		15 Feb 2002
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/p5-IO-Zlib/Makefile,v 1.5 2008/04/11 20:22:37 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-IO-Zlib/Makefile,v 1.6 2006/12/03 12:45:57 demon Exp $
#

PORTNAME=	IO-Zlib
PORTVERSION=	1.09
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IO:: style interface to Compress::Zlib
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib
RUN_DEPENDS=	${SITE_PERL}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib

PERL_CONFIGURE=	yes
MAN3=		IO::Zlib.3

.include <bsd.port.mk>
