# $MidnightBSD: mports/x11/docker/Makefile,v 1.4 2012/03/02 02:30:02 laffer1 Exp $

PORTNAME=	docker
PORTVERSION=	1.5
PORTREVISION=	7
CATEGORIES=	x11
MASTER_SITES=	http://offload2.icculus.org:9090/openbox/2/docker/ \
		http://offload1.icculus.org:9090/openbox/2/docker/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockapp with support for GNOME2 and KDE3 tray icons
LICENSE=	gpl2

USE_XORG=	x11
USE_GNOME=	glib20
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/docker

post-patch:
	@${REINPLACE_CMD} -e \
		's|^PREFIX=|PREFIX?=| ; \
		 s|^CFLAGS=|CFLAGS?=| ; \
		 s|--cflags glib-2.0|--cflags x11 glib-2.0| ; \
		 s|--libs glib-2.0|--libs x11 glib-2.0| ; \
		 s|-L$$(XLIBPATH)|| ; \
		 s|-lX11||' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
