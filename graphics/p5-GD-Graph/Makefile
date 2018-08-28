# $MidnightBSD$

PORTNAME=	GD-Graph
PORTVERSION=	1.44.01
DISTVERSION=	${PORTVERSION:C/\.(..)$/_\1/}
PORTREVISION=	3
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../by-authors/id/B/BW/BWARFIELD
PKGNAMEPREFIX=	p5-
DISTNAME=	GDGraph-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph plotting module for perl5
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/GD.pm:${PORTSDIR}/graphics/p5-GD \
		${SITE_PERL}/GD/Text/Align.pm:${PORTSDIR}/graphics/p5-GD-TextUtil
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

post-patch:
	@${FIND} ${WRKSRC} -name "*.orig" -print0 | ${XARGS} -0 ${RM} -f

.include <bsd.port.mk>
