# $MidnightBSD$

PORTNAME=	glib
PORTVERSION=	2.44.1
PORTREVISION?=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (current stable version)

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

LIB_DEPENDS+=	libpcre.so:${PORTSDIR}/devel/pcre \
		libffi.so:${PORTSDIR}/devel/libffi

GNU_CONFIGURE=	yes
USES+=		gettext gmake iconv:wchar_t libtool pathfix python pkgconfig shebangfix
USE_PYTHON=	py3kplist
USE_LDCONFIG=	yes
USE_PERL5=	yes
CONFIGURE_ARGS= --disable-gtk-doc --with-html-dir=${PREFIX}/share/doc \
		--disable-man --without-xml-catalog \
		--disable-dtrace \
		--enable-static \
		--with-pcre=system \
		--disable-fam
CONFIGURE_ENV=	ac_cv_header_sys_inotify_h=
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

SHEBANG_FILES=	*/*.pl

LIBVERSION=	0.4400.1
PLIST_SUB+=	LIBVERSION=${LIBVERSION}

glib_MAN=	gtester.1 gtester-report.1 glib-gettextize.1
gio_MAN=	gdbus.1 gsettings.1 gio-querymodules.1 \
		glib-compile-schemas.1 gapplication.1 \
		glib-compile-resources.1 gresource.1 gdbus-codegen.1
gobject_MAN=	glib-genmarshal.1 glib-mkenums.1 gobject-query.1

OPTIONS_DEFINE=	COLLATION_FIX DEBUG GDB
COLLATION_FIX_DESC=	fix string collation
GDB_DESC=	Install python gdb scripts

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
LIB_DEPENDS+=	libicui18n.so:${PORTSDIR}/devel/icu
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-glib_Makefile.in \
		${FILESDIR}/extra-patch-glib_gunicollate.c
# Disable it until someone can figure why it causes net-im/pidgin crashed.
#CONFIGURE_ENV+=	CFLAGS="-D__STDC_ISO_10646__"
.endif

.if ${PORT_OPTIONS:MGDB}
PLIST_SUB+=	GDB=""
.else
EXTRA_PATCHES+=	${FILESDIR}/extra-glib_gdbscripts \
		${FILESDIR}/extra-gobject_gdbscripts
PLIST_SUB+=	GDB="@comment "
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-debug=yes \
			--disable-silent-rules
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
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/GConf/gsettings
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/gio/modules
.for m in glib gio gobject
	${INSTALL_MAN} ${${m}_MAN:S|^|${WRKSRC}/docs/reference/${m}/|} \
		${STAGEDIR}${PREFIX}/man/man1
.endfor

.include <bsd.port.post.mk>

.endif
