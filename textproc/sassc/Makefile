PORTNAME=	sassc
PORTVERSION=	3.6.1
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper around libsass
WWW=		https://libsass.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsass.so:textproc/libsass

GH_ACCOUNT=	sass
GNU_CONFIGURE=	yes

MAKEFILE=	GNUmakefile

PLIST_FILES=	bin/sassc

USES=		autoreconf compiler:c++11-lib gmake libtool localbase
USE_GITHUB=	yes

post-patch:
	@${ECHO_CMD} "${ECHO_CMD} \"${PORTVERSION}\"" > ${WRKSRC}/version.sh

.include <bsd.port.mk>
