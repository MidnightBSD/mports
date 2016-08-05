# $MidnightBSD$
# $FreeBSD: ports/databases/gnats4/Makefile,v 1.11 2006/01/28 02:11:06 linimon Exp $

PORTNAME=	gnats
PORTVERSION=	4.1.0
PORTREVISION=	1
CATEGORIES=	databases devel
MASTER_SITES=	GNU
PKGNAMESUFFIX=	4
MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNATS, the GNU Problem Report Management System

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USES=		cpe gmake makeinfo
USE_GCC=	any
USERS=		gnats
CPE_VENDOR=	gnu

PKGMESSAGE=	${WRKDIR}/pkg-message
PKGINSTALL=	${WRKDIR}/pkg-install

GNATSDBDIR?=		/var/db/gnats

CONFIGURE_ARGS+=	--sharedstatedir=${GNATSDBDIR}

.ifdef WITH_SUBMITTER_ID
CONFIGURE_ARGS+=	--with-submitter=${WITH_SUBMITTER_ID}
.endif

.ifdef WITH_ORGANIZATION
CONFIGURE_ARGS+=	--with-organization=${WITH_ORGANIZATION:Q}
.endif

.ifdef WITH_GNATSD_SERVICE
CONFIGURE_ARGS+=	--with-gnats-service=${WITH_GNATSD_SERVICE}
.endif

PLIST_SUB=		GNATSDBDIR=${GNATSDBDIR}

MAN1=			edit-pr.1 query-pr.1 send-pr.1
MAN5=			databases.5 dbconfig.5
MAN7=			gnats.7
MAN8=			delete-pr.8 getclose.8 file-pr.8 gen-index.8 gnatsd.8 \
			install-sid.8 mkcat.8 mkdb.8 pr-edit.8 queue-pr.8 rmcat.8
INFO=			gnats-faq gnats
DOCFILES=		NEWS UPGRADING

.ifdef WITH_EMACS_PORT
USE_EMACS=	yes
EMACS_PORT_NAME=	${WITH_EMACS_PORT}
CONFIGURE_ARGS+=	--with-lispdir=${LOCALBASE}/${EMACS_SITE_LISPDIR}
.else
PLIST_SUB+=		EMACS_SITE_LISPDIR="@comment "
.endif

.ifdef CLIENT_ONLY
ALL_TARGET=		all-tools
INSTALL_TARGET=		install-tools
PLIST_SUB+=		SERVER="@comment "
PKGNAMESUFFIX=		-client
CONFLICTS+=		${PKGNAMEPREFIX}${PORTNAME}-4.*
.else
PLIST_SUB+=		SERVER=""
CONFLICTS+=		${PKGNAMEPREFIX}${PORTNAME}-client-4.*
.endif

pre-everything::
.if !defined(PACKAGE_BUILDING) && !defined(WANT_FREEFALL_CFG)
	@${ECHO} "============================================================="
	@${ECHO}
	@${ECHO} "You can build ${PKGNAME} with the following options:"
	@${ECHO}
	@${ECHO} "WITH_SUBMITTER_ID=unknown        default submitter-id"
	@${ECHO} "WITH_ORGANIZATION='unknown'      default organization"
	@${ECHO} "WITH_GNATSD_SERVICE=support      default gnatsd port name"
	@${ECHO} "WITH_EMACS_PORT=emacs            with Emacs support"
	@${ECHO}
	@${ECHO} "============================================================="
	@${ECHO}
.endif

pre-configure:
	@${ECHO_CMD} 'RELEASE_TAG="\`uname -srm\`"' > ${WRKSRC}/release-info

post-build:
	@for doc in pkg-message pkg-install; do \
		${SED} -e 's,%%PREFIX%%,${PREFIX},g' \
			-e 's,%%GNATSDBDIR%%,${GNATSDBDIR},g' \
			${PKGDIR}/$${doc} >${WRKDIR}/$${doc} ; \
	done

pre-install:
	@${MKDIR} ${PREFIX}/libexec/gnats
	@${SETENV} "PKG_PREFIX=${PREFIX}" ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
.ifndef CLIENT_ONLY
	@for conf in databases gnatsd.host_access; do \
		[ -f ${PREFIX}/etc/gnats/$${conf} ] \
		|| ${CP} ${PREFIX}/etc/gnats/$${conf}.default ${PREFIX}/etc/gnats/$${conf}; \
	done
.endif
.ifndef NOPORTDOCS
	@${MKDIR} ${DOCSDIR}
	@for doc in ${DOCFILES}; do \
		${INSTALL_DATA} ${WRKSRC}/$${doc} ${DOCSDIR}; \
	done
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
