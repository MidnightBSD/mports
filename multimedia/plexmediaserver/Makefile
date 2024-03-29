PORTNAME=	plexmediaserver
PORTVERSION?=	1.3.3.3148
PORTREVISION?=	0
CATEGORIES=	multimedia
MASTER_SITES=	https://downloads.plex.tv/plex-media-server/${PORTVERSION}-${PLEX_BUILD}/
DISTNAME=	PlexMediaServer-${PORTVERSION}-${PLEX_BUILD}-freebsd-${ARCH}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Plex Media Server component

LICENSE=	other

USES=		cpe tar:bzip2
PLEX_BUILD?=	b38628e
NO_BUILD=	yes
WRKSRC=	${WRKDIR}/PlexMediaServer-${PORTVERSION}-${PLEX_BUILD}

CPE_VENDOR=	plex
CPE_PRODUCT=	media_server
CPE_VERSION=	${PORTVERSION:R}

USE_RC_SUBR?=	${PORTNAME}

SUB_FILES=	pkg-message
SUB_LIST?=	PORTNAME=${PORTNAME} DATADIR=${DATADIR} USERS=${USERS} GROUPS=${GROUPS}
PLIST_SUB+=	PLEX_BUILD=${PLEX_BUILD}

USERS=	plex
GROUPS=	${USERS}
BUNDLE_LIBS=	yes

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	binary-only program, source code not available

.include <bsd.port.pre.mk>

post-patch:
	# binaries don't come pre-stripped
	${FIND} ${WRKSRC}/Resources -name '*.so' -exec ${STRIP_CMD} {} \+
	${FIND} ${WRKSRC} ${WRKSRC}/Resources -name 'Plex*' -depth 1 -exec ${STRIP_CMD} {} \+
	${FIND} ${WRKSRC} -depth 1 -name 'lib*' -exec ${STRIP_CMD} {} \+
	${RM} ${WRKSRC}/start.sh
	# Older verisons of Plex we have to create a symlink
	# Newer versions of Plex ship a duplicate file; we'll just symlink
	${RM} ${WRKSRC}/libpython2.7.so

do-fake:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}/${DATADIR})
	# Python fix for older releases of Plex
	(cd ${FAKE_DESTDIR}${DATADIR} && ${LN} -sf libpython2.7.so.1 libpython2.7.so)
	# Workaround for space in binary name
	(cd ${FAKE_DESTDIR}${DATADIR} && ${LN} -sf Plex\ Media\ Server Plex_Media_Server)

.include <bsd.port.post.mk>
