PORTNAME=	gettext-runtime
PORTREVISION=	1

COMMENT=	GNU gettext runtime libraries and programs

LICENSE=	lgpl2.1 gpl3
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1 =	${WRKSRC}/intl/COPYING.LIB
LICENSE_FILE_gpl3 =	${WRKSRC}/../COPYING

.include "${.CURDIR}/../gettext/Makefile.common"

# workaround for a weird bug with iconv
LIB_DEPENDS+=	libiconv.so:converters/libiconv

#MAKE_JOBS_UNSAFE=	yes

USES=		charsetfix cpe iconv libtool tar:xz
USE_LDCONFIG=	yes

CPE_PRODUCT=	gettext
CPE_VENDOR=	gnu

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-csharp --disable-java --with-included-gettext \
		ac_cv_lib_rt_sched_yield=no
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
WRKSRC_SUBDIR=	gettext-runtime

DATADIR=	${PREFIX}/share/gettext
DOCSDIR=	${PREFIX}/share/doc/gettext
#INFO=		autosprintf

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
