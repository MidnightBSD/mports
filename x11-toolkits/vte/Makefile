# $MidnightBSD: mports/x11-toolkits/vte/Makefile,v 1.11 2013/03/30 12:29:35 laffer1 Exp $

PORTNAME=	vte
PORTVERSION=	0.26.2
PORTREVISION?=	2
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Terminal widget with improved accessibility and I18N support
LICENSE?=	lgpl

USE_BZIP2=	yes
USE_PATHFIX=	yes

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
USE_BISON=	build
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GETTEXT=	yes
USE_GNOME?=	gnomeprefix gtk20 ltverhack referencehack
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
#		BSD_PTHREAD_LIBS="${PTHREAD_LIBS}"
CONFIGURE_ARGS?=--disable-python \
		--disable-Bsymbolic \
		--disable-freetypetest

.if !defined(MASTERDIR)
OPTIONS_DEFINE=	GLX
GLX_DESC=	Support for DRI/GLX rendering
.endif

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGLX} && !defined(MASTERDIR)
CONFIGURE_ARGS+=	--with-glX
USE_GL=			yes
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4016
EXTRA_PATCHES+=		${FILESDIR}/extra-patch-gnome-pty-helper_gnome-utmp.c
.endif

.include <bsd.port.post.mk>

.endif
