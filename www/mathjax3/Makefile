PORTNAME=	MathJax3
DISTVERSION=	3.2.2
CATEGORIES=	www math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-browser JavaScript display engine for mathematics
WWW=		https://www.mathjax.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	mathjax
GH_PROJECT=	MathJax

NO_ARCH=	yes
NO_BUILD=	yes

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
