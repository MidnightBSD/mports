# $MidnightBSD: mports/x11/xdm/Makefile,v 1.4 2011/05/07 02:55:11 laffer1 Exp $

PORTNAME=	xdm
PORTVERSION=	1.1.8
PORTREVISION=	3
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

post-patch:
	@${REINPLACE_CMD} -e "s|XDMCONFIGDIR/|${PREFIX}/lib/X11/xdm/|" \
		-e "s|XDMSCRIPTDIR/|${PREFIX}/lib/X11/xdm/|" \
			${WRKSRC}/config/xdm-config.cpp \
			${WRKSRC}/config/Xstartup.cpp \
			${WRKSRC}/config/Xreset.cpp
	@${REINPLACE_CMD} -e "s|@DESTDIR@||" ${WRKSRC}/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e "s|${EXAMPLESDIR}|${PREFIX}/lib/X11/xdm|" \
			${WRKSRC}/config.h

post-install:
.for f in ${CFFILES}
	${CP} -n ${EXAMPLESDIR}/$f ${PREFIX}/lib/X11/xdm/$f
.endfor
	(cd ${PREFIX}/lib/X11/xdm && ${LN} -sf /var/lib/xdm/authdir authdir)

.include <bsd.port.mk>
