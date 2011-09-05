# New ports collection makefile for:	pidgin
# Date created:			16 Oct 2007
# Whom:				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/net-im/pidgin/Makefile,v 1.26 2011/09/05 14:24:05 laffer1 Exp $

PORTNAME=	pidgin
PORTVERSION=	2.8.0
PORTREVISION=	2
CATEGORIES=	net-im
MASTER_SITES=   SF/pidgin/Pidgin/${PORTVERSION}
DISTNAME=       pidgin-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pidgin multi-protocol messaging client (GTK+ UI)
LICENSE=	gpl2

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification

CONFLICTS=	libpurple-[0-9*] gaim-1*

FAKE_OPTS=	trueprefix

#gstreamer support seems to cause segfaults
WITHOUT_GSTREAMER=	yes

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	xext sm
USE_GNOME=	gnomeprefix gnomehack intlhack gtk20 libxml2 gnomelibs gconf2
WANT_GNOME=	yes
INSTALL_ICONS=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	automake
CONFIGURE_ARGS+= \
		--disable-consoleui \
		--with-dynamic_prpls=${PRPL_MODULES} \
		--disable-nm \
		--disable-doxygen \
		--disable-vv \
		--disable-screensaver \
		--program-prefix='' \
		--disable-idn
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}" \
		PTHREAD_LIB="${PTHREAD_LIBS}"

PRPL_MODULES=	gg,irc,jabber,msn,novell,oscar,simple,yahoo,zephyr

OPTIONS=	SILC "Secure Internet Live Conferencing support" off \
		GNUTLS "GNUTLS encryption support" on \
		NSS "Mozilla NSS encryption support" off \
		SASL "Cyrus SASL support (for jabberd)" off \
		DBUS "Enable DBUS bindings" on \
		PERL "Perl scripting" off \
		BONJOUR "Enable mDNS support" on \
		SAMETIME "Enable Sametime client support" off \
		TCLTK "Tcl/Tk scripting" off \
		GTKSPELL "Spell checking support" on \
		GSTREAMER "Use GStreamer for playing sounds" on \
		CAP "Enable Contact Availability Prediction plugin" on

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mevolutiondataserver}!=""
USE_GNOME+=		evolutiondataserver
PLIST_SUB+=		EVO=""
CONFIGURE_ARGS+=	--enable-gevolution
.else
CONFIGURE_ARGS+=	--disable-gevolution
PLIST_SUB+=		EVO="@comment not installed: "
.endif

.if !defined(WITHOUT_GSTREAMER)
USE_GSTREAMER+=	core good
.else
CONFIGURE_ARGS+=--disable-gstreamer
.endif

.if !defined(WITHOUT_CAP)
LIB_DEPENDS+=	sqlite3.8:${PORTSDIR}/databases/sqlite3
CONFIGURE_ARGS+=	--enable-cap
PLIST_SUB+=	CAP=""
.else
CONFIGURE_ARGS+=--disable-cap
PLIST_SUB+=	CAP="@comment not installed: "
.endif

.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=		gnutls:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--enable-gnutls=yes
.else
CONFIGURE_ARGS+=	--enable-gnutls=no
.endif

.if defined(WITH_NSS)
LIB_DEPENDS+=		nss3:${PORTSDIR}/security/nss
CONFIGURE_ARGS+=	--enable-nss=yes \
			--with-nspr-includes=${LOCALBASE}/include/nspr \
			--with-nspr-libs=${LOCALBASE}/lib \
			--with-nss-includes=${LOCALBASE}/include/nss/nss \
			--with-nss-libs=${LOCALBASE}/lib/nss
PLIST_SUB+=		NSS=""
.else
CONFIGURE_ARGS+=	--enable-nss=no
PLIST_SUB+=		NSS="@comment "
.endif

.if defined(WITH_SASL)
LIB_DEPENDS+=		sasl2:${PORTSDIR}/security/cyrus-sasl2
CONFIGURE_ARGS+=	--enable-cyrus-sasl
.endif

.if defined(WITH_SILC)
LIB_DEPENDS+=		silcclient-1.1.3:${PORTSDIR}/devel/silc-toolkit
CONFIGURE_ARGS+=	--with-silc-includes=${LOCALBASE}/include/silc \
			--with-silc-libs=${LOCALBASE}/lib
PLIST_SUB+=		SILC=""
PRPL_MODULES:=		${PRPL_MODULES},silc
.else
PLIST_SUB+=		SILC="@comment not installed: "
.endif

.if !defined(WITHOUT_BONJOUR)
LIB_DEPENDS+=	avahi-client.3:${PORTSDIR}/net/avahi-app
PLIST_SUB+=	BONJOUR=""
PRPL_MODULES:=	${PRPL_MODULES},bonjour
CONFIGURE_ARGS+=	--enable-avahi
.else
CONFIGURE_ARGS+=	--disable-avahi
PLIST_SUB+=	BONJOUR="@comment not installed: "
.endif

.if defined(WITH_SAMETIME)
LIB_DEPENDS+=	meanwhile.1:${PORTSDIR}/net-im/meanwhile
PLIST_SUB+=	SAMETIME=""
PRPL_MODULES:=	${PRPL_MODULES},sametime
.else
CONFIGURE_ARGS+=	--disable-meanwhile
PLIST_SUB+=	SAMETIME="@comment not installed: "
.endif

CONFIGURE_ARGS+=	--disable-tcl

.if !defined(WITHOUT_DBUS)
LIB_DEPENDS+=		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=	--enable-dbus
PLIST_SUB+=		DBUS=""
.else
CONFIGURE_ARGS+=	--disable-dbus
PLIST_SUB+=		DBUS="@comment not installed: "
.endif

.if defined(WITH_PERL)
USE_PERL5=		yes
CONFIGURE_ARGS+=	--with-perl-lib=site
PLIST_SUB+=		PERL:=""
.else
CONFIGURE_ARGS+=	--disable-perl
PLIST_SUB+=		PERL:="@comment not installed: "
.endif

.if !defined(WITHOUT_GTKSPELL)
LIB_DEPENDS+=		gtkspell.0:${PORTSDIR}/textproc/gtkspell
.else
CONFIGURE_ARGS+=	--disable-gtkspell
.endif

pre-everything::
.if defined(WITHOUT_GNUTLS) && defined(WITHOUT_NSS)
	@${ECHO_MSG} "WARNING: In order to use MSN, you must enable the GNUTLS and/or NSS options."
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthreads|${PTHREAD_LIBS:S/"//g}|g' \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		-e 's|-lpanel |-lpanel -lncurses|g' \
		-e 's|-lpthread|${PTHREAD_LIBS:S/"//g}|g' \
		-e 's|-lsilc -lsilcclient ${PTHREAD_LIBS} $$LIBDL|-lsilc -lsilcclient ${PTHREAD_LIBS} -liconv|' \
		-e 's|TCL_VERSION found but 8.3 required|TCL_VERSION found but ${TCLTK_VER} required|g' \
		-e 's|TCL_MINOR_VERSION" -ne 3|TCL_MINOR_VERSION" -ne ${TCLTK_VER:E}|' \
			${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|/bin/bash|${SH}|' \
			${WRKSRC}/libpurple/purple-send \
			${WRKSRC}/libpurple/purple-send-async
	@${REINPLACE_CMD} -e 's|/python|/env python|' \
	    		${WRKSRC}/libpurple/purple-remote \
			${WRKSRC}/libpurple/purple-url-handler
#	@${FIND} ${BUILD_WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
#		's|[$$][(]top_builddir[)]/libpurple/libpurple.la|${LOCALBASE}/lib/libpurple.la|g'

.include <bsd.port.post.mk>
