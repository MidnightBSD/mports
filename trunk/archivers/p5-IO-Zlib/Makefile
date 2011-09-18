# $MidnightBSD: mports/archivers/p5-IO-Zlib/Makefile,v 1.8 2009/12/25 17:33:19 laffer1 Exp $

PORTNAME=	IO-Zlib
PORTVERSION=	1.10
PORTREVISION=	1
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IO:: style interface to Compress::Zlib
LICENSE=	perl

PERL_CONFIGURE=	yes
MAN3=		IO::Zlib.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
BUILD_DEPENDS=	p5-IO-Compress>=2:${PORTSDIR}/archivers/p5-IO-Compress
RUN_DEPENDS=	p5-IO-Compress>=2:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>
