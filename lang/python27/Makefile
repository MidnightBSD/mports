PORTNAME=	python27
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	2
CATEGORIES=	lang python ipv6
MASTER_SITES=	PYTHON/ftp/python/${PORTVERSION}
DISTNAME=	Python-${PORTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interpreted object-oriented programming language

LICENSE=	python

USES=		cpe ncurses pkgconfig readline ssl tar:xz
CONFIGURE_ENV=	SVNVERSION="echo midnightbsd"
CONFIGURE_TARGET= --build=${ARCH}-portbld-midnightbsd${OSREL} \
		  --host=${ARCH}-portbld-midnightbsd${OSREL} \
		  --target=${ARCH}-portbld-midnightbsd${OSREL}
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CPE_VENDOR=	python
CPE_PRODUCT=	${CPE_VENDOR}
CPE_VERSION=	${PORTVERSION}

CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ENV+=		ac_cv_opt_olimit_ok=no OPT=""				# Null out OPT to respect user CFLAGS and remove optimizations

INSTALL_TARGET=		altinstall						# Don't want cloberring of unprefixed files
#MAKE_ARGS+=		INSTALL_SHARED="${INSTALL_LIB}"				# Strip shared library
MAKE_ARGS+=		LIBPC="${PREFIX}/libdata/pkgconfig"			# Until pathfix gets support for files other than Makefile.in
MAKE_JOBS_UNSAFE=	yes							# Parser/pgen build bug. See Issue: 200622, 201974

OSMAJOR=	${OSREL:C/([0-9]*).*/\1/}

PLIST_SUB=		ABI=${ABIFLAGS} \
			PORTVERSION=${PORTVERSION} \
			OSMAJOR=${OSMAJOR}		# For plat-freebsd* in pkg-plist. http://bugs.python.org/issue19554

OPTIONS_DEFINE=		DEBUG IPV6 LIBFFI PYMALLOC SEM THREADS
OPTIONS_DEFAULT=	IPV6 LIBFFI PYMALLOC SEM THREADS UCS4
OPTIONS_SINGLE=		UNICODE
OPTIONS_SINGLE_UNICODE=	UCS2 UCS4
OPTIONS_SUB=		yes

LIBFFI_DESC=	Use libffi from ports instead of bundled version
UCS2_DESC=	Enable UCS2 Unicode Strings
UCS4_DESC=	Enable UCS4 Unicode Strings
PYMALLOC_DESC=	Enable specialized mallocs

DEBUG_CONFIGURE_WITH=	pydebug
IPV6_CONFIGURE_ENABLE=	ipv6
LIBFFI_CONFIGURE_ON=	--with-system-ffi
LIBFFI_LIB_DEPENDS=	libffi.so:devel/libffi

# Use CPPFLAGS over CFLAGS due to -I ordering, causing elementtree and pyexpat
# to break in Python 2.7, or preprocessor complaints in Python >= 3.3
# Upstream Issue: http://bugs.python.org/issue6299
USES+=		gettext
CPPFLAGS+=		-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib -lintl

PYMALLOC_CONFIGURE_WITH=	pymalloc

THREADS_CONFIGURE_WITH=	threads
THREADS_LDFLAGS=	-lpthread

UCS2_CONFIGURE_ON=	--enable-unicode=ucs2
UCS4_CONFIGURE_ON=	--enable-unicode=ucs4

.include "${.CURDIR}/Makefile.version"
.include <bsd.mport.options.mk>

# https://bugs.python.org/issue22521
# https://bugs.python.org/issue23042
.if !${PORT_OPTIONS:MLIBFFI} && ${ARCH} == i386
BROKEN=	You must use libffi from ports on i386. Enable the LIBFFI option
.endif

.if ${ARCH} == i386
PLIST_SUB+=	X86_ONLY=""
.else
PLIST_SUB+=	X86_ONLY="@comment "
.endif

.if ${ARCH} == amd64
PLIST_SUB+=	32BIT_ONLY="@comment "
.else
PLIST_SUB+=	32BIT_ONLY=""
.endif

.if !exists(/usr/bin/ypcat) || defined(WITHOUT_NIS)
PLIST_SUB+=	NO_NIS="@comment "
.else
PLIST_SUB+=	NO_NIS=""
.endif

post-patch:
	${CP} -r ${WRKSRC}/Lib/plat-freebsd8 \
		${WRKSRC}/Lib/plat-midnightbsd0
	@${REINPLACE_CMD} -e \
		's,/usr/doc/python-docs-,${PREFIX}/share/doc/python,g' \
		${PATCH_WRKSRC}/Lib/pydoc.py
.if ${PORT_OPTIONS:MSEM}
	@# do not use SEM_EXTRA_PATCHES here, since patch-setup.py overlaps with this one
	cd ${WRKSRC} && ${PATCH} ${PATCH_ARGS} < ${PATCHDIR}/extra-patch-setup.py
.endif

.if !exists(/usr/bin/ypcat) || defined(WITHOUT_NIS)
	@${REINPLACE_CMD} -e 's/disabled_module_list =[^]]*/&, "nis"/' \
		${WRKSRC}/setup.py
.endif

post-install:
	for i in ${PREFIX}/lib/python2.7/lib-dynload/*.so; do \
		${STRIP_CMD} $$i; done						# Strip shared extensions
# This code block exists for the qemu-user enabled cross build environment.
# When using this environment in poudriere, CC is not set to the default
# of /usr/bin/cc and a cross-compile toolchain is used.  We need to hand
# edit this so that the run time configuration for python matches what the
# FreeBSD base system provides.  sbruno 02Aug2017
.if ${CC} == /nxb-bin/usr/bin/cc
	@${REINPLACE_CMD} -e 's=/nxb-bin==' \
		${STAGEDIR}${PREFIX}/lib/python2.7/_sysconfigdata.py
	@cd ${WRKSRC} && ${SETENV} LD_LIBRARY_PATH=${WRKSRC} \
		./python -E -m compileall -d ${PREFIX}/lib/python2.7 \
		${STAGEDIR}${PREFIX}/lib/python2.7/_sysconfigdata.py
	@cd ${WRKSRC} && ${SETENV} LD_LIBRARY_PATH=${WRKSRC} \
		./python -E -O -m compileall -d ${PREFIX}/lib/python2.7 \
		${STAGEDIR}${PREFIX}/lib/python2.7/_sysconfigdata.py
	@${REINPLACE_CMD} -e 's=/nxb-bin==' \
		${STAGEDIR}${PREFIX}/lib/python2.7/config/Makefile
.endif
	${INSTALL_DATA} ${WRKSRC}/Tools/gdb/libpython.py \
		${STAGEDIR}${PREFIX}/lib/libpython2.7.so.1-gdb.py

regression-test: build
	@cd ${WRKSRC} && ${MAKE} TESTOPTS=-j${MAKE_JOBS_NUMBER} buildbottest

.include <bsd.port.mk>
