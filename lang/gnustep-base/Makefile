# $MidnightBSD: mports/lang/gnustep-base/Makefile,v 1.13 2011/08/17 22:31:27 laffer1 Exp $
# $FreeBSD: ports/lang/gnustep-base/Makefile,v 1.80 2006/08/31 05:35:32 dinoex Exp $

PORTNAME=	gnustep-base
PORTVERSION=	1.19.3
CATEGORIES=	lang devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library
LICENSE=	gpl3

LIB_DEPENDS+=	xml2.5:${PORTSDIR}/textproc/libxml2 \
		xslt.2:${PORTSDIR}/textproc/libxslt \
		gmp.10:${PORTSDIR}/math/gmp \
		gnutls.42:${PORTSDIR}/security/gnutls
BUILD_DEPENDS+=	pkg-config:${PORTSDIR}/devel/pkg-config

USE_AUTOTOOLS=	autoconf
GNU_CONFIGURE=	yes
#CFLAGS+=      -rpath=/usr/local/lib:/usr/lib
CONFIGURE_ARGS=	--disable-procfs --disable-openssl --enable-tls \
		--with-tls-prefix=${LOCALBASE} TLS_CONFIG="pkg-config -gnutls"
USE_GNUSTEP=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
USE_ICONV=	yes

MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
CFLAGS+=	-I${LOCALBASE}/include/libxml2/libxml -DHAVE_DLADDR=1
.if defined(GNUSTEP_WITH_LIBOBJC2)
CFLAGS+=	-I${GNUSTEP_SYSTEM_ROOT}/Library/Headers -DOBJC2RUNTIME=1
.endif

#BREAKS_IF_PEDANTIC=	yes
PLIST_SUB+=	LOCALBASE=${LOCALBASE}
ETCDIR=		${LOCALBASE}/etc

.if !defined(WITHOUT_GNUSTEP_FAKEMAIN)
CONFIGURE_ARGS+=	--enable-fake-main
.endif

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
