# $MidnightBSD: mports/deskutils/drivel/Makefile,v 1.7 2009/12/31 23:33:16 laffer1 Exp $

PORTNAME=	drivel
PORTVERSION=	2.0.3
PORTREVISION=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	SF/${PORTNAME}/Drivel%20%28stable%29/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blog editor for GNOME
LICENSE=	gpl2

LIB_DEPENDS=	curl.5:${PORTSDIR}/ftp/curl

INSTALLS_ICONS=	yes
USE_XLIB=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui intlhack gtksourceview
USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_OMF=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	drivel.schemas

.ifndef(WITHOUT_RHYTHMBOX)
CONFIGURE_ARGS+=	--with-rhythmbox
BUILD_DEPENDS+=		rhythmbox:${PORTSDIR}/audio/rhythmbox
RUN_DEPENDS+=		rhythmbox:${PORTSDIR}/audio/rhythmbox
.else
CONFIGURE_ARGS+=	--without-rhythmbox
.endif

.ifndef(WITHOUT_GTKSPELL)
LIB_DEPENDS+=		gtkspell.0:${PORTSDIR}/textproc/gtkspell
.else
CONFIGURE_ARGS+=	--without-gtkspell
.endif

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Define WITHOUT_RHYTHMBOX=yes to disable rhythmbox backend"
	@${ECHO_MSG} "Define WITHOUT_GTKSPELL=yes to disable gtkspell"
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e 's|;;|;|g' \
		${WRKSRC}/src/journal.c \
		${WRKSRC}/src/msg_queue.c

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}/usr/local/share/mime/application

.include <bsd.port.mk>
