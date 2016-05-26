# $MidnightBSD$

PORTNAME=	gawk
PORTVERSION=	4.1.3
CATEGORIES=	lang
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of Awk

LICENSE=	gpl3

LIB_DEPENDS=	libsigsegv.so:${PORTSDIR}/devel/libsigsegv

OPTIONS_DEFINE=		NLS MPFR
OPTIONS_SUB=		yes
NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls
MPFR_DESC?=		Support multiple-precision floating-point computation
MPFR_LIB_DEPENDS=	libmpfr.so:${PORTSDIR}/math/mpfr
MPFR_CONFIGURE_OFF=	--without-gmp --without-mpfr

INFO=		gawk gawkinet

GNU_CONFIGURE=	yes
USES=		iconv libtool makeinfo tar:xz
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG} \
		--with-libintl-prefix=${LOCALBASE} \
		AWK=${AWK}

PLIST_SUB+=	VERSION=${PORTVERSION}

post-patch:
	@${RM} -f ${WRKSRC}/doc/*.info
	@${REINPLACE_CMD} -e 's/ -export-dynamic/ -Wl,--export-dynamic/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
