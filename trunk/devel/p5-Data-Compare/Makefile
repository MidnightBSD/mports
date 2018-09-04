# $MidnightBSD$

PORTNAME=	Data-Compare
PORTVERSION=	1.2200
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DCANTRELL
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0*$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data::Compare - compare perl data structures

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-File-Find-Rule>=0:devel/p5-File-Find-Rule
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
