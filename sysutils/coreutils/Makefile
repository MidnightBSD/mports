PORTNAME=	coreutils
PORTVERSION=	9.5
PORTREVISION=	0
CATEGORIES=	sysutils textproc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Software Foundation's core utilities
WWW=		https://www.gnu.org/software/coreutils/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	id-utils-[0-9]* linux-gid-[0-9]*

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
# A rather nasty hack to stop gnustat from conflicting with base gstat
CONFIGURE_ARGS=	--program-prefix=g	\
		--program-transform-name=s/stat/nustat/
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib" FORCE_UNSAFE_CONFIGURE=1
CPPFLAGS+=	"-I${LOCALBASE}/include"

CONFLICTS_INSTALL=	gdu geneweb gexpr rubygem-god # bin/gdu bin/gexpr bin/god bin/gwc

USES=		cpe gmake iconv charsetfix tar:xz
USE_PERL5_BUILD=	yes # build - required for tests and man page generation
USE_LDCONFIG=	yes
PIE_UNSAFE=	yes

CPE_VENDOR=	gnu

INFO=		coreutils

OPTIONS_DEFINE=	GMP NLS
OPTIONS_DEFAULT=NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=   nls
GMP_LIB_DEPENDS=	libgmp.so:math/gmp
GMP_CONFIGURE_WITH=	libgmp

NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
CONFIGURE_ARGS+= --disable-year2038
.endif

post-build:
	@${REINPLACE_CMD} -e "s/ lib / /g" ${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/g* \
		${PREFIX}/libexec/coreutils/libstdbuf.so

#regression-test: build
#	(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${GMAKE} check)

.include <bsd.port.mk>
