PORTNAME=	gradle-completion
DISTVERSIONPREFIX=	v
DISTVERSION=	1.4.1
CATEGORIES=	devel java

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gradle tab completion for Bash and Zsh
WWW=		https://github.com/gradle/gradle-completion

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	gradle

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	share/bash-completion/completions/gradle \
		share/zsh/site-functions/_gradle

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/bash-completion/completions
	${INSTALL_DATA} ${WRKSRC}/gradle-completion.bash \
		${STAGEDIR}${PREFIX}/share/bash-completion/completions/gradle

	@${MKDIR} ${STAGEDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/_gradle \
		${STAGEDIR}${PREFIX}/share/zsh/site-functions/_gradle

.include <bsd.port.mk>
