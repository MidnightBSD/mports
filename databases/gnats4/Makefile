PORTNAME=	gnats
PORTVERSION=	4.1.0
PORTREVISION=	5
CATEGORIES=	databases devel
MASTER_SITES=	GNU
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNATS, the GNU Problem Report Management System
WWW=		https://www.gnu.org/software/gnats/

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USES=		cpe gmake makeinfo
USE_GCC=	yes
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

PLIST_SUB=	GNATSDBDIR=${GNATSDBDIR}
INFO=		gnats-faq gnats
PORTDOCS=	NEWS UPGRADING

OPTIONS_DEFINE=	DOCS EMACS SERVER
OPTIONS_DEFAULT=SERVER
OPTIONS_SUB=	yes
EMACS_USES=	emacs
EMACS_DESC=	Install Emacs Lisp support file
EMACS_VARS=	EMACS_NO_DEPENDS=yes
SERVER_DESC=	Install the gnats server too

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MSERVER}
ALL_TARGET=	all-tools
INSTALL_TARGET=	install-tools
.endif

.if ${PORT_OPTIONS:MEMACS}
CONFIGURE_ARGS+=--with-lispdir=${LOCALBASE}/${EMACS_SITE_LISPDIR}
.else
PLIST_SUB+=	EMACS_SITE_LISPDIR="@comment "
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
			${PKGDIR}/$${doc} >${WRKDIR}/$${doc}; \
	done

pre-install:
	@${MKDIR} ${PREFIX}/libexec/gnats
	${MKDIR} ${PREFIX}/info

post-install:
.if ${PORT_OPTIONS:MSERVER}
	${MV} ${ETCDIR}/databases.default \
		${ETCDIR}/databases.sample
	${MV} ${ETCDIR}/gnatsd.host_access.default \
		${ETCDIR}/gnatsd.host_access.sample
.endif
	@${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR})

.include <bsd.port.mk>
