# $MidnightBSD: mports/ports-mgmt/dialog4ports/Makefile,v 1.2 2013/06/12 00:29:17 laffer1 Exp $

PORTNAME=	dialog4ports
PORTVERSION=	0.1.5
CATEGORIES=	ports-mgmt
MASTER_SITES=	http://m1cro.tk/dialog4ports/ \
		http://files.etoilebsd.net/dialog4ports/ \
		http://mirror.shatow.net/freebsd/${PORTNAME}/ \
		http://m1cro.tk/dialog4ports/:dialog \
		http://files.etoilebsd.net/dialog4ports/:dialog \
		ftp://invisible-island.net/dialog/:dialog \
		http://mirror.shatow.net/freebsd/${PORTNAME}/:dialog

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Console Interface to configure ports
LICENSE=	bsd2

# CCACHE has options, so may need d4p, make d4p not ccache friendly
# to avoid circular dependency
NO_CCACHE=	yes
MANCOMPRESSED=	yes
MAN1=		${PORTNAME}.1
MAKE_ENV+=	__MAKE_CONF=/dev/null SRCCONF=/dev/null

PLIST_FILES=	bin/dialog4ports

MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

MAKE_ARGS+=	DEBUG_FLAGS="${DEBUG_FLAGS}"

## This is used by 'make config' via Tools/scripts/dialog4ports.sh
## Use caution in changing
.if !exists(${DIALOG4PORTS})
DIALOG4PORTS=	${WRKSRC}/dialog4ports
.endif

.if ${OSVERSION} < 4016
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX} \
		${DIALOGNAME}.tgz:dialog
DIALOGNAME=	dialog-1.1-20120706

MAKE_ENV+=	DIALOGSOURCES=${WRKDIR}/${DIALOGNAME}

do-configure:
	@cd ${WRKDIR}/${DIALOGNAME}; ./configure --build=${ARCH}-portbld-freebsd7.0

.endif

.include <bsd.port.post.mk>
