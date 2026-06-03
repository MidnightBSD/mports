PORTNAME=	gtar
PORTVERSION=	1.35
CATEGORIES=	archivers sysutils
MASTER_SITES=	GNU
MASTER_SITE_SUBDIR=	tar
DISTNAME=	tar-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tape archiver
WWW=		https://www.gnu.org/software/tar/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		charsetfix cpe iconv:${STATIC_ARGS} localbase tar:xz

# only force dependencies for compressors that have a single-letter option
#RUN_DEPENDS=	# see below

CPE_VENDOR=	gnu
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g \
		--disable-silent-rules
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	DEFAULT_ARCHIVE=/dev/sa0 \
		DEFAULT_RMT_COMMAND=/etc/rmt
# supply result to skip a test that will abort configure if run as root
CONFIGURE_ENV+=	gl_cv_func_mknod_works=yes

INFO=		tar

OPTIONS_DEFINE=	NLS STATIC
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime:${STATIC_ARGS}
NLS_CONFIGURE_ENABLE=	nls

STATIC_LDFLAGS=	-static
STATIC_CONFIGURE_ENV=	SHLIBEXT=""

STATIC_VARS=	STATIC_ARGS=build
STATIC_VARS_OFF=	STATIC_ARGS=lib

.if ${ARCH:U} == i386
CONFIGURE_ARGS+=	--disable-year2038
.endif

NO_TEST=	yes

.include <bsd.port.mk>
