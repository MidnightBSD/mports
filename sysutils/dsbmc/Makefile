PORTNAME=	dsbmc
DISTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt client for DSBMD that lets you mount media, and more
WWW=		https://github.com/mrclksr/DSBMC

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	dsbmd>=0.3:sysutils/dsbmd

USES=		compiler:c++11-lang desktop-file-utils gl qmake qt:5 tar:tgz

USE_GL=		gl
USE_QT=		buildtools_build core gui linguisttools_build widgets

USE_GITHUB=	yes
GH_ACCOUNT=	mrclksr
GH_PROJECT=	DSBMC

.include <bsd.port.mk>
