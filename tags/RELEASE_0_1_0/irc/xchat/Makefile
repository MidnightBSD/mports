# New ports collection makefile for:	xchat2
# Date created:			17 Aug 2002
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/irc/xchat/Makefile,v 1.1 2007/02/19 23:05:09 laffer1 Exp $
# $FreeBSD: ports/irc/xchat/Makefile,v 1.122 2006/11/28 14:44:41 pav Exp $
#    $MCom: ports-stable/irc/xchat/Makefile,v 1.1 2006/10/26 08:33:06 marcus Exp $
#

PORTNAME=	xchat
PORTVERSION=	2.6.8
PORTREVISION=	1
CATEGORIES=	irc gnome ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://xchat.org/files/source/2.6/
MASTER_SITE_SUBDIR=	${PORTNAME:S|2||}
DISTNAME=	xchat-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An X11 IRC client using the GTK+ 2 toolkit

OPTIONS=	PYTHON "Enable Python support" Off \
		SOCKS "Enable SOCKS5 proxy support" Off \
		TCL "Enable TCL suppoer" Off \
		PERL "Enable perl support" On \
		DBUS "Enable dbus support" On \
		GTKSPELL "Enable spell-checking" On \

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gtk20
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--enable-nls \
		--enable-ipv6

CONFLICTS=	xchat-1*

.if defined(WITH_SOCKS)
BUILD_DEPENDS+=	${LOCALBASE}/lib/libsocks5.a:${PORTSDIR}/net/socks5
CONFIGURE_ARGS+=	--enable-socks
.endif

# openssl in now default in configure

.if defined(WITH_PYTHON)
USE_PYTHON=		yes
CONFIGURE_ARGS+=	--enable-python
PLIST_SUB+=		PYTHON=""
.else
CONFIGURE_ARGS+=	--disable-python
PLIST_SUB+=		PYTHON="@comment "
.endif

.if defined(WITH_TCL)
LIB_DEPENDS+=	tcl83.1:${PORTSDIR}/lang/tcl83
CONFIGURE_ARGS+=--enable-tcl=${LOCALBASE}/lib/tcl8.3
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS} \
		-I${LOCALBASE}/include/tcl8.3" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS} \
		-L${LOCALBASE}/lib/tcl8.3"
PLIST_SUB+=	TCL=""
.else
CONFIGURE_ARGS+=--enable-tcl=no
PLIST_SUB+=	TCL="@comment "
.endif

.if !defined(WITHOUT_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=--enable-dbus
USE_GNOME+=	gconf2
GCONF_SCHEMAS+=	apps_xchat_url_handler.schemas
PLIST_SUB+=	DBUS=""
.else
CONFIGURE_ARGS+=--disable-dbus
PLIST_SUB+=	DBUS="@comment "
.endif

.if !defined(WITHOUT_GTKSPELL)
LIB_DEPENDS+=	gtkspell.0:${PORTSDIR}/textproc/gtkspell
CONFIGURE_ARGS+=--enable-spell=gtkspell
.else
CONFIGURE_ARGS+=--disable-spell
.endif

.include <bsd.port.pre.mk>

.if defined(WITHOUT_PERL)
CONFIGURE_ARGS+=--disable-perl
PLIST_SUB+=	PERL="@comment "
.else
USE_PERL5=	yes
CONFIGURE_ARGS+=--enable-perl
PLIST_SUB+=	PERL=""
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's|PY_LIBS=.*|PY_LIBS="-L\$$PY_EXEC_PREFIX/lib/python\$$PY_VER/config -lpython\$$PY_VER ${PTHREAD_LIBS} -lutil"|' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
