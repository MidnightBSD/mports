# $MidnightBSD$

PORTNAME=	MLDBM-Sync
PORTVERSION=	0.30
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MLDBM::Sync - safe concurrent access to MLDBM databases

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-MLDBM>=0:${PORTSDIR}/databases/p5-MLDBM
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
