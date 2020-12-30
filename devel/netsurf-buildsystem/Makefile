# Created by: Olivier Duchateau

PORTNAME=	buildsystem
PORTVERSION=	1.8
CATEGORIES=	devel
MASTER_SITES=	http://download.netsurf-browser.org/libs/releases/
PKGNAMEPREFIX=	netsurf-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NetSurf project buildsystem

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex

USES=		gmake perl5 shebangfix
MAKE_ENV=	COMPONENT_TYPE="lib-shared"
SHEBANG_FILES=	testtools/testrunner.pl
NO_ARCH=	yes

.include <bsd.port.mk>
