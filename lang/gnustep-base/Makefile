# $MidnightBSD$

PORTNAME=	gnustep-base
PORTVERSION=	1.24.8
CATEGORIES=	lang devel gnustep
MASTER_SITES=	GNUSTEP/core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library

LICENSE=	gpl3

LIB_DEPENDS+=	libffi.so:${PORTSDIR}/devel/libffi
LIB_DEPENDS+=	libxml2.so:${PORTSDIR}/textproc/libxml2
LIB_DEPENDS+=	libxslt.so:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS+=	libgmp.so:${PORTSDIR}/math/gmp
LIB_DEPENDS+=	libgnutls-openssl.so:${PORTSDIR}/security/gnutls
LIB_DEPENDS+=	libicuuc.so:${PORTSDIR}/devel/icu
LIB_DEPENDS+=	libgcrypt.so:${PORTSDIR}/security/libgcrypt

USE_AUTOTOOLS=	autoconf
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-procfs --disable-openssl --enable-tls \
		--disable-libdispatch \
		--with-tls-prefix=${LOCALBASE} TLS_CONFIG="pkg-config -gnutls" \
		--disable-mixedabi \
		--target=${ARCH}-portbld-freebsd9.1 \
		--host=${ARCH}-portbld-freebsd9.1
USE_GNUSTEP=  build
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
CONFIGURE_ENV+=		OBJCFLAGS='-fobjc-runtime=gnustep-1.7 -fblocks'
USES=		pkgconfig gnustep iconv


MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

PLIST_SUB+=	LOCALBASE=${LOCALBASE}
ETCDIR=		${LOCALBASE}/etc

PLIST_SUB+=	BASEVERSION=${PORTVERSION:C/[.][0-9]*$//1}

.include <bsd.port.pre.mk>

PATH:=	${PREFIX}/System/Tools:${PATH}

post-build:
.for i in ${MAKE_APPS}
	(cd ${WRKSRC}/${i}; . ${GNUSTEP_MAKEFILES}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${ALL_TARGET})
.endfor

post-extract:
	@${SED} -e "s=%%PREFIX%%=${LOCALBASE}=" \
		-e "s=%%LDCONFIG_GCC%%=${LDCONFIG_GCC}=" \
		${FILESDIR}/GNUstep.sh \
		> ${WRKSRC}/GNUstep.sh
	@${REINPLACE_CMD} -e "s|/usr/local/|${LOCALBASE}/|" \
		${WRKSRC}/configure

post-install:
	-@${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/rc.d
	${INSTALL_SCRIPT} ${WRKSRC}/GNUstep.sh ${FAKE_DESTDIR}${ETCDIR}/rc.d/GNUstep.sh
	${INSTALL_DATA} ${FILESDIR}/gdomap_if ${FAKE_DESTDIR}${ETCDIR}
.for i in ${INSTALL_APPS}
	(cd ${WRKSRC}/${i}; . ${GNUSTEP_MAKEFILES}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} -d ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
.endfor

.include <bsd.port.post.mk>
