# $MidnightBSD: mports/archivers/p5-Compress-Zlib/Makefile,v 1.8 2009/03/27 06:15:22 laffer1 Exp $

PORTNAME=	Compress-Zlib
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to zlib compression library
LICENSE=	perl

BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Compress/Raw/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Raw-Zlib \
		${SITE_PERL}/${PERL_ARCH}/IO/Uncompress/Gunzip.pm:${PORTSDIR}/archivers/p5-IO-Compress-Zlib

RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Compress::Zlib.3

.include <bsd.port.mk>

