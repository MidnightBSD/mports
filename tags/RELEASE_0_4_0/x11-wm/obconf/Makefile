# $MidnightBSD: mports/x11-wm/obconf/Makefile,v 1.7 2012/12/19 03:29:50 laffer1 Exp $

PORTNAME=	obconf
PORTVERSION=	2.0.3
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	http://openbox.org/dist/obconf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Preferences manager for the Openbox window manager
LICENSE=	gpl2

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification \
		obrender.27:${PORTSDIR}/x11-wm/openbox

USE_GNOME=	gnomehier libglade2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	OPENBOX_CFLAGS="`pkg-config --cflags obrender-3.5 obt-3.5`" \
		OPENBOX_LIBS="`pkg-config --libs obrender-3.5 obt-3.5`"
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/openbox
MAKE_ARGS=	mkdir_p='${MKDIR}'

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PORTDOCS=	ABOUT-NLS AUTHORS README TODO

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
