PORTNAME=	gettext-runtime
PORTREVISION=	0

COMMENT=	GNU gettext runtime libraries and programs

LICENSE=	lgpl2.1 gpl3
LICENSE_COMB=	multi

.include "${.CURDIR}/../gettext/Makefile.common"

USES=		charsetfix cpe iconv libtool tar:xz
USE_LDCONFIG=	yes

CPE_PRODUCT=	gettext
CPE_VENDOR=	gnu

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-csharp --disable-java --with-included-gettext \
		ac_cv_lib_rt_sched_yield=no
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
WRKSRC_SUBDIR=	gettext-runtime

DATADIR=	${PREFIX}/share/gettext
DOCSDIR=	${PREFIX}/share/doc/gettext
INFO=		autosprintf

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
