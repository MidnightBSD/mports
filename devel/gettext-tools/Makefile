PORTNAME=	gettext-tools
PORTREVISION=	0

COMMENT=	GNU gettext development and translation tools
WWW=		https://www.gnu.org/software/gettext/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/../COPYING

.include "${.CURDIR}/../gettext/Makefile.common"

BUILD_DEPENDS=	libtextstyle>=${PORTVERSION}:devel/libtextstyle
LIB_DEPENDS=	libtextstyle.so:devel/libtextstyle

USES=		charsetfix cpe gettext-runtime iconv libtool localbase tar:xz
USE_LDCONFIG=	yes

CPE_PRODUCT=	gettext
CPE_VENDOR=	gnu

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--disable-csharp --disable-java --disable-openmp \
		--with-included-glib --with-included-libcroco \
		--with-included-libunistring --with-included-libxml \
		--without-emacs --without-git ac_cv_lib_rt_sched_yield=no
INSTALL_TARGET=	install-strip
WRKSRC_SUBDIR=	gettext-tools
NO_TEST=	yes

DATADIR=	${PREFIX}/share/gettext
DOCSDIR=	${PREFIX}/share/doc/gettext
PLIST_SUB=	PORTVERSION=${PORTVERSION} VERSION=${PORTVERSION}

INFO=		gettext

OPTIONS_DEFINE=	DOCS EXAMPLES THREADS
OPTIONS_DEFAULT=THREADS
OPTIONS_EXCLUDE_DragonFly=	THREADS

THREADS_CONFIGURE_ENABLE=	threads

post-patch:
# Do not patch system float.h.
	@${REINPLACE_CMD} 's/FLOAT_H=float\.h//' \
		${WRKSRC}/configure
# Use libintl installed by gettext-runtime.
	@${REINPLACE_CMD} '/^LDADD_no =/s,\.\./intl/libgnuintl.la,,' \
		${WRKSRC}/tests/Makefile.in
# Use libasprintf installed by gettext-runtime.
	@${REINPLACE_CMD} 's,[^ ]*libasprintf.la,-lasprintf,' \
		${WRKSRC}/tests/lang-c++
# Use system libtextstyle.
	@${REINPLACE_CMD} \
		-e '/:/!s,[[:<:]]textstyle[^[:space:]]*\.h,,g' \
		-e 's,\.\./\.\./libtextstyle/lib/libtextstyle\.la,-ltextstyle,' \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
