# $MidnightBSD: mports/x11/dmenu/Makefile,v 1.11 2010/12/04 02:33:55 laffer1 Exp $
# $FreeBSD: ports/x11/dmenu/Makefile,v 1.4 2006/10/08 10:32:05 erwin Exp $

PORTNAME=	dmenu
PORTVERSION=	4.2.1
CATEGORIES=	x11
MASTER_SITES=	http://dl.suckless.org/tools/ \
		http://schot.a-eskwadraat.nl/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 menu application (not only) for the dwm window manager
LICENSE=	mit

USE_XORG=	x11 xinerama

FAKE_OPTS=	trueprefix

MAN1=		dmenu.1
PLIST_FILES=	bin/dmenu bin/dmenu_path bin/dmenu_run

EXTRA_FAKE_MAKEARGS= MANPREFIX=${PREFIX}/man

post-patch:
	@${GREP} -Rl '%%[[:alpha:]]\+%%' ${WRKSRC}|${XARGS} ${REINPLACE_CMD} \
		-e "s,%%PREFIX%%,${PREFIX},g" \
		-e "s,%%LOCALBASE%%,${LOCALBASE},g" \
		-e "s,%%MANPREFIX%%,${MANPREFIX},g"
.if defined(WITHOUT_XINERAMA)
	@${REINPLACE_CMD} -e 's,$${XINERAMALIBS},,g' \
		-e 's,$${XINERAMAFLAGS},,g' ${WRKSRC}/config.mk
.endif


.include <bsd.port.mk>

