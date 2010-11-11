# New ports collection makefile for:	memcached
# Date created:		July 31, 2008
# Whom:			Lucas Holt <Luke@MidnightBSD.org>
#
# $MidnightBSD: mports/databases/memcached/Makefile,v 1.6 2009/12/31 23:30:44 laffer1 Exp $
#

PORTNAME=	memcached
PORTVERSION=	1.4.5
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance distributed memory object cache system
LICENSE=	bsd3

LIB_DEPENDS=	event-1.3e:${PORTSDIR}/devel/libevent

USE_RC_SUBR=	memcached
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=		--with-libevent=${LOCALBASE} --program-prefix=
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

OPTIONS=	REPCACHED	"Enable data replication feature"	off \
		SASL		"Enable SASL support"			off

MAN1=		memcached.1

PLIST_FILES=	bin/memcached \
		bin/memcached-tool

PORTDOCS=	protocol.txt threads.txt readme.txt

.include <bsd.port.pre.mk>

.if defined(WITH_REPCACHED)
# WWW: http://repcached.lab.klab.org/
PATCH_SITES+=		${MASTER_SITE_FREEBSD_LOCAL}
PATCH_SITE_SUBDIR=	mm
PATCH_DIST_STRIP+=	-p1
PATCHFILES+=		repcached-2.2-${PORTVERSION}.patch.gz
CONFIGURE_ARGS+=	--enable-replication
.endif

.if defined(WITH_SASL) && !defined(WITHOUT_SASL)
LIB_DEPENDS+=		sasl2.2:${PORTSDIR}/security/cyrus-sasl2
CONFIGURE_ARGS+=	--enable-sasl
CFLAGS+=		-I${LOCALBASE}/include
CPPFLAGS=		${CFLAGS}
LDFLAGS+=		-L${LOCALBASE}/lib
CONFIGURE_ENV+=		CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
.else
CONFIGURE_ARGS+=	--disable-sasl
.endif

post-configure:
	@${REINPLACE_CMD} -e 's#doc/memcached.1##' ${WRKSRC}/Makefile

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/memcached-tool ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/${MAN1} ${MAN1PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${DOCSDIR}
.endfor
.endif

test:
	${MAKE} -C ${WRKSRC} test

.include <bsd.port.post.mk>
