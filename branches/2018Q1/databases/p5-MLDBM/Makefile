# $MidnightBSD$

PORTNAME=	MLDBM
PORTVERSION=	2.05
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Store multi-level hash structure in single level tied hash

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-FreezeThaw>=0:${PORTSDIR}/devel/p5-FreezeThaw
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
