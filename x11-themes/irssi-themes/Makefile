PORTNAME=	irssi-themes
PORTVERSION=	2016082001
CATEGORIES=	x11-themes irc
MASTER_SITES=	https://irssi-import.github.io/themes/ \
		FREEBSD_LOCAL/ehaupt/${PORTNAME}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of additional irssi themes

LICENSE=	unknown

RUN_DEPENDS=	irssi:irc/irssi

NO_ARCH=	yes
NO_BUILD=	yes
PLIST=		${WRKDIR}/pkg-plist

THEMESDIR_REL=	share/irssi/themes

.include <bsd.port.pre.mk>
.include "${MASTERDIR}/Makefile.inc"

pre-install:
.for f in ${DISTFILES}
	@${ECHO_CMD} "${THEMESDIR_REL}/${f}" >> ${PLIST}
.endfor

do-extract:
	@${MKDIR} ${WRKSRC}
.for f in ${DISTFILES}
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${f} ${WRKSRC}
.endfor

do-install:
	@${MKDIR} ${PREFIX}/${THEMESDIR_REL}
.for f in ${DISTFILES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${THEMESDIR_REL}/
.endfor

.include <bsd.port.post.mk>
