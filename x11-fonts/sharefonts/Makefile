# Created by: dburr@FreeBSD.org

PORTNAME=	sharefonts
PORTVERSION=	0.10
PORTREVISION=	8
CATEGORIES=	x11-fonts
MASTER_SITES=	http://download.gimp.org/pub/%SUBDIR%/ \
		ftp://ftp.sunet.se/pub/gnu/%SUBDIR%/   \
		http://ftp.gwdg.de/pub/misc/grafik/gimp/%SUBDIR%/ \
		http://mirrors.xmission.com/gimp/%SUBDIR%/
MASTER_SITE_SUBDIR=	gimp/fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of shareware ATM fonts from the CICA archives

LICENSE=	other

RESTRICTED=	Shareware: cannot be distributed without prior authorization

NO_BUILD=	yes

NO_ARCH=	yes
SUB_FILES=	pkg-message
USES=		fonts

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKDIR}/sharefont/* ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
