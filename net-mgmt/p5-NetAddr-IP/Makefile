# $MidnightBSD$

PORTNAME=	NetAddr-IP
PORTVERSION=	4.079
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Work with IP addresses and blocks thereof

LICENSE=	artistic gpl2
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/Artistic
LICENSE_FILE_gpl2=	${WRKSRC}/Copying

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/NetAddr/IP/Util/Util.so

.include <bsd.port.mk>
