# New ports collection makefile for:	docker
# Date created:				March 15, 2003
# Whom:					Samy Al Bahra <samy@kerneled.org>
#
# $MidnightBSD: mports/x11/docker/Makefile,v 1.3 2008/10/08 04:03:18 laffer1 Exp $
# $FreeBSD: ports/x11/docker/Makefile,v 1.9 2006/04/15 22:21:14 cperciva Exp $
#

PORTNAME=	docker
PORTVERSION=	1.5
PORTREVISION=	6
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
