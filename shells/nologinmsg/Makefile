
#
# The port is self contained in the src directory

PORTNAME=	nologinmsg
PORTVERSION=	1.0
CATEGORIES=	shells sysutils
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	More functional native binary replacement for /sbin/nologin

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		uidfix

do-extract:
	@${MKDIR} ${WRKSRC}
.for i in Makefile nologinmsg.c nologinmsg.8 pathnames.h
	@${CP} ${FILESDIR}/${i} ${WRKSRC}
.endfor

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/nologinmsg.8 \
		${WRKSRC}/pathnames.h

pre-install:
	${MKDIR} ${PREFIX}/etc/nologinmsgs

post-install:
	${STRIP_CMD} ${PREFIX}/bin/nologinmsg

.include <bsd.port.mk>
