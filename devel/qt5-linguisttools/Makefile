PORTNAME=	linguisttools
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt localization tools

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core xml buildtools:build declarative:build

BUILD_WRKSRC=	${WRKSRC}/src/linguist
INSTALL_WRKSRC=	${WRKSRC}/src/linguist

QT_BINARIES=	yes

post-patch:
	@${REINPLACE_CMD} -e '/SUBDIRS.*linguist/ d' \
		${WRKSRC}/src/linguist/linguist.pro

post-install:
.for f in lrelease lupdate
	${INSTALL_MAN} ${WRKSRC}/src/linguist/${f}/${f}.1 \
		${STAGEDIR}${PREFIX}/share/man/man1
	${RLN} ${STAGEDIR}${QT_BINDIR}/${f} ${STAGEDIR}${PREFIX}/bin/${f}-qt5
.endfor

.include <bsd.port.mk>
