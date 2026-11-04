PORTNAME=	qr-code-generator
PORTVERSION=	1.8.0
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-quality QR Code generator library
WWW=		https://www.nayuki.io/page/qr-code-generator-library

LICENSE=	mit

USES=		compiler:c++11-lang gmake

USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	nayuki
GH_PROJECT=	QR-Code-generator

PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	${CP} ${FILESDIR}/Makefile ${WRKSRC}
	${REINPLACE_CMD} -e 's,$$(DESTDIR)/usr,${FAKE_DESTDIR}${TRUE_PREFIX},' ${WRKSRC}/c/Makefile
	${REINPLACE_CMD} -e 's,$$(DESTDIR)/usr,${FAKE_DESTDIR}${TRUE_PREFIX},' ${WRKSRC}/cpp/Makefile
	${REINPLACE_CMD} -e 's,%%VERSION%%,${PORTVERSION},' ${WRKSRC}/c/Makefile
	${REINPLACE_CMD} -e 's,%%VERSION%%,${PORTVERSION},' ${WRKSRC}/cpp/Makefile


.include <bsd.port.mk>
