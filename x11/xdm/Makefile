# New ports collection makefile for:	xdm
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/xdm/Makefile,v 1.4 2007/09/13 19:45:02 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xdm
PORTVERSION=	1.1.6
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org X display manager
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	xmu x11 xau xinerama xpm xdmcp xt xext xaw
CONFIGURE_ARGS+=	--with-xdmconfigdir=${EXAMPLESDIR} \
			--with-xdmscriptdir=${EXAMPLESDIR}

MAN1=		xdm.1

CFFILES=	GiveConsole TakeConsole Xaccess Xreset Xresources \
		Xservers Xsession Xsetup_0 Xstartup Xwilling xdm-config

post-install:
.for f in ${CFFILES}
	${CP} -n ${EXAMPLESDIR}/$f ${PREFIX}/lib/X11/xdm/$f
.endfor

.include <bsd.port.mk>
