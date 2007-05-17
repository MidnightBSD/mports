# ex:ts=8
# New ports collection makefile for:	bash
# Date created:		21 August 1994
# Whom:			jkh
#
# $MidnightBSD: mports/shells/bash2/Makefile,v 1.1 2006/09/18 01:24:22 laffer1 Exp $
# $FreeBSD: ports/shells/bash2/Makefile,v 1.82 2006/09/09 01:36:29 obrien Exp $
#

PORTNAME=	bash
PORTVERSION=	2.05b.007
PORTREVISION?=	5
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_GNU} \
		ftp://ftp.cwru.edu/pub/bash/
MASTER_SITE_SUBDIR=	bash
DISTFILES=	bash-${PORTVERSION:C/\....$//}.tar.gz
.if !defined(NOPORTDOCS)
DISTFILES+=	bash-doc-${PORTVERSION:C/\....$//}.tar.gz
.endif

PATCH_SITES=	${MASTER_SITE_GNU:S/$/:gnu/} \
		ftp://ftp.cwru.edu/pub/bash/bash-2.05b-patches/ \
		${MASTER_SITE_LOCAL:S/$/:local/}
PATCH_SITE_SUBDIR=	bash/bash-2.05b-patches/:gnu obrien/:local
PATCHFILES=	bash205b-001 bash205b-002 bash205b-003 bash205b-004 \
		bash205b-005 bash205b-006 bash205b-007
#		msg00029.txt msg00031.txt msg00030.txt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Bourne Again Shell

CONFLICTS=	bash-3*

.include <bsd.port.pre.mk>

LATEST_LINK=	${PORTNAME}2
WRKSRC=		${WRKDIR}/bash-${PORTVERSION:C/\....$//}
GNU_CONFIGURE=	Yes
CONFIGURE_ARGS=	--with-installed-readline
.if defined(WITH_STATIC_BASH) || defined(NO_DYNAMICROOT) || (defined(NOSHARED) && ( ${NOSHARED} != "no" && ${NOSHARED} != "NO" ))
CONFIGURE_ARGS+= --enable-static-link
.else
CONFIGURE_ARGS+= --enable-static-link=no
.endif
.if defined(DEBUG)
CONFIGURE_ARGS+= --debug
.endif
MAN1=		bash.1 bashbug.1
INFO=		bash

post-patch:
	@${REINPLACE_CMD} -e "s,.FN /bin/bash,.FN ${PREFIX}/bin/bash," \
		${WRKDIR}/${PORTNAME}-${PORTVERSION:R}/doc/bash.1

post-install: 
	${LN} -f ${PREFIX}/bin/bash ${PREFIX}/bin/bash2
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/examples ; ${PAX} -rw . ${EXAMPLESDIR}
	@${FIND} ${EXAMPLESDIR} -type d -print | xargs chmod a+rx
	@${CHMOD} -R a+r ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN}  \
		${WRKDIR}/doc/article.ps  \
		${WRKDIR}/doc/bashref.ps  \
		${DOCSDIR}
	${INSTALL_MAN}  \
		${WRKDIR}/doc/article.txt  \
		${DOCSDIR}
	${BZIP2_CMD} -f ${DOCSDIR}/*.ps
.endif

.include <bsd.port.post.mk>

CONFIGURE_TARGET:=	--build=${CONFIGURE_TARGET}
