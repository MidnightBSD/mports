# $MidnightBSD$

PORTNAME=	Text-Diff
PORTVERSION=	1.41
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text::Diff - Perform diffs on files and record sets

LICENSE=	artistic gpl
LICENSE_COMB=	dual

COMMON_DEPENDS=	p5-Algorithm-Diff>=1.19:${PORTSDIR}/devel/p5-Algorithm-Diff
BUILD_DEPENDS=	${COMMON_DEPENDS}
RUN_DEPENDS=	${COMMON_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
