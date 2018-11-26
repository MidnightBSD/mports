# $MidnightBSD$

PORTNAME=	data
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://www.ijs.si/~lesi/distfiles/doom/ \
		http://distfiles.officialunix.com/
PKGNAMEPREFIX=	${DMPKGNAMEPREFIX}
EXTRACT_SUFX=	.bz2
DISTFILES=	#
DIST_SUBDIR=	${PKGNAMEPREFIX}${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Doom data files (Doom, Doom II, Hexen, Heretic and Strife)

LICENSE=	id
LICENSE_NAME=	id license
LICENSE_PERMS=
LICENSE_TEXT=	no redistributions

USES=		tar:bzip2
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

OPTIONS=	DOOM "Install Doom shareware data" on \
		HERETIC "Install Heretic shareware data" off \
		HEXEN "Install Hexen shareware data" off \
		STRIFE "Install Strife shareware data" off

SUB_FILES=	pkg-message

LATEST_LINK=	${PKGNAMEPREFIX}${PORTNAME}
DATADIR=	${FAKE_DESTDIR}${DMDIR}

LIST=		DOOM HERETIC HEXEN STRIFE

DOOM_WAD=	doom1.wad
HERETIC_WAD=	heretic1.wad
HEXEN_WAD=	hexen.wad
STRIFE_WAD=	strife0.wad

.include "Makefile.include"

.include <bsd.port.pre.mk>

.for f in ${LIST}
.   if defined(WITH_${f}) || !defined(WITHOUT_${f})
DISTFILES+=	${${f}_WAD}${EXTRACT_SUFX}
PLIST_SUB+=	${f}=""
.   else
PLIST_SUB+=	${f}="@comment "
.   endif
.endfor

.if ${DISTFILES} == ""
.   undef DIST_SUBDIR
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
.for f in ${LIST}
.   if defined(WITH_${f}) || !defined(WITHOUT_${f})
	@${BZIP2_CMD} -dc ${_DISTDIR}/${${f}_WAD}${EXTRACT_SUFX} > \
		${WRKDIR}/${${f}_WAD}
.   endif
.endfor

do-install:
	@${MKDIR} ${DATADIR}
.for f in ${LIST}
.   if defined(WITH_${f}) || !defined(WITHOUT_${f})
	${INSTALL_DATA} ${WRKDIR}/${${f}_WAD} ${DATADIR}
.   endif
.endfor

.include <bsd.port.post.mk>
