# $MidnightBSD: mports/archivers/p5-Compress-Zlib/Makefile,v 1.7 2008/10/10 18:13:28 ctriv Exp $

PORTNAME=	Compress-Zlib
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Compress
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

