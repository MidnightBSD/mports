PORTNAME=	qt6pas
PORTVERSION=	6.2.7
CATEGORIES=	x11-toolkits
MASTER_SITES=	FREEBSD_LOCAL/acm/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt6 binding for FreePascal
WWW=		https://wiki.lazarus.freepascal.org/index.php/Qt6_Interface

USES=		compiler:c++11-lang qmake qt:6
USE_QT=		base:build declarative:build tools:build
USE_LDCONFIG=	yes

QT6_VER_MIN=	6.2.7

post-patch:
	@${REINPLACE_CMD} -e 's|-mincoming-stack-boundary=2||g' ${WRKSRC}/Qt6Pas.pro

.include <bsd.port.mk>
