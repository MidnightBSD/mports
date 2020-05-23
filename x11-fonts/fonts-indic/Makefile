# Created by: Naresh Venkateshappa <nareshov@gmail.com>

PORTNAME=	fonts-indic
PORTVERSION=	2.1.5
PORTREVISION=	4
CATEGORIES=	x11-fonts
MASTER_SITES=	http://gentoo.osuosl.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Lohit family of Indic fonts

LICENSE=	other

USES=		fonts

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*/*/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
