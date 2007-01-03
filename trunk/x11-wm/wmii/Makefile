# New ports collection makefile for:	Window Manager Improved 2
# Date created:				02 Jun 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD: mports/x11-wm/wmii/Makefile,v 1.3 2006/12/31 20:30:40 wintellect Exp $
# $FreeBSD: ports/x11-wm/wmii/Makefile,v 1.8 2006/06/28 13:17:16 danfe Exp $
#

PORTNAME=	wmii
DISTVERSION=	3.5.1
CATEGORIES=	x11-wm
MASTER_SITES=	http://suckless.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic, minimalist window manager for X11

BUILD_DEPENDS=	dmenu:${PORTSDIR}/x11/dmenu
DEPENDS=	${PORTSDIR}/devel/libixp

MAKE_ARGS=	PREFIX="${PREFIX}" X11LIB="${X11BASE}/lib" \
		X11INC="${X11BASE}/include" CC="${CC}" \
		MANPREFIX="${MANPREFIX}/man"

MAN1=		wmii.1 wmiir.1 wmiiwm.1

#post-patch:
#	@${REINPLACE_CMD} -E 's|-O3|${CFLAGS}|; \
#		s|(-[LI])\$${PREFIX}|\1${LOCALBASE}|' \
#		${WRKSRC}/config.mk
#	@${REINPLACE_CMD} -e 's|cp -f $${M|${INSTALL_MAN} $${M|' \
#		${WRKSRC}/Makefile

#pre-install:
#.for b in wm/wmiiwm wmiimenu wmiipsel wmiir wmiisetsid wmiiwarp
#	@${STRIP_CMD} ${WRKSRC}/cmd/${b}
#.endfor

.include <bsd.port.mk>
