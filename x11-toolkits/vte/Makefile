# $MidnightBSD$

PORTNAME=	vte
PORTVERSION=	0.28.2
PORTREVISION?=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Terminal widget with improved accessibility and I18N support

LICENSE?=	lgpl

USES+=		tar:xz

.if !defined(REFERENCE_PORT)

USES+=		bison gettext gmake pathfix pkgconfig libtool:keepla
USE_LDCONFIG=	yes
USE_GNOME?=	gnomeprefix gtk20 introspection:build referencehack
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS?=--disable-python \
		--disable-Bsymbolic \
		--disable-freetypetest \
		--disable-static \
		--with-gtk=2.0 \
		--enable-introspection \
		-disable-gnome-pty-helper
GNU_CONFIGURE=	yes

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
