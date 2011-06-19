# $MidnightBSD: mports/lang/gnustep-base/Makefile,v 1.11 2011/02/02 21:06:52 laffer1 Exp $
# $FreeBSD: ports/lang/gnustep-base/Makefile,v 1.80 2006/08/31 05:35:32 dinoex Exp $

PORTNAME=	gnustep-base
PORTVERSION=	1.19.3
CATEGORIES=	lang devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library
LICENSE=	gpl3

LIB_DEPENDS+=	xml2.5:${PORTSDIR}/textproc/libxml2
LIB_DEPENDS+=	xslt.2:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS+=	gmp.10:${PORTSDIR}/math/gmp

ETCDIR=		${LOCALBASE}/etc
USE_AUTOTOOLS=	autoconf
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-procfs --with-config-file=${PREFIX}/GNUstep.conf
CFLAGS+=	-rpath=/usr/local/lib:/usr/lib
CONFIGURE_TARGET= ${ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_ICONV=	yes
MAKEFILE=
MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
CFLAGS+=	-I${LOCALBASE}/include/libxml2/libxml
BREAKS_IF_PEDANTIC=	yes
PLIST_SUB+=	LOCALBASE=${LOCALBASE}

#WITHOUT_OPENSSL=	yes
.if defined(WITHOUT_OPENSSL)
CONFIGURE_ARGS+=	--disable-openssl
PLIST_SUB+=	OPENSSL="@comment "
.else
USE_OPENSSL=	yes
PLIST_SUB+=	OPENSSL=""
MAKE_APPS=	SSL
INSTALL_APPS=	SSL
.endif

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

post-install:
	-@${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/rc.d
	${INSTALL_SCRIPT} ${WRKSRC}/GNUstep.sh ${FAKE_DESTDIR}${ETCDIR}/rc.d/GNUstep.sh
	${INSTALL_DATA} ${FILESDIR}/gdomap_if ${FAKE_DESTDIR}${ETCDIR}
.for i in ${INSTALL_APPS}
	(cd ${WRKSRC}/${i}; . ${GNUSTEP_MAKEFILES}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} -d ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
.endfor
	${RM} ${PREFIX}/System/Library/Libraries/libgnustep-base.so
	${LN} -s libgnustep-base.so.${PORTVERSION} \
	 ${PREFIX}/System/Library/Libraries/libgnustep-base.so

test:
	@(cd ${WRKSRC}/Testing && . ${GNUSTEP_MAKEFILES}/GNUstep.sh; ${GMAKE})

regression-test:	test

.include <bsd.port.post.mk>
