# Created by: Gea-Suan Lin <gslin@gslin.org>

PORTNAME=	Class-InsideOut
PORTVERSION=	1.14
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Safe, simple inside-out object construction kit

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-ISA>=0:devel/p5-Class-ISA

PORTSCOUT=	skipv:1.0301

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
