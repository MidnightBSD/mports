PORTNAME=	nerd-fonts
DISTVERSIONPREFIX=	v
DISTVERSION=	2.1.0
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Developer-targeted fonts with a high number of glyphs

LICENSE=	mit

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	ryanoasis

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	(cd ${WRKSRC}/patched-fonts && \
	${COPYTREE_SHARE} . ${FONTSDIR} "! -name *Windows* -and ! \
	-name *Awesome* -and ! -name *Pomicons* -and ! -name *Octicons* \
	-and ! -name *.md -and ! -name *Linux*")
	@${RMDIR} ${FONTSDIR}/ProFont/ProFontWinTweaked/complete \
		${FONTSDIR}/ProFont/ProFontWinTweaked \
		${FONTSDIR}/ProFont/profont-x11 \
		${FONTSDIR}/Terminus/BDF \
		${FONTSDIR}/Terminus/PCF \
		${FONTSDIR}/Terminus/PSF \

.include <bsd.port.mk>
