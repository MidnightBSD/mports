# New ports collection makefile for:	p5-Compress-Zlib
# Date created:				October 20th 1996
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/p5-Compress-Zlib/Makefile,v 1.2 2007/07/16 02:13:17 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-Compress-Zlib/Makefile,v 1.46 2007/02/01 11:30:58 demon Exp $
#

PORTNAME=	Compress-Zlib
PORTVERSION=	2.005
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Compress
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to zlib compression library

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Compress/Raw/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Raw-Zlib \
		${SITE_PERL}/IO/Uncompress/Gunzip.pm:${PORTSDIR}/archivers/p5-IO-Compress-Zlib
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Compress::Zlib.3

.include <bsd.port.mk>
