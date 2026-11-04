PORTNAME=	git-prompt.zsh
DISTVERSIONPREFIX=	v
DISTVERSION=	2.4.0
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, customizable, pure-shell, asynchronous Git prompt for Zsh
WWW=		https://github.com/woefe/git-prompt.zsh

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	zsh>=4.3:shells/zsh \
		git>=2.11.0:devel/git

USE_GITHUB=	yes
GH_ACCOUNT=	woefe

NO_ARCH=	yes
NO_BUILD=	yes
PLIST_FILES=	${DATADIR}/${PORTNAME} ${DOCSDIR}/README.md
SUB_FILES=	pkg-message
SUB_LIST+=	PORTNAME=${PORTNAME}

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME} ${DATADIR}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${DOCSDIR}

.include <bsd.port.mk>
