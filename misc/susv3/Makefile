# New ports collection makefile for:	susv3
# Date created:		11 April 2002
# Whom:			Simon 'corecode' Schubert <corecode@corecode.ath.cx>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/susv3/Makefile,v 1.5 2006/01/14 10:07:33 sem Exp $
#

PORTNAME=	susv3
PORTVERSION=	1.2
CATEGORIES=	misc
MASTER_SITES=	#
DISTNAME=	susv3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Single UNIX Specification Version 3

LICENSE=	restricted

RESTRICTED=	Redistribution of the documents is not permitted

USES=		tar:bzip2
NO_BUILD=	yes
PORTDOCS=	*

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE=		"may not be redistributed because of licensing reasons. Please visit http://www.unix-systems.org/version3/online.html to accept their license and download ${DISTFILES} into ${DISTDIR}"
.endif

do-install:
	@${MKDIR} ${DOCSDIR}
	@${FIND} ${WRKSRC} | ${SED} -e 's#^${WRKSRC}##' | while read file; do \
		if ${TEST} -d "${WRKSRC}$$file"; then \
			${MKDIR} "${DOCSDIR}$$file"; \
		else \
			if ${TEST} -L "${WRKSRC}$$file"; then \
				${LN} -s "`${LS} -l \"${WRKSRC}$$file\" | ${SED} -e 's/^.*> //'`" \
					"${DOCSDIR}$$file"; \
			else \
				${INSTALL_DATA} "${WRKSRC}$$file" "${DOCSDIR}$$file"; \
			fi; \
		fi; \
	done

.include <bsd.port.post.mk>
