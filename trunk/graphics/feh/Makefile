# $MidnightBSD$

PORTNAME=	feh
PORTVERSION=	2.3
CATEGORIES=	graphics
MASTER_SITES=	http://feh.finalrewind.org/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	uqs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image viewer that utilizes Imlib2

LICENSE=	mit

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl \
		giblib.1:${PORTSDIR}/graphics/giblib

USES=		gmake tar:bzip2
USE_XORG=	x11 xt xinerama
USE_PERL5_RUN=	yes

CPPFLAGS+=	-I${LOCALBASE}/include -std=c99
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV+=	LDFLAGS="${LDFLAGS}"

post-patch:
	@${REINPLACE_CMD} 's#share/man#man#' ${WRKSRC}/config.mk
	@${REINPLACE_CMD} 's#install-man install-doc install-bin#install-doc#' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} 's#/bin/bash#/bin/sh#' ${WRKSRC}/cam/gen-cam-menu

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/feh ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/cam/feh-cam ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/cam/gen-cam-menu ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/feh.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man/feh-cam.1 ${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man/gen-cam-menu.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
