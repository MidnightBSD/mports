PORTNAME=	gawk
PORTVERSION=	5.3.1
CATEGORIES=	lang
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of AWK scripting language
WWW=		https://www.gnu.org/software/gawk/gawk.html

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS_INSTALL=	ja-gawk # bin/gawk

OPTIONS_DEFINE=		NLS MPFR
OPTIONS_SUB=		yes
NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls
MPFR_DESC?=		Support multiple-precision floating-point computation
MPFR_LIB_DEPENDS=	libgmp.so:math/gmp libmpfr.so:math/mpfr
MPFR_CONFIGURE_OFF=	--without-gmp --without-mpfr

INFO=		gawk gawkinet gawkworkflow pm-gawk

USES=		gmake iconv libtool readline tar:lz
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG} \
		--with-libintl-prefix=${LOCALBASE} \
		AWK=${AWK}
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

PLIST_SUB+=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
