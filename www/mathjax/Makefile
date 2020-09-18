# Created by: Lukasz Stelmach <lukasz.stelmach@iem.pw.edu.pl>

PORTNAME=	MathJax
DISTVERSION=	2.7.6
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-browser JavaScript display engine for mathematics

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_BUILD=	yes
NO_ARCH=	yes

USE_GITHUB=	yes

# Changing permissions of 30k files with find -exec (COPYTREE) is way
# too slow.
do-install:
	${MKDIR} ${FAKE_DESTDIR}${WWWDIR}
	(cd ${WRKSRC} && \
		${FIND} -d . | ${CPIO} -dumpl ${FAKE_DESTDIR}${WWWDIR} >/dev/null 2>&1)
	${FIND} -d ${FAKE_DESTDIR}${WWWDIR} -type d -print0 | ${XARGS} -0 ${CHMOD} 755
	${FIND} -d ${FAKE_DESTDIR}${WWWDIR} -type f -print0 | ${XARGS} -0 ${CHMOD} ${SHAREMODE}
	@(cd ${PREFIX}; ${FIND} -s ${WWWDIR_REL} -not -type d) >> ${TMPPLIST}

.include <bsd.port.mk>
