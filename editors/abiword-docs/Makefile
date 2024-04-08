PORTNAME=	abiword-docs
PORTVERSION=	3.0.1
CATEGORIES=	editors
MASTER_SITES=	http://www.abisource.com/downloads/abiword/${PORTVERSION}/source/
DIST_SUBDIR=	AbiWord

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AbiWord help files
WWW=		https://www.abisource.com/

WRKSRC=		${WRKDIR}/${PORTNAME}-3.0.1

BUILD_DEPENDS=	abiword:editors/abiword
RUN_DEPENDS=	abiword:editors/abiword

GNU_CONFIGURE=	yes
USES=		gmake pkgconfig
# Don't give X warnings if DISPLAY is set
CONFIGURE_ENV=	DISPLAY=""
MAKE_ENV=	DISPLAY=""

.include <bsd.port.mk>
