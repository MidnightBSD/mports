# $MidnightBSD$

PORTNAME=	gtar
PORTVERSION=	1.29
CATEGORIES=	archivers sysutils
MASTER_SITES=	GNU
MASTER_SITE_SUBDIR=	tar
DISTFILES=	tar-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tape archiver

LICENSE=	gpl3

WRKSRC=		${WRKDIR}/tar-${PORTVERSION}

# only force dependencies for compressors that have a single-letter option
#RUN_DEPENDS=	# see below

INFO=		tar

USES=		charsetfix cpe iconv:${STATIC_ARGS} makeinfo tar:xz
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

OPTIONS_DEFINE=	NLS STATIC
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime:${STATIC_ARGS}
NLS_CONFIGURE_ENABLE=	nls

STATIC_LDFLAGS=	-static
STATIC_CONFIGURE_ENV=	SHLIBEXT=""

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSTATIC}
STATIC_ARGS=	build
.else
STATIC_ARGS=	lib
.endif

# Tests 161 163 are known to fail because path resolution of ".."
# in a removed directory fails.

# do not rebuild tar.info
post-patch:
	${TOUCH} -r ${WRKSRC}/doc/stamp-vti ${WRKSRC}/configure

.include <bsd.port.mk>
