PORTNAME=	glib
DISTVERSION=	2.66.7
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (current stable version)

LICENSE=	lgpl

PORTSCOUT=	limitw:1,even

NO_TEST=	yes

LIB_DEPENDS+=	libpcre.so:devel/pcre \
		libffi.so:devel/libffi

# iconv:wchar_t - our iconv in base doesn't support utf-8 -> wchar_t (boooo)
# (wchar_t is used by glibmm, rawtherapee triggered this)
USES=		compiler:c11 gettext gnome iconv:wchar_t \
		localbase:ldflags meson perl5 pkgconfig python:3.7+ tar:xz
USE_PYTHON=	py3kplist
USE_PERL5=	build
USE_LDCONFIG=	yes
MESON_ARGS=	-Db_lundef=false \
		-Dlibmount=disabled \
		-Dselinux=disabled \
		-Dinstalled_tests=false \
		-Ddefault_library=both \
		-Dxattr=false
BINARY_ALIAS=	python3=${PYTHON_CMD}

_LIBVERSION=	0.6600.7
PLIST_SUB=	LIBVERSION=${_LIBVERSION}

OPTIONS_DEFINE=	DEBUG FAM_ALTBACKEND MANPAGES NLS
OPTIONS_DEFAULT=	MANPAGES
OPTIONS_SUB=		yes

FAM_ALTBACKEND_DESC=	Alternate file monitor backend

MANPAGES_BUILD_DEPENDS=	docbook-xml>4.1.2:textproc/docbook-xml \
			docbook-xsl>0:textproc/docbook-xsl
MANPAGES_USE=		GNOME=libxslt:build
MANPAGES_MESON_TRUE=	man

.include <bsd.port.pre.mk>

# doesn't build yet
MESON_ARGS+=	-Ddtrace=false

.if empty(ICONV_LIB)
# native?
MESON_ARGS+=	-Diconv=libc
.else
MESON_ARGS+=	-Diconv=external
.endif

.if ${ARCH} == powerpc64
EXTRA_PATCHES=	${FILESDIR}/extra-arch-powerpc64
.endif

pre-configure-FAM_ALTBACKEND-on:
	@${REINPLACE_CMD} -e 's|kqueue-helper.c|kqueue_fnm.c|g ; \
		s|.*kqueue-missing.c.*||g ; \
		s|.*dep-list.c.*||g' \
		${WRKSRC}/gio/kqueue/meson.build
	@${CP} -f ${FILESDIR}/gkqueuefilemonitor.c ${WRKSRC}/gio/kqueue/gkqueuefilemonitor.c
	@${CP} ${FILESDIR}/kqueue_fnm.c ${WRKSRC}/gio/kqueue/kqueue_fnm.c
	@${CP} ${FILESDIR}/kqueue_fnm.h ${WRKSRC}/gio/kqueue/kqueue_fnm.h

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g ; \
		s|/usr/share/locale/locale|${LOCALBASE}/share/locale/locale|g' \
		${WRKSRC}/glib/gutils.c
	@${REINPLACE_CMD} -e 's|@PYTHON@|${PYTHON_CMD}|g' \
		${WRKSRC}/gio/gdbus-2.0/codegen/gdbus-codegen.in \
		${WRKSRC}/glib/gtester-report.in \
		${WRKSRC}/gobject/glib-genmarshal.in \
		${WRKSRC}/gobject/glib-mkenums.in
	@${REINPLACE_CMD} -e '/inotify_init1/d' \
		-e '/inotify.h/d' \
		${WRKSRC}/meson.build
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/gio/xdgmime/xdgmime.c \
		${WRKSRC}/glib/gutils.c \
		${WRKSRC}/glib/tests/utils.c

CODEGENDIR=	${PREFIX}/share/glib-2.0/codegen

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/GConf/gsettings
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/gio/modules
# generates .py[co] files for installed modules
# if that's not done, ${PYTHON_SITELIBDIR}/gps will be polluted
# with these files when module is imported from root user
	@${FIND} ${PREFIX} -name \*.pyc -delete
	(cd ${PREFIX} && \
	python${PYTHON_VER} ${PYTHON_LIBDIR}/compileall.py \
		-d ${CODEGENDIR} -f ${CODEGENDIR:S;${PREFIX}/;;} && \
	python${PYTHON_VER} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${CODEGENDIR} -f ${CODEGENDIR:S;${PREFIX}/;;})
	# install bash completion regardless if bash is present
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/bash-completion/completions
.for file in gapplication gdbus gio gresource gsettings
	${INSTALL_DATA} ${WRKSRC}/gio/completion/${file} \
		${STAGEDIR}${PREFIX}/share/bash-completion/completions/
.endfor
	-${RM} -r ${PREFIX}/libexec/installed-tests

.include <bsd.port.post.mk>
