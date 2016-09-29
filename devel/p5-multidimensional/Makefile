# $MidnightBSD$
# $FreeBSD: head/devel/p5-multidimensional/Makefile 415663 2016-05-23 03:50:24Z sunpoet $

PORTNAME=	multidimensional
PORTVERSION=	0.012
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ILMARI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disables multidimensional array emulation

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-B-Hooks-OP-Check>=0.19:${PORTSDIR}/devel/p5-B-Hooks-OP-Check \
		p5-ExtUtils-Depends>=0:${PORTSDIR}/devel/p5-ExtUtils-Depends \
		p5-Lexical-SealRequireHints>=0.005:${PORTSDIR}/devel/p5-Lexical-SealRequireHints
RUN_DEPENDS=	p5-B-Hooks-OP-Check>=0.19:${PORTSDIR}/devel/p5-B-Hooks-OP-Check \
		p5-Lexical-SealRequireHints>=0.005:${PORTSDIR}/devel/p5-Lexical-SealRequireHints

USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/multidimensional/multidimensional.so

.include <bsd.port.mk>
