PORTNAME=	junction
PORTVERSION=	20140329	# GH_TAGNAME's commit date.
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Humanist sans-serif font
WWW=		https://www.theleagueofmoveabletype.com/junction

LICENSE=	OFL11
LICENSE_FILE=	"${WRKSRC}/Open Font License.markdown"

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	theleagueof
GH_TAGNAME=	fb73260

NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	cd ${WRKSRC} && \
		${INSTALL_DATA} *.otf ${FONTSDIR}

.include <bsd.port.mk>
