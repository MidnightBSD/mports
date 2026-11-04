PORTNAME=	zsh-completions
PORTVERSION=	0.35.0
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional completion definitions for Zsh
WWW=		https://github.com/zsh-users/zsh-completions

LICENSE=	ZSH
LICENSE_NAME=	ZSH license
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

NO_ARCH=	yes
NO_BUILD=	yes

GH_ACCOUNT=	zsh-users
USE_GITHUB=	yes

do-install:
	${MKDIR} ${PREFIX}/share/zsh/site-functions/
	${INSTALL_DATA} ${WRKSRC}/src/* ${PREFIX}/share/zsh/site-functions/

.include <bsd.port.mk>
