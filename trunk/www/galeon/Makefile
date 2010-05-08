# Ports collection Makefile for:	galeon
# Date created:				7 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/www/galeon/Makefile,v 1.6 2010/01/23 21:01:32 laffer1 Exp $

PORTNAME=	galeon
PORTVERSION=	2.0.7
PORTREVISION=	0
CATEGORIES=	www gnome
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	${PORTNAME:S/2$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNOME 2 Web browser based on gecko (the Mozilla rendering engine)
LICENSE=	gpl2

USE_GECKO=	seamonkey xulrunner
WRKSRC=		${WRKDIR}/${PORTNAME:S/2$//}-${PORTVERSION:S/a$//}
USE_BZIP2=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libgnomeui desktopfileutils \
		gnomedesktop
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
CONFIGURE_ARGS=	--enable-nautilus-view=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		galeon.1
GCONF_SCHEMAS=	galeon.schemas

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=        --with-mozilla=${GECKO}

NO_WERROR=	yes
# allow build with more warnings enabled
.if defined(NO_WERROR)
CONFIGURE_ARGS+=	--disable-werror
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in*" | ${XARGS} ${REINPLACE_CMD} -e \
		 's|-lpthread|${PTHREAD_LIBS}|g'
	@${FIND} ${WRKSRC} -name "*.cpp" | ${XARGS} ${REINPLACE_CMD} -e \
		's|malloc\.h|stdlib.h|g'
	@${REINPLACE_CMD} -e 's|@prefix@/@DATADIRNAME@|@datadir@|g' \
		${WRKSRC}/ui/galeon-bookmarks-editor-ui.xml.in
	@${REINPLACE_CMD} -e 's|/usr/lib/mozilla/plugins|${LOCALBASE}/lib/browser_plugins:${LOCALBASE}/lib/browser_plugins:${LOCALBASE}/lib/browser_linux_plugins:${LOCALBASE}/lib/browser_linux_plugins|' \
		${WRKSRC}/mozilla/mozilla-embed-shell.cpp

.include <bsd.port.post.mk>
