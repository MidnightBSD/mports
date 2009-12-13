# $MidnightBSD: mports/misc/gnomehier/Makefile,v 1.7 2008/02/22 03:21:03 laffer1 Exp $
#
# !!DON'T BUMP PORTREVISION ON MTREE CHANGES ANYMORE!!

PORTNAME=	gnomehier
PORTVERSION=	2.3
CATEGORIES=	misc gnome
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility port that creates the GNOME directory tree
LICENSE=	unknown

NO_BUILD=	yes
PLIST?=		${WRKDIR}/pkg-plist
PKGINSTALL=	${WRKDIR}/pkg-install

GNOME_MTREE=	BSD.gnome.dist
GNOME_MTREE_ARGS=${MTREE_ARGS:S|${MTREE_FILE}|${TRUE_PREFIX}/etc/mtree/${GNOME_MTREE}|}

do-fetch:
	@${DO_NADA}

pre-install:
	@${CP} -f ${FILESDIR}/dirlist ${WRKDIR}
	@${RM} -f ${PLIST} ${WRKDIR}/${GNOME_MTREE}
	@${TOUCH} -f ${PLIST}
	@${ECHO_CMD} etc/mtree/${GNOME_MTREE} >> ${PLIST}
	@${MKDIR} ${WRKSRC}
	@${CAT} ${FILESDIR}/dirlist | ${SORT} -r | ${SED} -e \
		's|^|@dirrm |' >> ${PLIST}
	@${ECHO_CMD} "@unexec ${RMDIR} %D/etc/mtree 2>/dev/null || ${TRUE}" >> ${PLIST}
	@for dir in `${CAT} ${WRKDIR}/dirlist`; \
	do \
		${MKDIR} ${WRKSRC}/$${dir}; \
	done
	@${SED} -e 's|%%MTREE_ARGS%%|${GNOME_MTREE_ARGS}|' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}
	${CHGRP} games ${WRKSRC}/share/games
	${CHMOD} g=rwXs ${WRKSRC}/share/games
	cd ${WRKSRC} && \
		${MTREE_CMD} -U -d -n -i -c -k "uname, gname, mode" | \
		${SED} -e 's|uname=[A-Za-z0-9_]*|uname=root|' \
		       -e 's|gname=[A-Za-z0-9_]*|gname=wheel|' \
			> ${WRKDIR}/${GNOME_MTREE}

do-install:
	${MKDIR} ${PREFIX}/etc/mtree
	${INSTALL_DATA} ${WRKDIR}/${GNOME_MTREE} ${PREFIX}/etc/mtree

# make the TMPPLIST a second time, because $PLIST now exists.
post-install: make-tmpplist

.include <bsd.port.mk>
