# New ports collection makefile for:	xmlrpc-c
# Date created:			Feb 26, 2008
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/xmlrpc-c/Makefile,v 1.8 2010/10/23 13:29:01 laffer1 Exp $
#

PORTNAME=	xmlrpc-c
PORTVERSION=	1.06.41
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/Xmlrpc-c%20Super%20Stable/${PORTVERSION}
EXTRACT_SUFX=	.tgz
#DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	XML-RPC library for C and C++
LICENSE=	agg

OPTIONS=	DEBUG "Compile with debugging information" off \
		CURL "Compile with curl support" on \
		LIBWWW "Compile with libwww support" off

CONFLICTS=	xmlrpc-epi-0.*

USE_GNOME=	gnometarget
USE_PERL5=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:env
GNU_CONFIGURE=	yes
MAKEFILE=	GNUmakefile
MAKE_ARGS=	LIBTOOL="${LIBTOOL}" \
		CFLAGS_COMMON="${CFLAGS}" \
		CXXFLAGS_COMMON="${CXXFLAGS}"
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.pre.mk>

.if !defined(WITH_DEBUG)
CFLAGS+=	-DNDEBUG
.endif

.if defined(WITHOUT_CURL)
CONFIGURE_ARGS+=	--disable-curl-client
.else
LIB_DEPENDS+=	curl.6:${PORTSDIR}/ftp/curl
OPT_CURL=	yes
.endif

.if defined(WITH_LIBWWW)
LIB_DEPENDS+=	wwwcore.1:${PORTSDIR}/www/libwww
OPT_LIBWWW=	yes
.else
CONFIGURE_ARGS+=	--disable-libwww-client
.endif

.if !defined(OPT_LIBWWW) && !defined(OPT_CURL)
PLIST_SUB+=	CLIENT="@comment "
.else
PLIST_SUB+=	CLIENT=""
.endif

post-extract:
	@${FIND} ${WRKSRC} -type l -name blddir | ${XARGS} ${RM}
	@${FIND} ${WRKSRC} -type l -name srcdir | ${XARGS} ${RM}

post-patch:
	@${GREP} -lR '\-lpthread' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -e \
		's|-lpthread|${PTHREAD_LIBS}|g'

.include <bsd.port.post.mk>
