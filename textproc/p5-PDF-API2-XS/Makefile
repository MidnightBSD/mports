# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	PDF-API2-XS
PORTVERSION=	1.002
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optional PDF::API2 add-on using XS to speed up expensive operations

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake perl5
USE_PERL5=	configure

USE_CSTD=	c99

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/PDF/API2/XS/ImagePNG/ImagePNG.so

.include <bsd.port.mk>
