# $MidnightBSD$
# $FreeBSD: head/devel/gettext-tools/Makefile 373636 2014-11-29 18:22:32Z tijl $

PORTNAME=	gettext-tools
PORTREVISION=	0

COMMENT=	GNU gettext development and translation tools

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/../COPYING

.include "${.CURDIR}/../gettext/Makefile.common"

WRKSRC= ${WRKDIR}/gettext-${PORTVERSION}/gettext-tools

LIB_DEPENDS=	libexpat.so:${PORTSDIR}/textproc/expat2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-csharp --disable-java --disable-openmp \
		--with-included-glib --with-included-libcroco \
		--with-included-libunistring --with-included-libxml \
		--without-emacs --without-git ac_cv_lib_rt_sched_yield=no
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USES=		charsetfix gettext-runtime iconv libtool tar:xz
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
INFO+=		gettext
.endif

CONFIGURE_ARGS+=--disable-threads

post-patch:
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} '/^SUBDIRS =/s/doc//' ${WRKSRC}/Makefile.in
.endif
# Exclude examples and gnulib-tests.
	@${REINPLACE_CMD} -E '/^SUBDIRS =/s/(examples|gnulib-tests)//g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} \
		'/^install-data-am:/s/install-examplesbuildauxDATA//' \
		${WRKSRC}/Makefile.in ${WRKSRC}/m4/Makefile.in
# Do not install html copies of manpages.
	@${REINPLACE_CMD} \
		-e '/^all-local:/s/html-local//' \
		-e '/^install-data-local:/s/install-html//' \
		-e '/^installdirs-local:/s/installdirs-html//' \
		${WRKSRC}/man/Makefile.in
# Do not patch system float.h.
	@${REINPLACE_CMD} 's/FLOAT_H=float\.h//' \
		${WRKSRC}/configure
# Use libintl installed by gettext-runtime.
	@${REINPLACE_CMD} '/^LDADD_no =/s,\.\./intl/libgnuintl.la,,' \
		${WRKSRC}/tests/Makefile.in
# Use libasprintf installed by gettext-runtime.
	@${REINPLACE_CMD} 's,[^ ]*libasprintf.la,-lasprintf,' \
		${WRKSRC}/tests/lang-c++

regression-test: build
	@(cd ${WRKSRC} && ${MAKE_CMD} check)

.include <bsd.port.mk>
