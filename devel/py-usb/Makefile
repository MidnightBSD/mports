PORTNAME=	usb
PORTVERSION=	1.0.2
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around libusb

LICENSE=	bsd3

USES=		python
USE_PYTHON=	autoplist concurrent distutils

USE_GITHUB=	yes
GH_ACCOUNT=	pyusb
GH_PROJECT=	py${PORTNAME}
GH_TAGNAME=	47ca9c3

PORTDOCS=	*.rst

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/docs/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
