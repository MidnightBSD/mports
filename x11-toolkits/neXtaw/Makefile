# Created by: Thomas Gellekum <tg@FreeBSD.org>

PORTNAME=	neXtaw
PORTVERSION=	0.15.1
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://siag.nu/pub/neXtaw/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Athena Widgets with N*XTSTEP appearance

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool localbase xorg
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_XORG=	xmu x11 xext

OPTIONS_DEFINE=	DOCS

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib${PORTNAME}.so

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/CHANGES ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/FAQ ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
