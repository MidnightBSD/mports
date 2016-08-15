# $MidnightBSD$

PORTNAME=	IO-Zlib
PORTVERSION=	1.10
PORTREVISION=	2
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IO:: style interface to Compress::Zlib

LICENSE=	artistic gpl
LICENSE_COMB=	dual

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
BUILD_DEPENDS=	p5-IO-Compress>=2:${PORTSDIR}/archivers/p5-IO-Compress
RUN_DEPENDS=	p5-IO-Compress>=2:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>
