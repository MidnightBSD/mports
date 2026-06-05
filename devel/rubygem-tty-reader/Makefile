PORTNAME=	tty-reader
PORTVERSION=	0.9.0
PORTREVISION=	2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Methods for processing keyboard input
WWW=		https://ttytoolkit.org/ \
		https://github.com/piotrmurach/tty-reader

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-tty-cursor>=0.7<1:devel/rubygem-tty-cursor \
		rubygem-tty-screen>=0.8<1:devel/rubygem-tty-screen \
		rubygem-wisper2>=2.0<3:devel/rubygem-wisper2

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
