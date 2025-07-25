PORTNAME=	f2c
PORTVERSION=	20200916
CATEGORIES=	lang
MASTER_SITES=	NETLIB/f2c
DISTFILES=	${SIMPLEDIST} libf2c.zip src.tgz
DIST_SUBDIR=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fortran-to-C converter and its run-time libraries
WWW=		https://www.netlib.org/

LICENSE=	ATT
LICENSE_NAME=	Copyright of AT&T, Lucent Technologies and Bellcore
LICENSE_FILE=	${WRKSRC}/libf2c/Notice
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BROKEN_mips=		fails to compile: /usr/include/sigfpe.h: No such file or directory
BROKEN_mips64=		fails to compile: /usr/include/sigfpe.h: No such file or directory

USES=		gmake
USE_LDCONFIG=	yes

MAKE_JOBS_UNSAFE=	yes

LIBVER=		2
SIMPLEDIST=	changes f2c.1 f2c.1t f2c.h f2c.pdf fc getopt.c README

# Set FCNAME to the name of the Fortran 77 / F2C wrapper.
FCNAME?=	fc
PLIST_SUB=	FCNAME=${FCNAME} LIBVER=${LIBVER}

PORTDOCS=	README README_libf2c changes f2c.pdf

OPTIONS_DEFINE=	DOCS FC LEAD_0
OPTIONS_SUB=	yes

FC_DESC=	f77 script based on f2c
LEAD_0_DESC=	Print with leading zeros
LEAD_0_CFLAGS=	-DWANT_LEAD_0

do-extract:
	${MKDIR} ${WRKSRC}/libf2c
.for f in ${SIMPLEDIST}
	${CP} ${_DISTDIR}/${f} ${WRKSRC}
.endfor
	${UNZIP_NATIVE_CMD} ${_DISTDIR}/libf2c.zip -q -d ${WRKSRC}/libf2c
	(cd ${WRKSRC} && ${TAR} xfz ${_DISTDIR}/src.tgz)

pre-patch:
	${CP} -p ${WRKSRC}/libf2c/makefile.u ${WRKSRC}/libf2c/Makefile
	${CP} -p ${WRKSRC}/src/makefile.u ${WRKSRC}/src/Makefile

pre-configure:
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/fc
	${REINPLACE_CMD} -e 's|#CFLAGS = -O|CFLAGS = ${CFLAGS}|' ${WRKSRC}/src/Makefile
	${REINPLACE_CMD} 's|%%LIBVER%%|${LIBVER}|' ${WRKSRC}/libf2c/Makefile

do-build:
	@${ECHO_MSG} "===> Building f2c..."
	(cd ${WRKSRC}/src && ${DO_MAKE_BUILD} ${ALL_TARGET})
	@${ECHO_MSG} "===> Building libf2c..."
	(cd ${WRKSRC}/libf2c && ${DO_MAKE_BUILD} ${ALL_TARGET} libf2c.so)
	${MV} ${WRKSRC}/libf2c/libf2c.so ${WRKSRC}/libf2c/libf2c.so.${LIBVER}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/f2c ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/src/f2c.h ${PREFIX}/include
	${INSTALL_MAN} ${WRKSRC}/src/f2c.1t ${PREFIX}/share/man/man1/f2c.1
	${INSTALL_DATA} ${WRKSRC}/libf2c/libf2c.a ${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libf2c/libf2c.so.${LIBVER} ${PREFIX}/lib
	${LN} -sf libf2c.so.${LIBVER} ${PREFIX}/lib/libf2c.so

do-install-DOCS-on:
	${CP} ${WRKSRC}/libf2c/README ${WRKSRC}/README_libf2c
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

do-install-FC-on:
	${INSTALL_SCRIPT} ${WRKSRC}/fc ${FAKE_DESTDIR}${PREFIX}/bin/${FCNAME}

.include <bsd.port.mk>
