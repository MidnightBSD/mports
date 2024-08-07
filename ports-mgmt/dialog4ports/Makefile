PORTNAME=	dialog4ports
PORTVERSION=	0.1.6
PORTREVISION?=	4
CATEGORIES=	ports-mgmt
MASTER_SITES=	https://files.etoilebsd.net/dialog4ports/ \
		http://mirror.shatow.net/freebsd/${PORTNAME}/ \
		http://files.etoilebsd.net/dialog4ports/:dialog \
		ftp://invisible-island.net/dialog/:dialog \
		http://mirror.shatow.net/freebsd/${PORTNAME}/:dialog

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Console Interface to configure ports
WWW=		https://bitbucket.org/m1cro/d4p/

LICENSE=	bsd2

USES=		uidfix

FAKE_OPTS+=	trueprefix
MAKE_ARGS+=	MAN1DIR=${PREFIX}/share/man/man1

# CCACHE has options, so may need d4p, make d4p not ccache friendly
# to avoid circular dependency
NO_CCACHE=	yes
MAKE_ENV+=	__MAKE_CONF=/dev/null SRCCONF=/dev/null

.if !defined(D4P_SLAVE)
PLIST_FILES=	bin/dialog4ports share/man/man1/${PORTNAME}.1.gz
.endif

.include <bsd.port.pre.mk>

.if defined(DEBUG_FLAGS)
MAKE_ARGS+=	DEBUG_FLAGS="${DEBUG_FLAGS}"
.endif

## This is used by 'make config' via Tools/scripts/dialog4ports.sh
## Use caution in changing
.if !exists(${DIALOG4PORTS})
DIALOG4PORTS=	${WRKSRC}/dialog4ports
.endif

.if defined(D4P_SLAVE)
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${DIALOGNAME}.tgz:dialog
DIALOGNAME=	dialog-1.1-20120706

MAKE_ENV+=	DIALOGSOURCES=${WRKDIR}/${DIALOGNAME}

do-configure:
	@cd ${WRKDIR}/${DIALOGNAME}; ./configure --build=${ARCH}-portbld-freebsd11.4

.endif

.include <bsd.port.post.mk>
