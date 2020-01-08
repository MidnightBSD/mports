# Based on a port created by: Simon 'corecode' Schubert <corecode@corecode.ath.cx>
# $FreeBSD: head/misc/susv4/Makefile 423486 2016-10-07 21:49:04Z mandree $
# $MidnightBSD$

PORTNAME=	susv4
PORTVERSION=	20180131
CATEGORIES=	misc
MASTER_SITES=	#
DISTNAME=	susv4-2018
DIST_SUBDIR=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Group Base Specifications Issue 7/IEEE Std 1003.1, 2018 Edition

LICENSE=	restricted

RESTRICTED=	Redistribution of the documents is not permitted

USES=		tar:bzip2
NO_ARCH=	yes
NO_BUILD=	yes
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS
OPTIONS_SLAVE=	DOCS

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE=		may not be redistributed because of licensing reasons. Please visit http://www.unix.org/online.html to accept their license and download ${DISTFILES} into ${DISTDIR}/${DIST_SUBDIR}
.endif

do-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && \
		${FIND} . -name '*~' -delete && \
		${COPYTREE_SHARE} '*' ${STAGEDIR}${DOCSDIR}

.include <bsd.port.post.mk>
