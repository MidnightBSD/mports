PORTNAME=	xmlpatterns
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt support for XPath, XQuery, XSLT and XML Schema

USES=		compiler:c++11-lang qmake:norecursive qt-dist:5,xmlpatterns
USE_QT=		core declarative network buildtools_build

QT_BINARIES=	yes

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5XmlPatterns/Qt5XmlPatternsConfig.cmake

.include <bsd.port.mk>
