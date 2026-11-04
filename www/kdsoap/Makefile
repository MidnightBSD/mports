PORTNAME=	kdsoap
DISTVERSION=	2.2.0
CATEGORIES=	www
MASTER_SITES=	https://github.com/KDAB/KDSoap/releases/download/${PORTNAME}-${DISTVERSION}/
PKGNAMESUFFIX=	-qt6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++/Qt SOAP framework
WWW=		https://github.com/KDAB/KDSoap

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake compiler:c++17-lang qt:6
USE_LDCONFIG=	yes
USE_QT=		base

CMAKE_ON=	KDSoap_QT6
CMAKE_OFF=	KDSoap_EXAMPLES

PLIST_SUB=	SOVERSION=${DISTVERSION}

.include <bsd.port.mk>
