PORTNAME=	MathJax
DISTVERSION=	2.7.9
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-browser JavaScript display engine for mathematics
WWW=		https://www.mathjax.org/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_BUILD=	yes
NO_ARCH=	yes

USES=		cpe
USE_GITHUB=	yes

# Changing permissions of 30k files with find -exec (COPYTREE) is way
# too slow.
do-install:
	${MKDIR} ${WWWDIR}
	(cd ${WRKSRC} && \
		${FIND} -d . | ${CPIO} -dumpl ${WWWDIR} >/dev/null 2>&1)
	${FIND} -d ${WWWDIR} -type d -print0 | ${XARGS} -0 ${CHMOD} 755
	${FIND} -d ${WWWDIR} -type f -print0 | ${XARGS} -0 ${CHMOD} ${SHAREMODE}
	@(cd ${PREFIX}; ${FIND} -s ${WWWDIR_REL} -not -type d) >> ${TMPPLIST}

.include <bsd.port.mk>
