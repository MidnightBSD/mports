# $MidnightBSD$

PORTNAME=	Test-Deep
PORTVERSION=	1.128
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test data structures for differences deeply

LICENSE=	artistic gpl
LICENSE_COMB=	dual

NO_ARCH=	yes
REINPLACE_ARGS=	-i ''
USES=		perl5
USE_PERL5=	configure

post-patch:
	@${REINPLACE_CMD} -e '/return (/s/;/);/' ${WRKSRC}/lib/Test/Deep/RegexpOnly.pm

.include <bsd.port.mk>
