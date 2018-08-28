# $MidnightBSD$

PORTNAME=	coreutils
PORTVERSION=	8.28
PORTREVISION=	0
CATEGORIES=	sysutils textproc
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Software Foundation's core utilities

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	id-utils-[0-9]* linux-gid-[0-9]*

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
# A rather nasty hack to stop gnustat from conflicting with base gstat
CONFIGURE_ARGS=	--program-prefix=g	\
		--program-transform-name=s/stat/nustat/
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib" FORCE_UNSAFE_CONFIGURE=1
CPPFLAGS+=	"-I${LOCALBASE}/include"

USES=		cpe gmake iconv charsetfix tar:xz
USE_PERL5_BUILD=	yes # build - required for tests and man page generation
USE_LDCONFIG=	yes

CPE_VENDOR=	gnu

INFO=		coreutils

OPTIONS_DEFINE=	GMP NLS
OPTIONS_DEFAULT=NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=   nls
GMP_LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp
GMP_CONFIGURE_WITH=	gmp

.include <bsd.mport.options.mk>

post-build:
	@${REINPLACE_CMD} -e "s/ lib / /g" ${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/g* \
		${PREFIX}/libexec/coreutils/libstdbuf.so

#regression-test: build
#	(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${GMAKE} check)

.include <bsd.port.mk>
