# New ports collection makefile for:	gnomehier
# Date created:				2 July 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/misc/gnomehier/Makefile,v 1.5 2007/04/27 20:20:18 ctriv Exp $
# $FreeBSD: ports/misc/gnomehier/Makefile,v 1.34 2006/04/30 00:46:57 marcus Exp $
#
# !!DON'T BUMP PORTREVISION ON MTREE CHANGES ANYMORE!!

PORTNAME=	gnomehier
PORTVERSION=	2.2
CATEGORIES=	misc gnome
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility port that creates the GNOME directory tree

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
	${CHGRP} games ${WRKSRC}/share/gnome/games
	${CHMOD} g=rwXs ${WRKSRC}/share/gnome/games
	cd ${WRKSRC} && \
		${MTREE_CMD} -U -d -n -i -c -k "uname, gname, mode" \
			> ${WRKDIR}/${GNOME_MTREE}

do-install:
	${MKDIR} ${PREFIX}/etc/mtree
	${INSTALL_DATA} ${WRKDIR}/${GNOME_MTREE} ${PREFIX}/etc/mtree

# make the TMPPLIST a second time, because $PLIST now exists.
post-install: make-tmpplist

.include <bsd.port.mk>
