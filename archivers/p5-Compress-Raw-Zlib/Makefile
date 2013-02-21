# $MidnightBSD: mports/archivers/p5-Compress-Raw-Zlib/Makefile,v 1.9 2011/09/18 20:13:47 laffer1 Exp $

PORTNAME=	Compress-Raw-Zlib
PORTVERSION=	2.060
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PMQS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-Level Interface to zlib compression library
LICENSE=	perl

PERL_CONFIGURE=	YES

MAN3=		Compress::Raw::Zlib.3

post-patch:
	@${REINPLACE_CMD} -e '/^BUILD_ZLIB/ s|True|False|; /^INCLUDE/ s|= .*$$|= ${INCLUDEDIR}|; /^LIB/ s|= .*$$|= ${LIBDIR}|' ${WRKSRC}/config.in

.include <bsd.port.mk>
