# $MidnightBSD$

PORTNAME=	glib
PORTVERSION=	2.36.4
PORTREVISION?=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (current stable version)

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

LIB_DEPENDS+=	pcre:${PORTSDIR}/devel/pcre \
		ffi:${PORTSDIR}/devel/libffi

USES+=		gettext gmake iconv pathfix pkgconfig shebangfix
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	ltverhack
USE_PYTHON=	yes
USE_PERL5=	yes
CONFIGURE_ARGS=	--enable-static \
		--disable-gtk-doc --with-html-dir=${PREFIX}/share/doc \
		--disable-man --without-xml-catalog \
		--disable-dtrace \
		--with-pcre=system \
		--disable-fam
CONFIGURE_ENV=	ac_cv_header_sys_inotify_h=
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

SHEBANG_FILES=	*/*.pl glib/gen-iswide-table.py

OPTIONS_DEFINE=	COLLATION_FIX DEBUG
COLLATION_FIX_DESC=	fix string collation

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--disable-dtrace

.if empty(ICONV_LIB)
CONFIGURE_ARGS+=	--with-libiconv=native
.else
CONFIGURE_ARGS+=	--with-libiconv=gnu
.endif

# Let glib use asm code for implementing atomic ops on i386 and amd64.
.if ${ARCH} == "i386"
GLIB_ARCH=	i486
.elif ${ARCH} == "amd64"
GLIB_ARCH=	x86_64
.else
GLIB_ARCH=	${ARCH}
.endif
CONFIGURE_TARGET=${GLIB_ARCH}-portbld-freebsd9.1

.if ${PORT_OPTIONS:MCOLLATION_FIX}
LIB_DEPENDS+=	icui18n:${PORTSDIR}/devel/icu
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-glib_Makefile.in \
		${FILESDIR}/extra-patch-glib_gunicollate.c
# Disable it until someone can figure why it causes net-im/pidgin crashed.
#CONFIGURE_ENV+=	CFLAGS="-D__STDC_ISO_10646__"
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-debug=yes \
			--disable-silent-rules
.else
CONFIGURE_ARGS+=	--disable-modular-tests
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g ; \
		s|/usr/share/locale/locale|${LOCALBASE}/share/locale/locale|g' \
			${WRKSRC}/glib/gutils.c
	@${REINPLACE_CMD} -e 's|/lib/dbus/machine-id|/db/dbus/machine-id|g' \
		${WRKSRC}/gio/gdbusaddress.c ${WRKSRC}/gio/gdbusprivate.c \
		${WRKSRC}/po/*.po
	@${REINPLACE_CMD} -e 's|inotify_support=yes|inotify_support=no| ; \
		s|-Werror|| ; \
		s|#define HAVE_SYS_INOTIFY_H 1||' ${WRKSRC}/configure

post-install:
	@${MKDIR} ${PREFIX}/share/GConf/gsettings

.include <bsd.port.post.mk>

.endif
