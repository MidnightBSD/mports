# New ports collection makefile for:	BitchX ircII client
# Date created:		26 Jan 1998
# Whom:			griffin
#
# $MidnightBSD: mports/irc/bitchx/Makefile,v 1.2 2007/05/07 03:22:29 ctriv Exp $
# $FreeBSD: ports/irc/bitchx/Makefile,v 1.82 2007/03/05 00:15:24 linimon Exp $
#

PORTNAME=	BitchX
PORTVERSION=	1.1
CATEGORIES+=	irc
MASTER_SITES=	ftp://ftp.bitchx.org/pub/BitchX/source/ \
		ftp://ftp.cyberpunkz.org/pub/BitchX/source/ \
		ftp://ftp.cyberpunkz.org/pub/BitchX/tcl-o/:tcl
DISTFILES=	ircii-pana-${PORTVERSION}-final${EXTRACT_SUFX}
EXTRACT_ONLY=	ircii-pana-${PORTVERSION}-final${EXTRACT_SUFX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	An alternative ircII color client with optional GTK/GNOME support

OPTIONS=	XMMS "Build BitchX with XMMS-Plugin" off \
		PLUGINS "Build BitchX with addition plugins" off \
		LATIN "Improved ISO-8859-1 display support" off \
		TCL "Build BitchX with TCL scripting" off \
		SOCKS5 "Enable SOCKS5 support" off \
		SSL "Enable SSL support" off \
		IPV6 "Enable IPv6 support" off \
		GNOME "Build BitchX with Gtk-Frontend" off \
		

WRKSRC=		${WRKDIR}/BitchX
USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--exec-prefix="${PREFIX}/share" \
		--bindir="${PREFIX}/bin" \
		--datadir="${PREFIX}/share" \
		--libdir="${PREFIX}/share" \
		--build=${MACHINE_ARCH}-portbld-freebsd$6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

MAN1=		BitchX.1

# This is an awful hack, but so is the rest of bitchx.
FAKE_OPTS=	prefixhack
FAKE_MAKEARGS+=	exec_prefix=${FAKE_DESTDIR}${PREFIX}/share \
		datadir=${FAKE_DESTDIR}${PREFIX}/share libdir=${FAKE_DESTDIR}${PREFIX}/share \
		bindir=${FAKE_DESTDIR}${PREFIX}/bin

.if defined(WITH_GNOME)
BROKEN=	"Gnome is not current supported."
USE_X_LIB=	yes
USE_GNOME=	gnomelibs
CONFIGURE_ARGS+=--with-gtk
CFLAGS+=	-I${X11BASE}/include/gnome-1.0/
PLIST_SUB+=	NOGNOME:="@comment " GNOME:=""
.else
CONFIGURE_ARGS+=--without-gtk
PLIST_SUB+=	GNOME:="@comment " NOGNOME:=""
.endif
.if (defined(WITH_ESOUND) && defined(WITH_GNOME))
USE_GNOME+=	esound
CONFIGURE_ARGS+=--enable-sound
.endif

.if defined(WITH_SSL)
USE_OPENSSL=		yes
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_TCL)
BROKEN=	"Binary TCL files are missing"
DISTFILES+=	freebsd4-tcl83-bx1.0c19-tcl.o:tcl
.endif

.if defined(WITH_XMMS)
LIB_DEPENDS+=	xmms.4:${PORTSDIR}/multimedia/xmms
.endif

.if defined(WITH_IPV6)
USE_AUTOTOOLS=	autoconf:253
.endif

.if defined(WITH_IPV6)
CONFIGURE_ARGS+=--enable-ipv6
.endif

.if defined(WITH_TCL)
BUILD_DEPENDS+=	${LOCALBASE}/include/tcl8.3/tcl.h:${PORTSDIR}/lang/tcl83
CONFIGURE_ARGS+=--with-tcl \
		--with-tcl-libs=${LOCALBASE}/lib
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include -I${LOCALBASE}/include/tcl8.3"
CFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/tcl8.3
ONLY_FOR_ARCHS=	i386
.endif

.if defined(WITH_SOCKS5)
BUILD_DEPENDS+=		${LOCALBASE}/lib/libsocks5.a:${PORTSDIR}/net/socks5
CONFIGURE_ARGS+=	--with-socks5=${LOCALBASE}
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include"
.endif

.if defined(WITH_SSL)
CONFIGURE_ARGS+=	--with-ssl
.endif

.if defined(WITH_PLUGINS)
PLUGINS=	abot,acro,aim,arcfour,autocycle,blowfish,cavlink,encrypt,fserv,hint,identd,nap,pkga,possum,qbx,qmail,scan,wavplay
PLIST_SUB+=	PLUGINS:=""
.else
CONFIGURE_ARGS+=--without-plugins
PLIST_SUB+=	PLUGINS:="@comment "
.endif

.if defined(WITH_XMMS)
PLUGINS=	xmms
PLIST_SUB+=	XMMS:=""
.else
PLIST_SUB+=	XMMS:="@comment "
.endif
.if (defined(WITH_XMMS) && defined(WITH_PLUGINS))
PLUGINS=	abot,acro,aim,arcfour,autocycle,blowfish,cavlink,encrypt,fserv,hint,identd,nap,pkga,possum,qbx,qmail,scan,wavplay,xmms
.endif

.if (defined(WITH_PLUGINS) || defined(WITH_XMMS))
USE_LDCONFIG=		yes
CONFIGURE_ARGS+=	--with-plugins=${PLUGINS}
.endif
CONFIGURE_ENV+=		CFLAGS="${CFLAGS}"

.if defined(WITH_TCL)

pre-fetch:
.if !defined(BATCH) && !defined(PACKAGE_BUILDING)
	${DIALOG} --yesno "SECURITY NOTICE: TCL support is only \
	available by linking a precompiled binary object into the Application. \
	Do you really want to proceed building BitchX with TCL support?" 7 70 || ${FALSE}
.endif # BATCH

.endif # WITH_TCL

.if defined(WITH_TCL)

post-extract:
	@${CP} ${DISTDIR}/freebsd4-tcl83-bx1.0c19-tcl.o ${WRKSRC}/source/tcl.o

.endif

pre-patch:
.if defined(WITH_LATIN)
	${REINPLACE_CMD} -e 's|#undef LATIN1|#define LATIN1|g' ${WRKSRC}/include/config.h
.endif
	${REINPLACE_CMD} -e 's|bzip2|true|g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/bx/help
	${MKDIR} ${PREFIX}/share/doc/bitchx
	${TAR} --directory ${WRKSRC}/bitchx-docs -cf - . --exclude CVS | \
	${TAR} --directory ${PREFIX}/share/bx/help -xf -
.else
	${RMDIR} ${PREFIX}/share/bx/help
.endif
.if defined(WITH_GNOME)
	${STRIP_CMD} ${PREFIX}/bin/gtkBitchX-${PORTVERSION}-final
.else
	${STRIP_CMD} ${PREFIX}/bin/BitchX-${PORTVERSION}-final
	${STRIP_CMD} ${PREFIX}/bin/scr-bx
.endif

.include <bsd.port.post.mk>
