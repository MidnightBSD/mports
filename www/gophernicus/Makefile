PORTNAME=	gophernicus
DISTVERSION=	3.0.1
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern full-featured and secure Gopher daemon
WWW=		https://gophernicus.org/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
MAKE_ARGS=	CC="${CC}" \
		CFLAGS="${CFLAGS}" \
		INSTALL=${INSTALL} \
		SBINDIR=${FAKE_DESTDIR}${TRUE_PREFIX}/sbin
INSTALL_TARGET=	install-files
# XXX: Drop after updating to 3.1
CFLAGS+=	-fcommon
SUB_FILES=	pkg-message

PLIST_FILES=	sbin/gophernicus
PORTDOCS=	README.Gophermap README.md changelog gophermap gophertag

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && \
		${INSTALL_MAN} ${PORTDOCS} \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
