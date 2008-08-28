# New ports collection makefile for:	Window Manager Improved 2
# Date created:				02 Jun 2005
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD: mports/x11-wm/wmii/Makefile,v 1.9 2008/04/04 04:54:49 ctriv Exp $
# $FreeBSD: ports/x11-wm/wmii/Makefile,v 1.8 2006/06/28 13:17:16 danfe Exp $
#

PORTNAME=	wmii
DISTVERSION=	3.6
PORTREVISION=	0
CATEGORIES=	x11-wm
MASTER_SITES=	http://www.suckless.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic, minimalist window manager for X11
LICENSE=	x11

USE_ICONV=	yes
USE_XORG=	x11 xextproto xt xext

MAKE_ARGS=	PREFIX="${PREFIX}" INCLUDE="${LOCALBASE}/include" \
		INCX11="-I${LOCALBASE}/include" LIBX11="-L${LOCALBASE}/lib" \
		CC="${CC} -c" LD="${CC}" LIBIXP="-lixp" STATIC="" \
		LIBICONV="-liconv" MAN="${FAKE_DESTDIR}${MANPREFIX}/man"

FAKE_MAKEARGS+=	${MAKE_ARGS} PREFIX="${FAKE_DESTDIR}${PREFIX}"

LIB_DEPENDS=	ixp.1:${PORTSDIR}/devel/libixp
RUN_DEPENDS=	dmenu:${PORTSDIR}/x11/dmenu \
		${LOCALBASE}/9/bin/rc:${PORTSDIR}/devel/9base
BUILD_DEPENDS=	${RUN_DEPENDS}

MAN1=		wmii.1 wmiiloop.1 wmiir.1

post-patch: .SILENT
	${REINPLACE_CMD} -e 's|-lfmt -lutf|$${LIBX11} & -lX11|' \
		${WRKSRC}/cmd/Makefile
# Strip debug build options
	${REINPLACE_CMD} -E 's| -g( -O0)?||' ${WRKSRC}/config.mk
# Make actual compile/link command appear in the build log
	${REINPLACE_CMD} -e 's|^COMPILE=|& noisycc=yes | ; \
		s|^LINK=|& noisycc=yes |' ${WRKSRC}/mk/hdr.mk

.include <bsd.port.mk>
