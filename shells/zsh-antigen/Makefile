PORTNAME=	zsh-antigen
DISTVERSIONPREFIX=	v
DISTVERSION=	2.2.3
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for managing Zshell plugins inspired by Vundle
WWW=		https://github.com/zsh-users/antigen

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	zsh>=4.3.11:shells/zsh \
		git:devel/git

USE_GITHUB=	yes
GH_ACCOUNT=	zsh-users
GH_PROJECT=	antigen

NO_ARCH=	yes
NO_BUILD=	yes
PLIST_FILES=	${DATADIR}/antigen.zsh
SUB_FILES=	pkg-message

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/bin/antigen.zsh ${DATADIR}

.include <bsd.port.mk>
