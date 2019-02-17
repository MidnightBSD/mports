# $MidnightBSD$
# $FreeBSD: head/devel/p5-multidimensional/Makefile 415663 2016-05-23 03:50:24Z sunpoet $

PORTNAME=	multidimensional
PORTVERSION=	0.014
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ILMARI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disables multidimensional array emulation

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0:devel/p5-ExtUtils-Depends \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Hooks-OP-Check>=0.19:devel/p5-B-Hooks-OP-Check

USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/multidimensional/multidimensional.so

.include <bsd.port.mk>
