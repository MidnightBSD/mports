PORTNAME=	susv2
PORTVERSION=	1.0.20010716
CATEGORIES=	misc
MASTER_SITES=	#
DISTNAME=	susv2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Single UNIX Specification Version 2

LICENSE=	restricted

RESTRICTED=	Redistribution of the documents is not permitted

USES=		tar:bzip2
NO_BUILD=	yes
PORTDOCS=	*

.include <bsd.port.pre.mk>

.if !exists(${DISTDIR}/${DISTNAME}${EXTRACT_SUFX})
IGNORE=		may not be redistributed because of licensing reasons. Please visit http://www.unix.org/version2/online.html to accept their license and download ${DISTFILES} into ${DISTDIR}
.endif

do-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} '*' ${STAGEDIR}${DOCSDIR}

.include <bsd.port.post.mk>
