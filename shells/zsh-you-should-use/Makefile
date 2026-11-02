PORTNAME=	zsh-you-should-use
DISTVERSION=	1.11.1
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZSH plugin reminding you to use aliases for commands you typed
WWW=		https://github.com/MichaelAquilina/zsh-you-should-use

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	zsh>=4.3:shells/zsh

USE_GITHUB=	yes
GH_ACCOUNT=	MichaelAquilina

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message

PLIST_FILES=	${DATADIR}/you-should-use.plugin.zsh

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/you-should-use.plugin.zsh ${DATADIR}

.include <bsd.port.mk>
