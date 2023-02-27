PORTNAME=	zsh-autosuggestions
DISTVERSIONPREFIX=	v
DISTVERSION=	0.7.0
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fish-like autosuggestions for Zsh
WWW=		https://github.com/zsh-users/zsh-autosuggestions

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	zsh>=4.3:shells/zsh

USE_GITHUB=	yes
GH_ACCOUNT=	zsh-users

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message

PLIST_FILES=	${DATADIR}/${PORTNAME}.zsh

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/zsh-autosuggestions.zsh ${DATADIR}

.include <bsd.port.mk>
