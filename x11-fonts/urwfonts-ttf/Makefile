# Created by: Maxim Sobolev <sobomax@FreeBSD.org>

PORTNAME=	urwfonts-ttf
PORTVERSION=	1.0.7b18
CATEGORIES=	x11-fonts
MASTER_SITES=	ftp://ftp.izmiran.rssi.ru/pub/fonts/urw/
DISTNAME=	urw-fonts-${PORTVERSION:S/b/pre/}-ttf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unicode TrueType fonts from URW extended by Valek Filippov

LICENSE=	lgpl

DISABLE_SIZE=	yes
NO_WRKSUBDIR=	yes

NO_ARCH=	yes
NO_BUILD=	yes
USES=		fonts tar:bzip2

SUB_FILES=	pkg-message

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts.* ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
